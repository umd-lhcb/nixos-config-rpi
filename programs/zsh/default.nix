{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    #autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      ZSH_THEME="candy"
      EDITOR=vi

      # Search history with Ctrl-P/N
      bindkey "^P" up-line-or-search
      bindkey "^N" down-line-or-search

      # fzf history integration
      source ${./fzf-history.zsh}
    '';

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
  };
}
