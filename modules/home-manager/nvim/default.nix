{ config, pkgs, ...}:
{
  programs.neovim = {
  	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;
	withPython3 = true;
	plugins = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
	  # autocompletion
	  cmp-nvim-lsp
          cmp-buffer
          cmp-path
          cmp-cmdline
          cmp-nvim-lsp-signature-help
          nvim-cmp
          lspkind-nvim
	  
	  # hotkey window
	  legendary-nvim
	];
  

   extraPackages = with pkgs; [
        tree-sitter
        nodejs
        # Lua
        lua-language-server
        # Nix
        nil
        nixpkgs-fmt
        statix
      ];
  };
    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
}
