```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
nix shell nixpkgs#git -c git clone https://github.com/connorsimms/nixos.git ~/nixos
cd ~/nixos && nix run .#<host> -- switch
```
