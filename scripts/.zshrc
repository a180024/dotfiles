#Alias
alias vb="VBoxManage startvm \"Ubuntu Server 20.4\" --type headless"
alias xvb="VBoxManage controlvm \"Ubuntu Server 20.4\" poweroff"
alias sshvm="ssh davinwu@127.0.0.1 -p 2222"
alias uninit="rm -rf .git"
alias startvagrant="vagrant init ubuntu/trusty32; vagrant up; vagrant ssh"
alias brewpermission="sudo chown -R $(whoami) $(brew --prefix)/*"

#Paths
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/dart/libexec:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

#GIT Auto-Completion
source /usr/local/etc/bash_completion.d/git-completion.bash &>/dev/null

# z- jump around
# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	#Load rupa's z if installed
 	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

#VIM for bash
set -o vi




