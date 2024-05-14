if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x MANPAGER "less"

export EDITOR=nvim

alias ips "ip -c -br a"
alias P 'cd ~/Projects'
alias D 'cd ~/Downloads'
alias htop 'btop'
alias grep 'grep --color=auto -i'
alias vim 'nvim'
alias ls 'eza -la --icons=always --group-directories-first'


alias jupy 'cd /home/ut3usw/juproject/ && /home/ut3usw/juproject/venv/bin/jupyter lab --config /home/ut3usw/.jupyter/jupyter_lab_config.py'


# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'


# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# If you are coming from CMD. I mean no one does that, but I like these commands.
alias cls="clear"
alias del="rm -rfv"

# Always confirm before overwriting something && verbose mode.
alias mv="mv -v"
alias cp="cp -v"
alias ln="ln -v"
alias rm="rm -v"

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"



# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end


# Function for extracting different files
function ex
	switch $argv
		case *.tar.bz2
			tar xjf $argv		;;
		case *.tar.gz
			tar xzf $argv 		;;
		case *.bz2
			bunzip2 $argv		;;
		case *.rar
			unrar x $argv		;;
		case *.gz
			gunzip $argv		;;
		case *.tar
			tar xf $argv		;;
		case *.tbz2
			tar xjf $argv		;;
		case *.tgz
			tar xzf $argv		;;
		case *.zip
			unzip $argv			;;
		case *.Z
			uncompress $argv	;;
		case *.7z
			7z x $argv			;;
		case *.deb
			ar x $argv			;;
		case *.tar.xz
			tar xf $argv		;;
		case *.tar.zst
			unzstd $argv		;;
		case *
			echo "'$argv' cannot be extracted via ex" ;;
	end
	set_color normal
end

zoxide init fish | source
# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
