{ config, pkgs, lib, ... }:

{
  packageOverrides = pkgs; with pkgs; {
    myVim = vim_configurable.customize {
      name = "vim-with-plugins";
      vimrcConfig.plug.plugins = with pkgs.vimPlugins; [
        vim-nix
        vim-airline
        delimitMate
      ]
    }
  }
}
