A collection of my dotfiles - hopefully useful to other people

Apply configuration:

```bash
stow CATEGORY_DIRECTORY
```

Unapply configuration:

```bash
stow -D CATEGORY_DIRECTORY
```

Add new configuration:

1. Select the desired category directory, e.g. `cli`, `apps` or `scm`.
1. Create the parent directories to the configuration file below the category
   directory, starting at `$HOME` directory. E.g. `~/.config/direnv/` would
   become `scm/.config/direnv/` when the file is stored in the `scm` category.
1. Create the configuration files in the created directory.
1. Reapply the configuration for the category, e.g. `stow scm`
