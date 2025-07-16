
## Management
### `stow`
The root folder (where this README is situated) is used for confs that can be found somewhere within the user's home. 
`.stowrc` in the root folder has `-t $HOME` specified, which should always find the user's home.

#### Updating confs
The best way to update confs that are out of sync is to call `stow --adopt <package>`. This will copy the existing files that cause conflicts into the repo and create links to where the files were. Since this is a git controlled repo you how all the power and all the possibilities for an ordered merge of the config files.


### Folder Structure
`_non-stow` folder contains configurations that have not yet been put into the structure `stow` can work with. These are basically todos.

## Modules
### git
The checked-in `.gitconfig` features a "include ~/.git-configs/local-config" section, where you can add computer-local global configurations, eg. GitHub or GitLab user-name and email.

### zsh
Inspired by fish the zsh config has a conf.d folder, `.zsh.conf.d`. The toplevel configs read every entry in that folder in order of their appearance.

Folder-structure looks like this:
```
- .zsh.conf.d/
|---+ zshenv/
    |   - 00-env-vars.zsh
    + zprofile/
        - 20-python.zsh
    - 01-brew.zsh
    - n.zsh
```

`.zshrc` reads and sources all (and only) `*.zsh` files in `.zsh.conf.d`. `.zshenv` and `.zprofile` read from `.zsh.conf.d/zshenv` and `.zsh.conf.d/zprofile` respectively.

Be aware that the original zsh-config behaviour applies, ie. first `.zshenv` is sourced for all, then `.zprofile` for login-shells, and lastly `.zshrc` for interactive shells.
  Be also aware that MacOS and Linux source these files differently; where Linux sources `.zprofile` once (because Linux is a shell that runs a GUI, and essentially everything runs in that shell), MacOS runs a GUI that opens a login shell every time you open a terminal (side-note: when using tmux you will get interactive shells, not login shells).
  Additionally: MacOS, and some terminal emulators, seem to prepend their own `$PATH` after `.zshenv` has been sourced, resulting in homebrew being looked up after system folders. This is mostly undesired behaviour, as you will install the same program through brew, because the MacOS version is outdated or you want to use the GNU version instead of the BSD version.

You can copy, link, or `stow` whatever zsh-modules you need into your `.zsh.conf.d` folder - you could also rename them to change the order they are sourced. This way you only maintain and load what you need. The `.z`-files should contain only minimal setup: keep in mind that these need to work on MacOS and Linux. 

In case you want to parametrise a setup-script in `.zsh.conf.d` you can rely on environment variables, eg. `20-n.zsh` will need a `$N_PATH` that can be set to different values on different computers. This can be done by having a `10-n-path.zsh` defining that variable on different computers.

> [!alert]
> This can also be very useful when you don't want to check in your name - you can define a non-checked-in `00-values.zsh` file, that sets your name, email address, or other sensitive data

As an additional feature you can check in every zsh-module if a needed ENV VAR is set and let the user know in case something is missing.

#### Details
On loading order of config files:
- .zshenv is _always_ loaded and should contain ENV VARs or system setups - mostly the use case seems to be "things that need to be set up for login shell and interactive shell"
- .zprofile is read when in login shell (ie. non-interactive); designed after `sh` .profile and `bash` .bash_profile
  - Macos always reads this file once and makes its contents mostly available throughout terminals, which seems to be non-posix complient
- .zshrc is read for interactive shells
- .zlogin is read for login shells, serving the same purpose as .zprofile - while you can use both at the same time, you shouldn't as there is no real use case to it; it's designed after `csh` config files
- .zlogout is read and executed during exiting from a login-shell

More detailed information in stackoverflow posts
- https://unix.stackexchange.com/questions/324359/why-a-login-shell-over-a-non-login-shell/324391#324391
- https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell/46856#46856

### bash
`bash` follows the same `.bash.conf.d` approach as `zsh` does; see [zsh](#zsh) for more details. 
Only difference is that both `.bashrc` and `.bash_profile` read from `.bash.conf.d/bash_env`, since `bash` does not have a `.bash_env` file

#### Details
- interactive `bash` shells read from `.bashrc` if available
- login shells read from `.bash_profile`, `.bash_login`, or `.profile` - following this order it will load only the first one to exist!
- when called neither as login shell nor in interactive mode it will look for `BASH_ENV` env var and try to source the file defined in there
- when `bash` is called as `sh` alias, it will only read `.profile` when it is a login shell

More details can be found in [Bash-Startup-Files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html)
