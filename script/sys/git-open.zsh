#!/usr/bin/env zsh

# open remote giturl page

BRANCH="$(git branch | grep \* | cut -d ' ' -f2)";
URL="$(git config --get remote.origin.url)/tree/$BRANCH" 
$BROWSER "$(echo $URL | sed 's/\.git//g')"
# $BROWSER "$(git config --get remote.origin.url)/tree/$BRANCH"  
