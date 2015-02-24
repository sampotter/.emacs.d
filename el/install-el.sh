#!/bin/sh

check_for_program () {
    hash $1 2>/dev/null || {
	echo >&2 "Couldn't find $1 -- aborting.";
	exit 1;
    }
}

check_for_program wget
check_for_program git
check_for_program tar
check_for_program make

################################################################################
# URLs of modes and elisp files to download.

WINDOW_NUMBER_URL=http://www.emacswiki.org/emacs/download/window-number.el
EMACS_SESSION_URL=http://sourceforge.net/projects/emacs-session/files/session-2.4.tar.gz/download
P4EL_GIT_REPO=https://github.com/gareth-rees/p4.el.git
CEDET_GIT_REPO=http://git.code.sf.net/p/cedet/git
MATLAB_EMACS_URL=http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/matlab-emacs/?view=tar

################################################################################
# Download miscellaneous elisp files and byte compile them.

wget $WINDOW_NUMBER_URL
emacs -Q -batch -f batch-byte-compile window-number.el

################################################################################
# Download Emacs Session and byte compile it.

wget $EMACS_SESSION_URL --output-document=session.tar.gz
tar xvf session.tar.gz
rm session.tar.gz
emacs -Q -batch -f batch-byte-compile session.el

################################################################################
# Get p4.el from its git repository and install it.

git clone $P4EL_GIT_REPO
cd p4.el
emacs -Q -batch -f batch-byte-compile p4.el
cd -

################################################################################
# Download, unpack, and byte compile the development CEDET from SourceForge.

git clone $CEDET_GIT_REPO cedet
cd cedet
make
cd -

################################################################################
# Download and unpack Matlab Emacs, using the previously installed CEDET during
# byte compilation.

wget $MATLAB_EMACS_URL --output-document=matlab-emacs.tar
tar xvf matlab-emacs.tar
cd matlab-emacs
touch Makefile
make CEDET_PATH=../cedet/lisp
cd -
rm matlab-emacs.tar
