#!/usr/bin/env bash
set -eo pipefail; [[ $RELEASE_TRACE ]] && set -x
check_mark="\033[1;32m✔\033[0m"
header() { echo -e "\n\033[1m$1\033[0m"; }

. ./common.sh

[[ $silentMode == 0 ]] && set -x
header "\nLaTeX Lint and Formatting\n"

latexindent -l=+mainfile.yaml -w -rv -m -s latexindent.tex
echo -e "\033[1A ${check_mark} Fixing main.tex... done"

latexindent -w -rv -m -g tex-files.log -l -s *.tex
echo -e "\033[1A ${check_mark} Fmting LaTeX ... done"

latexindent -w -rv -m -g bib-files.log -l bibsettings.yaml -s *.bib
echo -e "\033[1A ${check_mark} Fmting bibtex ... done"
header "cleaning up....\n"
[[ $gitStatus == 1 ]] && git status
