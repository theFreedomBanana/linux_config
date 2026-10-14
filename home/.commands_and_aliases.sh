# ====================
# FILES & FOLDERS
# ====================
# head: output the first lines of the file passed as an argument
# tail: output the last lines of the file passed as an argument
# cat: output the content of the file passed as an argument
# tac: output the content of the file passed as an argument. Unlike the "cat" command "tac" starts from the end
# more: output the content of the file passed as an argument but enables scolling through sections with the space bar
# less: output the content of the file passed as an argument but enables scolling through the fiel with arrow keys
# du: stands for Directory Usage. Outputs every folder and recursive folders in the working directory along with the total size
#     -h for human readable output
#     -s for a summarize output
# rmdir: remove directory. Only working with empty directories. If containing files we'll need to use "rm-r"
# dir: very similar to ls. An alternative provided mainly for familiarity with users coming from DOS/Windows.
# mktemp: create a temporary file or directory
# tee: splits the output in 2 directions, e.g stdin and wherever you want the output to go. This means, `echo foo | tee file.txt` will both be printed in the stdin but also be put in 'file.txt'
# sed: Stream EDitor. Mostly used to find and replace elements in a file. Ex: `sed 's/old/new/' file.txt`
# xargs: takes input from stdin and turns it into arguments for another command
# install: copy a file to a location, while optionally setting its permissions, owner, and group. It's kind of a mix between `cp`, `chmod`, `chown`
# ln: create linked files
# awk: a tool to read files filtering rows and performing calculations

# ====================
# NAVIGATION
# ====================
# pushd: navigates to the previous address. Typed again takes you back to your initial address before first typed.
# popd: navigates to the previous address and so on.
# locate: finds file argument location on the computer. Uses a database updated once a day. In order to manually update it check the following command
# sudo updatedb: update locate database
# dirname: return the parent's directory of a given address (e.g dirname /home/john/Document => /home/john)
# chdir: Change directory. Same as `cd`

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
# apt autoremove: remove dependencies installed with other apps and no longer used
# dpkg -i: install a Debian package (apt is a front-end for dpkg, aka Debian Package)
# snap: the snap command lets you install, configure, and remove snaps packages.

# ====================
# USERS
# ====================
# whoami: returns the current user
# su: Switch User. Switch to another user account (default to root when no argument is given)
# users: output currently logged in users
# groups <username>: output group membership for a given user
# getent: get entries for administrative DB. Can be used to list every user or every group
# id: outputs a bunch of infos related to the current user
# chmod: enable to change rights about the argument file [rwx]  [rw-]  [r--]. read equals 4, write equals 2, execute equals 1
#                                                            ^      ^      ^
#                                                           user  group  everyone else
# who: show every user currently connected to a machine
# w: same as "who" but gives more details
# passwd: change a user's password (ex: passwd john)
# adduser: to add a new user. Another command `useradd` also exists but `adduser` is more friendly
# usermod: to update a user. For example: `sudo usermod -aP root john`, adds root john user in root group

# ====================
# SYSTEM & PROCESSORS
# ====================
# free: outputs memory usage in the system
# kill: stop a running process using it's PID (Process ID)
# killall: stop all related processes using  the process name (ex: killall firefox)
# pkill: will send SIGTERM to all processes matching tha match a given pattern
#        -9 will send a SIGKILL to processes, shutting them down immediatly (works for kill and killall as well)
#	-9 will send a SIGKILL to processes, shutting them down immediatly (works for kill and killall as well)
# df: Disk Free. Display the mounted file system and how much space they use. Usefull with the `-h` option (human readable)
# lsblk: LiSt BLocK. Display blocks (includes drives and virtual blocks), mounted and unmounted
# ps: outputs running processes in current shell
# top: outputs running processes on the computer
# htop: better looking "top"
# uptime: tells how long the system has been running
# snap list: outputs every snap package
# time: run programs and summarize system resource usage
# neofetch: display informations about the system
# usb-devices: print USB device details
# tty: terminal typewriter. Return a unique identifier for the related terminal or shell
# lsof: list every open files with the address, the name of the related application, the user, the PID
# mkfs: MaKe File System. Creates superblocks, inodes, bitmaps, in order for a drive to be mounted. Used automatically, I don't think I'll ever need to run it
# fck: File System Consistency Check. Check and repair file system errors. Don't run it on a mounted file system. You should boot in recovery mode
# make: a build automation tool. It reads instructions from a file called a Makefile and uses them to build programs, run tests, generate files, or perform other repetitive tasks.
# hostnamectl: update hostname. ex: sudo hostnamectl set-hostname new-name
# uname -p: print the type of processor used by the machine (arm, amd)

