---
layout: post
title:  "macOS Big Sur: OS X Setup for Developers"
date:   2020-12-21 10:39:23 +0100
categories: updates
description: "Testing the Sidebar - it should work with this super intersting post now!!"
tags:
  - OS X
  - tools
---

# Hackintosh Setup  - OS X

[[https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99](https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99)](https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99%5D(https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99))

[[https://thevaluable.dev/zsh-install-configure/](https://thevaluable.dev/zsh-install-configure/)](https://thevaluable.dev/zsh-install-configure/%5D(https://thevaluable.dev/zsh-install-configure/))

[[https://github.com/swrobel/dotfiles](https://github.com/swrobel/dotfiles)](https://github.com/swrobel/dotfiles%5D(https://github.com/swrobel/dotfiles))

[[https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd](https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd)](https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd%5D(https://medium.com/responsetap-engineering/macbook-like-a-pro-606682ea22bd))

[[https://thorsten-hans.com/5-types-of-zsh-aliases](https://thorsten-hans.com/5-types-of-zsh-aliases)](https://thorsten-hans.com/5-types-of-zsh-aliases%5D(https://thorsten-hans.com/5-types-of-zsh-aliases))







Ahh, the incomparable feeling of logging in to your new Mac for the first time. So uncluttered, so pristine, so shiny.

TODO: add the product image from here: https://www.amazon.com/-/es/Twelve-South-Inspire-recipiente-inspirado/dp/B075BF39F9

Alas, not very useful without a bit (ok, a metric shit-ton) of set up and polishing! To get any measurable mileage out of your new baby, you will need to:



* Install the tools of your choice (the easy(er) part)

* Tweak and fine-tune them to perfection (the not-so-easy part)



It can be a daunting task, especially if you are doing it for the first time!



But even seasoned veterans might wonder:



* is there a better tool for X (your choice since the 90s)?

* Imma need something for Y, should I pick: foo, bar, or baz? I think fred (or was it waldo?) someone mentioned plug (or was it thud?)

* Screw analysis paralysis, I’m going with Z. Now, how do I become a productivity/code/CLI beast utilizing it effectively?



Fear not, I have been in both places, and I’m tired of figuring it all out for the umpteenth time! I created this guide for my future self, and I believe you can benefit from it too!



This tutorial assumes you are on OS X Big Sur, but it should work for older version as well, with minimal tweaks (eg Catalina/Big Sur ships with zsh out of the box, so this tutorial doesn’t include switching from bash to zsh).



I’m primarily a Ruby and Rails developer, so there are going to be some Ruby-specific parts (and a smattering of other stuff I’m working with: Javascript, Node, Elm, Elixir, Python).



However, I’m trying to be as language- and framework agnostic as possible. Ruby doesn’t float your boat? Ignore those parts. Hate docker? Ditto. Think emacs/vim \>\> VS Code? I’m even going to add a convenient link for you to jump to the next section! (TODO: actually ad those links, they are not there righ now IIRC)



All right, enough rambling - let’s kick the tires and light the fires!



## Install and Set up homebrew



### Pre-flight notes

It’s very possible that you’d like to set up your new machine based on your current/old system. If that’s the case, `brew leaves` is your friend!



Rather than running `brew list`, which shows you ALL the packages installed by brew,  `brew leaves` lists ONLY the packages you have installed yourself.



> But that way, imma forget bdw-gc, isl@0.12 or p11-kit! To say nothing of mpfr@2 and libmpc!



… said no one ever.



tl;dr: `brew leaves` lists only the packages you’ll _potentially_ want to transfer to your new shiny Mac.



Why _potentially_, you ask. IT TOOK ME YEARS OF CAREFUL CURATION TO CRAFT THE PERFECT LIBRARY OF HAND-PICKED BESTEST TOOLS, you scream.



I hear you, and I’m not here to pry those fantastic tools from your not-cold-and-not-dead hands! That said, let me present two plausible reasons for skipping some packages:



* **languages and their version managers** (erlang, elixir, python, pyenv, ruby, rubyenv, rvm, node, nvm, npm, but even MySQL and Postgres…): We are going to use one package to rule them all: _asdf_. Behind the unassuming name hides an underrated, powerful and clean tool that’s better than the sum of your previous tooling’s parts. Trust me on this one.

* **accumulated cruft**: A short, non-exhaustive list to give you an idea: cowsay, ponysay, cowthink, sl (steam locomotive), aafire, dog (‘better than cat’), cmatrix, rig, oneko, asciiquarium, funny-manpages. I can’t be the only one who installed one or more of these on a whim to goof around, only to forget about them later



.

Now, the worst part is not even the existence of the top level packages, but potential issues with their dependencies (I remember spending 3 hours on fixing `readline` after I installed `asciinema`, which somehow screwed up other packages depending on `readline`).

Maybe, just maybe, you’ll want to ignore some of these. Or maybe there are some packages you stopped using over time.

tl;dr: take only what’s needed!





Ready, steady…



### Install homebrew



`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`



`brew update`



### Install CLI packages with brew

``` bash

brew install \
  coreutils \
  make \
  autoconf \
  gnupg \
  git \
  docker \
  docker-compose \
  docker-machine \
  redis \
  yarn \
  visual-studio-code \
  brave-browser \
  firefox \
  iterm2 \
  telegram \
  setapp

```



## Set up the Shell

As I mentioned above, Big Sur comes with zsh by default.

Let’s pump it up by installing Oh My Zsh. If you are unfamiliar with Oh My Zsh, here’s the proverbial picture that’s worth 1e3 words:

TODO pic - standard apple vs Oh My Zsh

```bash

sh -c "$(curl -fsSL [https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"

```
Run the following to fix some permissions

```bash
compaudit | xargs chmod g-w,o-w
```



### Set up a theme

Recommended: [Powerlevel10k]([https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) "Powerlevel10k theme for oh-my-zsh")



Install with

```bash

git clone --depth=1 [https://github.com/romkatv/powerlevel10k.git](https://github.com/romkatv/powerlevel10k.git) $ZSH_CUSTOM/themes/powerlevel10k

```



Change the default theme (`ZSH_THEME` in `~/.zshrc` to `powerlevel10k/powerlevel10k`). After your change, the line should read:

```bash

ZSH_THEME="powerlevel10k/powerlevel10k"

```



Open a terminal window and follow the config steps.



Enable _Instant Prompt_ during configuration, or manually by adding this to the top of your `.zshrc`



```bash

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then

  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

fi

```



[Instant Prompt]([https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt](https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt) "Instant Prompt") displays the prompt immediately (while loading plugins in the background), so you can start typing right away. Smooooth!



### Set up oh-my-zsh plugins



You probably saw videos of  keyboard ninjas who accomplish large swathes of stuff deftly, firing a flurry of commands and  keyboard combos that would put seasoned mortal combat masters to shame. With some config and a  lot practice, Oh-My-Zsh plugins can help you to achieve similar superpowers.



Check out [Oh My Zsh Plugins]([https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) "Oh My Zsh Plugins") for a complete list.



To add a new plugin, edit the `plugins=(...)` line in `.zshrc`.



I’m using these right now - YMMV based on your tools/programming languages/preferences:



```bash

plugins=(z thefuck alias-finder brew web-search vscode asdf docker docker-compose git github ruby rails bundler node)

```



Let’s go through each of these quickly.

### Tour of useful oh-my-zsh plugins



#### z

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z))

There are three types of developers in the world:



1. happy users of _z_

2. devs who never heard of it

3. newcomers thinking ‘OMG how could I exist without _z_?!? Seriously, WTF?!’.



Unless you are a happy camper already, you are about to transition from the second group to the third (and eventually, the first :-))



> This plugin defines the z command that tracks your most visited directories and allows you to access them with very few keystrokes.



TODO: image

Note: There’s a chance you are going to see a similar error message after installing the plugin:



```bash

_z_dirs:2: no such file or directory: /Users/miatrinity/.z

```



You can safely ignore it - it will vanish automatically when you open a new terminal.



#### thefuck



The Fuck, especially in the oh-my-zsh plugin version (just hit ESC twice) is another severely underrated gem! A picture Is worth a bazillion words:

TODO: image



#### alias-finder



Most of the plugins are a collection of shortcuts that expand to longer commands, saving you from a shit tonne of typing. For example,



```bash

gc!



# expands to



git commit -v --amend

```



Before you commit dozens of these shortcuts to muscle memory, you are going to look up which one does what, a _lot_. This plugin helps to ease the pain.



```bash

> alias-finder "git commit -v --amend"

'gc!'='git commit -v --amend'

gc='git commit -v'

g=git

```



#### brew

TODO: [[https://dev.to/mattstratton/my-brewfile-1pob](https://dev.to/mattstratton/my-brewfile-1pob)](https://dev.to/mattstratton/my-brewfile-1pob%5D(https://dev.to/mattstratton/my-brewfile-1pob))

TODO: [[https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2](https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2)](https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2%5D(https://github.com/magarcia/dotfiles/blob/master/.Brewfile%23%23yadm.j2))

brew-specific set of shortcuts, like `bubc -> brew upgrade && brew cleanup`.

Full list of shortcuts [here]([https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) "brew plugin shortcuts").



#### web-search



> This plugin adds aliases for searching with Google, Wiki, Bing, YouTube and other popular services.



Example:



```bash

google oh-my-zsh websearch plugin

```



This opens [[https://www.google.com/search?q=oh-my-zsh+websearch+plugin](https://www.google.com/search?q=oh-my-zsh+websearch+plugin)](https://www.google.com/search?q=oh-my-zsh+websearch+plugin%5D(https://www.google.com/search?q=oh-my-zsh+websearch+plugin)) in your browser. Neat!



Another example:



```bash

stackoverflow node installation

```



You get the idea!

[Full details here.]([https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search) "web-search plugin")



#### vscode



Shortcuts to open VS Code:

![](vs-code-plugin.png)



####  asdf

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf))

Forget rvm, rbenv, nvm, pyenv, kiex or what-have-you - asdf manages all that, and better!



We are going to [ install and configure asdf](#asdf-config) a bit later. For the impatient: jump to asdf configuration.



#### docker and docker-compose



This plugin adds auto-completion for docker and docker-compose.



For example,



[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker))

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose))

#### git

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git))

#### github

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github))

#### ruby

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails))

#### rails

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails))

