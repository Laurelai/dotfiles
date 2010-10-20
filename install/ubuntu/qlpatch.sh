#!/bin/sh

# patch for a bug in ubuntu lisp controller
echo "(:directory (:HOME \".clc/systems/\"))" > /etc/common-lisp/source-registry.conf.d/02-common-lisp-controller-userdir.conf

