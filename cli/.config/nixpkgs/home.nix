# Configuration options: https://nix-community.github.io/home-manager/options.html
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jceb";
  home.homeDirectory = "/home/jceb";

  # Packages that should be installed to the user profile.
  home.packages = [
    # nix
    pkgs.nixfmt
    pkgs.nixpkgs-fmt

    # CLI programs
    pkgs.any-nix-shell
    pkgs.atool
    pkgs.bashInteractive
    pkgs.borgbackup
    pkgs.exa
    pkgs.fzf
    pkgs.fzy
    pkgs.gawk
    pkgs.gnused
    pkgs.htop
    pkgs.imagemagick
    pkgs.khal
    pkgs.khard
    pkgs.mosh
    pkgs.neomutt
    pkgs.nnn
    pkgs.offlineimap
    pkgs.pastel
    pkgs.perlPackages.vidir
    pkgs.python310Packages.pip
    pkgs.python3Full
    pkgs.starship
    pkgs.stow
    pkgs.tmate
    pkgs.tmux
    pkgs.trash-cli
    pkgs.vdirsyncer
    pkgs.watchman

    ## development tools
    # pkgs.python310Packages.pyls-black
    pkgs.black # python linter
    pkgs.curl
    pkgs.deno
    pkgs.git
    pkgs.git-annex
    pkgs.git-extras
    pkgs.gnumake
    pkgs.httpie
    # pkgs.neovim
    pkgs.cht-sh
    pkgs.neovim-remote
    pkgs.pandoc
    pkgs.python310Packages.pyflakes
    pkgs.remarshal
    pkgs.stylua
    pkgs.terraform-ls

    ## Kubernetes
    pkgs.jq
    pkgs.k9s
    pkgs.krew
    pkgs.kubectx
    pkgs.sops
    pkgs.yq

    # # GUI programs
    # pkgs.alacritty
    # pkgs.audacity
    # pkgs.autokey
    # pkgs.calibre
    # pkgs.drawio
    # pkgs.gimp
    # pkgs.gnucash
    # pkgs.gsimplecal
    # pkgs.gufw
    # pkgs.neovide
    # pkgs.obs-studio
    # pkgs.okular
    # pkgs.pdftk
    # pkgs.picom
    # pkgs.ranger
    # pkgs.redshift
    # pkgs.screenkey
    # pkgs.scribus
    # pkgs.solaar
    # pkgs.transmission-gtk
    # pkgs.ufw
    # pkgs.vault
    # pkgs.vlc
    # pkgs.xournalpp
    # pkgs.xsel
    # pkgs.pipewire
    # pkgs.pipewire-media-session
    # pkgs.xbindkeys
    # pkgs.xbindkeys-config
    # pkgs.ibus
    # pkgs.ibus-engines.libpinyin
    # pkgs.tint2
    # pkgs.seafile-client
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.fish.enable = true;

  # programs.alacritty.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.feh.enable = true;
  programs.feh.buttons = {
    prev_img = [ ];
    next_img = [ ];
    blur = [ ];
    zoom_in = [ "4" "C-4" ];
    zoom_out = [ "5" "C-5" ];
  };
  programs.feh.keybindings = {
    action_5 = [ "R" ];
    close = [ "x" "C-w" ];
    menu_child = [ "l" ];
    menu_down = [ "j" ];
    menu_parent = [ "h" ];
    menu_up = [ "k" ];
    next_img = [ "j" "n" ];
    prev_img = [ "k" "p" ];
    quit = [ "q" "Escape" "C-q" ];
    reload_minu = [ "s" ];
    reload_plu = [ "s" ];
    scroll_down = [ "J" ];
    scroll_left = [ "H" ];
    scroll_right = [ "L" ];
    scroll_up = [ "K" ];
    toggle_fullscreen = [ "v" "F11" ];
    toggle_info = [ "i" ];
    jump_rando = [ "m" ];
    toggle_keep_vp = [ "z" ];
    zoom_default = [ "0" ];
    zoom_fit = [ "equal" "slash" ];
    zoom_in = [ "plus" ];
    zoom_out = [ "minus" ];
  };
}
