install [jira-cmd](https://github.com/germanrcuriel/jira-cmd)

	npm install -g jira-cmd
	

configure jira-cmd by running `jira


## branch.sh
to create branch with issue name, assign issue to current user and update is status *to progress*, run :

	  git-jira-branch MOB-11
if a branch with the same name exist, checks out that branch instead


## close.sh
to commit all changes, push the branch, mark issue 'done' and open the pull request page on bitbucket, run :

   	  git-jira-close

from the issues' branch

to copy commands to your `/usr/local/bin` and make them executable

   	cd /usr/local/bin/ && sudo curl https://raw.githubusercontent.com/anlcan/git-jira/master/branch.sh -o git-jira-branch&& sudo chmod a+x gijira-open
   
	cd /usr/local/bin/ && sudo curl https://raw.githubusercontent.com/anlcan/git-jira/master/close.sh -o git-jira-close && sudo chmod a+x gjira-close
