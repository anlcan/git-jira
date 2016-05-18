install [jira-cmd](https://github.com/germanrcuriel/jira-cmd)

	```
	npm install -g jira-cmd
	```

configure jira-cmd by running `jira


## branch.sh
to create branch with issue name, assign issue to current user and update is status *to progress*, run :

	  branch.sh MOB-11
if a branch with the same name exist, checks out that branch instead


## close.sh
to commit all changes, push the branch, mark issue 'done' and open the pull request page on bitbucket, run :

   	  close.sh

from the issues' branch
