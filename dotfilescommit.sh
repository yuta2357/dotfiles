#!/bin/bash
#自動コミット
#全てのファイルをコミットするときに使用
#使い方----- 特定のディレクトリでbash dotfilescommit.shで起動
#その他
#一部のコミットやブランチを変える時は手作業で

echo "input comment"
read comment

git add .
git commit -m"${comment}"

git push https://github.com/yuta2357/dotfiles master

