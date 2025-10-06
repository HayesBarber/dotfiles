alias gcm="git checkout main || git checkout master"
alias gl="git pull"
alias gr="git restore ."
alias gs="git status"
alias gd="git diff"
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias rtc="revert_to_commit"
alias tree="tree -C -F --dirsfirst"
alias ls="tree -L 1"

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

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
