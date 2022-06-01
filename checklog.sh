#!/bin/bash
# check for undefined/multiply-defined references

set -x
egrep -i --color=auto 'undefined' *.log
egrep -i --color=auto 'multiply-defined' *.log
egrep -i --color=auto 'fixthis' *.log
exit