# fcd looks in $DIRFILE initially $HOME/.dirstack and lets you pick one
# if fcd has a parameter go to that value.
# if 2 parameters use second one as file if first is - pickone else go to first
#
# the sed is to handle bill gates stupid spaces in direcory names
# file $HOME/.sed_dir.txt contains "s/\/\/\// /g"
# If first arguemnt is a + then work as before but after cd do fdchere.

export DIRFILE="$HOME/.dirstack"

function fcd {
   f=$DIRFILE
   dofcdhere=F
   if test x$1 == x+
   then
      shift 1
      dofcdhere=T
   fi

   if test x$2 != x
   then
     f=$2
   fi

   if test x$1 == "x-"
   then
      shift 2
   fi   

   if test x$1 != x
   then
       n=$1
       select foo in `cat $f`
       do
            cd "`echo $foo |  sed -f $HOME/.sed_dir.txt`"
            echo $PWD
            break
        done <<DONE
        $n
DONE

   else

    select foo in `cat $f`
    do
        cd "`echo $foo |  sed -f $HOME/.sed_dir.txt`"
        echo $PWD
        break
   done

   fi

   if test $dofcdhere == T
   then
      fcdhere
   fi
   # if we land on a new project, go ahead and activate it.
   if test -r "$PWD/.dirstack"
   then
      export DIRFILE="$PWD/.dirstack"
   fi
   echo DIRFILE is $DIRFILE
}

#dpd deletes a entry in the $DIRFILE
function dpd {
    select foo in `cat $DIRFILE`
    do
	ed - $DIRFILE <<HERE
	g,^$foo$,d
	w
	q
HERE
	return
    done
}
# apd add current directory to $DIRFILE
# the sed is to change bill gates stupid spaces in direcory names to ///
function apd {
	echo $PWD | sed -e 's/ /\/\/\//g' >> $DIRFILE
}

# establish a new project area
function fcdhere {
      if test x$1 != x
      then
           cd $1
      fi
       export DIRFILE="$PWD/.dirstack"
      # create the first entry if necessary
      if test ! -r "$DIRFILE"
      then
           if test -w "$PWD"
           then
               apd "$PWD"
           fi
      fi
}

# jump to the top-level of the project
function fcdtop {
       cd `dirname $DIRFILE`
}

# jump to $HOME and restore default dirfile/dirstack
function fcdhome {
       cd
       fcdhere
}

# switch to an existing project, by number if specified: "fcdswitch 3"
function fcdswitch {
       fcdhome
       fcd $*
       fcdhere
}

