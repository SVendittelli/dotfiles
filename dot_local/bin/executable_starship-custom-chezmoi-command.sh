# ~/.local/bin/starship-custom-chezmoi-command.sh
# =============================================================================
# Add chezmoi status to starship prompt

if [ !(chezmoi git diff --quiet HEAD *> /dev/null) ] ; then
    $Changes = '!'
else
    $Changes = ''
fi

if [ $(chezmoi git -- rev-list --count origin..HEAD) -gt 0 ] ; then
    $Ahead = '+'
else
    $Ahead = ''
fi

if [ $(chezmoi git -- rev-list --count HEAD..origin) -gt 0 ] ; then
    $Behind = '-'
else
    $Behind = ''
fi

return "[$($Changes)$($Ahead)$($Behind)]"
