
[ please look at 'Issues' for questions and feedback. thanks! ]

Preston's better bash dirstack

FIXME: this documentation is a work-in-progress

fcd depends on a ascii text file named $DIRFILE ( initially $HOME/.dirstack )

Since it is an ascii file you can view it, edit it, etc.  Here is a small example:

* /home/fred
* /path/to/project1
* /path/to/project2

The main idea of fcd is to present the contents of the DIRFILE as a
numbered menu and allow you to quickly 'cd' to that directory, even
if the name is hard to type or remember.

Simple Examples: each of these will display the menu and let you
make your selection.

    fcd     # display menu and wait for your input/selection

    apd     # add the current directory to the DIRFILE

    dpd     # display menu and allow you to delete an entry

    fcdhere # set the DIRFILE to the current directory

    fcdtop  # 'cd' to the DIRFILE directory

    fcdhome # 'cd' to $HOME and also set DIRFILE

fcd nnn

fcd + 

fcd + /path/to/some/project

fcd - /path/to/some/project

fcdhere /path/to/some/project

