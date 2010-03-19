LANG=en_US.UTF-8; export LANG
#LANGUAGE=$LANG
#LC_ALL=$LANG
EDITOR=/usr/bin/vim;             export EDITOR
#EMAIL=put me in ~/.zshother;    export EMAIL
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
PAGER=less;                      export PAGER
# add -F to automatically quit less if page fits on one screen
LESS="--ignore-case -r -SX";    export LESS
GPG_TTY=$(tty);                  export GPG_TTY
QUILT_PATCHES=debian/patches;    export QUILT_PATCHES
BC_ENV_ARGS=~/.bcrc;             export BC_ENV_ARGS

# set PATH so it includes user's private bin if it exists
[ -d ~/bin ] && PATH=~/bin:"${PATH}"

PATH=$PATH:/sbin:/usr/sbin

GREP_OPTIONS='--color=auto --exclude=\*\.svn-base --exclude=\*\.tmp --binary-files=without-match'; export GREP_OPTIONS

#ECLIPSE_HOME=/home/jceb/tmp/eclipse.clean;     export ECLIPSE_HOME
#GRAILS_HOME=/home/jceb/Software/grails;        export GRAILS_HOME
#PATH=$PATH:$GRAILS_HOME/bin;                   export PATH

PYTHONPATH=~/lib/python;           export PYTHONPATH
PYTHONSTARTUP=~/.pystartup;        export PYTHONSTARTUP
#AWT_TOOLKIT=MToolkit                           export AWT_TOOLKIT

[ -e ~/.zshother ] && . ~/.zshother

hostname=$(hostname)

[ -e ~/.gnupg/gpg-agent-info-$hostname ] && . ~/.gnupg/gpg-agent-info-$hostname && export GPG_AGENT_INFO
