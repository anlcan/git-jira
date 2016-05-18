#!/bin/bash                                                                                                           

# set -e # fail if any commands fails                                                                                 

# check if issue has the right format, if it fails, nothing will happen                                               
ISSUE=`echo $1 | grep -io '[[:alpha:]]\+-[[:digit:]]\+'`
echo "using $ISSUE"

## check issue exists on jira                                                                                         
SHOW=`jira show $ISSUE`
[[ $SHOW == "Issue Does Not Exist" ]] && echo "no issue found" && exit 0;

## show issue                                                                                                         
echo "$SHOW"

if [ `git branch --list $ISSUE` ]
then
   echo "Branch name $ISSUE already exists."
   git checkout $ISSUE
   exit 0
fi

# create and checkout a branch named after the issue (ie JIRA-1)                                                      
git checkout -b $ISSUE

# assign issue to me                                                                                                  
jira assign $ISSUE

# start working on issue (not that you might get bad transition warning)                                              
jira start $ISSUE