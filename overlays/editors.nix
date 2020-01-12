self: super: 

let
  customRC = ''
    set mouse=a
  '';

  plugins = with super.vimPlugins; [
    vim-nix
    vim-airline
    delimitMate
  ];
in

{
  super.vim.ftNix = false;
  vim-configured = super.vim_configurable.customize {
    name = "vim";
    vimrcConfig = { inherit customRC; plug.plugins = plugins; };
  };

  neovim-configured = super.neovim.override {
    configure = { inherit customRC; plug.plugins = plugins; };
    viAlias = true;
    vimAlias = true;
  };
  neovim-vimdiff = super.writeScriptBin "vimdiff" "exec ${self.neovim-configured}/bin/nvim -d \"$@\"";
}
