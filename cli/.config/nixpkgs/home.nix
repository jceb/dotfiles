# Configuration options: https://nix-community.github.io/home-manager/options.html
{ config, pkgs, ... }:

with pkgs;
let
  # Python installatino example from https://nixos.wiki/wiki/Python
  my-python-packages = python-packages:
    with python-packages; [
      # pip
      black # Python linter
      lxml # XML module reqiured for sync-bookmarks
      pyflakes # Pythong linter
      pyyaml # YAML module
      setuptools
      toml # TOML language module
      virtualenv
      yamllint # YAML linter
      pynvim # Python neovim client
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jceb";
  home.homeDirectory = "/home/jceb";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # CLI basics

    # a2ps # Ascii pretty printer
    # abcde # CD ripper
    # asciinema # Record CLI
    # checkexec # File change detection TODO: package it https://github.com/kurtbuilds/checkexec
    # dasel # like awk for data formats such as CSV, JSON, etc
    # ff # File finder like fd TODO: package it https://github.com/vishaltelangre/ff
    # fzf # Fuzzy finder
    # miller # like awk for data formats such as CSV, JSON, etc
    # ov # File pager https://github.com/noborus/ov
    # perlPackages.vidir # CLI file renamer - also provided by pkg.moreutils
    # screen # Terminal multiplexer
    # tab # TODO: package it, Modern text processing like awk https://bitbucket.org/tkatchev/tab
    (lowPrio
      moreutils) # additional unix tools, lowPrio because it provides a few programs that are also provided by other packages, like parallel
    any-nix-shell # Nix-shell intergation with any shell https://github.com/haslersn/any-nix-shell
    atool # File archive frontend https://www.nongnu.org/atool
    bashInteractive # bash
    borgbackup # Backup solution https://borgbackup.readthedocs.io/en/stable/index.html
    exa # ls replacement
    fd # File finder
    fzy # Fuzzy finder like fzf
    gawk # awk
    gnused # sed
    htop # top replaceement showing system utilization
    imagemagick # Image processing
    lsof # List open files
    neofetch # neofetch https://github.com/dylanaraps/neofetch
    nnn # CLI file manager https://github.com/jarun/nnn
    nushell # Nu Shell https://www.nushell.sh/
    parallel # Execute CLI jobs in parallel - also provided by pkg.moreutils
    pastel # CLI color manager
    ranger # CLI file manager
    rclone # Sync files https://rclone.org/
    ripgrep # grep
    skim # Fuzzy finder like fzf
    starship # Shell prompt https://starship.rs/
    stow # Dotfile manager https://www.gnu.org/software/stow/
    syncthing # File syncing https://syncthing.net/
    tmate # Pair promgramming remote shell using tmux https://tmate.io/
    tmux # Terminal multiplexer
    trash-cli # rm replacement with system trash support
    up # pipes with instant live view
    vivid # LS_COLORS support https://github.com/sharkdp/vivid
    zoxide # Fast cd system

    # system tools
    parted # system partitioning
    # etckeeper # doesn't exist yet
    nixos-rebuild # NixOS configuration  maangement https://nixos.wiki/wiki/Nixos-rebuild

    ## Documents
    # asciidoc-full-with-plugins # ASCIIDoc
    # asciidoctor-with-extensions # ASCIIDoc
    # fop # XML formatter
    pandoc # Document generator http://pandoc.org/
    # d2 # Diagramming tool https://github.com/terrastruct/d2

    # Networking tools
    # bandwhich  # Display current network utilization
    curl # HTTP and more CLI https://curl.se/
    curlie # Wrapper around curl, replacement for httpie https://github.com/rs/curlie
    mtr # traceroute utility
    netcat-gnu # TCP swiss army kife
    nethogs # net top tool https://github.com/raboof/nethogs

    ## Security
    # gnupg
    # inlets # TODO: not yet packaged; remote port forwarding
    # openssl # openssl CLI for setting up the HSM
    # pwgen-secure # password generator in python
    # vegeta # HTTP load generator https://www.terraform.io/
    age # modern encryption tool with small explicit keys https://age-encryption.org/
    mosh # Remote shell like ssh that support disconnects
    nmap # port scanner
    pwgen # password generator
    step-cli # simplified certificate manager CLI https://smallstep.com/cli/

    ## PIM
    # khal # CLI calendar https://github.com/pimutils/khal
    # msmtp # simple SMTP client
    # neomutt # CLI mail client https://github.com/neomutt/neomutt
    # notmuch-mutt # mail indexer
    # urlview # extract urls from text
    khard # CLI address book https://github.com/lucc/khard
    notmuch # mail indexer
    offlineimap # CLI IMAP client http://www.offlineimap.org/
    vdirsyncer # CLI iCal and vCard syncer https://github.com/pimutils/vdirsyncer

    ## development tools
    # adr-tools # Tool for working with ADR Recrords
    # ant # Java build tool
    # batik # Java SVG handling
    # cargo-valgrind # Debugging and profiling tool
    # diffstat # Diff histogram information
    # difftastic # Diff tool that understands programming languages https://github.com/Wilfred/difftastic
    # fossil # Fossil SCM
    # httpie # HTTP CLi https://httpie.io/
    # myrepos # TODO: not yet packaged
    # neovim
    # valgrind # Debugging and profiling tool
    # watchman # Generic file watcher and command executor https://github.com/facebook/watchman
    # cargo-generate # Generic file templating tool https://github.com/topics/cargo-generate
    cargo-watch # Generic file watcher and command executor https://github.com/watchexec/cargo-watch
    cht-sh # Cheat sheet CLI https://cht.sh/
    gh # GitHub CLI https://cli.github.com/
    git # Git https://git-scm.com/
    git-annex # Large file store for Git https://git-annex.branchable.com/
    git-bug # Git bug https://github.com/MichaelMure/git-bug
    git-extras # Extended Git commands https://git-annex.branchable.com/
    git-cliff # Changelog generator https://github.com/orhun/git-cliff
    github-cli # Github CLI https://docs.github.com/en/github-cli
    gitoxide # Gitoxide, Git replacement in Rust https://github.com/Byron/gitoxide
    gnumake # Make https://www.gnu.org/software/make/manual/make.html#Quick-Reference
    just # Simple make replacement https://just.systems/
    neovim-remote # Wrapper to open files in an existing neovim instance https://github.com/mhinz/neovim-remote
    quilt # Patch management
    scc # Fast and accurate code counter https://github.com/boyter/scc
    tokei # Count your code, quickly https://github.com/XAMPPRocky/tokei
    taplo-cli # TOML Toolkit https://github.com/tamasfe/taplo
    tig # Git UI
    universal-ctags # Maintained ctags implementation
    watchexec # Generic file watcher and command executor https://github.com/watchexec/watchexec

    # Programming language specific
    # cargo # managed via rustup
    # golint # Go language linter, deprecated; replaced by go vet ./... and staticcheck ./... (https://staticcheck.io/docs/getting-started/)
    # lldb # high peformance debugger required by https://github.com/mfussenegger/nvim-dap # FIXME: currently broken, liblzma/xz dependency is missing
    # python310Packages.pyls-black # managed via python-with-my-packages
    # remarshal # Conversion tool between different structured file formats https://github.com/dbohdan/remarshal
    # rust-analyzer # Rust language server https://rust-analyzer.github.io/ - now provided as part of rustup https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html#rust-analyzer-is-now-available-via-rustup
    # rust-bindgen # managed via rustup
    # rustc # managed via rustup
    # rustfmt # managed via rustup
    # terraform # Infrastructure as code https://www.terraform.io/
    # terraform-ls # Terraform language server - disabled, because it's managed / automatically downloaded by vim
    # xz # required by lldb?
    # yamlfmt # YAML formatter https://github.com/google/yamlfmt TODO: add to nix
    cargo-bloat # Rust find the bloat https://github.com/RazrFalcon/cargo-bloat
    cargo-udeps # Rust fix unused dependency checker https://github.com/est31/cargo-udeps
    delve # Go debugger https://github.com/go-delve/delve
    deno # JS interpreter https://deno.land/
    go # Go language https://golang.org/
    go-tools # Go language tools
    nixfmt # Nix language formatter
    nixpkgs-fmt # Nix language formatter
    nodejs # JS interpreter https://nodejs.org/en/
    pyright # Python type checker
    python-with-my-packages
    rustup # either use this or rustc, cargo etc ... run `rustup update stable` to initialize the currrent version
    sccache # rust compiler caching tool https://github.com/mozilla/sccache
    shellcheck # Bash script linter
    shfmt # Shell formatter https://github.com/patrickvane/shfmt
    stylish-haskell # Haskell formatter
    stylua # Lua formatter
    yarn # Yarn JS package manager

    ## Kubernetes
    # awscli2 # deactivated because of a broken dependency on MacOS, install manually https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    # datree # kubernetes configuration verification https://datree.io/
    # eksctl # AWS Kubernetes CLi https://eksctl.io/
    # fluxcd # fluxcd CLI for interacting with the CD tool https://fluxcd.io
    # kubernetes-helm # helm CLI https://helm.sh
    # linkerd # simple service mesh for kubernetes https://linkerd.io/
    jq # JSON CLI - fully replaceable by yq-go
    k9s # interactive kubectl interface  https://k9scli.io/
    krew # kubectl plugin manager - explore is a highly recommend plugin https://krew.sigs.k8s.io/plugins/
    kubectl # kubernetes CLI https://kubectl.docs.kubernetes.io/
    kubectx # Kubernetes context manager
    skopeo # Interaction with image registries https://github.com/containers/skopeo
    sops # Kubernetes secret encryption https://github.com/mozilla/sops
    skaffold # Image build tool https://skaffold.dev/docs/
    yq-go # YAML and JSON CLI parser https://mikefarah.gitbook.io/yq/

    # # GUI programs
    # alacritty
    # audacity
    # autokey
    # calibre
    # drawio
    # flameshot # screenshot utility
    # gimp
    # gnucash
    # gsimplecal
    # gufw
    # ibus
    # ibus-engines.libpinyin
    # neovide
    # obs-studio
    # okular
    # pdftk
    # picom
    # pipewire
    # pipewire-media-session
    # redshift
    # screenkey
    # scribus
    # seafile-client
    # solaar
    # tint2
    # transmission-gtk
    # ufw
    # vault
    # vlc
    # xbindkeys
    # xbindkeys-config
    # xcolor # X11 color picker
    # xournalpp
    # xsel
    # standardnotes # notebook https://standardnotes.com/
    # insomnia # GUI rest client https://insomnia.rest/
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # See https://nix-community.github.io/home-manager/index.html
  home.stateVersion = "22.11";
  # home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.fish.enable = true;

  # programs.alacritty.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.feh.enable = true;
  # programs.feh.buttons = {
  #   prev_img = [ ];
  #   next_img = [ ];
  #   blur = [ ];
  #   zoom_in = [ "4" "C-4" ];
  #   zoom_out = [ "5" "C-5" ];
  # };
  # programs.feh.keybindings = {
  #   action_5 = [ "R" ];
  #   close = [ "x" "C-w" ];
  #   menu_child = [ "l" ];
  #   menu_down = [ "j" ];
  #   menu_parent = [ "h" ];
  #   menu_up = [ "k" ];
  #   next_img = [ "j" "n" ];
  #   prev_img = [ "k" "p" ];
  #   quit = [ "q" "Escape" "C-q" ];
  #   reload_minu = [ "s" ];
  #   reload_plu = [ "s" ];
  #   scroll_down = [ "J" ];
  #   scroll_left = [ "H" ];
  #   scroll_right = [ "L" ];
  #   scroll_up = [ "K" ];
  #   toggle_fullscreen = [ "v" "F11" ];
  #   toggle_info = [ "i" ];
  #   jump_rando = [ "m" ];
  #   toggle_keep_vp = [ "z" ];
  #   zoom_default = [ "0" ];
  #   zoom_fit = [ "equal" "slash" ];
  #   zoom_in = [ "plus" ];
  #   zoom_out = [ "minus" ];
  # };
}
