# A collection of my dotfiles

## Install

- Clone repository:
  `git clone --recurse-submodules https://github.com/jceb/dotfiles.git ~/Documents/dotfiles`
- Apply configuration: `~/Documents/dotfiles/apply-all`

## Usage

- Apply configuration: `stow CATEGORY_DIRECTORY`
- Unapply configuration: `stow -D CATEGORY_DIRECTORY`

Add new configuration:

1. Select the desired category directory, e.g. `cli`, `apps` or `scm`.
2. Create the parent directories to the configuration file below the category
   directory, starting at `$HOME` directory. E.g. `~/.config/direnv/` would
   become `scm/.config/direnv/` when the file is stored in the `scm` category.
3. Create the configuration files in the created directory.
4. Reapply the configuration for the category, e.g. `stow scm`
