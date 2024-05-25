# ------- SSH Key for GitHub -------
echo "Creating an SSH key for you... 🔐"
ssh-keygen -t rsa

echo "Please add this public key to Github 👻 \n"
cat ~/.ssh/id_rsa.pub
open -a Safari https://github.com/settings/keys
read -p "Press [Enter] key after this... ⌨️"
# ------- SSH Key for GitHub -------

# ------- Install things from the App Store -------
# install 
# ------- Install things from the App Store -------

# ------- Homebrew -------
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$user/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew... 🆕"
brew update
# ------- Homebrew -------

# ------- Git -------
echo "Installing Git... 🦸‍♂️"
brew install git

echo "Git config 🙋‍♂️ - Enter your data and press Enter!"


echo -n 'Username: '
read username
git config --global user.name "$username"

echo -n 'Mail: '
read mail
git config --global user.email $mail
# ------- Git -------

# ------- Terminal Setup -------

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH... 😱"
curl -L http://install.ohmyz.sh | sh

echo "Setting up Oh My Zsh theme... 🎨"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
open ~/.zshrc
read -p "Please set ZSH_THEME=\"powerlevel10k/powerlevel10k\" ✍️ and then press Enter!"

echo "Add some auto suggestions... 👨‍🚒"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
open ~/.zshrc
read -p "Please add zsh-autosuggestions & zsh-syntax-highlighting to your Plugins! e. g. plugins=(... zsh-autosuggestions zsh-syntax-highlighting) (WITHOUT comma) ✍️ and then press Enter!"
 
echo "Setting ZSH as shell... 💻"
chsh -s /usr/local/bin/zshd

# ------- Terminal Setup -------

echo "Cleaning up brew 🧹"
brew cleanup

# ------- Apps -------
echo "Installing homebrew cask 🧙‍♂️"
brew install homebrew/cask

apps=(
  raycast
  google-chrome
  warp
  spotify
  microsoft-outlook
  microsoft-teams
  arc
  visual-studio-code
  
  obsidian
  anki
  todoist
  docker
  discord
  karabiner
  beeper
  anki
  adobe acrobat reader
  cleanshotx
  clickup
  morgen
  google apps
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask... ⏳"
brew install --cask --appdir="/Applications" ${apps[@]}


brew cleanup
# ------- Apps -------

# install dashlane
# connect to warp

# ------- Mac Settings -------
echo "Setting some Mac settings... ⚙️"

#"Automatically quit printer app once the print jobs complete 🖨"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Showing icons for hard drives, servers, and removable media on the desktop ℹ️"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Preventing Time Machine from prompting to use new hard drives as backup volume 😫"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Setting screenshot format to PNG 📸"
defaults write com.apple.screencapture type -string "png"

# ------- Mac Settings -------

killall Finder

# ------- Advertisment -------
echo "Done! 🥳"


while true; do
    read -p "Do you want me to open my YouTube Channel for you? 🎥 (y/n) " yn
    case $yn in
        [Yy]* ) open -a Safari https://www.youtube.com/channel/UChXpovO__JiZrbcfTDFt39w?sub_confirmation=1; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
