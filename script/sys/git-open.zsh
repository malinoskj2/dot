#!/usr/bin/env zsh

# open remote giturl page

BRANCH="$(git branch | grep \* | cut -d ' ' -f2)";
$BROWSER "$(git config --get remote.origin.url)/tree/$BRANCH"
