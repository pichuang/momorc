MoMorc
==========
**Install  *.rc automatically with symbolic link**

OS X requirements
-----------------

> brew install reattach-to-user-namespace

Installation
------------

> git clone https://github.com/pichuang/momorc.git
>
> chmod +x install.py
>
> ./install.py

momorc screen cheatsheat
------------------------
start new:

    screen

attach:

    screen -rd

list:

    screen -ls

prefix:

    <ctrl+a>

momorc tmux cheatsheat
----------------------
start new:

    tmux

start new with session name:

    tmux new -s myname

attach:

    tmux a  #  (or at, or attach)

attach to named:

    tmux a -t myname

list sessions:

    tmux ls

<a name="killSessions"></a>kill session:

    tmux kill-session -t myname

<a name="killAllSessions"></a>Kill all the tmux sessions:

    tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill

Hit the prefix `ctrl+a`  and then:

## Sessions


    r  reload ~/.tmux.conf
    $  name session

## Windows (tabs)

    c  new window
    w  list windows
    f  find window
    ,  name window
    &  kill window
    n  next window
    p  previous window

## <a name="ResizePane"></a>Resize pane

    < Resizes the current pane left
    > Resizes the current pane right
    - Resizes the current pane down
    < Resizes the current pane upward

## <a name="PanesSplits"></a>Panes (splits)

    _  vertical split
    |  horizontal split
    
    "  Change the panes size
    o  swap panes
    q  show pane numbers
    x  kill pane
    +  break pane into window (e.g. to select text by mouse to copy)
    z  Zoom-in/out pane zoom
    -  restore pane from window

## Misc

    d  detach
    t  big clock
    ?  list shortcuts
    :  prompt

## <a name="syncPanes"></a>Sync Panes

You can do this by switching to the appropriate window, typing your Tmux prefix (commonly Ctrl-B or Ctrl-A) and then a colon to bring up a Tmux command line, and typing:

```
:setw synchronize-panes
```

You can optionally add on or off to specify which state you want; otherwise the option is simply toggled. This option is specific to one window, so it won’t change the way your other sessions or windows operate. When you’re done, toggle it off again by repeating the command. [tip source](http://blog.sanctum.geek.nz/sync-tmux-panes/)

## <a name="copymode"></a>Copy mode
start copy mode:

    [

exit copy mode:

    q

else:

    Function                vi        
    Back to indentation     ^         
    Clear selection         Escape    
    Copy selection          Enter     
    Cursor down             j         
    Cursor left             h         
    Cursor right            l         
    Cursor to bottom line   L
    Cursor to middle line   M         
    Cursor to top line      H         
    Cursor up               k         
    Delete entire line      d         
    Delete to end of line   D         
    End of line             $         
    Goto line               :         
    Half page down          C-d       
    Half page up            C-u       
    Next page               C-f       
    Next word               w         
    Paste buffer            p         
    Previous page           C-b       
    Previous word           b         
    Quit mode               q         
    Scroll down             C-Down or J  
    Scroll up               C-Up or K    
    Search again            n        
    Search backward         ?        
    Search forward          /        
    Start of line           0       
    Start selection         Space   

Reference
---------
- [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058)
