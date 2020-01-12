self: super:

let
  customRC = ''
    " This makes mouse selection copy work
    set mouse=i

    " Always show line numbers
    set number

    " Highlight column 81
    set textwidth=80
    set colorcolumn=+1
    hi ColorColumn ctermbg=246

    " Remove trailing whitespace when writing a buffer, but not for diff files
    func! RemoveTrailingWhitespace()
        if &ft != "diff"
            let b:curcol = col(".")
            let b:curline = line(".")
            silent! %s/\s\+$//
            silent! %s/\(\s*\n\)\+\%$//
            call cursor(b:curline, b:curcol)
        endif
    endfunc
    autocmd BufWritePre * call RemoveTrailingWhitespace()
  '';

  plugins = with super.vimPlugins; [
    vim-nix
    vim-airline
    delimitMate
    supertab
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
