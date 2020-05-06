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

save-buffer-kill-terminals`
