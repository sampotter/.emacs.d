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
CEDET_GIT_REPO=http://git.code.sf.net/p/cedet/git
MATLAB_EMACS_URL=http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/matlab-emacs/?view=tar

################################################################################
# Download miscellaneous elisp files.

wget $WINDOW_NUMBER_URL

################################################################################
# Download, unpack, and byte compile the development CEDET from SourceForge.

git clone $CEDET_GIT_REPO cedet
cd cedet
make
cd -

################################################################################
# Download and unpack Matlab Emacs.

wget $MATLAB_EMACS_URL --output-document=matlab-emacs.tar
tar xvf matlab-emacs.tar
cd matlab-emacs
touch Makefile
make CEDET_PATH=../cedet/lisp
cd -
rm matlab-emacs.tar
