@ECHO off
cls
rem This is a batch file to setup a new git repo
rem Date: 3 Jan 2019

ECHO 
ECHO Enter the Github URL as arg1
ECHO Example: setupgit https://www.github.com/AndrewChien78/Test 
set arg1=%1
ECHO ON
ECHO "This is my first repo" >> README.md
git init
git add .
git commit -m "This is the first commit for the repo"
git remote add origin %arg1%
git push -u 