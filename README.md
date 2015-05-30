MoMorc
==========
**Install  *.rc automatically with symbolic link**

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

## <a name="ResizePane"></a>Resize pane

    < Resizes the current pane left
    > Resizes the current pane right
    - Resizes the current pane down
    < Resizes the current pane upward

## <a name="PanesSplits"></a>Panes (splits)

    %  vertical split
    _  vertical split
    "  horizontal split
    |  horizontal split
    
    o  swap panes
    q  show pane numbers
    x  kill pane
    +  break pane into window (e.g. to select text by mouse to copy)
    -  restore pane from window
    ⍽  space - toggle between layouts
    q  Show pane numbers, when the numbers show up type the key to goto that pane)
    z  toggle pane zoom

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

    Function                vi             emacs
    Back to indentation     ^              M-m
    Clear selection         Escape         C-g
    Copy selection          Enter          M-w
    Cursor down             j              Down
    Cursor left             h              Left
    Cursor right            l              Right
    Cursor to bottom line   L
    Cursor to middle line   M              M-r
    Cursor to top line      H              M-R
    Cursor up               k              Up
    Delete entire line      d              C-u
    Delete to end of line   D              C-k
    End of line             $              C-e
    Goto line               :              g
    Half page down          C-d            M-Down
    Half page up            C-u            M-Up
    Next page               C-f            Page down
    Next word               w              M-f
    Paste buffer            p              C-y
    Previous page           C-b            Page up
    Previous word           b              M-b
    Quit mode               q              Escape
    Scroll down             C-Down or J    C-Down
    Scroll up               C-Up or K      C-Up
    Search again            n              n
    Search backward         ?              C-r
    Search forward          /              C-s
    Start of line           0              C-a
    Start selection         Space          C-Space
    Transpose chars                        C-t

Reference
---------
- [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058)