#### bundler

[[https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bundler](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bundler)](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bundler%5D(https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bundler))

#### node



# Set up Git Workflow



## Prologue

I like to separate my projects under directories based on language. I’m adding this step here because I’m going to check out some repos to test my setup, and I’d like to leverage this directory structure from the get go.



TODO: Nikki wtf does this not work?! Plz fix



```bash

mkdir workspace && cd workspace && \

      mkdir ruby && \

      mkdir rails && \

      mkdir js && \

      mkdir vue && \

      mkdir elixir && \

      mkdir elm && \

      mkdir python

```



I’m setting up multiple keys, each tied to a different GitHub account/servers:

* Clark Kent (the worker, husband, dad etc)

* Trinity Takei (the code cutter, wonder writer, bootstrapping bricoleur, alliteration aficionado  etc)

* MiaTrinity (joint account with my pair-programming partner)

If you’d like to separate your work/personal accounts, you came to the right place!



## SSH key setup



 [This Github SSH guide ]([https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) "Set up your ssh keys") has been my go-to place for SSH key setup until I learned it by heart! Just kidding, I never did



, visiting that link all the time.



### Fix permissions



For security reasons, you need to set permissions on the generated private keys:



```bash

sudo chmod 600 ~/.ssh/id_rsa_clark_kent \

  && chmod 600 ~/.ssh/id_rsa_trinity \

  && chmod 600 ~/.ssh/id_rsa_miatrinity

```



