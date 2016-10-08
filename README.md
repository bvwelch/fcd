
[ please look at 'Issues' for questions and feedback. thanks! ]

Preston's better bash dirstack

FIXME: this documentation is a work-in-progress

FCD is a 'bash' script that you can 'source' from your .bashrc file.

The main idea of FCD is allow you to switch between various directory trees
(hearafter referred to as 'projects').

FCD makes use of an ascii text file named $DIRFILE ( initially $HOME/.dirstack
)

FCD will present the contents of the DIRFILE as a numbered menu and allow you
to quickly 'cd' to that directory, even if the name is hard to type or
remember.

Once you arrive at a new 'project' directory, you will likely want to think of
it is as your temporary 'project home'.  You can have separate DIRFILES for
each project, and switch easily between projects.

It is helpful to think of your $HOME/.dirstack as your master list of projects,
but this is not required.

Since it is an ascii file you can view it, edit it, etc.  Here is a small
example:

    cat $DIRFILE/.dirstack
    /home/fred
    /path/to/project1
    /path/to/project2

Simple Examples: 

    fcd     # display menu and wait for your input/selection
            # note: after 'cd', automatically looks for existing dirstack

    apd     # add the current directory to the current project

    dpd     # display menu and allow you to delete an entry

    fcdhere # make the current directory the current 'project'

    fcdtop  # 'cd' to the top-level of the current project

    fcdhome # 'cd' to $HOME and make it the current project

    fcdswitch # like fcdhome, but then select a different project

Advanced Examples:

    fcd 5   # skip menu display, select the 5th entry of current project

    fcdhere /path/to/some/project # switch to specific project directory tree

Need examples and explanations for these:

    fcd 5 /path/to/project/.dirstack

    fcd - /path/to/some/project/.dirstack

    fcd - /path/to/some/project/.dirstack 5
    
    fcd + arg arg arg ...
    
    
    
