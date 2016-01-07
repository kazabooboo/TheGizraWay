---
layout: page
title: Continuous Integration Flow
---

# Continuous Integration Flow
Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early.

## Requirements
Make sure you have [Apache](http://www.apache.org/), [Git](https://git-scm.com/), and [Drupal v7.x](https://www.drupal.org/) installed on your computer.

## GitHub
GitHub is a Web-based Git repository hosting service (Git is a VCS). It offers all of the distributed revision control and source code management functionality of Git as well as adding its own features.


### Installation
In this section we'll go over the installation process for an example project - `asiapacific`.

0. Let's open the Terminal and navigate to `var/www/html`.

1. Now, enter to the  [UNFPAHQ projects page on GitHub](https://github.com/UNFPAHQ), and from there enter to the `asiapacific` repository.

2. Now clone the project with the git command `git clone TheUrlRepo` (replace the `TheUrlRepo` with the actual URL of the repo, press on the copy button next to the repo URL).
  ![]({{ site.url }}/assets/ci-flow/Selection_001.png)

3. Enter to the directory project (in our case it's `asiapacific`.

4. Download the Database and Website zip files (linked in the README file of each repo, in our case: [Website zip](https://drive.google.com/a/gizra.com/file/d/0B0mxrCADpU0eeUpCb09nSDJnSE0/view?usp=sharing) & [DB file](https://drive.google.com/a/gizra.com/file/d/0B0mxrCADpU0eRFFKbnZaYVM2ejA/view?usp=sharing)).

5. Extract the Website zip and copy the `files` directory to `asiapacific/sites/default`.

6. Enter to the terminal and create a database with the command `mysqladmin -u username -p create asiapacific` (replace `username` with your MySQL username), MySQL will prompt for your MySQL password. Next log in to MySQL with the command `mysql -u username -p`. Now enter the command `GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON asiapacific.* TO 'username'@'localhost' IDENTIFIED BY 'password';` where `username` and `password` are the MySQL username and password. If all was successfully done, MySQL will replay with `Query OK, 0 rows affected`.

7. Now navigate in the terminal to the `Downloads` directory and load the DB file to the DB you just created with the command `mysql -u username -p asiapacific < DataBaseFile.sql` (replace `DataBaseFile` with the DB file name you downloaded at number 4).

All done! Go to [http://localhost/](http://localhost/) and `asiapacific` to see the website.


### The Gizra Way
When you work on a project you'll be given an issue. You can see all the issues of of the project in the issue tab:
![]({{ site.url }}/assets/ci-flow/Selection_002.png)

Enter to an issue page, and you can see his title (with the issue number next to it), who opened the issue and it's status, comments about that issue, labels, and who is assigned to it.
![]({{ site.url }}/assets/ci-flow/Selection_004.png)

Each task is developed in a separate branch. So in this case I will open a branch with the name 25 (because it's the issue number), and start to commit the code on it. Soon as there is something to review we'll do a pull request with the issue title, so in this case the title of the PR will be `WIP: Behat test - Add tests to sitemap` (WIP stands for **W**ork **I**n **P**rogress - so the Senior developer will know it's not finish yet). And in the text PR we will write the issue number (in our case `#25`).

Once the task is complete we'll review our own code, make sure our code is stand with the [Drupal coding standards](https://www.drupal.org/coding-standards), make sure all tests pass and then remove the *WIP* from the PR title, assign the PR to one of the senior developers (by pressing on the gear icon next to *Assignee* and choose it's username), and add a comment that says to the S.developer that the code is ready to be reviewed. The S.developer will then review the code, comment on each line that requires change (and we'll change it accordingly), and eventually will merge our branch into master (and close the PR and the issue).

An example for a Pull Request:
![]({{ site.url }}/assets/ci-flow/Selection_005.png)

In the above example we see a user named `nirgn975` open a PR for branch named `17` to be merged into branch `master`. He add the issue number (`#17`) to the comment in the PR. Once the task is done he comment on the PR that the code is ready to be reviewed and mention the S.developer (with `@` symbol), and assignee the PR to him.


## Travis - [Website](https://travis-ci.org/)

Travis CI is a Free and open-source software, hosted, distributed continuous integration service used to build and test projects hosted at GitHub. Travis CI makes working in a team for a software project easier with automated builds. These builds are triggered automatically when each developer checks in their code to the repository.

Travis build the project from scratch and run the tests every commit you make. Travis is integrate into GitHub and will place a little red `x` or a green `v` next to every commit (next to the hash number of the commit) depend if the build and the tests succeed or failed. Example:
![]({{ site.url }}/assets/ci-flow/Selection_007.png)
