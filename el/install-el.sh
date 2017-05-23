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
MATLAB_EMACS_URL=http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/matlab-emacs/?view=tar
COLUMN_ENFORCE_MODE_GIT_REPO=https://github.com/jordonbiondo/column-enforce-mode.git
IRONY_MODE_GIT_REPO=https://github.com/Sarcasm/irony-mode.git

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
# Grab column-enforce-mode from its github repository and set it up.

git clone $COLUMN_ENFORCE_MODE_GIT_REPO column-enforce-mode
cd column-enforce-mode
emacs -Q -batch -f batch-byte-compile *.el
cd -
