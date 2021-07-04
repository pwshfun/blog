#Remove-Item .\public\* -Recurse

hugo

Set-Location public
git add -A


$msg="rebuilding site " + (Get-Date)
If ($args[0]) {$msg = $args[0]}

#commit and push public repo
git commit -m $msg
git push origin master

#and back out and commit and push source repo
cd ..
git add -A
git commit -m $msg
git push origin master