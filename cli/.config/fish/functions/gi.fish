set GI_CACHE ~/.cache/tmp/gi.cache

function _gi_dir
    if [ ! -e "$GI_CACHE" ];
        mkdir -p "$GI_CACHE"
    end
end

function _gi_fetch
    _gi_dir
    if [ -e "$GI_CACHE/$argv" ];
        cat "$GI_CACHE/$argv"
    else
        curl -sL "https://www.gitignore.io/api/$argv" | tee "$GI_CACHE/$argv"
    end
end

function giu
    rm -rf "$GI_CACHE"
    _gi_dir
    curl -sL 'https://www.gitignore.io/api/list?format=lines' > "$GI_CACHE/list"
end

function gi
    if [ ! -e "$GI_CACHE/list" ];
        giu
    end

    set query ""
    if [ -n $argv ];
        set query "--query=$argv"
    end

	fzf "$query" -m < "$GI_CACHE/list" | while read type;
        _gi_fetch $type
    end
end

function gii
    _gi_fetch $argv
end
