{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFzfHistory = true;
    #enableFzfCompletion = true;

    #autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      ZSH_THEME="candy"
      ENABLE_CORRECTION="true"

      # Search history with Ctrl-P/N
      bindkey '^P' up-line-or-search
      bindkey '^N' down-line-or-search

      # Command line navigation
      bindkey '^\' edit-command-line
      bindkey '^J' backward-word
      bindkey '^K' forward-word

      # Use the vi navigation keys besides cursor keys in menu completion
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      bindkey -M menuselect 'h' vi-backward-char        # left
      bindkey -M menuselect 'k' vi-up-line-or-history   # up
      bindkey -M menuselect 'l' vi-forward-char         # right
      bindkey -M menuselect 'j' vi-down-line-or-history # bottom
    '';

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
  };
}
