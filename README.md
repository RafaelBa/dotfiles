
## Management
### `stow`
The root folder (where this README is situated) is used for confs that can be found somewhere within the user's home. 
`.stowrc` in the root folder has `-t $HOME` specified, which should always find the user's home.

#### Updating confs
The best way to update confs that are out of sync is to call `stow --adopt <package>`. This will copy the existing files that cause conflicts into the repo and create links to where the files were. Since this is a git controlled repo you how all the power and all the possibilities for an ordered merge of the config files.


### Folder Structure
`_non-stow` folder contains configurations that have not yet been put into the structure `stow` can work with. These are basically todos.

