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
  home.packages = [
    # CLI programs
    # pkgs.a2ps # Ascii pretty printer
    # pkgs.abcde # CD ripper
    # pkgs.asciinema # Record CLI
    # pkgs.checkexec # File change detection TODO: package it https://github.com/kurtbuilds/checkexec
    # pkgs.dasel # like awk for data formats such as CSV, JSON, etc
    # pkgs.ff # File finder like fd TODO: package it https://github.com/vishaltelangre/ff
    # pkgs.fzf # Fuzzy finder
    # pkgs.miller # like awk for data formats such as CSV, JSON, etc
    pkgs.parallel # Execute CLI jobs in parallel - also provided by pkg.moreutils
    # pkgs.perlPackages.vidir # CLI file renamer - also provided by pkg.moreutils
    # pkgs.screen # Terminal multiplexer
    # pkgs.tab # TODO: package it, Modern text processing like awk https://bitbucket.org/tkatchev/tab
    pkgs.any-nix-shell # Nix-shell intergation with any shell https://github.com/haslersn/any-nix-shell
    pkgs.atool # File archive frontend https://www.nongnu.org/atool
    pkgs.bashInteractive # bash
    pkgs.borgbackup # Backup solution https://borgbackup.readthedocs.io/en/stable/index.html
    pkgs.exa # ls replacement
    pkgs.fd # File finder
    pkgs.fzy # Fuzzy finder like fzf
    pkgs.gawk # awk
    pkgs.gnused # sed
    pkgs.htop # top replaceement showing system utilization
    pkgs.imagemagick # Image processing
    (lowPrio
      pkgs.moreutils) # additional unix tools, lowPrio because it provides a few programs that are also provided by other packages, like pkgs.parallel
    pkgs.nnn # CLI file manager https://github.com/jarun/nnn
    pkgs.nushell # Nu Shell
    pkgs.pastel # CLI color manager
    pkgs.ranger # CLI file manager
    pkgs.rclone # Sync files
    pkgs.ripgrep # grep
    pkgs.skim # Fuzzy finder like fzf
    pkgs.starship # Shell prompt https://starship.rs/
    pkgs.stow # Dotfile manager https://www.gnu.org/software/stow/
    pkgs.tmate # Pair promgramming remote shell using tmux https://tmate.io/
    pkgs.tmux # Terminal multiplexer
    pkgs.trash-cli # rm replacement with system trash support
    pkgs.up # pipes with instant live view
    pkgs.zoxide # Fast cd system

    ## Documents
    # pkgs.asciidoc-full-with-plugins # ASCIIDoc
    # pkgs.asciidoctor-with-extensions # ASCIIDoc
    # pkgs.fop # XML formatter
    pkgs.pandoc # Document generator http://pandoc.org/

    ## Security
    # pkgs.bandwhich  # Display current network utilization
    # pkgs.gnupg
    # pkgs.inlets # TODO: not yet packaged; remote port forwarding
    # pkgs.openssl # openssl CLI for setting up the HSM
    # pkgs.vegeta # HTTP load generator https://www.terraform.io/
    pkgs.age # modern encryption tool with small explicit keys https://age-encryption.org/
    pkgs.mosh # Remote shell like ssh that support disconnects
    pkgs.mtr # traceroute utility
    pkgs.netcat-gnu # TCP swiss army kife
    pkgs.nmap # port scanner
    pkgs.pwgen-secure # password generator
    pkgs.step-cli # simplified certificate manager CLI https://smallstep.com/cli/

    ## PIM
    # pkgs.khal # CLI calendar https://github.com/pimutils/khal
    pkgs.khard # CLI address book https://github.com/lucc/khard
    # pkgs.neomutt # CLI mail client https://github.com/neomutt/neomutt
    pkgs.notmuch # mail indexer
    # pkgs.notmuch-mutt # mail indexer
    # pkgs.urlview # extract urls from text
    # pkgs.msmtp # simple SMTP client
    pkgs.offlineimap # CLI IMAP client http://www.offlineimap.org/
    pkgs.vdirsyncer # CLI iCal and vCard syncer https://github.com/pimutils/vdirsyncer

    ## development tools
    # pkgs.adr-tools # Tool for working with ADR Recrords
    # pkgs.ant # Java build tool
    # pkgs.batik # Java SVG handling
    # pkgs.cargo-valgrind # Debugging and profiling tool
    # pkgs.diffstat # Diff histogram information
    # pkgs.difftastic # Diff tool that understands programming languages https://github.com/Wilfred/difftastic
    # pkgs.fossil # Fossil SCM
    # pkgs.httpie # HTTP CLi https://httpie.io/
    # pkgs.myrepos # TODO: not yet packaged
    # pkgs.neovim
    # pkgs.neovim-remote # Wrapper to open files in an existing neovim instance https://github.com/mhinz/neovim-remote
    # pkgs.valgrind # Debugging and profiling tool
    # pkgs.watchman # Generic file watcher and command executor https://github.com/facebook/watchman
    pkgs.cargo-generate # Generic file templating tool https://github.com/topics/cargo-generate
    pkgs.cargo-watch # Generic file watcher and command executor https://github.com/watchexec/cargo-watch
    pkgs.cht-sh # Cheat sheet CLI https://cht.sh/
    pkgs.curl # HTTP and more CLI https://curl.se/
    pkgs.curlie # Wrapper around curl, replacement for httpie https://github.com/rs/curlie
    pkgs.git # Git https://git-scm.com/
    pkgs.git-annex # Large file store for Git https://git-annex.branchable.com/
    pkgs.git-extras # Extended Git commands https://git-annex.branchable.com/
    pkgs.github-cli # Github CLI https://docs.github.com/en/github-cli
    pkgs.gitoxide # Gitoxide, Git replacement in Rust https://github.com/Byron/gitoxide
    pkgs.gnumake # Make https://www.gnu.org/software/make/manual/make.html#Quick-Reference
    pkgs.just # Simple make replacement https://just.systems/
    pkgs.quilt # Patch management
    pkgs.scc # Fast and accurate code counter https://github.com/boyter/scc
    pkgs.taplo-cli # TOML Toolkit https://github.com/tamasfe/taplo
    pkgs.tig # Git UI
    pkgs.universal-ctags # Maintained ctags implementation
    pkgs.watchexec # Generic file watcher and command executor https://github.com/watchexec/watchexec

    # Programming language specific
    # pkgs.cargo # managed via rustup
    # pkgs.lldb # high peformance debugger required by https://github.com/mfussenegger/nvim-dap # FIXME: currently broken, liblzma/xz dependency is missing
    # pkgs.python310Packages.pyls-black # managed via python-with-my-packages
    # pkgs.remarshal # Conversion tool between different structured file formats https://github.com/dbohdan/remarshal
    # pkgs.rust-analyzer # Rust language server https://rust-analyzer.github.io/ - now provided as part of rustup https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html#rust-analyzer-is-now-available-via-rustup
    # pkgs.rust-bindgen # managed via rustup
    # pkgs.rustc # managed via rustup
    # pkgs.rustfmt # managed via rustup
    # pkgs.terraform # Infrastructure as code https://www.terraform.io/
    # pkgs.terraform-ls # Terraform language server - disabled, because it's managed / automatically downloaded by vim
    # pkgs.xz # required by lldb?
    # pkgs.yamlfmt # YAML formatter https://github.com/google/yamlfmt TODO: add to nix
    pkgs.cargo-bloat # Rust find the bloat https://github.com/RazrFalcon/cargo-bloat
    pkgs.cargo-udeps # Rust fix unused dependency checker https://github.com/est31/cargo-udeps
    pkgs.delve # Go debugger https://github.com/go-delve/delve
    pkgs.deno # JS interpreter https://deno.land/
    pkgs.go # Go language https://golang.org/
    pkgs.go-tools # Go language tools
    pkgs.nixfmt # Nix language formatter
    pkgs.nixpkgs-fmt # Nix language formatter
    pkgs.nodejs # JS interpreter https://nodejs.org/en/
    pkgs.pyright # Python type checker
    pkgs.rustup # either use this or rustc, cargo etc ... run `rustup update stable` to initialize the currrent version
    pkgs.sccache # rust compiler caching tool https://github.com/mozilla/sccache
    pkgs.shfmt # Shell formatter https://github.com/patrickvane/shfmt
    pkgs.stylish-haskell # Haskell formatter
    pkgs.stylua # Lua formatter
    pkgs.yarn # Yarn JS package manager
    python-with-my-packages

    ## Kubernetes
    # pkgs.awscli2 # deactivated because of a broken dependency on MacOS, install manually https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    # pkgs.datree # kubernetes configuration verification https://datree.io/
    # pkgs.eksctl # AWS Kubernetes CLi https://eksctl.io/
    # pkgs.fluxcd # fluxcd CLI for interacting with the CD tool https://fluxcd.io
    # pkgs.kubernetes-helm # helm CLI https://helm.sh
    # pkgs.linkerd # simple service mesh for kubernetes https://linkerd.io/
    pkgs.jq # JSON CLI - fully replaceable by yq-go
    pkgs.k9s # interactive kubectl interface  https://k9scli.io/
    pkgs.krew # kubectl plugin manager - explore is a highly recommend plugin https://krew.sigs.k8s.io/plugins/
    pkgs.kubectl # kubernetes CLI https://kubectl.docs.kubernetes.io/
    pkgs.kubectx # Kubernetes context manager
    pkgs.sops # Kubernetes secret encryption https://github.com/mozilla/sops
    pkgs.yq-go # YAML and JSON CLI parser https://mikefarah.gitbook.io/yq/

    # # GUI programs
    # pkgs.alacritty
    # pkgs.audacity
    # pkgs.autokey
    # pkgs.calibre
    # pkgs.drawio
    # pkgs.flameshot # screenshot utility
    # pkgs.gimp
    # pkgs.gnucash
    # pkgs.gsimplecal
    # pkgs.gufw
    # pkgs.ibus
    # pkgs.ibus-engines.libpinyin
    # pkgs.neovide
    # pkgs.obs-studio
    # pkgs.okular
    # pkgs.pdftk
    # pkgs.picom
    # pkgs.pipewire
    # pkgs.pipewire-media-session
    # pkgs.redshift
    # pkgs.screenkey
    # pkgs.scribus
    # pkgs.seafile-client
    # pkgs.solaar
    # pkgs.tint2
    # pkgs.transmission-gtk
    # pkgs.ufw
    # pkgs.vault
    # pkgs.vlc
    # pkgs.xbindkeys
    # pkgs.xbindkeys-config
    # pkgs.xcolor # X11 color picker
    # pkgs.xournalpp
    # pkgs.xsel
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
