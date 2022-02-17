# ====================
# FILES & FOLDERS
# ====================
# head: output the first lines of the file passed as an argument
# tail: output the last lines of the file passed as an argument
# cat: output the content of the file passed as an argument
# tac: output the content of the file passed as an argument. Unllike the "cat" command "tac" starts from the end
# more: output the content of the file passed as an argument but enables scolling through sections with the space bar
# less: output the content of the file passed as an argument but enables scolling through the fiel with arrow keys
# du: outputs every file included in the current folder along with the total size
# rmdir: remove directory. Only working with empty directories. If containing files we'll need to use "rm-r"
# dir: kinda similar to ls. Outputs files.
# mktemp: create a temporary file or directory

# ====================
# NAVIGATION
# ====================
# pushd: navigates to the previous address. Typed again takes you back to your initial address before first typed.
# popd: navigates to the previous address and so on.
# locate: finds file argument location on the computer. Uses a database updated once a day. In order to manually update it check the following command
# sudo updatedb: update locate database
# dirname: return the current parent's directory address

# ====================
# SEARCH & HELP
# ====================
# whereis: locate the binary, source, and manual page files for a command
# which: locate a command
# history: outputs the history of typed commands
# apropos: outputs every commands related to the argument
# whatis: outputs a short description of the argument command
# ctrl + r: search among the previous typed commands

# ====================
# PACKAGES
# ====================
# apt-cache search: look for packages containing keyword passed as argument
# apt-get update: updates the list of available packages and their versions, but does not install or upgrade any packages
# apt-get upgrade: install newer version of packages
# apt remove: remove related packages but keep configuration or data files
# apt purge: remove about everything related to the package
# apt autoremove: remvove dependencies installed with other apps and no longer used

# ====================
# USERS
# ====================
# whoami: returns the current user
# su: become the user passed as parameter
# users: output names of the existing users on the computer
# id: outputs a bunch of infos related to the current user
# chmod: enable to change rights about the argument file [rwx]  [rw-]  [r--]. read equals 4, write equals 2, execute equals 1
#                                                            ^      ^      ^
#                                                           user  group  everyone else

# ====================
# SYSTEM & PROCESSORS
# ====================
# free: outputs memory usage in the system
# kill: stop a running process
# killall: stop all related processes
# df: outputs every mount disks
# lsblk: outputs every mount disks (don't know the difference with 'df')
# ps: outputs running processes in current shell
# top: outputs running processes on the computer
# htop: better looking "top"
# uptime: tells how long the system has been running
# snap list: outputs every snap package
# time: run programs and summarize system resource usage

# ====================
# NETWORK
# ====================
# ifconfig: outputs network interface
# ip: show or manipulate routing, network devices, interfaces, tunnels

# ====================
# MISCELLANEOUS
# ====================
# cal: outputs a calendar
# watch: opens a prompt and runs a command every x seconds
# env: outputs all the environment variable
# date: outputs the date
# sleep: sleep execution for "x" seconds, "x" being the argument
# sed: stream editor for filtering and transforming text
# >: rewrite the argument file with the output of the previous command
# >>: write at the end of the argument file with the output of the previous command

# ====================
# ALIASES
# ====================
alias lsla='ls -la --group-directories-first'
alias lsl='ls -l --group-directories-first'
# alias ls='exa -abghHl --group-directories-first'
alias lsa='ls -a --group-directories-first'
alias fzrm='fzf | xargs rm -v'
alias ff='fzf'
alias psg='ps aux | grep'
alias npr='npm run'
alias wh='which'
alias pyg='cat'
alias pig='pyg'
alias g='git'
alias na='nano'
alias chrome="google-chrome"
alias pdf='xdg-open'
alias untar='tar -xvzf'
