set fish_color_uname    red
set fish_color_hostname yellow
set fish_color_cwd      cyan
set fish_color_git      magenta
set fish_color_success  brgreen
set fish_color_failure  red

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

# Status Chars
set __fish_git_prompt_char_dirtystate '?'
set __fish_git_prompt_char_stagedstate '!'
set __fish_git_prompt_char_untrackedfiles '.'
set __fish_git_prompt_char_stashstate '$'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_diverged ' ↑↓'
set __fish_git_prompt_char_upstream_ahead ' ↑'
set __fish_git_prompt_char_upstream_behind ' ↓'

function prompt_hostname
    # return the short hostname only by default (#4804)
    string replace -r "\..*" "" (hostname)
end

function fish_prompt
  set last_status $status

  echo
  set -U fish_prompt_pwd_dir_length 0

  set_color $fish_color_uname
  printf '%s' (whoami)
  set_color normal

  if set -q SSH_CLIENT; or set -q SSH_TTY
    printf ' at ' 

    set_color $fish_color_hostname
    echo -n (prompt_hostname)
    set_color normal
  end

  printf ' in '
  
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  set git (__fish_git_prompt ' ')

  if test -n "$git"
    printf ' on'
    set_color magenta
    printf '%s' $git
    set_color normal
  end

  # Line 2
  echo
  if [ $last_status -eq 0 ]
      set_color $fish_color_success
  else
      set_color $fish_color_failure
  end
  printf 'λ '
  set_color normal
end
