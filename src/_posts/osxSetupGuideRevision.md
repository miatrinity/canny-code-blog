IMPORTANT FORWARD RE: GEMS
there will be a lot of perms issues with the new architecture, to avoid ever having to sudo install anything, use the following cmd:
```
gem install name_of_gem --user-install
```

this installs it without sudo and without r/w perms errors, such as:
```ERROR:  While executing gem ... (Gem::FilePermissionError)     You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.```

ALSO IMPORTANT RE: ASDF AND RUBY
```https://www.codegram.com/blog/asdf-version-manager-to-rule-them-all/```

always do:
create 
~/.asdfrc
~/.tool-versions

add to ~/.asdfrc
```legacy_version_file = yes```
add to ~/.tool-versions
```
ruby 3.0.1
rails-6.1.4```
```


Should also include .tool-versions and ~/.asdfrc  in the dot files

Very important for rails lol:
```https://stackoverflow.com/questions/7788946/rails-keeps-telling-me-that-its-not-currently-installed```

"If you're running a rails command _immediately after installing rails_, you will need to restart your terminal before your commands will be recognized."


be sure to ssh keys to chmod 400 (only viewable by you)

immediate notes: 
"https://thevaluable.dev/zsh-install-configure/%5D(https://thevaluable.dev/zsh-install-configure/)" returns 404 not found/ nginx

"https://github.com/swrobel/dotfiles%5D(https://github.com/swrobel/dotfiles)" Returns 404

"https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd%5D(https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd)" Returns 404

"https://www.thorsten-hans.com/5-types-of-zsh-aliases%5D(https:/thorsten-hans.com/5-types-of-zsh-aliases)"

Page does not exist

Re: M1 Brew:

TODO:
read thoroughly
https://osxdaily.com/2020/11/18/how-run-homebrew-x86-terminal-apple-silicon-mac/

current sol:
 
- Add Homebrew to your **PATH** in /Users/nikkigrimm/.zprofile:

 echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/nikkigrimm/.zprofile

>>then, if having curl issues:
      

If you need to have curl first in your PATH, run:

 echo 'export PATH="/opt/homebrew/opt/curl/bin:$PATH"' >> ~/.zshrc

  

For compilers to find curl you may need to set:

 export LDFLAGS="-L/opt/homebrew/opt/curl/lib"

 export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
- Run `brew help` to get started

- Further documentation: 

 https://docs.brew.sh

running the zsh tutorial commands return this:

      

nikkigrimm@Nicolettes-MacBook-Air ~ % git clone --depth=1 [https://github.com/romkatv/powerlevel10k.git](https://github.com/romkatv/powerlevel10k.git) $ZSH_CUSTOM/themes/powerlevel10k

zsh: unknown file attribute: h

```
sh -c "$(curl -fsSL [https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
```

solution:

working omz command
      

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

reference:
https://technofob.com/2020/12/24/the-ultimate-mac-m1-terminal-iterm2-oh-my-zsh-zsh-syntax-highlighting/

however, returns-but with install of omz:       

compinit:503: no such file or directory: /usr/local/share/zsh/site-functions/_brew


Regarding zsh pl10k:

line in tutorial returns the h error again.

Solution for power level 10k
use:

```git clone https://github.com/romkatv/powerlevel10k.git /tmp/powerlevel10k
source /tmp/powerlevel10k/powerlevel10k.zsh-theme
```
reference:
https://www.reddit.com/r/linux/comments/b0suyu/powerlevel10k_the_fastest_zsh_theme_with_git_in/
##########################


Brew shortcuts returns 404
https://cannycode.io/updates/macosbig-sur-os-x-setup-for-developers/[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew)

full details here (zsh plugins)
returns 404
`bubc -> brew upgrade && brew cleanup`

########################


ZSH alias plugin issues
link 1: ```https://dev.to/mattstratton/my-brewfile-1pob%5D(https://dev.to/mattstratton/my-brewfile-1pob)```
link 2:```https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2%5D(https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2)```

full list of shortcuts returns 404, from CannyCode.io
```https://cannycode.io/updates/macosbig-sur-os-x-setup-for-developers/[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew)```

full details re: web-search plugin link:
```https://cannycode.io/updates/macosbig-sur-os-x-setup-for-developers/[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search)```

full details for zsh plugins
```https://cannycode.io/updates/macosbig-sur-os-x-setup-for-developers/[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search)```


asdf link returning 404
```https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf)```

zsh plugin links all 404 from docker to node

###################

Prologue mkdir workspace &&'s work

###################

cannycode ssh guide 404's

####################

The separate git identities/ssh keys is really dope, I haven't tried it out yet, but it looks great and would love to utilize it.

#####################

running through configure asdf portion, no issues so far

be sure to brew install gpg2 before running the bash script

######################

elixir and erlang
-completed

#######################

elm
-completed

#####################

colorls
-completed

######################
visual studio
links do not work

custom css and js loader links do not work

######################

vs as default editor
- apparently working, I'm using vscodium





