# My NixOS Setup (+ Dotfiles)

## Requirements
Nix for NixOS
```bash
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
```
Nix for macOS & non-NixOS Linux
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Usage
### Deployment
Either clone and run locally, or run directly from github.
#### NixOS (sudo privileges)
```bash
git clone https://github.com/connorsimms/nixos
cd nixos
sudo nixos-rebuild switch --flake .#desktop
```
or
```bash
sudo nixos-rebuild switch --flake github:connorsimms/nixos#desktop
```
#### Nix-Darwin (sudo privileges)
```bash
git clone https://github.com/connorsimms/nixos
cd nixos
darwin-rebuild switch --flake .#macbook
```
or
```bash
darwin-rebuild switch --flake github:connorsimms/nixos#macbook
```
#### Home-Manager (non-sudo privileges)
```bash
git clone https://github.com/connorsimms/nixos
cd nixos
home-manager switch --flake .#csimms@server
```
or
```bash
home-manager switch --flake github:connorsimms/nixos#csimms@server
```
