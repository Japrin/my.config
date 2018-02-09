# .bashrc

if [ -z "$TMUX" ]; then

	# Source global definitions
	if [ -f /etc/bashrc ]; then
		. /etc/bashrc
	fi
fi

##LD_LIBRARY_PATH=/Share/BP/zhenglt/04.lib/C/libevent/mybuild/lib:/Share/BP/zhenglt/04.lib/C/xml2/lib:/Share/BP/zhenglt/04.lib/C/xslt/lib/:/WPS1/zhenglt/01.bin/httpd/mybuild/mysql/lib/:/WPS1/zhenglt/04.lib/lib:/opt/VirtualBox/:/Share/BP/zhenglt/04.lib/C/gmp-6.0.0/mybuild/lib:/Share/BP/zhenglt/01.bin/python/Python-2.7.8/mybuild/lib:/usr/lib64:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=/Share/BP/zhenglt/04.lib/C/libevent/mybuild/lib:/Share/BP/zhenglt/04.lib/C/xml2/lib:/Share/BP/zhenglt/04.lib/C/xslt/lib/:/WPS1/zhenglt/01.bin/httpd/mybuild/mysql/lib/:/WPS1/zhenglt/04.lib/lib:/opt/VirtualBox/:/Share/BP/zhenglt/04.lib/C/gmp-6.0.0/mybuild/lib:/Share/BP/zhenglt/01.bin/python/Python-2.7.8/mybuild/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
	
PATH=/Share/BP/zhenglt/01.bin/IDE/ncurses/mybuild/bin/:$PATH
PATH=/Share/BP/zhenglt/01.bin/IDE/wmctrl/mybuild/bin/:$PATH
PATH=/Share/BP/zhenglt/01.bin/vi/mybuild/bin:$PATH
PATH=/Share/BP/zhenglt/04.lib/C/xml2/bin:/Share/BP/zhenglt/04.lib/C/xslt/bin/:$PATH
PATH=/opt/VirtualBox/:$PATH
PATH=/Share/BP/zhenglt/03.toolkit/sge:$PATH
export PATH=$PATH

export LD_LIBRARY_PATH=/Share/BP/zhenglt/01.bin/ngs/mybuild/lib64:$LD_LIBRARY_PATH
export NGS_LIBDIR=/Share/BP/zhenglt/01.bin/ngs/mybuild/lib64
export CLASSPATH=/Share/BP/zhenglt/01.bin/ngs/mybuild/jar/ngs-java.jar:$CLASSPATH
export NGS_BAM_LIBDIR=/Share/BP/zhenglt/01.bin/ngs/mybuild/lib64
export LD_LIBRARY_PATH=/Share/BP/zhenglt/01.bin/ncbi-vdb/mybuild/lib64:$LD_LIBRARY_PATH
export NCBI_VDB_LIBDIR=/Share/BP/zhenglt/01.bin/ncbi-vdb/mybuild/lib64
#######ld -L$NCBI_VDB_LIBDIR -lncbi-vdb ...

#export CFLAGS="-I/Share/BP/zhenglt/01.bin/hdf5-1.8.14/mybuild/include"
#export LDFLAGS="-L/Share/BP/zhenglt/01.bin/hdf5-1.8.14/mybuild/lib -L/Share/BP/zhenglt/01.bin/python/Python-2.7.8/mybuild/lib"


. ~/my.git/git-completion.bash
. ~/my.git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# User specific aliases and functions
#PS1='\[\e[33;1m\][\[\e[0m\] \[\e[32;1m\]\u\[\e[0m\]\[\e[36;1m\]@\h: \[\e[0m\]\[\e[35;1m\]\w\[\e[0m\] \[\e[33;1m\]]\[\e[0m\]\$'
##PS1='\[\e[33;1m\][\[\e[0m\] \[\e[32;1m\]\u\[\e[0m\]\[\e[36;1m\]@\h: \[\e[0m\]\[\e[35;1m\]\w\[\e[0m\] \[\e[33;1m\]]\[\e[0m\] $(__git_ps1 "(%s)")\$'
PS1='\[\e[33;1m\][\[\e[0m\] \[\e[32;1m\]\u\[\e[0m\]\[\e[36;1m\]@\h: \[\e[0m\]\[\e[35;1m\]\w\[\e[0m\] \[\e[33;1m\]]\[\e[0m\]\r\n\$'
alias l='ls -lhtr'
alias le='less -NS'
alias vim="vim --servername VIM"
alias vi="vim"
## excute as root: sslvpn_client_linux64
alias clslogin='ssh zeminz_zlt@10.100.1.88'


export PKG_CONFIG_PATH=/Share/BP/zhenglt/05.setting/PKGCONFIG
export BLAS=/Share/BP/zhenglt/04.lib/C/LAPACK/lib/libblas.a
export LAPACK=/Share/BP/zhenglt/04.lib/C/LAPACK/lib/liblapack.a
export DJANGO_SETTINGS_MODULE=django.conf.zhenglt
export SGE_ROOT=/opt/gridengine
export SGE_CELL=default
export DRMAA_LIBRARY_PATH=/opt/gridengine/lib/lx26-amd64

function tablook
{
	ifile=$1
    cat $ifile | csvlook -d$'\t'
	##sed 's/\t/,/g' $ifile | csvlook
}

#if [ -n "$TMUX" ]; then
#	module purge
#	unset LOADEDMODULES
#	unset _LMFILES_
#fi
export MODULESHOME=/usr/share/Modules
. /usr/share/Modules/init/bash
export MODULEPATH="/Share/BP/zhenglt/05.setting/modulefiles":/usr/share/Modules/modulefiles:/etc/modulefiles
#### installed in WPSnew
#export MODULEPATH="/WPSnew/zhenglt/05.setting/modulefiles":/usr/share/Modules/modulefiles:/etc/modulefiles
#module load R/3.4.0
#module load perl/5.24.1
#module load python/2.7.13
#module load tmux/2.4
#module load vim/8.0
#module load misc/unknown

#### installed in Share
module load novomedSeq/1.0
module load htop/1.0.3
##module load tmux/1.9a
module load tmux/2.2
module load ctag/5.8
module load cscope/15.8b
module load pandoc/1.13.1
module load git/2.6.2.307.g37023ba
module load gnu/unknown
module load tpp/1.3.1
module load misc/unknown
##export DISPLAY=:0

#MY_INI="/Share/BP/zhenglt/02.pipeline/cancer/parameter/init_human.sh"
MY=/Share/BP/zhenglt
##MY=/WPSnew/zhenglt
cd $MY

export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


###. /home/zhenglt/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
###export PHYLOCSF_BASE=/Share/BP/zhenglt/01.bin/PhyloCSF



