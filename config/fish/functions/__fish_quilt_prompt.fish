function __fish_quilt_set_color -d "Initialize variable with a default value"
    set -l user_variable_name "$argv[1]"
    set -l default $argv[2]
    set -l user_variable $$user_variable_name

    if not set -q $user_variable_name
        set -g $user_variable_name (set -q $user_variable_name; and echo $user_variable; or echo $default)
        set -g "$user_variable_name"_done (set_color normal)
    end
end

function __fish_quilt_prompt -d "Write out the quilt prompt"
    if not command -sq quilt
        return 1
    end
    if not command quilt top > /dev/null ^ /dev/null
        return 1
    end
    set -l patches
    command quilt series | while read p
        set patches $patches $p
    end
    set -l npatches (count $patches)
    set -l current_patch (command quilt top)
    set -l idx_patch (contains -i $current_patch $patches)
    __fish_quilt_set_color __fish_quilt_prompt_color (set_color blue)
    set -l format $argv[1]
    if test -z "$format"
        set format " (%s)"
    end
    set prompt "$__fish_quilt_prompt_color"(basename $current_patch)" $idx_patch/$npatches$__fish_quilt_prompt_color_done"
    printf $format $prompt
end
