#!/bin/bash                                                                                                           

# set -e # fail if any commands fails                                                                                 

if [ $# -lt 1 ]; then
    echo "usage : git-jira-branch MOB-11 MobileTask11"
    exit 0
fi

# check if issue has the right format, if it fails, nothing will happen                                               
ISSUE=`echo $1 | grep -io '[[:alpha:]]\+-[[:digit:]]\+'`
if [ "$ISSUE" = "" ]; then
    echo "issue format : MOB-11 {PROJECT_SHORT_NAME}-{ISSUE_NUMBER}"
    exit 0
fi
echo "using $ISSUE"

## check issue exists on jira                                                                                         
SHOW=`jira show $ISSUE`
[[ $SHOW == "Issue Does Not Exist" ]] && echo "no issue found" && exit 0;

## show issue                                                                                                         
echo "$SHOW"

#set branch name
BRANCH=$ISSUE

# check if issue short description exists
DESC="$2"
if [  ${#DESC} -gt 0 ]; then
	# short desc can not be longer than 50 chars
	if [ ${#DESC} -gt 49 ]; then
		echo "short description is too long $DESC"
		exit 0
	fi
	echo "short description : $DESC"
	BRANCH="$ISSUE/$DESC"
fi

if [ `git branch --list $BRANCH` ]
then
   echo "Branch name $BRANCH already exists."
   git checkout $BRANCH
   exit 0
fi

# git fetch get lastest updates
git fetch

# create and checkout a branch named after the issue (ie JIRA-1)                                                      
git checkout -b $BRANCH origin/master

# show branch lists
git branch -vv

# assign issue to me                                                                                                  
jira assign $ISSUE

# start working on issue (not that you might get bad transition warning)                                              
jira start $ISSUE