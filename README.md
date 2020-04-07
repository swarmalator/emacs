# emacs
My GNU Emacs configuration and files

1. Powershell (as Administrator):
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

2. Download and run Ubuntu 18.04 LTS Windows App

3. Generate keypair
ssh-keygen -t rsa

4. Add this key to the deploy keys of this repository.
cat ~/.ssh/id_rsa.pub

5. Clone the repo
cd ~/Documents
git clone git@github.com:swarmalator/emacs.git

6. Download Emacs26
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt install emacs26

7. Create Batch script
echo export DISPLAY=:0 ^^^&^^^& export LIBGL_ALWAYS_INDIRECT=1 ^^^&^^^& setsid emacs -geometry 80x24 ^^^& | wsl && exit
