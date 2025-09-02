
sudo pacman -Syu --noconfirm yay base base-devel protobuf unzip lld lcov direnv zoxide
sudo pacman -Syu --noconfirm postgresql-libs aws-cli typescript
sudo pacman -Syu --noconfirm fzf helm kubectl zsh cmake ccls jq yq musl neovim 
sudo pacman -Syu --noconfirm ripgrep htop curl wget git vim docker openssh bridge-utils pass avahi llvm
sudo pacman -Syu --noconfirm tmate clang linux-tools gnu-netcat tmate aarch64-linux-gnu-gcc brightnessctl
sudo pacman -Syu --noconfirm bat neomutt kitty aspell-uk aspell-en aspell-de yubikey-manager yubico-pam freerdp simple-scan docker-compose
sudo pacman -Syu --noconfirm vlc chromium ttf-font-awesome awesome-terminal-fonts otf-font-awesome adapta-gtk-theme 
sudo pacman -Syu --noconfirm papirus-icon-theme go dnsmasq openssh extra/noto-fonts extra/noto-fonts-emoji tmux terraform
sudo pacman -Syu --noconfirm fzf alacritty signal-desktop keepassxc syncthing obsidian

sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

# Rust Development
sudo pacman -S rustup --noconfirm
rustup toolchain add stable
rustup toolchain add nightly
for target in "wasm32-wasi" "wasm32-unknown-unknown" "x86_64-unknown-linux-musl" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl"; do
	rustup target add $target
done

rustup component add rls rust-analysis rust-src clippy
rustup component add llvm-tools-preview --toolchain nightly
rustup component add llvm-tools-preview

cargo install cargo-audit --features=fix
cargo install git-cliff
cargo install cargo2junit
cargo install cargo-make
cargo install grcov
cargo install sqlx-cli --no-default-features --features native-tls,postgres
cargo install cargo-nextest --version 0.9.39
cargo install cargo-about
cargo install cargo-license
cargo install cargo-watch
cargo install --locked trunk
cargo install --locked gitlab-report
# after cargo needs rust deps
sudo pacman -Syu --noconfirm rust-analyzer


curl https://pyenv.run | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh/ohmyzsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $HOME/.config/zsh/ohmyzsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git  $HOME/.config/zsh/ohmyzsh/plugins/fast-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git  $HOME/.config/zsh/ohmyzsh/plugins/zsh-autocomplete
