#!/bin/bash

echo "input comment for commit"
read comment

git add .
git commit -m"${comment}"

git push https://github.com/yuta2357/dotfiles master

