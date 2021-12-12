if [ $# -eq 2  ] 
then 
	FOL=$2
elif [ $# -eq 1 ]
then 
	echo Insufficient args, please provide fem link.
else 
	FOL=$1
fi

curl -O https://codeload.github.com/frontendmentorio/$1/zip/refs/heads/main
unzip main -d $FOL
mv $FOL/${1}-main/* $FOL/
rm -rf $FOL/${1}-main main