### Identity Ergonomics



I’m switching between identities frequently (usually multiple times per day), so it’s imperative to make this simple and quick. The script to accomplish this is always evolving, it started out like this:



```bash

#  ~/.oh-my-zsh/custom/identities.zsh



set_identity() {

  ssh-add -D

  ssh-add $1



  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then

    git config [user.name](http://user.name/) $2

    git config user.email $3

    echo "======================================================="

    echo "git config updated to:"

    echo "======================================================="

    echo "git config [user.name](http://user.name/): $(git config [user.name](http://user.name/))"

    echo "git config user.email: $(git config user.email)"

  fi

}



git_clark_kent() {

    set_identity "$HOME/.ssh/id_rsa" "Clark Kent" "[clark@kent.com](mailto:clark@kent.com)"

}



git_trinity() {

    set_identity "$HOME/.ssh/id_rsa_trinity" "Trinity Takei" "[trinity.takei@gmail.com](mailto:trinity.takei@gmail.com)"

}





git_miatrinity() {

    set_identity "$HOME/.ssh/id_rsa_miatrinity" "Mia Sinek && Trinity Takei" "[m14tr1n1ty@gmail.com](mailto:m14tr1n1ty@gmail.com)"

}

```



Whenever I wanted to work on a project requiring a different identity from the current one, I just had to do this:



