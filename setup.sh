#!/bin/bash
#Autor: Conde

#Owner 
sudo chown -R $(whoami): * 
sudo chown -R $(whoami): zshrc 

#Requeriments and tools
sudo apt-get update
sudo apt-get install bspwm polybar suckless-tools git lxappearance picom nitrogen neovim feh build-essential fcrackzip john zsh unzip zsh duf bat rofi -y

#Create directorys 
rm -rf ~/.config/polybar
cp -r bspwm ~/.config/ 
cp -r picom ~/.config/ 
cp -r polybar ~/.config/ 
cp -r sxhkd ~/.config/ 
cp -r wallpapers ~/.config/ 

#Execution permissions
chmod +x $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/sxhkd/sxhkdrc
chmod +x $HOME/.config/picom/picom.conf
chmod +x  ~/.config/polybar/scripts/*

#Polybar Fonts 
sudo cp polybar/fonts/* /usr/share/fonts/truetype/
fc-cache

#Hack Nerd Fonts 
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip 
sudo unzip Hack.zip -d /usr/local/share/fonts/
rm -f Hack.zip

#Custom Shell 
chsh -s $(which zsh)
(echo "y") | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp zshrc ~/.zshrc
cp p10k/p10k.zsh ~/.p10k.zsh

#Extra Tools
wget -q -O htmlq.tar.gz https://github.com/mgdm/htmlq/releases/latest/download/htmlq-x86_64-linux.tar.gz 
sudo sudo tar xf htmlq.tar.gz -C /usr/local/bin/
wget -q https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-musl_0.21.0_amd64.deb 
sudo dpkg -i lsd-musl_0.21.0_amd64.deb  
rm -f lsd-musl_0.21.0_amd64.deb htmlq-x86_64-linux.tar.gz 

#Reboot 
sudo reboot 
