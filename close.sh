#!/bin/bash                                                                                                           

# get current branch name                                                                                             
BRANCH=`git symbolic-ref --short -q HEAD`

ISSUE=$BRANCH
echo $ISSUE

# assume the branch name is also the issue name                                                                       
SUMMARY=`jira show -o summary $ISSUE`
echo $SUMMARY

# a last commit with summary                                                                                          
git commit -am "$SUMMARY"

# push to origin, grep the pull-request url                                                                           
git push -u --verbose  origin HEAD 2> tmp_file

# grep pull request url from push command output                                                                      
PR_URL=`grep -io 'https://bitbucket.org/.*' tmp_file`
rm tmp_file

echo "PR URL: $PR_URL"

# mark issue done                                                                                                     
jira done $ISSUE

# magic : http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash                        
if [ -z ${PR_URL} ]; then  echo "no pull request url found"; else open $PR_URL; fi