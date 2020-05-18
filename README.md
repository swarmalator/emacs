# emacs
My GNU Emacs startup files

## Installation (Raspbian)

1. Update the package manager 

   `sudo apt update`
2. Upgrade packages 
    
    `sudo apt upgrade`
3. Install Emacs 26 

    `sudo apt install emacs`
4. Navigate to desired location for your Emacs/org-mode documents and clone this repository 

    `git clone https://github.com/swarmalator/emacs.git`
    
    (creates a folder called "emacs")
5. Tell emacs to use these startup files instead of defaults 

    `echo '(load "~/path/to/emacs/folder/.emacs")' > ~/.emacs`
    
    (change the path to the "emacs" folder, adding "/.emacs" to the end)
    
    
That's it! Running GNU Emacs (GUI) should load these startup files and look pretty. If you want the vanilla emacs experience again, simply remove or rename the `~/.emacs` file.

## Updating

1. Use C-c j to open up your journal
2. Make sure files are saved with C-x C-s
3. Open up magit buffer with C-x g
4. Skip this step if you don't see "unstaged changes" - If there are "unstaged changes", use TAB on each of the changes to view it in case you want to add them again after the update. Make sure the changes are removed by clicking "unstaged changes" and typing "k"
5. Type "F" and then "u" while in the magit buffer to fetch the latest update
6. Restart Emacs

## Some Useful Commands

- *C-x is short for Control + x*
- *M-x is short for Alt + x*

F11

toggle-frame-fullscreen



C-c j

org-journal-new-entry



C-c RET

insert-time-heading



C-p

previous-line



C-n

next-line



M-f

forward-word



M-b

backward-word



M-d

kill-word



C-;

flyspell-auto-correct-previous-word



C-x C-s

save-buffer



C-x C-c

save-buffer-kill-terminals
