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
      plenary-nvim
      nvim-web-devicons
	  
      # hotkey window
	  legendary-nvim

	  # autocompletion
      nvim-lspconfig
	  cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp-signature-help
      nvim-cmp
      lspkind-nvim
      luasnip
      cmp_luasnip

	  # colorscheme
      catppuccin-nvim

      # telescope
      telescope-nvim
      dressing-nvim

      # statusline
      lualine-nvim

      # bufferline
      barbar-nvim
      
      # treesitter
      (nvim-treesitter.withPlugins (plugins: with plugins; [ c nix cpp markdown cuda json lua ]))


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
        # telescope addons
        ripgrep
        # git integration
        lazygit
      ];
  };
    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
}