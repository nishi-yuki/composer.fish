function __composer -d 'Edit command before run'
    set -l tmpfile (mktemp)
    commandline --current-buffer > $tmpfile
    set -l editor
    if [ -n "$VISUAL" ]
        set editor $VISUAL
    else if [ -n "$EDITOR" ]
        set editor $EDITOR
    else
        set editor vi
    end
    $editor $tmpfile
    commandline --replace (cat $tmpfile)
    rm $tmpfile
end
