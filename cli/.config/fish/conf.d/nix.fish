if [ -n "$HOME" ]; and [ -n "$USER" ]

    # Set up the per-user profile.
    # This part should be kept in sync with nixpkgs:nixos/modules/programs/shell.nix

    set NIX_LINK $HOME/.nix-profile


    # Append ~/.nix-defexpr/channels to $NIX_PATH so that <nixpkgs>
    # paths work when the user has fetched the Nixpkgs channel.
    if [ -n "$NIX_PATH" ]
        export NIX_PATH="$NIX_PATH:$HOME/.nix-defexpr/channels"
    else
        export NIX_PATH="$HOME/.nix-defexpr/channels"
    end

    # Set up environment.
    # This part should be kept in sync with nixpkgs:nixos/modules/programs/environment.nix
    export NIX_PROFILES="/nix/var/nix/profiles/default $HOME/.nix-profile"

    # Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
    if [ -e /etc/ssl/certs/ca-certificates.crt ] # NixOS, Ubuntu, Debian, Gentoo, Arch
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
    else if [ -e /etc/ssl/ca-bundle.pem ] # openSUSE Tumbleweed
        export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
    else if [ -e /etc/ssl/certs/ca-bundle.crt ] # Old NixOS
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
    else if [ -e /etc/pki/tls/certs/ca-bundle.crt ] # Fedora, CentOS
        export NIX_SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
    else if [ -e "$NIX_LINK/etc/ssl/certs/ca-bundle.crt" ] # fall back to cacert in Nix profile
        export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
    else if [ -e "$NIX_LINK/etc/ca-bundle.crt" ] # old cacert in Nix profile
        export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ca-bundle.crt"
    end

    if [ -n "$MANPATH" ]
        export MANPATH="$NIX_LINK/share/man:$MANPATH"
    else
        export MANPATH="$NIX_LINK/share/man"
    end

    export PATH="$NIX_LINK/bin:$PATH"
    set -e NIX_LINK
end

any-nix-shell fish | source
