module completions {

  def "nu-complete jj color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Jujutsu (An experimental VCS)
  export extern jj [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
  ]

  def "nu-complete jj abandon color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Abandon a revision
  export extern "jj abandon" [
    ...revisions_pos: string  # The revision(s) to abandon (default: @)
    -r: string
    --summary(-s)
    --retain-bookmarks        # Do not delete bookmarks pointing to the revisions to abandon
    --restore-descendants     # Do not modify the content of the children of the abandoned commits
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj abandon color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj absorb color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move changes from a revision into the stack of mutable revisions
  export extern "jj absorb" [
    --from(-f): string        # Source revision to absorb from
    --into(-t): string        # Destination revisions to absorb into
    --to: string              # Destination revisions to absorb into
    ...paths: path            # Move only changes to these paths (instead of all paths)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj absorb color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj backout color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Apply the reverse of given revisions on top of another revision
  export extern "jj backout" [
    --revisions(-r): string   # The revision(s) to apply the reverse of
    --destination(-d): string # The revision to apply the reverse changes on top of
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj backout color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage bookmarks [default alias: b]
  export extern "jj bookmark" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark create color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new bookmark
  export extern "jj bookmark create" [
    --revision(-r): string    # The bookmark's target revision
    --to: string              # The bookmark's target revision
    ...names: string          # The bookmarks to create
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark create color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark delete color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Delete an existing bookmark and propagate the deletion to remotes on the next push
  export extern "jj bookmark delete" [
    ...names: string          # The bookmarks to delete
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark delete color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark forget color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Forget a bookmark without marking it as a deletion to be pushed
  export extern "jj bookmark forget" [
    --include-remotes         # When forgetting a local bookmark, also forget any corresponding remote bookmarks
    ...names: string          # The bookmarks to forget
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark forget color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark list sort" [] {
    [ "name" "name-" "author-name" "author-name-" "author-email" "author-email-" "author-date" "author-date-" "committer-name" "committer-name-" "committer-email" "committer-email-" "committer-date" "committer-date-" ]
  }

  def "nu-complete jj bookmark list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List bookmarks and their targets
  export extern "jj bookmark list" [
    --all-remotes(-a)         # Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks
    --remote: string          # Show all tracking and non-tracking remote bookmarks belonging to this remote
    --tracked(-t)             # Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default
    --conflicted(-c)          # Show conflicted bookmarks only
    ...names: string          # Show bookmarks whose local name matches
    --revisions(-r): string   # Show bookmarks whose local targets are in the given revisions
    --template(-T): string    # Render each bookmark using the given template
    --sort: string@"nu-complete jj bookmark list sort" # Sort bookmarks based on the given key (or multiple keys)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark move color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move existing bookmarks to target revision
  export extern "jj bookmark move" [
    --from(-f): string        # Move bookmarks from the given revisions
    --to(-t): string          # Move bookmarks to this revision
    --allow-backwards(-B)     # Allow moving bookmarks backwards or sideways
    ...names: string          # Move bookmarks matching the given name patterns
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark move color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark rename color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Rename `old` bookmark name to `new` bookmark name
  export extern "jj bookmark rename" [
    old: string               # The old name of the bookmark
    new: string               # The new name of the bookmark
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark rename color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark set color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create or update a bookmark to point to a certain commit
  export extern "jj bookmark set" [
    --revision(-r): string    # The bookmark's target revision
    --to: string              # The bookmark's target revision
    --allow-backwards(-B)     # Allow moving the bookmark backwards or sideways
    ...names: string          # The bookmarks to update
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark set color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark track color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Start tracking given remote bookmarks
  export extern "jj bookmark track" [
    ...names: string          # Remote bookmarks to track
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark track color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj bookmark untrack color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Stop tracking given remote bookmarks
  export extern "jj bookmark untrack" [
    ...names: string          # Remote bookmarks to untrack
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj bookmark untrack color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage bookmarks [default alias: b]
  export extern "jj branch" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch create color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new bookmark
  export extern "jj branch create" [
    --revision(-r): string    # The bookmark's target revision
    --to: string              # The bookmark's target revision
    ...names: string          # The bookmarks to create
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch create color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch delete color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Delete an existing bookmark and propagate the deletion to remotes on the next push
  export extern "jj branch delete" [
    ...names: string          # The bookmarks to delete
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch delete color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch forget color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Forget a bookmark without marking it as a deletion to be pushed
  export extern "jj branch forget" [
    --include-remotes         # When forgetting a local bookmark, also forget any corresponding remote bookmarks
    ...names: string          # The bookmarks to forget
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch forget color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch list sort" [] {
    [ "name" "name-" "author-name" "author-name-" "author-email" "author-email-" "author-date" "author-date-" "committer-name" "committer-name-" "committer-email" "committer-email-" "committer-date" "committer-date-" ]
  }

  def "nu-complete jj branch list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List bookmarks and their targets
  export extern "jj branch list" [
    --all-remotes(-a)         # Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks
    --remote: string          # Show all tracking and non-tracking remote bookmarks belonging to this remote
    --tracked(-t)             # Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default
    --conflicted(-c)          # Show conflicted bookmarks only
    ...names: string          # Show bookmarks whose local name matches
    --revisions(-r): string   # Show bookmarks whose local targets are in the given revisions
    --template(-T): string    # Render each bookmark using the given template
    --sort: string@"nu-complete jj branch list sort" # Sort bookmarks based on the given key (or multiple keys)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch move color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move existing bookmarks to target revision
  export extern "jj branch move" [
    --from(-f): string        # Move bookmarks from the given revisions
    --to(-t): string          # Move bookmarks to this revision
    --allow-backwards(-B)     # Allow moving bookmarks backwards or sideways
    ...names: string          # Move bookmarks matching the given name patterns
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch move color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch rename color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Rename `old` bookmark name to `new` bookmark name
  export extern "jj branch rename" [
    old: string               # The old name of the bookmark
    new: string               # The new name of the bookmark
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch rename color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch set color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create or update a bookmark to point to a certain commit
  export extern "jj branch set" [
    --revision(-r): string    # The bookmark's target revision
    --to: string              # The bookmark's target revision
    --allow-backwards(-B)     # Allow moving the bookmark backwards or sideways
    ...names: string          # The bookmarks to update
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch set color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch track color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Start tracking given remote bookmarks
  export extern "jj branch track" [
    ...names: string          # Remote bookmarks to track
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch track color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj branch untrack color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Stop tracking given remote bookmarks
  export extern "jj branch untrack" [
    ...names: string          # Remote bookmarks to untrack
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj branch untrack color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj commit color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update the description and create a new change on top
  export extern "jj commit" [
    --interactive(-i)         # Interactively choose which changes to include in the first commit
    --tool: string            # Specify diff editor to be used (implies --interactive)
    --message(-m): string     # The change description to use (don't open editor)
    ...paths: path            # Put these paths in the first commit
    --reset-author            # Reset the author to the configured user
    --author: string          # Set author to the provided string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj commit color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage config options
  export extern "jj config" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config edit color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Start an editor on a jj config file
  export extern "jj config edit" [
    --user                    # Target the user-level config
    --repo                    # Target the repo-level config
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config edit color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config get color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Get the value of a given config option.
  export extern "jj config get" [
    name: string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config get color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List variables set in config files, along with their values
  export extern "jj config list" [
    name?: string             # An optional name of a specific config option to look up
    --include-defaults        # Whether to explicitly include built-in default values in the list
    --include-overridden      # Allow printing overridden values
    --user                    # Target the user-level config
    --repo                    # Target the repo-level config
    --template(-T): string    # Render each variable using the given template
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config path color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print the paths to the config files
  export extern "jj config path" [
    --user                    # Target the user-level config
    --repo                    # Target the repo-level config
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config path color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config set color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update a config file to set the given option to a given value
  export extern "jj config set" [
    name: string
    value: string             # New value to set
    --user                    # Target the user-level config
    --repo                    # Target the repo-level config
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config set color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj config unset color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update a config file to unset the given option
  export extern "jj config unset" [
    name: string
    --user                    # Target the user-level config
    --repo                    # Target the repo-level config
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj config unset color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Low-level commands not intended for users
  export extern "jj debug" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug copy-detection color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show information about file copies detected
  export extern "jj debug copy-detection" [
    revision?: string         # Show file copies detected in changed files in this revision, compared to its parent(s)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug copy-detection color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug fileset color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Parse fileset expression
  export extern "jj debug fileset" [
    path: path
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug fileset color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug index color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show commit index stats
  export extern "jj debug index" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug index color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug init-simple color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new repo in the given directory using the proof-of-concept simple backend
  export extern "jj debug init-simple" [
    destination?: path        # The destination directory
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug init-simple color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug local-working-copy color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show information about the local working copy state
  export extern "jj debug local-working-copy" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug local-working-copy color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug operation display" [] {
    [ "operation" "id" "view" "all" ]
  }

  def "nu-complete jj debug operation color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show information about an operation and its view
  export extern "jj debug operation" [
    operation?: string
    --display: string@"nu-complete jj debug operation display"
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug operation color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug reindex color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Rebuild commit index
  export extern "jj debug reindex" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug reindex color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug revset color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Evaluate revset to full commit IDs
  export extern "jj debug revset" [
    revision: string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug revset color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug snapshot color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Trigger a snapshot in the op log
  export extern "jj debug snapshot" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug snapshot color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug template color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Parse a template
  export extern "jj debug template" [
    template: string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug template color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug tree color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List the recursive entries of a tree
  export extern "jj debug tree" [
    --revision(-r): string
    --id: string
    --dir: string
    ...paths: string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug tree color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug watchman color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  export extern "jj debug watchman" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug watchman color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug watchman status color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Check whether `watchman` is enabled and whether it's correctly installed
  export extern "jj debug watchman status" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug watchman status color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug watchman query-clock color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  export extern "jj debug watchman query-clock" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug watchman query-clock color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug watchman query-changed-files color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  export extern "jj debug watchman query-changed-files" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug watchman query-changed-files color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug watchman reset-clock color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  export extern "jj debug watchman reset-clock" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug watchman reset-clock color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj debug working-copy color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show information about the working copy state
  export extern "jj debug working-copy" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj debug working-copy color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj describe color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update the change description or other metadata
  export extern "jj describe" [
    ...revisions_pos: string  # The revision(s) whose description to edit (default: @)
    -r: string
    --message(-m): string     # The change description to use (don't open editor)
    --stdin                   # Read the change description from stdin
    --no-edit                 # Don't open an editor
    --edit                    # Open an editor
    --reset-author            # Reset the author to the configured user
    --author: string          # Set author to the provided string
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj describe color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj diff color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Compare file contents between two revisions
  export extern "jj diff" [
    --revisions(-r): string   # Show changes in these revisions
    --from(-f): string        # Show changes from this revision
    --to(-t): string          # Show changes to this revision
    ...paths: path            # Restrict the diff to these paths
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space(-w)    # Ignore whitespace when comparing lines
    --ignore-space-change(-b) # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj diff color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj diffedit color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Touch up the content changes in a revision with a diff editor
  export extern "jj diffedit" [
    --revision(-r): string    # The revision to touch up
    --from(-f): string        # Show changes from this revision
    --to(-t): string          # Edit changes in this revision
    --tool: string            # Specify diff editor to be used
    --restore-descendants     # Preserve the content (not the diff) when rebasing descendants
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj diffedit color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj duplicate color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create new changes with the same content as existing ones
  export extern "jj duplicate" [
    ...revisions_pos: string  # The revision(s) to duplicate (default: @)
    -r: string
    --destination(-d): string # The revision(s) to duplicate onto (can be repeated to create a merge commit)
    --insert-after(-A): string # The revision(s) to insert after (can be repeated to create a merge commit)
    --after: string           # The revision(s) to insert after (can be repeated to create a merge commit)
    --insert-before(-B): string # The revision(s) to insert before (can be repeated to create a merge commit)
    --before: string          # The revision(s) to insert before (can be repeated to create a merge commit)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj duplicate color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj edit color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Sets the specified revision as the working-copy revision
  export extern "jj edit" [
    revision: string          # The commit to edit
    -r                        # Ignored (but lets you pass `-r` for consistency with other commands)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj edit color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj evolog color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show how a change has evolved over time
  export extern "jj evolog" [
    --revision(-r): string
    --limit(-n): string       # Limit number of revisions to show
    --reversed                # Show revisions in the opposite order (older revisions first)
    --no-graph                # Don't show the graph, show a flat list of revisions
    --template(-T): string    # Render each revision using the given template
    --patch(-p)               # Show patch compared to the previous version of this change
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj evolog color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # File operations
  export extern "jj file" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file annotate color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show the source change for each line of the target file
  export extern "jj file annotate" [
    path: path                # the file to annotate
    --revision(-r): string    # an optional revision to start at
    --template(-T): string    # Render each line using the given template
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file annotate color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file chmod mode" [] {
    [ "n" "x" ]
  }

  def "nu-complete jj file chmod color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Sets or removes the executable bit for paths in the repo
  export extern "jj file chmod" [
    mode: string@"nu-complete jj file chmod mode"
    --revision(-r): string    # The revision to update
    ...paths: path            # Paths to change the executable bit for
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file chmod color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List files in a revision
  export extern "jj file list" [
    --revision(-r): string    # The revision to list files in
    --template(-T): string    # Render each file entry using the given template
    ...paths: path            # Only list files matching these prefixes (instead of all files)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file show color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print contents of files in a revision
  export extern "jj file show" [
    --revision(-r): string    # The revision to get the file contents from
    ...paths: path            # Paths to print
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file show color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file track color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Start tracking specified paths in the working copy
  export extern "jj file track" [
    ...paths: path            # Paths to track
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file track color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj file untrack color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Stop tracking specified paths in the working copy
  export extern "jj file untrack" [
    ...paths: path            # Paths to untrack. They must already be ignored
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj file untrack color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj fix color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update files with formatting fixes or other changes
  export extern "jj fix" [
    --source(-s): string      # Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set
    ...paths: path            # Fix only these paths
    --include-unchanged-files # Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj fix color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Commands for working with Git remotes and the underlying Git repo
  export extern "jj git" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git clone color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new repo backed by a clone of a Git repo
  export extern "jj git clone" [
    source: string            # URL or path of the Git repo to clone
    destination?: path        # Specifies the target directory for the Jujutsu repository clone. If not provided, defaults to a directory named after the last component of the source URL. The full directory path will be created if it doesn't exist
    --remote: string          # Name of the newly created remote
    --colocate                # Whether or not to colocate the Jujutsu repo with the git repo
    --depth: string           # Create a shallow clone of the given depth
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git clone color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git export color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update the underlying Git repo with changes made in the repo
  export extern "jj git export" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git export color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git fetch color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Fetch from a Git remote
  export extern "jj git fetch" [
    --branch(-b): string      # Fetch only some of the branches
    --remote: string          # The remote to fetch from (only named remotes are supported, can be repeated)
    --all-remotes             # Fetch from all remotes
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git fetch color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git import color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update repo with changes made in the underlying Git repo
  export extern "jj git import" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git import color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git init color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new Git backed repo
  export extern "jj git init" [
    destination?: path        # The destination directory where the `jj` repo will be created. If the directory does not exist, it will be created. If no directory is given, the current directory is used
    --colocate                # Specifies that the `jj` repo should also be a valid `git` repo, allowing the use of both `jj` and `git` commands in the same directory
    --git-repo: path          # Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created `jj` repo
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git init color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git push color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Push to a Git remote
  export extern "jj git push" [
    --remote: string          # The remote to push to (only named remotes are supported)
    --bookmark(-b): string    # Push only this bookmark, or bookmarks matching a pattern (can be repeated)
    --all                     # Push all bookmarks (including new bookmarks)
    --tracked                 # Push all tracked bookmarks
    --deleted                 # Push all deleted bookmarks
    --allow-new(-N)           # Allow pushing new bookmarks
    --allow-empty-description # Allow pushing commits with empty descriptions
    --allow-private           # Allow pushing commits that are private
    --revisions(-r): string   # Push bookmarks pointing to these commits (can be repeated)
    --change(-c): string      # Push this commit by creating a bookmark based on its change ID (can be repeated)
    --named: string           # Specify a new bookmark name and a revision to push under that name, e.g. '--named myfeature=@'
    --dry-run                 # Only display what will change on the remote
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git push color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage Git remotes
  export extern "jj git remote" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote add color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Add a Git remote
  export extern "jj git remote add" [
    remote: string            # The remote's name
    url: string               # The remote's URL or path
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote add color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List Git remotes
  export extern "jj git remote list" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote remove color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Remove a Git remote and forget its bookmarks
  export extern "jj git remote remove" [
    remote: string            # The remote's name
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote remove color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote rename color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Rename a Git remote
  export extern "jj git remote rename" [
    old: string               # The name of an existing remote
    new: string               # The desired name for `old`
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote rename color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git remote set-url color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Set the URL of a Git remote
  export extern "jj git remote set-url" [
    remote: string            # The remote's name
    url: string               # The desired URL or path for `remote`
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git remote set-url color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj git root color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show the underlying Git directory of a repository using the Git backend
  export extern "jj git root" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj git root color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj help keyword" [] {
    [ "bookmarks" "config" "filesets" "glossary" "revsets" "templates" "tutorial" ]
  }

  def "nu-complete jj help color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print this message or the help of the given subcommand(s)
  export extern "jj help" [
    ...command: string        # Print help for the subcommand(s)
    --keyword(-k): string@"nu-complete jj help keyword" # Show help for keywords instead of commands
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj help color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj interdiff color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Compare the changes of two commits
  export extern "jj interdiff" [
    --from(-f): string        # Show changes from this revision
    --to(-t): string          # Show changes to this revision
    ...paths: path            # Restrict the diff to these paths
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space(-w)    # Ignore whitespace when comparing lines
    --ignore-space-change(-b) # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj interdiff color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj log color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show revision history
  export extern "jj log" [
    --revisions(-r): string   # Which revisions to show
    ...paths: path            # Show revisions modifying the given paths
    --limit(-n): string       # Limit number of revisions to show
    --reversed                # Show revisions in the opposite order (older revisions first)
    --no-graph                # Don't show the graph, show a flat list of revisions
    --template(-T): string    # Render each revision using the given template
    --patch(-p)               # Show patch
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj log color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj new color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new, empty change and (by default) edit it in the working copy
  export extern "jj new" [
    ...revisions: string      # Parent(s) of the new change
    -d                        # Ignored (but lets you pass `-d`/`-r` for consistency with other commands)
    --message(-m): string     # The change description to use
    --no-edit                 # Do not edit the newly created change
    --edit                    # No-op flag to pair with --no-edit
    --insert-after(-A): string # Insert the new change after the given commit(s)
    --after: string           # Insert the new change after the given commit(s)
    --insert-before(-B): string # Insert the new change before the given commit(s)
    --before: string          # Insert the new change before the given commit(s)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj new color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj next color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move the working-copy commit to the child revision
  export extern "jj next" [
    offset?: string           # How many revisions to move forward. Advances to the next child by default
    --edit(-e)                # Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)
    --no-edit(-n)             # The inverse of `--edit`
    --conflict                # Jump to the next conflicted descendant
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj next color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Commands for working with the operation log
  export extern "jj operation" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation abandon color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Abandon operation history
  export extern "jj operation abandon" [
    operation: string         # The operation or operation range to abandon
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation abandon color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation diff color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Compare changes to the repository between two operations
  export extern "jj operation diff" [
    --operation: string       # Show repository changes in this operation, compared to its parent
    --op: string              # Show repository changes in this operation, compared to its parent
    --from(-f): string        # Show repository changes from this operation
    --to(-t): string          # Show repository changes to this operation
    --no-graph                # Don't show the graph, show a flat list of modified changes
    --patch(-p)               # Show patch of modifications to changes
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation diff color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation log color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show the operation log
  export extern "jj operation log" [
    --limit(-n): string       # Limit number of operations to show
    --reversed                # Show operations in the opposite order (older operations first)
    --no-graph                # Don't show the graph, show a flat list of operations
    --template(-T): string    # Render each operation using the given template
    --op-diff(-d)             # Show changes to the repository at each operation
    --patch(-p)               # Show patch of modifications to changes (implies --op-diff)
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation log color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation restore what" [] {
    [ "repo" "remote-tracking" ]
  }

  def "nu-complete jj operation restore color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new operation that restores the repo to an earlier state
  export extern "jj operation restore" [
    operation: string         # The operation to restore to
    --what: string@"nu-complete jj operation restore what" # What portions of the local state to restore (can be repeated)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation restore color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation show color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show changes to the repository in an operation
  export extern "jj operation show" [
    operation?: string        # Show repository changes in this operation, compared to its parent(s)
    --no-graph                # Don't show the graph, show a flat list of modified changes
    --patch(-p)               # Show patch of modifications to changes
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation show color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj operation undo what" [] {
    [ "repo" "remote-tracking" ]
  }

  def "nu-complete jj operation undo color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Create a new operation that undoes an earlier operation
  export extern "jj operation undo" [
    operation?: string        # The operation to undo
    --what: string@"nu-complete jj operation undo what" # What portions of the local state to restore (can be repeated)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj operation undo color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj parallelize color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Parallelize revisions by making them siblings
  export extern "jj parallelize" [
    ...revisions: string      # Revisions to parallelize
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj parallelize color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj prev color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Change the working copy revision relative to the parent revision
  export extern "jj prev" [
    offset?: string           # How many revisions to move backward. Moves to the parent by default
    --edit(-e)                # Edit the parent directly, instead of moving the working-copy commit
    --no-edit(-n)             # The inverse of `--edit`
    --conflict                # Jump to the previous conflicted ancestor
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj prev color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj rebase color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move revisions to different parent(s)
  export extern "jj rebase" [
    --branch(-b): string      # Rebase the whole branch relative to destination's ancestors (can be repeated)
    --source(-s): string      # Rebase specified revision(s) together with their trees of descendants (can be repeated)
    --revisions(-r): string   # Rebase the given revisions, rebasing descendants onto this revision's parent(s)
    --destination(-d): string # The revision(s) to rebase onto (can be repeated to create a merge commit)
    --insert-after(-A): string # The revision(s) to insert after (can be repeated to create a merge commit)
    --after: string           # The revision(s) to insert after (can be repeated to create a merge commit)
    --insert-before(-B): string # The revision(s) to insert before (can be repeated to create a merge commit)
    --before: string          # The revision(s) to insert before (can be repeated to create a merge commit)
    --skip-empty              # Deprecated. Use --skip-emptied instead
    --skip-emptied            # If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj rebase color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj resolve color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Resolve conflicted files with an external merge tool
  export extern "jj resolve" [
    --revision(-r): string
    --list(-l)                # Instead of resolving conflicts, list all the conflicts
    --tool: string            # Specify 3-way merge tool to be used
    ...paths: path            # Only resolve conflicts in these paths. You can use the `--list` argument to find paths to use here
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj resolve color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj restore color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Restore paths from another revision
  export extern "jj restore" [
    ...paths: path            # Restore only these paths (instead of all paths)
    --from(-f): string        # Revision to restore from (source)
    --into(-t): string        # Revision to restore into (destination)
    --to: string              # Revision to restore into (destination)
    --changes-in(-c): string  # Undo the changes in a revision as compared to the merge of its parents
    --revision(-r): string    # Prints an error. DO NOT USE
    --interactive(-i)         # Interactively choose which parts to restore
    --tool: string            # Specify diff editor to be used (implies --interactive)
    --restore-descendants     # Preserve the content (not the diff) when rebasing descendants
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj restore color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj revert color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Apply the reverse of the given revision(s)
  export extern "jj revert" [
    --revisions(-r): string   # The revision(s) to apply the reverse of
    --destination(-d): string # The revision(s) to apply the reverse changes on top of
    --insert-after(-A): string # The revision(s) to insert the reverse changes after (can be repeated to create a merge commit)
    --after: string           # The revision(s) to insert the reverse changes after (can be repeated to create a merge commit)
    --insert-before(-B): string # The revision(s) to insert the reverse changes before (can be repeated to create a merge commit)
    --before: string          # The revision(s) to insert the reverse changes before (can be repeated to create a merge commit)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj revert color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj root color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show the current workspace root directory (shortcut for `jj workspace root`)
  export extern "jj root" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj root color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj run color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # (**Stub**, does not work yet) Run a command across a set of revisions.
  export extern "jj run" [
    shell_command: string     # The command to run across all selected revisions
    --revisions(-r): string   # The revisions to change
    -x                        # A no-op option to match the interface of `git rebase -x`
    --jobs(-j): string        # How many processes should run in parallel, uses by default all cores
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj run color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj show color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show commit description and changes in a revision
  export extern "jj show" [
    revision?: string         # Show changes in this revision, compared to its parent(s)
    -r                        # Ignored (but lets you pass `-r` for consistency with other commands)
    --template(-T): string    # Render a revision using the given template
    --summary(-s)             # For each path, show only whether it was modified, added, or deleted
    --stat                    # Show a histogram of the changes
    --types                   # For each path, show only its type before and after
    --name-only               # For each path, show only its path
    --git                     # Show a Git-format diff
    --color-words             # Show a word-level diff with changes indicated only by color
    --tool: string            # Generate diff by external command
    --context: string         # Number of lines of context to show
    --ignore-all-space        # Ignore whitespace when comparing lines
    --ignore-space-change     # Ignore changes in amount of whitespace when comparing lines
    --no-patch                # Do not show the patch
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj show color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sign color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Cryptographically sign a revision
  export extern "jj sign" [
    --revisions(-r): string   # What revision(s) to sign
    --key: string             # The key used for signing
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sign color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj simplify-parents color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Simplify parent edges for the specified revision(s)
  export extern "jj simplify-parents" [
    --source(-s): string      # Simplify specified revision(s) together with their trees of descendants (can be repeated)
    --revisions(-r): string   # Simplify specified revision(s) (can be repeated)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj simplify-parents color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sparse color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage which paths from the working-copy commit are present in the working copy
  export extern "jj sparse" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sparse color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sparse edit color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Start an editor to update the patterns that are present in the working copy
  export extern "jj sparse edit" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sparse edit color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sparse list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List the patterns that are currently present in the working copy
  export extern "jj sparse list" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sparse list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sparse reset color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Reset the patterns to include all files in the working copy
  export extern "jj sparse reset" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sparse reset color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj sparse set color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update the patterns that are present in the working copy
  export extern "jj sparse set" [
    --add: path               # Patterns to add to the working copy
    --remove: path            # Patterns to remove from the working copy
    --clear                   # Include no files in the working copy (combine with --add)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj sparse set color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj split color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Split a revision in two
  export extern "jj split" [
    --interactive(-i)         # Interactively choose which parts to split
    --tool: string            # Specify diff editor to be used (implies --interactive)
    --revision(-r): string    # The revision to split
    --parallel(-p)            # Split the revision into two parallel revisions instead of a parent and child
    ...paths: path            # Files matching any of these filesets are put in the first commit
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj split color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj squash color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Move changes from a revision into another revision
  export extern "jj squash" [
    --revision(-r): string    # Revision to squash into its parent (default: @)
    --from(-f): string        # Revision(s) to squash from (default: @)
    --into(-t): string        # Revision to squash into (default: @)
    --to: string              # Revision to squash into (default: @)
    --message(-m): string     # The description to use for squashed revision (don't open editor)
    --use-destination-message(-u) # Use the description of the destination revision and discard the description(s) of the source revision(s)
    --interactive(-i)         # Interactively choose which parts to squash
    --tool: string            # Specify diff editor to be used (implies --interactive)
    ...paths: path            # Move only changes to these paths (instead of all paths)
    --keep-emptied(-k)        # The source revision will not be abandoned
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj squash color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj status color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show high-level repo status
  export extern "jj status" [
    ...paths: path            # Restrict the status display to these paths
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj status color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj tag color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Manage tags
  export extern "jj tag" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj tag color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj tag list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List tags
  export extern "jj tag list" [
    ...names: string          # Show tags whose local name matches
    --template(-T): string    # Render each tag using the given template
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj tag list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Infrequently used commands such as for generating shell completions
  export extern "jj util" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util completion shell" [] {
    [ "bash" "elvish" "fish" "nushell" "power-shell" "zsh" ]
  }

  def "nu-complete jj util completion color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print a command-line-completion script
  export extern "jj util completion" [
    shell?: string@"nu-complete jj util completion shell"
    --bash                    # Deprecated. Use the SHELL positional argument instead
    --fish                    # Deprecated. Use the SHELL positional argument instead
    --zsh                     # Deprecated. Use the SHELL positional argument instead
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util completion color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util config-schema color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print the JSON schema for the jj TOML config format
  export extern "jj util config-schema" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util config-schema color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util exec color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Execute an external command via jj
  export extern "jj util exec" [
    command: string           # External command to execute
    ...args: string           # Arguments to pass to the external command
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util exec color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util gc color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Run backend-dependent garbage collection
  export extern "jj util gc" [
    --expire: string          # Time threshold
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util gc color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util install-man-pages color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Install Jujutsu's manpages to the provided path
  export extern "jj util install-man-pages" [
    path: path                # The path where manpages will installed. An example path might be `/usr/share/man`. The provided path will be appended with `man1`, etc., as appropriate
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util install-man-pages color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj util markdown-help color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Print the CLI help for all subcommands in Markdown
  export extern "jj util markdown-help" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj util markdown-help color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj undo what" [] {
    [ "repo" "remote-tracking" ]
  }

  def "nu-complete jj undo color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Undo an operation (shortcut for `jj op undo`)
  export extern "jj undo" [
    operation?: string        # The operation to undo
    --what: string@"nu-complete jj undo what" # What portions of the local state to restore (can be repeated)
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj undo color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj unsign color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Drop a cryptographic signature
  export extern "jj unsign" [
    --revisions(-r): string   # What revision(s) to unsign
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj unsign color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj version color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Display version information
  export extern "jj version" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj version color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Commands for working with workspaces
  export extern "jj workspace" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace add sparse_patterns" [] {
    [ "copy" "full" "empty" ]
  }

  def "nu-complete jj workspace add color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Add a workspace
  export extern "jj workspace add" [
    destination: string       # Where to create the new workspace
    --name: string            # A name for the workspace
    --revision(-r): string    # A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents
    --sparse-patterns: string@"nu-complete jj workspace add sparse_patterns" # How to handle sparse patterns when creating a new workspace
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace add color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace forget color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Stop tracking a workspace's working-copy commit in the repo
  export extern "jj workspace forget" [
    ...workspaces: string     # Names of the workspaces to forget. By default, forgets only the current workspace
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace forget color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace list color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # List workspaces
  export extern "jj workspace list" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace list color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace rename color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Renames the current workspace
  export extern "jj workspace rename" [
    new_workspace_name: string # The name of the workspace to update to
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace rename color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace root color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Show the current workspace root directory
  export extern "jj workspace root" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace root color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete jj workspace update-stale color" [] {
    [ "always" "never" "debug" "auto" ]
  }

  # Update a workspace that has become stale
  export extern "jj workspace update-stale" [
    --repository(-R): path    # Path to repository to operate on
    --ignore-working-copy     # Don't snapshot the working copy, and don't update it
    --ignore-immutable        # Allow rewriting immutable commits
    --at-operation: string    # Operation to load the repo at
    --at-op: string           # Operation to load the repo at
    --debug                   # Enable debug logging
    --color: string@"nu-complete jj workspace update-stale color" # When to colorize output
    --quiet                   # Silence non-primary command output
    --no-pager                # Disable the pager
    --config: string          # Additional configuration options (can be repeated)
    --config-toml: string     # Additional configuration options (can be repeated) (DEPRECATED)
    --config-file: path       # Additional configuration files (can be repeated)
    --help(-h)                # Print help (see more with '--help')
  ]

}

export use completions *
