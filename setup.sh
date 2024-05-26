# ------- Dashlane setup -------
echo "Setting up Dashlane..."
echo "download dashlane using the app store"

open -a "App Store"

echo "connect to your dashlane..."
read
# ------- Dashlane setup -------

# ------- SSH Key for GitHub -------
echo "Creating an SSH key for you... 🔐"
ssh-keygen -t rsa

echo "Please add this public key to Github 👻 \n"
cat ~/.ssh/id_rsa.pub
open -a Safari https://github.com/settings/keys
read -p "Press [Enter] key after this... ⌨️"
# ------- SSH Key for GitHub -------

# ------- Homebrew -------
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$user/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew... 🆕"
brew update

echo "Installing homebrew cask 🧙‍♂️"
brew install homebrew/cask

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


# ------- Karabiner setup -------
echo "Setting up Karabiner..."

brew install --cask karabiner-elements

echo "Go to https://github.com/Mickael-Martos/karabiner?tab=readme-ov-file and clone the project"
read

echo "Delete the default ~/.config/karabiner folder"
read

echo "Create a symlink with ln -s ~/github/mxstbr/karabiner ~/.config (where ~/github/mxstbr/karabiner is your local path to where you cloned the repository)"
read

echo "Restart karabiner_console_user_server with launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server"
read

echo "Open the repo and change the karabiner files with the one from this mac-install"
read


# ------- Karabiner setup -------

# ------- Raycast setup -------
echo "Setting up Raycast..."

brew install --cask raycast

echo "Open raycast and connect with your github account"
echo "PS: if the setup cannot be put properly you can import the raycast configuration: https://github.com/Mickael-Martos/raycast"
read

# ------- Raycast setup -------

# ------- Obsidian setup -------
echo "Setting up Obsidian..."

brew install --cask obsidian

echo "Download your vault from github"
read

echo "Add the necessary plugins"
read

# ------- Obsidian setup -------

# ------- Visual Studio Code setup -------
echo "Setting up visual-studio-code..."

brew install --cask visual-studio-code

echo "Connect to your github..."
read

# ------- Visual Studio Code setup -------

# ------- Apps -------

apps=(
  google-chrome
  arc
  spotify
  microsoft-outlook
  microsoft-teams
  anki
  todoist
  discord
  beeper
  anki
  cleanshot
  clickup
  morgen
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask... ⏳"
brew install --cask --appdir="/Applications" ${apps[@]}

echo "Cleaning up brew 🧹"
brew cleanup
# ------- Apps -------


# ------- Terminal Setup -------

# #Install Zsh & Oh My Zsh
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

# ------- Warp Setup -------

brew install --cask warp

echo "Using Warp with zsh, open warp terminal and run 'chsh -s $(which zsh)' "
read

# ------- Warp Setup -------

# ------- Docker Setup -------

echo "Installing Docker... 🦸‍♂️"
brew install --cask docker

# ------- Docker Setup -------

# ------- Python Setup -------
brew update
brew install python
python3 -m pip install pyp

# Add Python and Pyp to PATH
echo 'export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >> ~/.bash_profile
echo 'export PYP_SITE_DIR="$(python3 -m site --user-site)"' >> ~/.bash_profile
source ~/.bash_profile
# ------- Python Setup -------


# ------- Nodejs Setup -------
echo "Installing NVM... 🦸‍♂️"
brew install nvm
mkdir ~/.nvm

echo "add the following line to your shell profile (e.g., ~/.bash_profile or ~/.zshrc):"
echo "export NVM_DIR=~/.nvm source $(brew --prefix nvm)/nvm.sh"
read

echo "Installing Nodejs... 🦸‍♂️"
nvm install node
nvm install --lts
# ------- Nodejs Setup -------

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

#"Automatically hiding the dock"
defaults write com.apple.dock autohide -bool true; killall Dock

echo "now set the key repeat rate in system setting / keyboard to Fast"
echo "and the Delay until repeat in system setting / keyboard to Short"
open /System/Library/PreferencePanes/Keyboard.prefPane
read

echo "now go to the accebillity / zoom to be able to zoom using the control button"
open "x-apple.systempreferences:com.apple.preference.universalaccess"
read

# ------- Mac Settings -------

killall Finder

# ------- Advertisment -------
echo "You might want to install Go with GVM, for that you can follow this repo : https://github.com/moovweb/gvm?tab=readme-ov-file"
echo "Done! 🥳"

