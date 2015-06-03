# enil-zsh-dotfiles

My zsh dotfiles, use at your own risk and have fun!
The configuration should work both on OS X and Linux.

## Installation

Just run the `install.sh` script and it will symlink everything to the home directory.
I prefer to keep the git under `~/.dotfiles/zsh`.

[docker-zsh-completion] is used to autocomplete `docker` commands, and [docker-compose-zsh-completion] for
`docker-compose` commands.
To enable these they must be added as [submodules]:

```sh
git submodule init
git submodule update
```

## Features and notes

* The optional configuration file `.zshrc.local` will be included if available and can be used for per-machine
configuration.
* The optional configuration files `.zshrc.linux` and `.zshrc.darwin` will be conditionally included depending on the
operating system and if available.
* An alternative prompt with white background for the username and hostname will be used if logged in using SSH to
distiguish SSH sessions.
* The aliases `tnews`, `tatts`, `tkills` and `tlists` are handy shortcuts for working with tmux sessions.
* The command `tssh` is a shortcut to attach to a tmux session over SSH.
* The command `tmuxterm` creates a tmux session which will be automatically killed when the pseudoterminal closes.

[docker-zsh-completion]:         https://github.com/felixr/docker-zsh-completion
[docker-compose-zsh-completion]: https://github.com/sdurrheimer/docker-compose-zsh-completion
[submodules]:                    https://git-scm.com/book/en/v2/Git-Tools-Submodules