```bash

cd a_trinity_takei_project

git_trinity



# woo! git username/email set correctly and I can interact with my repo as trinity. Sweet!

```



But wait, it gets better. Here’s an automated version I’m using these days:



```bash

# ~/.oh-my-zsh/custom/enter_new_directory.zsh



set_identity() {

  # Remove previous identitites - it just messes things up

  ssh-add -D

  # store passphrase in keychain (rather than ask it after every switch)  

  ssh-add -K $1



  # configure user name and email for nice commits

  git config [user.name](http://user.name/) $2

  git config user.email $3

  echo "======================================================="

  echo "git config updated to:"

  echo "======================================================="

  echo "git config [user.name](http://user.name/): $(git config [user.name](http://user.name/))"

  echo "git config user.email: $(git config user.email)"

}



git_clark_kent() {

    set_identity "$HOME/.ssh/id_rsa_clark_kent" "Clark Kent" "[clark@kent.com](mailto:clark@kent.com)"

}



git_trinity() {

    set_identity "$HOME/.ssh/id_rsa_trinity" "Trinity Takei" "[trinity.takei@gmail.com](mailto:trinity.takei@gmail.com)"

}





git_miatrinity() {

    set_identity "$HOME/.ssh/id_rsa_miatrinity" "Mia Sinek && Trinity Takei" "[mia.trinity.codes@gmail.com](mailto:mia.trinity.codes@gmail.com)"

}



precmd() {    

    # only do this if we switched to a new directory

    if [ "$PWD" != "$MY_OLD_PWD" ]; then



        # set git [user.name](http://user.name/) and user.email if we are in a git directory

        if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then



            MY_OLD_PWD="$PWD";



            remote_url=`git config --get remote.origin.url`

            echo "Switched to git directory, remote URL:\n"            

            echo "$remote_url\n"



            if [[ $remote_url =~ 'trinitytakei' ]] ; then

                git_trinity

            elif [[ $remote_url =~ 'miatrinity' ]] ; then

                git_miatrinity

            elif [[ $remote_url =~ 'CareerArcGroup' ]] ; then

                git_clark_kent

            else

                echo "Haven't seen this username before, please update ~/.oh-my-zsh/custom/identities.zsh"

            fi            

        fi



        if [ -f "./bin/rails" ]; then

            echo "\nRails directory detected, adding ./bin to path"

            export PATH="$PWD/bin:$PATH"

        fi



    fi

}

```



