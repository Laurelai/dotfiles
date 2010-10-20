#!/bin/sh
sudo ./qlpatch.sh
curl -O http://beta.quicklisp.org/quicklisp.lisp
sbcl --load qlsetup.lisp
