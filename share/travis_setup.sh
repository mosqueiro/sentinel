#!/bin/bash
set -evx

mkdir ~/.papelcore

# safety check
if [ ! -f ~/.papelcore/.papel.conf ]; then
  cp share/papel.conf.example ~/.papelcore/papel.conf
fi
