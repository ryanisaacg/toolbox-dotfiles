set fish_color_ssh      yellow
set fish_color_cwd      cyan
set fish_color_git      magenta
set fish_color_success  green
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

function prompt_section
    set_color $argv[1]
    printf '%s' $argv[2]
    set_color normal
end

function fish_prompt
    set last_status $status

    echo

    # Line 1
    prompt_section $fish_color_cwd (prompt_pwd)

    set git (__fish_git_prompt ' ')
    if test -n "$git"
        printf ' on'
        prompt_section $fish_color_git $git
        else
        printf ' '
    end

    if set -q SSH_CLIENT; or set -q SSH_TTY
        printf 'as'
        set name (whoami)
        set host (string replace -r "\..*" "" (hostname))
        prompt_section $fish_color_ssh " $name@$host"
    end

    # Line 2
    echo
    [ $last_status -eq 0 ]; and set col $fish_color_success; or set col $fish_color_failure
    prompt_section $col '❯ '
end
