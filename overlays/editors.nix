self: super: 

let
  vimrcConfig = {
    customRC = ''
      set mouse=a
    '';

    plug.plugins = with super.vimPlugins; [
      vim-nix
      vim-airline
      delimitMate
    ];
  };
in

{
  super.vim.ftNix = false;
  vim-configured = super.vim_configurable.customize {
    name = "vim";
    inherit vimrcConfig;
  };
}
