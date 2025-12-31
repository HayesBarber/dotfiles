eval "$(starship init zsh)"

alias cl="clear"
alias gcm="git checkout main || git checkout master"
alias gl="git pull"
alias gs="git status"
alias gd="git diff"
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias rtc="revert_to_commit"
alias tree="tree -C -F --dirsfirst"
alias ls="tree -L 1"

millis() {
    python3 -c 'import time; print(int(time.time() * 1000))'
}

millis_to_et() {
    local input
    if [[ -p /dev/stdin ]]; then
        read input
    elif [[ -n "$1" ]]; then
        input="$1"
    else
        echo "Usage: millis_to_et <millis> or echo <millis> | millis_to_et"
        return 1
    fi
    python3 -c "import time; from datetime import datetime; import zoneinfo; dt = datetime.fromtimestamp($input / 1000, tz=zoneinfo.ZoneInfo('America/New_York')); print(dt.strftime('%I:%M: %p'))"
}

format_current_branch() {
  current_branch 2> /dev/null | sed "s/\(.*\)/[\1] /"
}

copy() { tee /dev/tty | pbcopy; }
copy_branch() { current_branch | copy; }
cpath() { pwd | copy; }

acm() {
  git add .
  local message="$*"
  if [[ -z "$message" ]]; then
      message="auto commit"
  fi
  git commit -m "$message"
  git push
}

nb() {
    git checkout -b "$1"
    git push -u origin "$1"
}

gb() {
  local branch
  branch=$(git branch -a | fzf --prompt="Git Branches> " --height 40% --layout reverse --border)

  if [[ -n $branch ]]; then
    branch=$(echo "${branch}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    branch="${branch#\* }"
    branch="${branch#remotes/origin/}"
    git checkout "$branch"
  fi
}

restore() {
    git restore .
    git clean -fd
}

pr() {
  local submit=false
  local title=$(current_branch)
  local body=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -s)
        submit=true
        shift
        ;;
      -t|--title)
        shift
        title="$1"
        shift
        ;;
      -b|--body)
        shift
        body="$1"
        shift
        ;;
      *)
        echo "Usage: pr [-s] [-t|--title \"PR title\"] [-b|--body \"PR body\"]"
        return 1
        ;;
    esac
  done

  if $submit; then
    pr_url=$(gh pr create --title "$title" --body "$body")
    echo "$pr_url" | copy
    open "$pr_url"
  else
    gh pr create --title "$title" --body "$body" --web
  fi
}

github() {
  local remote=$(git remote get-url origin 2>/dev/null)

  if [[ -z $remote ]]; then
    echo "Not a git repository or no origin remote found"
    return 1
  fi

  local base_domain repo_path

  if [[ "$remote" =~ ^git@([^:]+):(.+)\.git$ ]]; then
    base_domain="${match[1]}"
    repo_path="${match[2]}"
  elif [[ "$remote" =~ ^https://([^/]+)/(.+)\.git$ ]]; then
    base_domain="${match[1]}"
    repo_path="${match[2]}"
  else
    echo "Unsupported remote format: $remote"
    return 1
  fi

  local url="https://${base_domain}/${repo_path}"
  echo "Opening repo: $url"
  open "$url"
}

compare() {
  local remote=$(git remote get-url origin 2>/dev/null)

  if [[ -z $remote ]]; then
    echo "Not a git repository or no origin remote found"
    return 1
  fi

  local base_domain repo_path

  if [[ "$remote" =~ ^git@([^:]+):(.+)\.git$ ]]; then
    base_domain="${match[1]}"
    repo_path="${match[2]}"
  elif [[ "$remote" =~ ^https://([^/]+)/(.+)\.git$ ]]; then
    base_domain="${match[1]}"
    repo_path="${match[2]}"
  else
    echo "Unsupported remote format: $remote"
    return 1
  fi

  local current_branch=$(current_branch)

  local main_branch
  if git show-ref --quiet refs/remotes/origin/main; then
    main_branch="main"
  elif git show-ref --quiet refs/remotes/origin/master; then
    main_branch="master"
  else
    echo "Neither 'main' nor 'master' branch found on origin"
    return 1
  fi

  if [[ "$current_branch" == "$main_branch" ]]; then
    echo "You are already on the $main_branch branch"
    return 1
  fi

  local url="https://${base_domain}/${repo_path}/compare/${main_branch}...${current_branch}"
  echo "Opening diff: $url"
  open "$url"
}

revert_to_commit() {
  if [[ -z "$1" ]]; then
    echo "Usage: revert_to_commit <commit-hash>"
    return 1
  fi

  local commit="$1"
  local short_sha="${commit:0:7}"
  local branch="revert-to-${short_sha}"

  echo "Creating and switching to branch: $branch"
  git checkout -b "$branch" || return 1

  echo "Removing current working directory files..."
  git rm -rf . || return 1

  echo "Restoring files from commit $commit"
  git checkout "$commit" -- . || return 1

  git reset || return 1

  echo "Done."
}

release() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: release --major|--minor|--patch"
    return 1
  fi

  local bump_type=""
  case "$1" in
    --major)
      bump_type="major"
      ;;
    --minor)
      bump_type="minor"
      ;;
    --patch)
      bump_type="patch"
      ;;
    *)
      echo "Usage: release --major|--minor|--patch"
      return 1
      ;;
  esac
  
  git fetch

  local latest_tag
  latest_tag=$(git describe --tags --abbrev=0 2>/dev/null)
  if [[ -z "$latest_tag" ]]; then
    latest_tag="v0.0.0"
  fi

  # Extract version numbers
  IFS='.' read -r major minor patch <<< "${latest_tag#v}"

  case "$bump_type" in
    major)
      major=$((major + 1))
      minor=0
      patch=0
      ;;
    minor)
      minor=$((minor + 1))
      patch=0
      ;;
    patch)
      patch=$((patch + 1))
      ;;
  esac

  new_tag="v${major}.${minor}.${patch}"

  gh release create "$new_tag" --generate-notes
  echo "Released $new_tag"
}

merge() {
  local flag=""
  # Parse arguments for --major, --minor, or --patch
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --major|--minor|--patch)
        flag="$1"
        shift
        ;;
      *)
        echo "Usage: merge [--major|--minor|--patch]"
        return 1
        ;;
    esac
  done
  gh pr merge --admin --squash --delete-branch --body ""
  # If a flag was passed, call release with it
  if [[ -n "$flag" ]]; then
    release "$flag"
  fi
}

try_source() {
  [ -f "$1" ] && source "$1"
}

try_source "$(brew --prefix 2>/dev/null)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
try_source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

try_source "$(brew --prefix 2>/dev/null)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
try_source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
