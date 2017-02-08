My git cheatsheet

# Git
## Start Here to learn git  
* https://try.github.io/levels/1/challenges/1
* https://training.github.com/kit/
* https://training.github.com/classes/
* https://www.atlassian.com/git/tutorials/
* http://git-scm.com/doc
* http://nbviewer.ipython.org/github/fperez/reprosw/blob/master/Version%20Control.ipynb
* http://git-scm.com/book/en/Getting-Started-Git-Basics
* https://help.github.com/articles/create-a-repo
* https://www.atlassian.com/git/tutorials/saving-changes
* http://rogerdudler.github.io/git-guide/
* http://swcarpentry.github.io/git-novice/
* https://www.codeschool.com/paths/git
* http://hplgit.github.io/teamods/bitgit/Langtangen_github.html

## Windows Desktop git Client  
* http://www.sourcetreeapp.com/
* https://code.google.com/p/tortoisegit/
* [git extensions](https://github.com/gitextensions/gitextensions)

## Linux git client
 * gitk 

# Github
* https://github.com/tiimgreen/github-cheat-sheet/blob/master/README.md
* https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf
* https://guides.github.com/activities/hello-world/

# local manuals
* file:///C:/Program%20Files%20%28x86%29/Git/doc/git/html/user-manual.html
* file:///C:/Program%20Files%20%28x86%29/Git/doc/git/html/gittutorial.html

#Other manuals
* https://git-scm.com/docs/git-diff

# how to get help
```bash
git help <verb>
git <verb> --help
man git-<verb>
```

# keywords
```bash
git add         # stages changes
git revert      # unstage
git fetch       # gets changes from remote. Recommend using a branch for all remote work
git merge       # merges changes into the active branch and creates a commit,and the merged branch is unaffected. local by default
git pull        # fetch and merge remote
git revert      # undoes a single commit anywhere by undoing changes and creating a new commit
git reset       # changes the whole project back to the previous commit. NOT RECOMMENDED
git revert HEAD # uses the HEAD commit and makes a new commit without the current changes
git clean       # removes untracked files from the work directory
git rebase      # moves a branch to a new base commit and shares the branches publicly
git remote      # create, view and delete connections to other repositories 
git branch      # create, list, rename and delete branches. branches are just containers for different commits
git checkout    # allows you to edit branches

```

# Workflows
* Centralized workflow - all users share origin/master and and fetch other users changes that have already been comited and push their changes when they are at the top. use ```git pull --rebase origin master``` to keep your commits at the tip rather than trying the merge
* Feature Branch workflow - users share an origin/master and develop in branches, and when their feature is ready, the develop creates a pull request for the team to review and merge if acceptable 
* Forking Workflow - No centralized repository. each user has their own origin/master, and creates branches for all development. 
* Gitflow Workflow - proejct release design more complicated than feature branch workflow


# Typical Walkthrough for setting up an empty project
Git global setup
```
git config --global user.name "Neal Gordon"
git config --global user.email "neal@gordon.com"
```

Create a new repository
```
mkdir test2
cd test2
git init
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin http://gitlab.noble.tech/ngordon/test2.git
git push -u origin master
```

Push an existing Git repository
```
cd existing_git_repo
git remote add origin http://gitlab.noble.tech/ngordon/test2.git
git push -u origin master
```

Help
```bash
git help git
git commit ?
git remote ?
```
other version control systems
 - List item
 - subversion (SVN)
 - Perforce
 - Bazaar

Git takes snapshots of the files, where as SVN tracks differences

SVN equivalents


SVN     |  Git
------  | -----
trunk   |  master
import  |  add
checkout | clone
update | pull



git options /flags

shortcut | name | desc
---------- | -------- | ------
-d |           |			#directories
-f |--force    |
-n  |--dry-run  |
-q |--quiet   |
 -    | --oneline  |
 -v    |  -verbose      |



 Three main states
 
 - commited-data is safely stored in the local database
 - modified - the file is changed the the file is not commited to the databse yet
 - staged - marked a modified file in its current version

staged: Files are ready to be committed.
unstaged: Files with changes that have not been prepared to be commited.
untracked: Files aren't tracked by Git yet. This usually indicates a newly created file.
deleted: File has been deleted and is waiting to be removed from Git.

master is the local repo, where origin/master is the global master of the project
HEAD always refers to the current commit or snapshot


keep a file in the directory but to stop tracking revisions
```bash
git rm --cached -r <dir>
git rm --cached file1
```

## fetching changes and check status
```git status```

a user finished a feature and to share, pushes it to a remote repo from his local repo
make the remote repo just like the local repo
```git push origin master```

if another user tries to do this, it will error. the other users need to pull. the first users updates before she can add hers.  
 adds the second users commits to the top of the master. MERGES branches and all changes. Use fetch if you just want to see the changes
```git pull --rebase origin master```

once the second user does this, they can now make thier repo the master 
```git push origin master```


# Looking at changes
one way to look at the changes of a local repo and compare it to a remote is to use diff

The general syntax for diff is
```
git diff remote/branch
```

gets changes from remote
```bash
git fetch origin master
git diff HEAD...origin
# or 
diff HEAD...origin/master
```

Another way is to use log
```
git fetch origin master
git log origin/master ^master
```

The best way I have found is to use the git merge tool
```
git mergetool
```

Or a manual merge request
```
#Check out, review and merge locally
#Step 1. Fetch and check out the branch for this merge request
git fetch origin
git checkout -b neal origin/neal

#Step 2. Review the changes locally

#Step 3. Merge the branch and fix any conflicts that come up
git checkout master
git merge --no-ff neal

#Step 4. Push the result of the merge to GitLab
git push origin master
```


Or another way is to use this
```
git fetch origin
git diff master origin/master
# if all changes are OK, then
git merge origin/master # assume master is the current branch
```

A better explanation of diff
```
git diff remote/origin   
#This shows the incoming remote additions as deletions; any additions in your local 
repository are shown as additions.

git diff ...remote/origin
#Shows incoming remote additions as additions; the triple-dot excludes changes
committed to your local repository.

git diff ..remote/origin
#Shows incoming remote additions as additions; the double-dot includes changes
committed to your local repository as deletions (since they are not yet pushed).
```

#SSH
ensure that the id_rsa filename stays that way, I have not been able to use a file of any other name
1. check to see if keys exist 
-  ```ls -al ~/.ssh```
2.  generate a new ssh key
- ```ssh-keygen -t rsa -C "your_email@example.com"```
3. star the ssh agent in the background
- ```ssh-agent -s```
4. copy public key to the clipboard
 - ```clip < ~/.ssh/id_rsa.pub```
5. check and make sure that the ssh key is working
- ```ssh -T git@github.com```

# settings
```
git config --global user.name "Neal Gordon"
git config --global user.email nealagordon@gmail.com
git config user.name # returns user name
git config --global core.editor emacs
```

rename files
```git mv file1.txt file2.txt```

test the rename with a dry run
```git commit -a --dry-run```

bash commands to make some files and directories
```mkdir ~/Hello-World # Creates a directory for your project```

Creates a file called "README" in your Hello-World directory
```touch README```

shows all files in the master branch
```git ls-tree -r master```

# Add
```bash
git add filename.txt # adds file to repository
git reset filename.txt # unstages file
git add -A .         # adds all files recursivley which is what the . is for
git add -A stages All
git add . stages new and modified, without deleted
git add -u stages modified and deleted, without new
#git add -A == git add .; git add -u
git add # stages all file changes in the repository
git add <directory>  # stages all changes in directory for the next commit
git add -p # Begin an interactive staging session that lets you choose 
#	portions of a file to add to the next commit. 
#	This will present you with a chunk of changes and prompt you for a command. 
git add '*.txt' # adds all text files
git add *
git add README # Stages your README file, adding it to the list of files to be committed
git commit # takes all files staged with git add and commits them to the local repository.
```

the commited files are safe versions of the project
this also launches a text editor
```bash
git commit -m 'first commit' # Commits your files, adding the message "first commit"
```

everything so far is local , when we push, it will be uploaded to a server
```bash
git commit -a # commits a snapshot of all changes in 
#	the working directroy that have been added with git add
git commit --dry-run -a
```

#Log
```bash 
git log  # use space to scroll, q to exit
git log -n 10 # shows last 10 commits
git log --oneline  # condeses commit infor for overall summary
git log --stat
git log -p  #Most detailed shows the full diff of each commit. 
git log --summary
git log --author="<pattern>" # pattern can be pain text or a regualr pattern
git log --grep="<pattern>" # pattern can be plain text or a regualr pattern
git log <since>..<until>
git log notes_git.txt #only shows commits for a notes_git.txt file
git log --graph --decorate --oneline #decorate adds the name of the branches
git log --author="Neal Gordon" -p notes_git.txt
```

```
git stash # if you pull and dont want to commit, stash
git diff HEAD # looks at the changes
git diff --staged
```

braches allows different featues to be worked on without making changes to the master
can also use branches to try out new stuff. 
branches are just the tip, with all the commits below them 
```git branch # shows branches```
```git branch crazy-experiement # creates a new branch```

but make sure to use checkout to make changes to it
```bash
git branch <branch> # branch a branch, does not check out branch
git branch -d <branch> deletes a branch only is there are not unmerged changes
git branch -D <branch> FORCE deletes a branch even if there are unmerged changes
git branch -m <branch1> renames the current branch to branch1
git rm '*.txt' # removes all textfiles and stages them
git rm -r folder1 # removes an entire folder
```
if the files are deleted from the repo without using git rm, you still need to
or you can use the -a parameter when commiting and it cleans it up
the -a just stages every file when commiting
```git commit -am "finalizes the deletion of the files with rm"```

pull requests allow the admin to look at code, comment it and 
before commits are made
```bash
git merge clean_up  # merges the brach clean_up with the master
git branch -d clean_up  # deletes the branch. 
# If the branch has not been merged, you must use --force or -D
```

viewing old commits via git checkout 
checking out files, checking out commits, checking out branches
checkout command  updates the HEAD to point to either the specifc branch or commit
NEVER DEVELOP ON A DETACHED HEAD. always make a branch
```bash
git checkout --octocat.txt # gets rid of all changes since last commit for octocat.txt
git checkout newbranch1 # switches to newbranch1
git checkout master # returns to the master branch
git checkout <commit> <file1> # reverts file1 in the working directory  to the commit#
# this, unlike checking out an entire commit, does affect the current state of the project!!
git checkout HEAD hello.py # checks out the most recent version
git checkout <commit>  # reverts all files in the working directory to the commit#
# this places you in a detached HEAD state. recommend only checking out a file
git checkout -b new_brach # if you checkout an older version, this is how you branch
```

## undoing changes
The 'current' state of the project remains untouched in the master branch.
During development, the HEAD usually points to master or some local branch until
you check out a previous commit, then HEAD points to the currently checked out commit.
However, viewing an old file via checkout is not a detached head state, but you are actually making changes to the master if commited.

```git revert <commit>  # undoes a single commit and creates a new commit```

Rather than revert back, forgetting the work inbetweem
Reverting should be used when you want to remove an entire 
commit from your project history. This can be useful, for 
example, if you’re tracking down a bug and find that it 
was introduced by a single commit. Instead of manually going 
in, fixing it, and committing a new snapshot, you can use git 
revert to automatically do all of this for you.
example
```
git commit -m "make some changes that will be undone"
git revert HEAD  # reverts the changes we just made with thte commit
```

## reset
```bash
git reset # resets the staging area the match the most recent commit
#	cleaning up the staging area
#	but leaves the working directory unchaged
git reset <file> #removes a file from the staging area
git reset --hard  # obliterates all uncommited changes
git reset <commit> # moves the current branch tip to commit
git reset --hard <commit>
```

## Clean
```bash
git clean -n # performs a dry run of clean
git clean -f # force removes untracked files from the currently directory
git clean -f <path> # removes untracked files in file
git clean -df # removes untracked files and directories 
git clean -xf # removes untracked files and files that git usually ignores
```

## ignore files
```bash
git add .gitignore # adds a file that contains wildcards for files to ignore
git add .gitignore
git commit -m "added ignore file" 
```
commit from history combine the staged changes with the previous commit and  replace the previous commit with resulting snapshot. #creates an entirely new commit and removes the previous ```
```bash
git commit --amend 
```

```bash
git remote #list remote connections to other repos
```

creates, view and delete connections to other repositories. similar to a bookmark to access other repos
```bash
git remote -v # lists urls
git remote add <name1> <url> # creates a new connection, and enables the use of	name1 to access the repo
git remove rm <name> # removes the name to the repo
git remote rename <oldname> <newname>
git remote add john http://dev.example.com/john.git # allows access to 
#	individual repositories 
git remote add origin https://github.com/try-git/try_git.git
git clone # gets a copy of an exiting repo, similar to SVN checkout
git clone git://github.com/schacon/grit.git mygrit  
# creates a clone called origin of grit into mygrit directory
# name the main remote origin
git fetch <remote> # imports commits from a remote repository into the local repo, but does not merge them
#	and stored as remote branches (as opposed to local branches)
#	Fetching is handy to see what other people are working on but not combine with your repository
git fetch <remote> <branch>
git branch -r #views remote branches , use git checkout and git log to inspect
#Deleting a remote branch:
git push origin --delete <branch>  # Git version 1.7.0 or newer
#Deleting a local branch:
git branch --delete <branch>
git branch -d <branch> # Shorter version
```

###merging 
 can be done via fast forward (moving the master to the tip of the branch or to do a three way merge which maintains the branch but moves the master forward
```
git merge # merges branches to the local repository using the defaul algorithm
git merge origin/branch2  # merges local branch with the remote branch2
git merge --noff <branch> # always generate a merge commit
git fetch origin # syncs local repo with the central repo master
git log --oneline master..origin/master
git checkout master
git log origin/master
git merge origin/master
# The origin/master and master branches now point to the same commit
```

While you can use either of these merge strategies, many developers 	like to use fast-forward merges (facilitated through rebasing) for 	small features or bug fixes, while reserving 3-way merges for the 	integration of longer-running features. In the latter case, the 	resulting merge commit serves as a symbolic joining of the two branches.

git pull is equlavalent as SVN update
```git pull <remote> # rolls git fetch and git merge into a single command```
fetches the remote copy of the current branch and merges into local copy
```
git pull origin master # gets changes from the origin
git pull --rebase <remote> # ensures a linear history, as opposed to merging. Recommended
```

moves my local changes on top of everyone elses changes
```
git checkout master
git pull -rebase origin
```

 making changes to master never push to another developers repo, only push to repos created with --bare flag bare repos do not have a working directory
```
git push origin # pushes all branches to the remote
git push <remote> <branch>
git push <remote> --all
git push <remote> --tags # tags are not automatically sent, but they are with this
git fetch --tags
git pull --tags
git push origin master # makes your local repo the global master
git push -u origin master # origin repo on github, -u tells git to remember the parameters



```git push origin master:fix78``` pushes the local master to a remote branch called fix78. You wanted to push the local branch fix78, which has the same syntax but without the master:

You can fix it by doing ```git push origin :fix78``` to delete the remote branch and then ```git push origin fix78``` to push your local branch to the remote repo.

```

errors cloning large repositories, this solved it
```bash
git clone --depth 1 https://github.com/nagordon/test2.git
```

add '.pibb' to the end of a gist url to get the html only version. runs local webserver
``` bash
# change default webserver
git instaweb --webrickt
git instaweb --httpd webrick
```

# if it fails you may need to install it
```
sudo apt-get install mysql-server mysql-client
sudo apt-get install lighttpd
sudo apt-get install php5-fpm php5
```

move the location of the repoistory
```
# clone the original repository first
git clone https://github.com/nagordon/test3.git
# push the local master to the new test4 master
git push https://github.com/nagordon/test4.git master:master

```

# end of my cheatsheet
- - - -
- - - -
- - - -

# GitHub Cheat Sheet
A collection of cool hidden and not so hidden features of Git and GitHub. This cheat sheet was inspired by [Zach Holman](https://github.com/holman)'s [Git and GitHub Secrets](http://www.confreaks.com/videos/1229-aloharuby2012-git-and-github-secrets) talk at Aloha Ruby Conference 2012 ([slides](https://speakerdeck.com/holman/git-and-github-secrets)) and his [More Git and GitHub Secrets](https://vimeo.com/72955426) talk at WDCNZ 2013 ([slides](https://speakerdeck.com/holman/more-git-and-github-secrets)).

*Shortlink: [`http://git.io/sheet`](http://git.io/sheet)*

*Read this in other languages: [English](README.md), [한국어](README.ko.md), [日本語](README.ja.md), [简体中文](README.zh-cn.md).*

## Table of Contents
 - [GitHub](#github)
  - [Ignore Whitespace](#ignore-whitespace)
  - [Adjust Tab Space](#adjust-tab-space)
  - [Commit History by Author](#commit-history-by-author)
  - [Cloning a Repository](#cloning-a-repository)
  - [Branch](#branch)
    - [Compare all Branches to Another Branch](#compare-all-branches-to-another-branch)
    - [Comparing Branches](#comparing-branches)
    - [Compare Branches across Forked Repositories](#compare-branches-across-forked-repositories)
  - [Gists](#gists)
  - [Git.io](#gitio)
  - [Keyboard Shortcuts](#keyboard-shortcuts)
  - [Line Highlighting in Repositories](#line-highlighting-in-repositories)
  - [Closing Issues via Commit Messages](#closing-issues-via-commit-messages)
  - [Cross-Link Issues](#cross-link-issues)
  - [Locking Conversations](#locking-conversations)
  - [CI Status on Pull Requests](#ci-status-on-pull-requests)
  - [Syntax Highlighting in Markdown Files](#syntax-highlighting-in-markdown-files)
  - [Emojis](#emojis)
  - [Images/GIFs](#imagesgifs)
    - [Embedding Images in GitHub Wiki](#embedding-images-in-github-wiki)
  - [Quick Quoting](#quick-quoting)
  - [Pasting Clipboard Image to Comments](#pasting-clipboard-image-to-comments)
  - [Quick Licensing](#quick-licensing)
  - [Task Lists](#task-lists)
    - [Task Lists in Markdown Documents](#task-lists-in-markdown-documents)
  - [Relative Links](#relative-links)
  - [Metadata and Plugin Support for GitHub Pages](#metadata-and-plugin-support-for-github-pages)
  - [Viewing YAML Metadata in your Documents](#viewing-yaml-metadata-in-your-documents)
  - [Rendering Tabular Data](#rendering-tabular-data)
  - [Revert a Pull Request](#revert-a-pull-request)
  - [Diffs](#diffs)
    - [Rendered Prose Diffs](#rendered-prose-diffs)
    - [Diffable Maps](#diffable-maps)
    - [Expanding Context in Diffs](#expanding-context-in-diffs)
    - [Diff or Patch of Pull Request](#diff-or-patch-of-pull-request)
    - [Rendering and diffing images](#rendering-and-diffing-images)
  - [Hub](#hub)
  - [Contributing Guidelines](#contributing-guidelines)
  - [Octicons](#octicons)
  - [GitHub Resources](#github-resources)
    - [GitHub Talks](#github-talks)
 - [Git](#git)
  - [Previous Branch](#previous-branch)
  - [Stripspace](#stripspace)
  - [Checking out Pull Requests](#checking-out-pull-requests)
  - [Empty Commits :trollface:](#empty-commits-trollface)
  - [Styled Git Status](#styled-git-status)
  - [Styled Git Log](#styled-git-log)
  - [Git Query](#git-query)
  - [Merged Branches](#merged-branches)
  - [Fixup and Autosquash](#fixup-and-autosquash)
  - [Web Server for Browsing Local Repositories](#web-server-for-browsing-local-repositories)
  - [Git Configurations](#git-configurations)
    - [Aliases](#aliases)
    - [Auto-Correct](#auto-correct)
    - [Color](#color)
  - [Git Resources](#git-resources)
    - [Git Books](#git-books)

## GitHub
### Ignore Whitespace
Adding `?w=1` to any diff URL will remove any changes only in whitespace, enabling you to see only that code that has changed.

![Diff without whitespace](https://camo.githubusercontent.com/797184940defadec00393e6559b835358a863eeb/68747470733a2f2f6769746875622d696d616765732e73332e616d617a6f6e6177732e636f6d2f626c6f672f323031312f736563726574732f776869746573706163652e706e67)

[*Read more about GitHub secrets.*](https://github.com/blog/967-github-secrets)

### Adjust Tab Space
Adding `?ts=4` to a diff or file URL will display tab characters as 4 spaces wide instead of the default 8. The number after `ts` can be adjusted to suit your preference. This does not work on Gists, or raw file views, but a [Chrome extension](https://chrome.google.com/webstore/detail/github-tab-size/ofjbgncegkdemndciafljngjbdpfmbkn) can automate this.

Here is a Go source file before adding `?ts=4`:

![Before, tab space example](http://i.imgur.com/GIT1Fr0.png)

...and this is after adding `?ts=4`:

![After, tab space example](http://i.imgur.com/70FL4H9.png)

### Commit History by Author
To view all commits on a repo by author add `?author={user}` to the URL.

```
https://github.com/rails/rails/commits/master?author=dhh
```

![DHH commit history](http://i.imgur.com/S7AE29b.png)

[*Read more about the differences between commits views.*](https://help.github.com/articles/differences-between-commit-views)

### Cloning a Repository
When cloning a repository the `.git` can be left off the end.

```bash
$ git clone https://github.com/tiimgreen/github-cheat-sheet
```

[*Read more about the Git `clone` command.*](http://git-scm.com/docs/git-clone)

###Branch
#### Compare all Branches to Another Branch

If you go to the repo's [Branches](https://github.com/tiimgreen/github-cheat-sheet/branches) page, next to the Commits button:

```
https://github.com/{user}/{repo}/branches
```

... you would see a list of all branches which are not merged into the main branch.

From here you can access the compare page or delete a branch with a click of a button.

![Compare branches not merged into master in rails/rails repo - https://github.com/rails/rails/branches](http://i.imgur.com/0FEe30z.png)

#### Comparing Branches
To use GitHub to compare branches, change the URL to look like this:

```
https://github.com/{user}/{repo}/compare/{range}
```

Where `{range} = master...4-1-stable`

For example:

```
https://github.com/rails/rails/compare/master...4-1-stable
```

![Rails branch compare example](http://i.imgur.com/tIRCOsK.png)

`{range}` can be changed to things like:

```
https://github.com/rails/rails/compare/master@{1.day.ago}...master
https://github.com/rails/rails/compare/master@{2014-10-04}...master
```

*Dates are in the format `YYYY-DD-MM`*

![Another compare example](http://i.imgur.com/5dtzESz.png)

Branches can also be compared in `diff` and `patch` views:

```
https://github.com/rails/rails/compare/master...4-1-stable.diff
https://github.com/rails/rails/compare/master...4-1-stable.patch
```

[*Read more about comparing commits across time.*](https://help.github.com/articles/comparing-commits-across-time)

#### Compare Branches across Forked Repositories
To use GitHub to compare branches across forked repositories, change the URL to look like this:

```
https://github.com/{user}/{repo}/compare/{foreign-user}:{branch}...{own-branch}
```

For example:

```
https://github.com/rails/rails/compare/byroot:master...master
```

![Forked branch compare](http://i.imgur.com/Q1W6qcB.png)

### Gists
[Gists](https://gist.github.com/) are an easy way to work with small bits of code without creating a fully fledged repository.

![Gist](http://i.imgur.com/VkKI1LC.png?1)

Add `.pibb` to the end of any Gist URL ([like this](https://gist.github.com/tiimgreen/10545817.pibb)) in order to get the *HTML only* version suitable for embedding in any other site.

Gists can be treated as a repository so they can be cloned like any other:

```bash
$ git clone https://gist.github.com/tiimgreen/10545817
```

![Gists](http://i.imgur.com/BcFzabp.png)

This means you also can modify and push updates to Gists:

```bash
$ git commit
$ git push
Username for 'https://gist.github.com': 
Password for 'https://tiimgreen@gist.github.com': 
```

However, Gists do not support directories. All files need to be added to the repository root.  
[*Read more about creating Gists.*](https://help.github.com/articles/creating-gists)

### Git.io
[Git.io](http://git.io) is a simple URL shortener for GitHub.

![Git.io](http://i.imgur.com/6JUfbcG.png?1)

You can also use it via pure HTTP using Curl:

```bash
$ curl -i http://git.io -F "url=https://github.com/..."
HTTP/1.1 201 Created
Location: http://git.io/abc123

$ curl -i http://git.io/abc123
HTTP/1.1 302 Found
Location: https://github.com/...
```

[*Read more about Git.io.*](https://github.com/blog/985-git-io-github-url-shortener)

### Keyboard Shortcuts
When on a repository page, keyboard shortcuts allow you to navigate easily.

 - Pressing `t` will bring up a file explorer.
 - Pressing `w` will bring up the branch selector.
 - Pressing `s` will focus the search field for the current repository. Pressing Backspace to delete the “This repository” pill changes the field to search all of GitHub.
 - Pressing `l` will edit labels on existing Issues.
 - Pressing `y` **when looking at a file** (e.g. `https://github.com/tiimgreen/github-cheat-sheet/blob/master/README.md`) will change your URL to one which, in effect, freezes the page you are looking at. If this code changes, you will still be able to see what you saw at that current time.

To see all of the shortcuts for the current page press `?`:

![Keyboard shortcuts](http://i.imgur.com/y5ZfNEm.png)

[Read more about search syntax you can use.](https://help.github.com/articles/search-syntax/)

### Line Highlighting in Repositories
Either adding `#L52` to the end of a code file URL or simply clicking the line number will highlight that line number.

It also works with ranges, e.g. `#L53-L60`, to select ranges, hold `shift` and click two lines:

```
https://github.com/rails/rails/blob/master/activemodel/lib/active_model.rb#L53-L60
```

![Line Highlighting](http://i.imgur.com/8AhjrCz.png)

### Closing Issues via Commit Messages
If a particular commit fixes an issue, any of the keywords `fix/fixes/fixed`, `close/closes/closed` or `resolve/resolves/resolved`, followed by the issue number, will close the issue once it is committed to the master branch.

```bash
$ git commit -m "Fix screwup, fixes #12"
```

This closes the issue and references the closing commit.

![Closing Repo](http://i.imgur.com/Uh1gZdx.png)

[*Read more about closing Issues via commit messages.*](https://help.github.com/articles/closing-issues-via-commit-messages)

### Cross-Link Issues
If you want to link to another issue in the same repository, simply type hash `#` then the issue number, and it will be auto-linked.

To link to an issue in another repository, `{user}/{repo}#ISSUE_NUMBER` e.g. `tiimgreen/toc#12`.

![Cross-Link Issues](https://camo.githubusercontent.com/447e39ab8d96b553cadc8d31799100190df230a8/68747470733a2f2f6769746875622d696d616765732e73332e616d617a6f6e6177732e636f6d2f626c6f672f323031312f736563726574732f7265666572656e6365732e706e67)

### Locking Conversations
Pull Requests and Issues can now be locked by owners or collaborators of the repo.

![Lock conversation](https://cloud.githubusercontent.com/assets/2723/3221693/bf54dd44-f00d-11e3-8eb6-bb51e825bc2c.png)

This means that users who are not collaborators on the project will no longer be able to comment.

![Comments locked](https://cloud.githubusercontent.com/assets/2723/3221775/d6e513b0-f00e-11e3-9721-2131cb37c906.png)

[*Read more about locking conversations.*](https://github.com/blog/1847-locking-conversations)


### CI Status on Pull Requests
If set up correctly, every time you receive a Pull Request, [Travis CI](https://travis-ci.org/) will build that Pull Request just like it would every time you make a new commit. Read more about how to [get started with Travis CI](http://docs.travis-ci.com/user/getting-started/).

[![Travis CI status](https://cloud.githubusercontent.com/assets/1687642/2700187/3a88838c-c410-11e3-9a46-e65e2a0458cd.png)](https://github.com/octokit/octokit.rb/pull/452)

[*Read more about the commit status API.*](https://github.com/blog/1227-commit-status-api)

### Syntax Highlighting in Markdown Files
For example, to syntax highlight Ruby code in your Markdown files write:

    ```ruby
    require 'tabbit'
    table = Tabbit.new('Name', 'Email')
    table.add_row('Tim Green', 'tiimgreen@gmail.com')
    puts table.to_s
    ```

This will produce:

```ruby
require 'tabbit'
table = Tabbit.new('Name', 'Email')
table.add_row('Tim Green', 'tiimgreen@gmail.com')
puts table.to_s
```

GitHub uses [Linguist](https://github.com/github/linguist) to perform language detection and syntax highlighting. You can find out which keywords are valid by perusing the [languages YAML file](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).

[*Read more about GitHub Flavored Markdown.*](https://help.github.com/articles/github-flavored-markdown)

### Emojis
Emojis can be added to Pull Requests, Issues, commit messages, etc. using `:name_of_emoji:`

The full list of supported Emojis on GitHub can be found at [emoji-cheat-sheet.com](http://www.emoji-cheat-sheet.com/) or [scotch-io/All-Github-Emoji-Icons](https://github.com/scotch-io/All-Github-Emoji-Icons).

The top 5 used Emojis on GitHub are:

1. `:shipit:`
2. `:sparkles:`
3. `:-1:`
4. `:+1:`
5. `:clap:`

### Images/GIFs
Images and GIFs can be added to comments, READMEs etc.:

```
![Alt Text](http://www.sheawong.com/wp-content/uploads/2013/08/keephatin.gif)
```

Raw images from the repo can be used by calling them directly.:

```
![Alt Text](https://github.com/{user}/{repo}/raw/master/path/to/image.gif)
```

![Peter don't care](http://www.sheawong.com/wp-content/uploads/2013/08/keephatin.gif)

All images are cached on GitHub, so if your host goes down, the image will remain available.

#### Embedding Images in GitHub Wiki
There are multiple ways of embedding images in Wiki pages. There's the standard Markdown syntax (shown above). But there's also a syntax that allows things like specifying the height or width of the image:

```markdown
[[ http://www.sheawong.com/wp-content/uploads/2013/08/keephatin.gif | height = 100px ]]
```

Which produces:

![Just a screenshot](http://i.imgur.com/J5bMf7S.png)

### Quick Quoting
When on a comment thread and you want to quote something someone previously said, highlight the text and press `r`, this will copy it into your text box in the block-quote format.

![Quick Quote](https://f.cloud.github.com/assets/296432/124483/b0fa6204-6ef0-11e2-83c3-256c37fa7abc.gif)

[*Read more about quick quoting.*](https://github.com/blog/1399-quick-quotes)

### Pasting Clipboard Image to Comments

_(Works on Chrome browsers only)_

After taking a screenshot and adding it to the clipboard (mac: `cmd-ctrl-shift-4`), you can simply paste (`cmd-v / ctrl-v`) the image into the comment section and it will be auto-uploaded to github.

![Pasting Clipboard Image to Comments](https://cloud.githubusercontent.com/assets/39191/5794265/39c9b65a-9f1b-11e4-9bc7-04e41f59ea5f.png)

[*Read more about issue attachments.*](https://help.github.com/articles/issue-attachments)

### Quick Licensing
When creating a repository, GitHub gives you the option of adding in a pre-made license:

![License](http://i.imgur.com/Chqj4Fg.png)

You can also add them to existing repositories by creating a new file through the web interface. When the name `LICENSE` is typed in you will get an option to use a template:

![License](http://i.imgur.com/fTjQict.png)

Also works for `.gitignore`.

[*Read more about open source licensing.*](https://help.github.com/articles/open-source-licensing)

### Task Lists
In Issues and Pull requests check boxes can be added with the following syntax (notice the space):

```
- [ ] Be awesome
- [ ] Prepare dinner
  - [ ] Research recipe
  - [ ] Buy ingredients
  - [ ] Cook recipe
- [ ] Sleep
```

![Task List](http://i.imgur.com/jJBXhsY.png)

When they are clicked, they will be updated in the pure Markdown:

```
- [x] Be awesome
- [ ] Prepare dinner
  - [x] Research recipe
  - [x] Buy ingredients
  - [ ] Cook recipe
- [ ] Sleep
```

[*Read more about task lists.*](https://help.github.com/articles/writing-on-github#task-lists)

#### Task Lists in Markdown Documents
In full Markdown documents **read-only** checklists can now be added using the following syntax:

```
- [ ] Mercury
- [x] Venus
- [x] Earth
  - [x] Moon
- [x] Mars
  - [ ] Deimos
  - [ ] Phobos
```

- [ ] Mercury
- [x] Venus
- [x] Earth
  - [x] Moon
- [x] Mars
  - [ ] Deimos
  - [ ] Phobos

[*Read more about task lists in markdown documents.*](https://github.com/blog/1825-task-lists-in-all-markdown-documents)

### Relative Links
Relative links are recommended in your Markdown files when linking to internal content.

```markdown
[Link to a header](#awesome-section)
[Link to a file](docs/readme)
```

Absolute links have to be updated whenever the URL changes (e.g. repository renamed, username changed, project forked). Using relative links makes your documentation easily stand on its own.

[*Read more about relative links.*](https://help.github.com/articles/relative-links-in-readmes)

### Metadata and Plugin Support for GitHub Pages
Within Jekyll pages and posts, repository information is available within the `site.github` namespace, and can be displayed, for example, using `{{ site.github.project_title }}`.

The Jemoji and jekyll-mentions plugins enable [emoji](#emojis) and [@mentions](https://github.com/blog/821) in your Jekyll posts and pages to work just like you'd expect when interacting with a repository on GitHub.com.

[*Read more about repository metadata and plugin support for GitHub Pages.*](https://github.com/blog/1797-repository-metadata-and-plugin-support-for-github-pages)

### Viewing YAML Metadata in your Documents
Many blogging websites, like [Jekyll](http://jekyllrb.com/) with [GitHub Pages](http://pages.github.com/), depend on some YAML-formatted metadata at the beginning of your post. GitHub will render this metadata as a horizontal table, for easier reading

![YAML metadata](https://camo.githubusercontent.com/47245aa16728e242f74a9a324ce0d24c0b916075/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f36343035302f313232383236372f65303439643063362d323761302d313165332d396464382d6131636432323539393334342e706e67)

[*Read more about viewing YAML metadata in your documents.*](https://github.com/blog/1647-viewing-yaml-metadata-in-your-documents)

### Rendering Tabular Data
GitHub supports rendering tabular data in the form of `.csv` (comma-separated) and `.tsv` (tab-separated) files.

![Tabular data](https://camo.githubusercontent.com/1b6dd0157ffb45d9939abf14233a0cb13b3b4dfe/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f3238323735392f3937363436322f33323038336463652d303638642d313165332d393262322d3566323863313061353035392e706e67)

[*Read more about rendering tabular data.*](https://github.com/blog/1601-see-your-csvs)

###Revert a Pull Request
After a pull request is merged, you may find it does not help anything or it was a bad decision to merge the pull request. 

You can revert it by clicking the **Revert** button on the right side of a commit in the pull request page to create a pull request with reverted changes to this specific pull request.

![Revert button](https://camo.githubusercontent.com/0d3350caf2bb1cba53123ffeafc00ca702b1b164/68747470733a2f2f6769746875622d696d616765732e73332e616d617a6f6e6177732e636f6d2f68656c702f70756c6c5f72657175657374732f7265766572742d70756c6c2d726571756573742d6c696e6b2e706e67)

[*Read more about reverting pull requests*](https://github.com/blog/1857-introducing-the-revert-button)

### Diffs
#### Rendered Prose Diffs
Commits and pull requests, including rendered documents supported by GitHub (e.g. Markdown), feature *source* and *rendered* views.

![Source / Rendered view](https://github-images.s3.amazonaws.com/help/repository/rendered_prose_diff.png)

Click the "rendered" button to see the changes as they'll appear in the rendered document. Rendered prose view is handy when you're adding, removing, and editing text:

![Rendered Prose Diffs](https://f.cloud.github.com/assets/17715/2003056/3997edb4-862b-11e3-90be-5e9586edecd7.png)

[*Read more about rendered prose diffs.*](https://github.com/blog/1784-rendered-prose-diffs)

#### Diffable Maps
Any time you view a commit or pull request on GitHub that includes geodata, GitHub will render a visual representation of what was changed.

[![Diffable Maps](https://f.cloud.github.com/assets/282759/2090660/63f2e45a-8e97-11e3-9d8b-d4c8078b004e.gif)](https://github.com/benbalter/congressional-districts/commit/2233c76ca5bb059582d796f053775d8859198ec5)

[*Read more about diffable maps.*](https://github.com/blog/1772-diffable-more-customizable-maps)

#### Expanding Context in Diffs
Using the *unfold* button in the gutter of a diff, you can reveal additional lines of context with a click. You can keep clicking *unfold* until you've revealed the whole file, and the feature is available anywhere GitHub renders diffs.

![Expanding Context in Diffs](https://f.cloud.github.com/assets/22635/1610539/863c1f64-5584-11e3-82bf-151b406a272f.gif)

[*Read more about expanding context in diffs.*](https://github.com/blog/1705-expanding-context-in-diffs)

#### Diff or Patch of Pull Request
You can get the diff of a Pull Request by adding a `.diff` or `.patch`
extension to the end of the URL. For example:

```
https://github.com/tiimgreen/github-cheat-sheet/pull/15
https://github.com/tiimgreen/github-cheat-sheet/pull/15.diff
https://github.com/tiimgreen/github-cheat-sheet/pull/15.patch
```

The `.diff` extension would give you this in plain text:

```
diff --git a/README.md b/README.md
index 88fcf69..8614873 100644
--- a/README.md
+++ b/README.md
@@ -28,6 +28,7 @@ All the hidden and not hidden features of Git and GitHub. This cheat sheet was i
 - [Merged Branches](#merged-branches)
 - [Quick Licensing](#quick-licensing)
 - [TODO Lists](#todo-lists)
+- [Relative Links](#relative-links)
 - [.gitconfig Recommendations](#gitconfig-recommendations)
     - [Aliases](#aliases)
     - [Auto-correct](#auto-correct)
@@ -381,6 +382,19 @@ When they are clicked, they will be updated in the pure Markdown:
 - [ ] Sleep

(...)
```

#### Rendering and diffing images
GitHub can display several common image formats, including PNG, JPG, GIF, and PSD. In addition, there are several ways to compare differences between versions of those image formats.

[![Diffable PSD](https://cloud.githubusercontent.com/assets/2546/3165594/55f2798a-eb56-11e3-92e7-b79ad791a697.gif)](https://github.com/blog/1845-psd-viewing-diffing)

[*Read more about rendering and diffing images.*](https://help.github.com/articles/rendering-and-diffing-images)

### Hub
[Hub](https://github.com/github/hub) is a command line Git wrapper that gives you extra features and commands that make working with GitHub easier.

This allows you to do things like:

```bash
$ hub clone tiimgreen/toc
```

[*Check out some more cool commands Hub has to offer.*](https://github.com/github/hub#commands)

### Contributing Guidelines
Adding a `CONTRIBUTING` file to the root of your repository will add a link to your file when a contributor creates an Issue or opens a Pull Request.

![Contributing Guidelines](https://camo.githubusercontent.com/71995d6b0e620a9ef1ded00a04498241c69dd1bf/68747470733a2f2f6769746875622d696d616765732e73332e616d617a6f6e6177732e636f6d2f736b697463682f6973737565732d32303132303931332d3136323533392e6a7067)

[*Read more about contributing guidelines.*](https://github.com/blog/1184-contributing-guidelines)

### Octicons
GitHubs icons (Octicons) have now been open sourced.

![Octicons](https://og.github.com/octicons/octicons@1200x630.png)

[*Read more about GitHub's Octicons*](https://octicons.github.com)


### GitHub Resources
| Title | Link |
| ----- | ---- |
| GitHub Explore | https://github.com/explore |
| GitHub Blog | https://github.com/blog |
| GitHub Help | https://help.github.com/ |
| GitHub Training | https://training.github.com/ |
| GitHub Developer | https://developer.github.com/ |

#### GitHub Talks
| Title | Link |
| ----- | ---- |
| How GitHub Uses GitHub to Build GitHub | https://www.youtube.com/watch?v=qyz3jkOBbQY |
| Introduction to Git with Scott Chacon of GitHub | https://www.youtube.com/watch?v=ZDR433b0HJY |
| How GitHub No Longer Works | https://www.youtube.com/watch?v=gXD1ITW7iZI |
| Git and GitHub Secrets | https://www.youtube.com/watch?v=Foz9yvMkvlA |
| More Git and GitHub Secrets | https://www.youtube.com/watch?v=p50xsL-iVgU |

## Git
### Previous Branch
To move to the previous branch in Git:

```bash
$ git checkout -
# Switched to branch 'master'

$ git checkout -
# Switched to branch 'next'

$ git checkout -
# Switched to branch 'master'
```

[*Read more about Git branching.*](http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging)

### Stripspace

Git Stripspace:

- Strips trailing whitespace
- Collapses newlines
- Adds newline to end of file

A file must be passed when calling the command, e.g.:
```bash
$ git stripspace < README.md
```

[*Read more about the Git `stripspace` command.*](http://git-scm.com/docs/git-stripspace)

### Checking out Pull Requests

Pull Requests are special branches on the GitHub repository which can be retrieved locally in several ways:

Retrieve a specific Pull Request and store it temporarily in `FETCH_HEAD` for quickly `diff`ing or `merge`ing:

```bash
$ git fetch origin refs/pull/[PR-Number]/head
```

Acquire all Pull Request branches as local remote branches by refspec:

```bash
$ git fetch origin '+refs/pull/*/head:refs/remotes/origin/pr/*'
```

Or setup the remote to fetch Pull Requests automatically by adding these corresponding lines in your repository's `.git/config`:

```
[remote "origin"]
    fetch = +refs/heads/*:refs/remotes/origin/*
    url = git@github.com:tiimgreen/github-cheat-sheet.git
```

```
[remote "origin"]
    fetch = +refs/heads/*:refs/remotes/origin/*
    url = git@github.com:tiimgreen/github-cheat-sheet.git
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
```

For Fork-based Pull Request contributions, it's useful to `checkout` a remote branch representing the Pull Request and create a local branch from it:

```bash
$ git checkout pr/42 pr-42
```

Or should you work on more repositories, you can globally configure fetching pull requests in the global git config instead.

```bash
git config --global --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
```

This way, you can use the following short commands in all your repositories:
```bash
git fetch origin
```

```bash
git checkout pr/42
```

[*Read more about checking out pull requests locally.*](https://help.github.com/articles/checking-out-pull-requests-locally)

### Empty Commits :trollface:
Commits can be pushed with no code changes by adding `--allow-empty`:

```bash
$ git commit -m "Big-ass commit" --allow-empty
```

Some use-cases for this (that make sense), include:

 - Annotating the start of a new bulk of work or a new feature.
 - Documenting when you make changes to the project that aren't code related.
 - Communicating with people using your repository.
 - The first commit of a repo, as the first commit cannot be rebased later: `git commit -m "init repo" --allow-empty`.

![It ain't even that trolololol...](http://i.minus.com/il1jaw.gif)

### Styled Git Status
Running:

```bash
$ git status
```

Produces:

![git status](http://i.imgur.com/qjPyvXb.png)

By adding `-sb`:

```bash
$ git status -sb
```

This is produced:

![git status -sb](http://i.imgur.com/K0OY3nm.png)

[*Read more about the Git `status` command.*](http://git-scm.com/docs/git-status)

### Styled Git Log
Running:

```bash
$ git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
```

Produces:

![git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative](http://i.imgur.com/58eOtkW.png)

Credit to [Palesz](http://stackoverflow.com/users/88355/palesz)

*This can be aliased using the instructions found [here](https://github.com/tiimgreen/github-cheat-sheet#aliases).*

[*Read more about the Git `log` command.*](http://git-scm.com/docs/git-log)

### Git Query
A Git query allows you to search all your previous commit messages and find the most recent one matching the query.

```bash
$ git show :/query
```

Where `query` (case-sensitive) is the term you want to search, this then finds the last one and gives details on the lines that were changed.

```bash
$ git show :/typo
```
![git show :/query](http://i.imgur.com/icaGiNt.png)

*Press `q` to quit.*

### Merged Branches
Running:

```bash
$ git branch --merged
```

Will give you a list of all branches that have been merged into your current branch.

Conversely:

```bash
$ git branch --no-merged
```

Will give you a list of branches that have not been merged into your current branch.

[*Read more about the Git `branch` command.*](http://git-scm.com/docs/git-branch)

### Fixup and Autosquash
If there is something wrong with a previous commit (can be one or more from HEAD), for example `abcde`, run the following command after you've amended the problem:
```bash
$ git commit --fixup=abcde
$ git rebase abcde^ --autosquash -i
```
[*Read more about the Git `commit` command.*](http://git-scm.com/docs/git-commit)
[*Read more about the Git `rebase` command.*](http://git-scm.com/docs/git-rebase)

### Web Server for Browsing Local Repositories
Use the Git `instaweb` command to instantly browse your working repository in `gitweb`. This command is a simple script to set up `gitweb` and a web server for browsing the local repository.

```bash
$ git instaweb
```

Opens:

![Git instaweb](http://i.imgur.com/Dxekmqc.png)

[*Read more about the Git `instaweb` command.*](http://git-scm.com/docs/git-instaweb)

### Git Configurations
Your `.gitconfig` file contains all your Git configurations.

#### Aliases
Aliases are helpers that let you define your own git calls. For example you could set `git a` to run `git add --all`.

To add an alias, either navigate to `~/.gitconfig` and fill it out in the following format:

```
[alias]
  co = checkout
  cm = commit
  p = push
  # Show verbose output about tags, branches or remotes
  tags = tag -l
  branches = branch -a
  remotes = remote -v
```

...or type in the command-line:

```bash
$ git config --global alias.new_alias git_function
```

For example:

```bash
$ git config --global alias.cm commit
```

For an alias with multiple functions use quotes:

```bash
$ git config --global alias.ac 'add -A . && commit'
```

Some useful aliases include:

| Alias | Command | What to Type |
| --- | --- | --- |
| `git cm` | `git commit` | `git config --global alias.cm commit` |
| `git co` | `git checkout` | `git config --global alias.co checkout` |
| `git ac` | `git add . -A` `git commit` | `git config --global alias.ac '!git add -A && git commit'` |
| `git st` | `git status -sb` | `git config --global alias.st 'status -sb'` |
| `git tags` | `git tag -l` | `git config --global alias.tags 'tag -l'` |
| `git branches` | `git branch -a` | `git config --global alias.branches 'branch -a'` |
| `git cleanup` | `git branch --merged | grep -v '*' | xargs git branch -d` | `git config --global alias.cleanup "!git branch --merged | grep -v '*' | xargs git branch -d"` |
| `git remotes` | `git remote -v` | `git config --global alias.remotes 'remote -v'` |
| `git lg` | `git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --` | `git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"` |

*Some Aliases are taken from [@mathiasbynens](https://github.com/mathiasbynens) dotfiles: https://github.com/mathiasbynens/dotfiles/blob/master/.gitconfig*

#### Auto-Correct
If you type `git comit` you will get this:

```bash
$ git comit -m "Message"
# git: 'comit' is not a git command. See 'git --help'.

# Did you mean this?
#   commit
```

To call `commit` when `comit` is typed, just enable auto-correct:

```bash
$ git config --global help.autocorrect 1
```

So now you will get this:

```bash
$ git comit -m "Message"
# WARNING: You called a Git command named 'comit', which does not exist.
# Continuing under the assumption that you meant 'commit'
# in 0.1 seconds automatically...
```

#### Color
To add more color to your Git output:

```bash
$ git config --global color.ui 1
```

[*Read more about the Git `config` command.*](http://git-scm.com/docs/git-config)

### Git Resources
| Title | Link |
| ----- | ---- |
| Official Git Site | http://git-scm.com/ |
| Official Git Video Tutorials | http://git-scm.com/videos |
| Code School Try Git | http://try.github.com/ |
| Introductory Reference & Tutorial for Git | http://gitref.org/ |
| Official Git Tutorial | http://git-scm.com/docs/gittutorial |
| Everyday Git | http://git-scm.com/docs/everyday |
| Git Immersion | http://gitimmersion.com/ |
| Ry's Git Tutorial | http://rypress.com/tutorials/git/index.html |
| Git for Designers | http://hoth.entp.com/output/git_for_designers.html |
| Git for Computer Scientists | http://eagain.net/articles/git-for-computer-scientists/ |
| Git Magic | http://www-cs-students.stanford.edu/~blynn/gitmagic/ |
| GitHub Training Kit | http://training.github.com/kit |

#### Git Books
| Title | Link |
| ----- | ---- |
| Pragmatic Version Control Using Git | http://www.pragprog.com/titles/tsgit/pragmatic-version-control-using-git |
| Pro Git | http://git-scm.com/book |
| Git Internals PluralSight | https://github.com/pluralsight/git-internals-pdf |
| Git in the Trenches | http://cbx33.github.com/gitt/ |
| Version Control with Git | http://www.amazon.com/Version-Control-Git-collaborative-development/dp/1449316387 |
| Pragmatic Guide to Git | http://www.pragprog.com/titles/pg_git/pragmatic-guide-to-git |
| Git: Version Control for Everyone | http://www.packtpub.com/git-version-control-for-everyone/book |
