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

#### OrbStack NixOS machine (aarch64-linux)
OrbStack mounts the mac's home inside the machine, so the mac's checkout is
the one to build from — no second clone needed:
```bash
orb -m nixos sudo nixos-rebuild switch --flake /Users/csimms/nixos#orb
```
`hosts/orb.nix` replaces the machine's generated `/etc/nixos`; the parts of it
worth keeping live in `modules/system/linux/orbstack.nix`, and the per-install
CA certificate in `hosts/orb/orbstack-ca.pem`. A new OrbStack machine needs a
host file like `hosts/orb.nix` and its own certificate.

### Checking before you switch
```bash
nix flake check                # evaluates + builds the host for this system
nix flake check --all-systems  # evaluates the other hosts too
nix fmt                        # nixfmt-tree over the tree
```
`nix eval .#…drvPath` swallows evaluation errors and misreports them as a
missing attribute. To see a real trace:
```bash
nix eval --impure --show-trace \
  --expr 'let f = builtins.getFlake "/Users/csimms/nixos"; in f.nixosConfigurations.desktop.config.system.build.toplevel.drvPath'
```
When checking the linux host from the mac, `Required system: 'x86_64-linux'`
means evaluation **succeeded** and only a build remains. That is a pass.

## Layout

Three module trees, one option namespace (`modules.*`):

| Tree | Declares | Rule |
|---|---|---|
| `modules/system/` | NixOS + nix-darwin options | Machine-wide things: boot, hardware, fonts, package managers, privileged runtimes. |
| `modules/user/` | home-manager options | Everything belonging to a person: shell, editor, applications, language servers. |
| `modules/bridge/` | nothing | Reads `config.home-manager.users` and flips the system switch a user module needs. |

Platform subdirectories (`darwin/`, `linux/`) are imported separately by each
host, because the same option name is declared in both and the module system
rejects duplicate declarations. Do **not** try to import both and gate with
`mkIf`, and never branch `imports` on `pkgs` or `config` — `imports` is
evaluated before they exist, so it is infinite recursion.

### Conventions

- **Applications are chosen in `modules/user/gui/`**, on either platform. A
  macOS app that comes from Homebrew appends to `modules.darwin.casks`, which
  `modules/bridge/darwin/casks.nix` collects into `homebrew.casks` — so adding
  one is a single new file with nothing else to wire up. Platform-specific
  modules assert their platform rather than failing silently elsewhere.
- A leaf's option is `modules.<leafname>.enable`, unless its category has an
  aggregate switch (`cli`, `lsp`), in which case it is
  `modules.<category>.<leafname>.enable` defaulting to the aggregate.
- A leaf that needs a sibling sets it with `lib.mkDefault` inside `config`.
- Dotfiles are referenced as `inputs.self + "/dotfiles/..."` and attached with
  `xdg.configFile."<path>".source` (`recursive = true` for directories).
- `modules.docs` installs man pages at the system level, on every host. On
  macOS the viewer stays Apple's `/usr/bin/man`: man-db cannot find the
  syscall and libc pages in the Command Line Tools SDK (`man 2 open`).
- Every language server enabled in `dotfiles/nvim/lua/lsp.lua` needs a matching
  module in `modules/user/lsp/` to put its binary on `PATH`. Without one it
  fails to attach silently and the `LspAttach` keymaps — including `K` — never
  get set for that filetype.

### Gotchas worth remembering

- `homebrew.onActivation.cleanup` removes casks that are not declared here.
  It is set to `"uninstall"`; `"zap"` additionally deletes an app's support
  files, which will destroy anything installed outside nix.
- home-manager rsyncs macOS app bundles into `~/Applications/Home Manager Apps`
  with `--delete`, so anything written inside a bundle is wiped on activation.
  Browser policies go through the app's `defaults` domain instead.
