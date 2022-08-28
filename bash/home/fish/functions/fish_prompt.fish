function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '

    end
    #echo -n (set_color ff0000)'󰊠  '(set_color ffb5de)'󰊠  '(set_color 00ffde)'󰊠  '(set_color ffb542)'󰊠  '(set_color ffff00)'󰮯  '(set_color ffff00)(prompt_pwd) ''
   
    echo -n (set_color ffb542)'󰊠  '(set_color ff0000)'󰊠  '(set_color ffb5de)'󰊠  '(set_color 00ffde)'󰊠  '(set_color --bold ffff00)'󰮯  '(set_color --bold ffff00)(prompt_pwd) ''

    set_color normal
end
