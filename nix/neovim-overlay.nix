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
    # TODO: order this
    telescope-nvim
    telescope-fzf-native-nvim

    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects
    nvim-treesitter-context
    rainbow-delimiters-nvim

    nvim-lspconfig
    lazydev-nvim
    trouble-nvim

    # cmp
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-emoji
    (mkNvimPlugin inputs.cmp-nerdfont "cmp-nerdfont")
    (mkNvimPlugin inputs.nvim-cmp-font "nvim-cmp-font")

    luasnip
    cmp_luasnip

    flash-nvim

    conform-nvim

    auto-save-nvim
    nvim-autopairs
    auto-session
    toggleterm-nvim
    nvim-surround

    harpoon

    oil-nvim
    todo-comments-nvim
    comment-nvim
    twilight-nvim
    zen-mode-nvim

    # -- ui --
    catppuccin-nvim
    nvim-web-devicons
    lualine-nvim
    tabby-nvim
    fidget-nvim
    nvim-notify
    dashboard-nvim
    statuscol-nvim
    neo-tree-nvim
    dressing-nvim
    nui-nvim

    # -- git --
    diffview-nvim
    gitsigns-nvim
    neogit

    # -- Notes --
    neorg
    neorg-telescope
    (mkNvimPlugin inputs.neorg-interim-ls "neorg-interim-ls")
    (mkNvimPlugin inputs.neorg-templates "neorg-templates")

    # -- IA -- 
    avante-nvim

  ];

  extraPackages = with pkgs; [
    # Language servers
    lua-language-server
    nil
    clang-tools


    # Formater
    stylua
    rustfmt
    rustc
    cargo
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
