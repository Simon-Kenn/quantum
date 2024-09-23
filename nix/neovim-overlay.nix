{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  all-plugins = with pkgs.vimPlugins; [
    # -- core --
    which-key-nvim
    plenary-nvim

    # -- editor -- 
    telescope-nvim
    telescope-fzf-native-nvim

    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects
    nvim-treesitter-context
    rainbow-delimiters-nvim

    nvim-lspconfig
    lspkind-nvim
    lazydev-nvim

    # cmp

    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline

    luasnip
    cmp_luasnip

    conform-nvim

    auto-save-nvim
    nvim-autopairs
    auto-session
    toggleterm-nvim
    nvim-surround

    oil-nvim
    comment-nvim

    # -- ui --
    catppuccin-nvim
    nvim-web-devicons
    lualine-nvim
    tabby-nvim
    todo-comments-nvim

    # -- git --
    diffview-nvim
    gitsigns-nvim
    neogit

  ];

  extraPackages = with pkgs; [
    # Language servers
    lua-language-server
    nil
    clang-tools


    # Formater
    stylua
    rustfmt
    nixfmt-classic

    ripgrep
    fd
  ];
in {
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };
}
