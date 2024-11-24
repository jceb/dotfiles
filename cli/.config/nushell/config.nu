# Source: https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_config.nu
# Nushell Config File

# For more information on themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
use ~/.config/nushell/nu_scripts/themes/nu-themes/tokyo-night.nu
let dark_theme = (tokyo-night)

use ~/.config/nushell/nu_scripts/themes/nu-themes/tokyo-day.nu
let light_theme = (tokyo-day)

# Configure carapace:
# mkdir ~/.cache/carapace
# carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
let carapace_completer = {|spans|
  # if the current command is an alias, get it's expansion
  let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)
  # overwrite
  let spans = (if $expanded_alias != null  {
    # put the first word of the expanded alias first in the span
    $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
  } else {
    $spans
  })
  carapace $spans.0 nushell ...$spans
  | from json
}

$env.LS_COLORS = (vivid generate one-light | str trim)

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  show_banner: false # true or false to enable or disable the welcome banner at startup
  ls: {
    use_ls_colors: true # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }
  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }
  # cd: {
  #   abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
  # }
  table: {
    mode: compact # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    padding: { left: 1, right: 1 } # a left right padding of each column in a table
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
    header_on_separator: false # show header text on separator/border line
    # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
  }

  error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

  # datetime_format determines what a datetime rendered in the shell would look like.
  # Behavior without this configuration point will be to "humanize" the datetime display,
  # showing something like "a day ago."
  datetime_format: {
      # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
      # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
  }

  explore: {
    #help_banner: true
    exit_esc: true

    command_bar_text: '#C4C9C6'
    # command_bar: {fg: '#C4C9C6' bg: '#223311' }

    status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
    # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

    highlight: {bg: 'yellow' fg: 'black' }

    status: {
      # warn: {bg: 'yellow', fg: 'blue'}
      # error: {bg: 'yellow', fg: 'blue'}
      # info: {bg: 'yellow', fg: 'blue'}
    }

    try: {
      # border_color: 'red'
      # highlighted_color: 'blue'

      # reactive: false
    }

    table: {
      split_line: { fg: "#404040" },
      selected_cell: { bg: light_blue },
      selected_row: {},
      selected_column: {},

      cursor: true

      line_index: true
      line_shift: true
      line_head_top: true
      line_head_bottom: true

      show_head: true
      show_index: true
    }

    config: {
      cursor_color: {bg: 'yellow' fg: 'black' }

      # border_color: white
      # list_color: green
    }
  }

  history: {
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: false # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
    isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
  }
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: $carapace_completer
    }
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  }
  cursor_shape: {
    emacs: line # block, underscore, line (line is the default)
    vi_insert: line # block, underscore, line (block is the default)
    vi_normal: block # block, underscore, line  (underscore is the default)
  }
  color_config: $light_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
  footer_mode: 25 # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: vi # emacs, vi
  shell_integration: {
      # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
      osc2: true
      # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
      osc7: true
      # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
      osc8: true
      # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
      osc9_9: false
      # osc133 is several escapes invented by Final Term which include the supported ones below.
      # 133;A - Mark prompt start
      # 133;B - Mark prompt end
      # 133;C - Mark pre-execution
      # 133;D;exit - Mark execution finished with exit code
      # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
      osc133: true
      # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
      # 633;A - Mark prompt start
      # 633;B - Mark prompt end
      # 633;C - Mark pre-execution
      # 633;D;exit - Mark execution finished with exit code
      # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
      # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
      # and also helps with the run recent menu in vscode
      osc633: true
      # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
      reset_application_mode: true
  }
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
  use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
  highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.
  recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

  plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.

  plugin_gc: {
      # Configuration for plugin garbage collection
      default: {
          enabled: true # true to enable stopping of inactive plugins
          stop_after: 10sec # how long to wait after a plugin is inactive to stop it
      }
      plugins: {
          # alternate configuration for specific plugins, by name, for example:
          #
          # gstat: {
          #     enabled: false
          # }
      }
  }

  hooks: {
    pre_prompt: [
    # {# null # replace with source code to run before the prompt is shown
    # }
    {
      # See https://github.com/nushell/nu_scripts/blob/main/direnv/config.nu
      code: "
        let direnv = (direnv export json | from json)
        let direnv = if not ($direnv | is-empty) { $direnv } else { {} }
        $direnv | load-env
      "
    }
    ]
    pre_execution: [{ null }] # run before the repl input is run
    env_change: {
            PWD: [{|before, after|
              if ($before == null) or (($before != ($env.DIRHISTORY_REVERSE | get -i 0)) and ($before != ($env.DIRHISTORY | get -i 0))) {
                $env.DIRHISTORY = ($env.DIRHISTORY | prepend $before);
              }
            }] # run if the PWD environment is different since the last repl input
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
    command_not_found: { null } # return an error message when a command is not found
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: bookmark_menu
        only_buffer_difference: true
        marker: "b "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            open ~/.warprc | lines | parse "{shortcut}:{directory}"
            | where shortcut =~ $buffer or directory =~ $buffer
            | sort-by shortcut
            | each { |it| {description: $it.shortcut value: $it.directory} }
        }
      }
      {
        name: file_menu
        only_buffer_difference: true
        marker: "f "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            fd -E .git -E node_modules -d 4 -H -t f -t l -L
            | lines
            | where ($it =~ $buffer)
            | each { |it| {value: $it} }
        }
      }
      {
        name: directory_menu
        only_buffer_difference: true
        marker: "d "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            fd -E .git -E node_modules -d 4 -H -t d -t l -L
            | lines
            | where ($it =~ $buffer)
            | each { |it| {value: $"./($it)"} }
        }
      }
      {
        name: last_word_menu
        only_buffer_difference: true
        marker: "h "
        type: {
            layout: list
            page_size: 10
            # layout: columnar
            # columns: 4
            # col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            # col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            # history | last 10 | get command | split row ' ' | str trim | filter {|x| ($x | str length) > 0}
            atuin history last --cmd-only | lines | last 10 | split row ' ' | str trim | filter {|x| ($x | str length) > 0}
            | reverse
            | find $buffer
            | each { |it| {value: ($it | ansi strip)} }
        }
      }
      {
        name: kube_context_menu
        only_buffer_difference: true
        marker: "k "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            yq e '.contexts[].name' $env.KUBECONFIG
            | lines
            | compact
            | where ($it =~ $buffer)
            | each { |it| {value: $"--context=($it)"} }
        }
      }
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: { attr: r }
            description_text: yellow
            match_text: { attr: u }
            selected_match_text: { attr: ur }
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
  ]
  keybindings: [
    # extend vi insert mode with emacs bindings
    {
      name: vi_normal
      modifier: alt
      keycode: char_b
      mode: vi_insert
      event: [
          { edit: MoveWordLeft }
      ]
    }
    {
      name: vi_normal
      modifier: alt
      keycode: char_f
      mode: vi_insert
      event: [
          { edit: MoveWordRight }
      ]
    }
    {
      name: vi_normal
      modifier: control
      keycode: char_b
      mode: vi_insert
      event: [
          { edit: MoveLeft }
      ]
    }
    {
      name: vi_normal
      modifier: control
      keycode: char_f
      mode: vi_insert
      event: [
          { edit: MoveRight }
      ]
    }
    {
      name: vi_normal
      modifier: alt
      keycode: backspace
      mode: vi_insert
      event: [
          { edit: CutWordLeft }
      ]
    }
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: bookmark_menu
      modifier: control
      keycode: char_k
      mode: [emacs vi_normal vi_insert]
      event: [
      # { send: menu name: bookmark_menu }
      # { edit: InsertString, value: "cd $'(open ~/.warprc | sed -ne 's/:/\\t/p' | sk --color $'(cat ~/.config/colorscheme),hl:1' --reverse --height 40% | awk '{print $2}'| str trim)'"}
      { send: executehostcommand cmd: "cd $'(open ~/.warprc | sed -ne 's/:/\\t/p' | fzf --color $'(cat ~/.config/colorscheme),hl:1' --reverse --height 40% | awk '{print $2}'| str trim)'"}
      ]
    }
    {
      name: kube_context_menu
      modifier: control
      keycode: char_g
      mode: [emacs vi_normal vi_insert]
      event: [
      { send: menu name: kube_context_menu }
      ]
    }
    {
      name: file_menu
      modifier: alt
      keycode: char_t
      mode: [emacs vi_normal vi_insert]
      event: [
      { send: menu name: file_menu }
      # { edit: InsertString, value: "(fd --min-depth 1 -d 4 -td -HL -E '\\.git/' | fzf --color '(cat ~/.config/colorscheme),hl:1' --reverse --height 40% | str trim)"}
      ]
    }
    {
      name: directory_menu
      modifier: alt
      keycode: char_n
      mode: [emacs vi_normal vi_insert]
      event: [
      # { send: menu name: directory_menu }
      { send: executehostcommand cmd: "cd $'(fd -E .git -E node_modules -d 4 -H -t d -t l -L | fzf --color $'(cat ~/.config/colorscheme),hl:1' --reverse --height 40%)'"}
      ]
    }
    {
      name: last_word_menu
      modifier: alt
      keycode: char_.
      mode: [emacs vi_normal vi_insert]
      event: [
      { send: menu name: last_word_menu }
      ]
    }
    {
      name: directory_u
      modifier: alt
      keycode: char_u
      mode: [emacs vi_normal vi_insert]
      event: [
          { send: executehostcommand cmd: "cd .." }
      ]
    }
    {
      name: directory_u
      modifier: alt
      keycode: char_h
      mode: [emacs vi_normal vi_insert]
      event: [
          { send: executehostcommand
            cmd: "if ($env.DIRHISTORY | length) > 0 { $env.DIRHISTORY_REVERSE = ($env.DIRHISTORY_REVERSE | prepend $env.PWD); let newdir = ($env.DIRHISTORY.0); $env.DIRHISTORY = ($env.DIRHISTORY | range 1..); cd $newdir} else {print -e 'Already at oldest directory.'}"
          }
      ]
    }
    {
      name: directory_l
      modifier: alt
      keycode: char_l
      mode: [emacs vi_normal vi_insert]
      event: [
          { send: executehostcommand
            cmd: "if ($env.DIRHISTORY_REVERSE | length) > 0 {  let newdir = ($env.DIRHISTORY_REVERSE.0); $env.DIRHISTORY_REVERSE = ($env.DIRHISTORY_REVERSE | range 1..); cd $newdir} else {print -e 'Already at oldest directory.'}"
          }
      ]
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: [emacs vi_normal vi_insert]
      event: { send: menu name: history_menu }
    }
    {
      name: help_menu
      modifier: control
      keycode: char_q
      # mode: emacs
      mode: [emacs vi_normal vi_insert]
      event: { send: menu name: help_menu }
    }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: [emacs vi_normal vi_insert]
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    # {
    #   name: kill-line
    #   modifier: control
    #   keycode: char_k
    #   mode: [emacs, vi_normal, vi_insert]
    #   event: {
    #     until: [
    #       {edit: cuttolineend}
    #     ]
    #   }
    # }
    # Keybindings used to trigger the user defined menus
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: alt
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: commands_with_description
      modifier: control
      keycode: char_s
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
    }
  ]
}

$env.DIRHISTORY = []
$env.DIRHISTORY_REVERSE = []

# somehow the alias can't be set because it's sourced the moment it's
# created??!!
# # export alias reload = source ~/.config/nushell/config.nu
# export alias R = reload
# # export alias reload = source $nu.config-path
# export def-env reload [] {
#     # source $nu.config-path
#     source ~/.config/nushell/config.nu
# }

# use git-aliases.nu *
use aliases.nu *
source zoxide.nu
source atuin.nu

# plugin use /run/current-system/sw/bin/nu_plugin_formats # from ini, ...
# plugin add /run/current-system/sw/bin/nu_plugin_query
# plugin add /run/current-system/sw/bin/nu_plugin_gstat
# plugin add /run/current-system/sw/bin/nu_plugin_polars
