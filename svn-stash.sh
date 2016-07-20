#!/bin/bash -xe

function apply_diff {
    svn patch $STASH_DIR/$1
}


STASH_DIR=".svnstash"
STACK_SIZE=`ls $STASH_DIR | wc -w`

if [ $# -eq 0 ]; then
    mkdir -p $STASH_DIR
    FILES=`ls $STASH_DIR | grep diff`
    DIFFNAME="diff$STACK_SIZE"
    svn diff > $STASH_DIR/$DIFFNAME
    svn revert -R .
    exit 0
fi


LAST_DIFF=`ls -t ${STASH_DIR} | awk '{print $NF}' | head -1`
echo $LAST_DIFF

if [ $STACK_SIZE -eq 0 ]; then
    echo "Cannot perform any operations. Stack is empty"
    exit -1
fi

if [ $# -gt 0 ]; then
    if [ "$1" = "pop" ]; then
        apply_diff $LAST_DIFF
        rm $STASH_DIR/$LAST_DIFF
        exit 0
    fi

    if [ "$1" = "apply" ]; then
        apply_diff $LAST_DIFF
        exit 0
    fi

    if [ "$1" = "show" ]; then
        vim $STASH_DIR/$LAST_DIFF
        exit 0
    fi

    if [ "$1" = "size" ]; then
        echo $STACK_SIZE
        exit 0
    fi
fi