# ====================
# NETWORK
# ====================
# ifconfig: outputs network interface
# ip: a modern ifconfig. Show or manipulate routing, network devices, interfaces, tunnels
# iptables: iptables is a Linux command-line tool used to configure firewall rules—controlling which network traffic is allowed, blocked, or modified.
# dig: used for DNS lookup
# nmap => Network Mapper. A network discovery and security-auditing tool.
# nc: NetCat. Used for testing network connection and check wether ports are reachable
# netstat: Show network Sockets. Check open ports and see what network connectivity are running
# ss: a modern netstat

# ====================
# SSH
# ====================
# ssh-copy-id: copy your SSH public key to a remote server, so you can log in using SSH without entering your password each time
# ssh-keyscan: used to retrieve the public ssh host key of a server
# ssh-keygen: used to generate an ssh key

# ====================
# MISCELLANEOUS
# ====================
# cal: outputs a calendar
# watch: opens a prompt and runs a command every x seconds
# env: outputs all the environment variable
# date: outputs the date
# sleep: sleep execution for "x" seconds, "x" being the argument
# sed: stream editor for filtering and transforming text
# <: read in from standard input
# >: rewrite the argument file with the output of the previous command
# >>: write at the end of the argument file with the output of the previous command
# chsh: change the default login shell for the user
# timeout: timeout after a given time
# sh: execute a shell script
# set -euo pipefail: Stop when something goes wrong, don't use undefined variables, and don't hide failures inside pipelines
# journalctl -u nginx: display nginx logs (can also be found in /var/log/nginx/access.log)

# ====================
# SHELL BUILT-IN
# ====================
# printf: a shell built in command to display text. Usually favored over "echo" as it gives more control over formating
# command: shell built in. Execute a raw command. Bypass aliases
# type: shell built in. Returns what the shell think of a command. If it's a shell build in will return will say so, otherwise will return the bin location.
#       If it is an alias it will return the alias iteself
# whence: a zsh equival of `type` (I feel `type` give more accurate results)

# ====================
# MAC OS ONLY
# ====================
# diskutil list: same as lsblk
# dscl: MacOS only
# scutil: System Configuration UTIlities -> Manage system configuration parameters
# pfctl: the equivalent of iptables

# ====================
# LINUX ONLY
# ====================
## Linux only. On MacOS users are in /Users
#`cat /etc/passwd`: to see all users
#`cat /etc/groups`: to see all groups
#getent: Get Entries. Used to query the system database. For example:
#        - getent passwd: show users
#        - getent passwd john: show user john
#        - getent groups: show groups
#        - getent hosts: show ...
#        - getent services: show services

# ====================
# ALIASES
# ====================
# alias lsla='ls -la --group-directories-first'
# alias lsl='ls -l --group-directories-first'
# alias ls='exa -abghHl --group-directories-first'
# alias lsa='ls -a --group-directories-first'
alias ls='eza -la --group-directories-first'
alias fzrm='fzf | xargs rm -v'
alias ff='fzf'
alias ps='ps -o user,pid,ppid,time,etime,stat,command'
alias psg='ps aux | grep'
alias fps='ps -aux'
alias npr='npm run'
alias wh='which'
alias pyg='cat'
alias pig='pyg'
alias g='git'
alias na='nano'
alias chrome="google-chrome"
alias pdf='xdg-open'
alias untar='tar -xvzf'
alias setclip="xclip -selection c" # On PacOS use pbcopy instead
alias getclip="xclip -selection c -o" # On MacOS use pbpaste instead
alias dirsize='eza -lD --total-size'
alias yaz=yazi
alias files=yazi
alias img=viu
alias md=mdfried