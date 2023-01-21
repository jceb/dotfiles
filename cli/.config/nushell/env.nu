# Nushell Environment Config File

let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    # let path_segment = if (is-admin) {
    #     $"(ansi red_bold)($env.PWD)"
    # } else {
    #     $"(ansi green_bold)($env.PWD)"
    # }
    #
    # $path_segment
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
# let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }
let-env PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
# let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR = { "" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

## To enable direnv in nushell we must run code in the context of the current shell - i.e it cannot be within a block and it needs to run as a "code" string as per https://github.com/nushell/nushell/pull/5982 (so you must run nushell 0.66 or later). That way it works as if you'd typed in and run the code directly in your shell.
## Direnv knows what to do otherwise and will export the env to load (or unload) based on what is in your current environment so this is all that is needed with some checks for empty strings, defaulting then to an empty table so that load-env is always happy.

let-env config = {
  hooks: {
    env_change: {
      PWD: [{
        code: "
          let direnv = (direnv export json | from json)
          let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
          $direnv | load-env
        "
      }]
    }
  }
}