Using zsh’s [precmd() hook]([http://zsh.sourceforge.net/Doc/Release/Functions.html](http://zsh.sourceforge.net/Doc/Release/Functions.html) "ZSH functions"), I’m setting the identity automatically:

* if I’m in a git directory (why bother otherwise)

* only if I have changed to this directory recently (so that it’s done only once)

* based on the repo URL which contains the user name

Win!



# Set up asdf



## Install asdf



Note: this assumes you are using the asdf oh-my-zsh plugin. If you aren’t, the setup might be a bit different.

```bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

```



## Configure asdf



Create a new file, `~/.asdfrc` and paste this line into it:



```bash

legacy_version_file = yes

```



This will ensure that asdf picks up `.ruby-version` (and equivalents for other tools) if present. Handy for third-party/legacy projects.



### Install various language interpreters

#### Ruby

```bash

asdf plugin add ruby

asdf install ruby latest



# further useful commands



# Show available MRI versions

asdf list all ruby | grep "^\d"



# Show versions installed locally

asdf list ruby



# Use version 2.7.1 in this directory (and all subdirectories)

# NOTE: creates .tool-versions file in the current dir

asdf local ruby 2.7.1

```



#### Node

```bash

asdf plugin add nodejs



# Import the Node.js release team's OpenPGP keys to main keyring

# For more info, check:

# [https://github.com/asdf-vm/asdf-nodejs/blob/master/README.md](https://github.com/asdf-vm/asdf-nodejs/blob/master/README.md)



bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring



asdf install nodejs latest



# ignore this if you are not using yarn

# Rails peeps: you ARE using yarn (at least at the time of writing)

brew install yarn

```



#### Elixir (& Erlang)

```bash

asdf plugin add erlang

asdf install erlang latest

asdf plugin add elixir

asdf install elixir latest

```



#### Elm

```bash

asdf plugin add elm

asdf install elm latest

```



#### Python

```bash

asdf plugin add python

asdf install python latest

```



### Beautify the Terminal’s `ls` Command



Now that we have Ruby installed, we can add one crank up the badassness of terminal output a notch. From this:

TODO: Boring before image

To this:

TODO: Awsum after image

How?



```bash

gem install colorls

```



Create a new file, `~/.oh-my-zsh/custom/colorls.zsh`



```bash

# ~/.oh-my-zsh/custom/colorls.zsh



alias l='colorls --group-directories-first --almost-all'

alias ll='colorls --group-directories-first --almost-all --long'

```



Open a new terminal window, type `l` or `ll`, and watch the magic.



[[https://github.com/athityakumar/colorls](https://github.com/athityakumar/colorls)](https://github.com/athityakumar/colorls%5D(https://github.com/athityakumar/colorls))



# Set up Visual Studio Code



[[https://calebporzio.com/my-vs-code-setup-2](https://calebporzio.com/my-vs-code-setup-2)](https://calebporzio.com/my-vs-code-setup-2%5D(https://calebporzio.com/my-vs-code-setup-2))

[[https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums](https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums)](https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums%5D(https://marketplace.visualstudio.com/items?itemName=lehni.vscode-fix-checksums))



## Configuration

1. Install [Custom CSS and JS loader]([https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css) "Custom CSS Extension").

2. Add this to `settings.json`



```bash

   "vscode_custom_css.policy": true,

"vscode_custom_css.imports": ["file:///Users/miatrinity/.vscode/hide-title-bar.css"],

```



3. Restart VSCode with proper permission to modify itself:

```bash

sudo chown -R $(whoami) "/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

```



4. Activate command "Reload Custom CSS and JS".

5. Restart VS Code

6. “Your Code installation appears to be corrupt. Please reinstall.”

7.





## Extensions



# Setting up git, GitHub, hub flow

[[https://stackoverflow.com/questions/33315856/setting-visual-studio-code-as-my-macs-default-editor-including-editing-git-com/35782566#35782566](https://stackoverflow.com/questions/33315856/setting-visual-studio-code-as-my-macs-default-editor-including-editing-git-com/35782566#35782566)](https://stackoverflow.com/questions/33315856/setting-visual-studio-code-as-my-macs-default-editor-including-editing-git-com/35782566#35782566%5D(https://stackoverflow.com/questions/33315856/setting-visual-studio-code-as-my-macs-default-editor-including-editing-git-com/35782566%2335782566))

[[https://github.com/github/hub/tree/master/etc](https://github.com/github/hub/tree/master/etc)](https://github.com/github/hub/tree/master/etc%5D(https://github.com/github/hub/tree/master/etc))



# Ruby and Rails Extra Config



## binstub setup



Here’s a trick If you if you ever got confused…

* when to use `rails s`, `bin/rails s` or `bundle exec rails s`

* what version is being run using each of the above commands

* want to shave  off typing `bin/` (or `bundle exec`, on older versions of Rails - although you should switch to binstubs) and still be confident you are using the right version?





```bash

# ~/.oh-my-zsh/custom/entering_new_directory.zsh



precmd() {

    # only do this if we switched to a new directory

    if [ "$PWD" != "$MY_OLD_PWD" ]; then

    # ...

    # identities stuff here

    # ...



        if [ -f "./bin/rails" ]; then

            echo "\nRails directory detected, adding ./bin to path"

            export PATH="$PWD/bin:$PATH"

        fi

    fi

}



```



Now you can just use `rails` (or `rspec`, or any other binstub in the current directory) without prepending `bin/` or `bundle exec`.



## Solargraph Extra Setup

[[https://github.com/castwide/solargraph/issues/188](https://github.com/castwide/solargraph/issues/188)](https://github.com/castwide/solargraph/issues/188%5D(https://github.com/castwide/solargraph/issues/188))

[[https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e](https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e)](https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e%5D(https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e))

[[https://www.youtube.com/watch?v=xUBKXqhBKk8](https://www.youtube.com/watch?v=xUBKXqhBKk8)](https://www.youtube.com/watch?v=xUBKXqhBKk8%5D(https://www.youtube.com/watch?v=xUBKXqhBKk8))

[[https://dev.to/andrewmcodes/ruby-on-rails-development-with-vs-code-p1i](https://dev.to/andrewmcodes/ruby-on-rails-development-with-vs-code-p1i)](https://dev.to/andrewmcodes/ruby-on-rails-development-with-vs-code-p1i%5D(https://dev.to/andrewmcodes/ruby-on-rails-development-with-vs-code-p1i))

Solargraph works pretty well OOTB, but there’s still some juice we can squeeze out of it to make it even more awesome!



### Install the gem

```bash

gem install solargraph

which solargraph

/Users/miatrinity/.asdf/shims/solargraph

```



### Add path to VS Code



Add this setting to `settings.json`

```json

"solargraph.commandPath": "/Users/miatrinity/.asdf/shims/solargraph "

```



### Pimping the docs



Make sure you have gem documentation installed by running:

```bash

yard gems

```





# Create dotfiles repo

TODO: I'm so clueless here, would need more time (hahahaha) to figure it out... so please help me out here

[[https://github.com/driesvints/dotfiles](https://github.com/driesvints/dotfiles)](https://github.com/driesvints/dotfiles%5D(https://github.com/driesvints/dotfiles))



It would be a shame to lose all this work due to a force majeure (HDD crash, lost laptop etc) so let’s store it in a dotfiles repo.

1. Create a new repository called dotfiles (Here’s [my dotfiles repository]([https://github.com/trinitytakei/dotfiles](https://github.com/trinitytakei/dotfiles) "My dotfiles repository"))

2. Clone it to your local drive:

```bash

cd ~/workspace

git clone git@github.com:trinitytakei/dotfiles.git

```

3. `cd` into the new directory:

```bash

cd dotfiles

```

4. Copy and symlink all the files one by one. This might seem to be daunting, and I was tempted to write a script, but

* it’s important to avoid copying anything sensitive (cough, cough `~/.ssh`) as well as ensures that you set up the right symlinks.

* you have to do this only once, ever (from now on, you will clone the repo)

* therefore, it’s imperative to get it right - so a bit of extra copying, contemplating which file you need and which one you don’t etc. doesn’t hurt

```bash

cp ~/.zshrc .

ln -nfs /Users/miatrinity/workspace/dotfiles/.zshrc /Users/miatrinity/.zshrc



cp ~/.asdfrc .

ln -nfs /Users/miatrinity/workspace/dotfiles/.asdfrc /Users/miatrinity/.asdfrc



cp ~/.p10k.zsh .

ln -nfs /Users/miatrinity/workspace/dotfiles/.p10k.zsh /Users/miatrinity/.p10k.zsh







```



# Misc

[[https://dev.to/andrewmcodes/run-rubocop-with-github-actions-4adp](https://dev.to/andrewmcodes/run-rubocop-with-github-actions-4adp)](https://dev.to/andrewmcodes/run-rubocop-with-github-actions-4adp%5D(https://dev.to/andrewmcodes/run-rubocop-with-github-actions-4adp))

[[https://gist.github.com/wbotelhos/fb865fba2b4f3518c8e533c7487d5354](https://gist.github.com/wbotelhos/fb865fba2b4f3518c8e533c7487d5354)](https://gist.github.com/wbotelhos/fb865fba2b4f3518c8e533c7487d5354%5D(https://gist.github.com/wbotelhos/fb865fba2b4f3518c8e533c7487d5354))
