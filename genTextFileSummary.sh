#!/bin/bash

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# source the text which should be in key=value pair inside the config
# file so that we can use the variables inside this shell environment.
source config.txt

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Check USERNAME.
if [ -z "${USERNAME}" ]; then 
	echo "USERNAME is unset"; 
	echo "EXITING PLEASE SET 'USERNAME' IN config.txt"
	exit 1

else 
	echo "USERNAME is set to '$USERNAME'"; 
	USERNAME_="$USERNAME"
fi

#Check DIRECTORIES.
if [ -z "${DIRECTORIES}" ]; then 
	echo "DIRECTORIES are unset"; 
else 
	echo "DIRECTORIES are set to '$DIRECTORIES'";
	DIRECTORIES_="$DIRECTORIES"
fi

#Check OUTPUTFILE
if [ -z "${OUTPUTFILE}" ]; then 
	echo "OUTPUTFILE is unset";
	echo "EXITING PLEASE SET 'OUTPUTFILE' IN config.txt"
	exit 1
else 
	echo "OUTPUTFILE are set to '$OUTPUTFILE'";
	OUTPUTFILE_="$OUTPUTFILE"
fi

#Check TARGET_PROJECT_DIR
if [ -z "${TARGET_PROJECT_DIR}" ]; then 
	echo "TARGET_PROJECT_DIR is unset";
	echo "EXITING PLEASE SET 'TARGET_PROJECT_DIR' IN config.txt"
	exit 1
else 
	echo "TARGET_PROJECT_DIR are set to '$TARGET_PROJECT_DIR'";
	TARGET_PROJECT_DIR_="$TARGET_PROJECT_DIR"
fi

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

OUTPUTDIR="Output"
`mkdir $OUTPUTDIR &> /dev/null`

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

git -C $TARGET_PROJECT_DIR log \
--author="$USERNAME_" \
--pretty=format:'%x1E%h%x1F%an%x1F%ae%x1F%aD%x1F%s%x1F%B%x1E' \
$DIRECTORIES_ \
| gawk -f trailers.awk > $OUTPUTDIR/$OUTPUTFILE_

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo 
echo "!Wohooooo!"
echo "Import the generated file "
echo `pwd`/$OUTPUTDIR/$OUTPUTFILE_
echo "in excel "

echo 
echo "The above file contains details of commits made by '$USERNAME_' in '$DIRECTORIES_' directories of '$TARGET_PROJECT_DIR' project."
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
