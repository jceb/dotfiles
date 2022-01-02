# fish completion for flux                                 -*- shell-script -*-

function __flux_debug
    set file "$BASH_COMP_DEBUG_FILE"
    if test -n "$file"
        echo "$argv" >> $file
    end
end

function __flux_perform_completion
    __flux_debug "Starting __flux_perform_completion with: $argv"

    set args (string split -- " " "$argv")
    set lastArg "$args[-1]"

    __flux_debug "args: $args"
    __flux_debug "last arg: $lastArg"

    set emptyArg ""
    if test -z "$lastArg"
        __flux_debug "Setting emptyArg"
        set emptyArg \"\"
    end
    __flux_debug "emptyArg: $emptyArg"

    if not type -q "$args[1]"
        # This can happen when "complete --do-complete flux" is called when running this script.
        __flux_debug "Cannot find $args[1]. No completions."
        return
    end

    set requestComp "$args[1] __complete $args[2..-1] $emptyArg"
    __flux_debug "Calling $requestComp"

    set results (eval $requestComp 2> /dev/null)
    set comps $results[1..-2]
    set directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set flagPrefix (string match -r -- '-.*=' "$lastArg")

    __flux_debug "Comps: $comps"
    __flux_debug "DirectiveLine: $directiveLine"
    __flux_debug "flagPrefix: $flagPrefix"

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# This function does three things:
# 1- Obtain the completions and store them in the global __flux_comp_results
# 2- Set the __flux_comp_do_file_comp flag if file completion should be performed
#    and unset it otherwise
# 3- Return true if the completion results are not empty
function __flux_prepare_completions
    # Start fresh
    set --erase __flux_comp_do_file_comp
    set --erase __flux_comp_results

    # Check if the command-line is already provided.  This is useful for testing.
    if not set --query __flux_comp_commandLine
        # Use the -c flag to allow for completion in the middle of the line
        set __flux_comp_commandLine (commandline -c)
    end
    __flux_debug "commandLine is: $__flux_comp_commandLine"

    set results (__flux_perform_completion "$__flux_comp_commandLine")
    set --erase __flux_comp_commandLine
    __flux_debug "Completion results: $results"

    if test -z "$results"
        __flux_debug "No completion, probably due to a failure"
        # Might as well do file completion, in case it helps
        set --global __flux_comp_do_file_comp 1
        return 1
    end

    set directive (string sub --start 2 $results[-1])
    set --global __flux_comp_results $results[1..-2]

    __flux_debug "Completions are: $__flux_comp_results"
    __flux_debug "Directive is: $directive"

    set shellCompDirectiveError 1
    set shellCompDirectiveNoSpace 2
    set shellCompDirectiveNoFileComp 4
    set shellCompDirectiveFilterFileExt 8
    set shellCompDirectiveFilterDirs 16

    if test -z "$directive"
        set directive 0
    end

    set compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
    if test $compErr -eq 1
        __flux_debug "Received error directive: aborting."
        # Might as well do file completion, in case it helps
        set --global __flux_comp_do_file_comp 1
        return 1
    end

    set filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
    set dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
    if test $filefilter -eq 1; or test $dirfilter -eq 1
        __flux_debug "File extension filtering or directory filtering not supported"
        # Do full file completion instead
        set --global __flux_comp_do_file_comp 1
        return 1
    end

    set nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
    set nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

    __flux_debug "nospace: $nospace, nofiles: $nofiles"

    # Important not to quote the variable for count to work
    set numComps (count $__flux_comp_results)
    __flux_debug "numComps: $numComps"

    if test $numComps -eq 1; and test $nospace -ne 0
        # To support the "nospace" directive we trick the shell
        # by outputting an extra, longer completion.
        __flux_debug "Adding second completion to perform nospace directive"
        set --append __flux_comp_results $__flux_comp_results[1].
    end

    if test $numComps -eq 0; and test $nofiles -eq 0
        __flux_debug "Requesting file completion"
        set --global __flux_comp_do_file_comp 1
    end

    # If we don't want file completion, we must return true even if there
    # are no completions found.  This is because fish will perform the last
    # completion command, even if its condition is false, if no other
    # completion command was triggered
    return (not set --query __flux_comp_do_file_comp)
end

# Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
# so we can properly delete any completions provided by another script.
# The space after the the program name is essential to trigger completion for the program
# and not completion of the program name itself.
complete --do-complete "flux " > /dev/null 2>&1
# Using '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c flux -e

# The order in which the below two lines are defined is very important so that __flux_prepare_completions
# is called first.  It is __flux_prepare_completions that sets up the __flux_comp_do_file_comp variable.
#
# This completion will be run second as complete commands are added FILO.
# It triggers file completion choices when __flux_comp_do_file_comp is set.
complete -c flux -n 'set --query __flux_comp_do_file_comp'

# This completion will be run first as complete commands are added FILO.
# The call to __flux_prepare_completions will setup both __flux_comp_results and __flux_comp_do_file_comp.
# It provides the program's completion choices.
complete -c flux -n '__flux_prepare_completions' -f -a '$__flux_comp_results'

