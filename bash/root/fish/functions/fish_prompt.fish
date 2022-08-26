function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '

    end
    echo -n (set_color ffff00)'󰮯  '(set_color 0089ff)'󰊠  '(set_color 0089ff)'󰊠  '(set_color 0089ff)'󰊠  '(set_color 0089ff)'󰊠  '(set_color ff0000)$PWD ''
    set_color normal
end
