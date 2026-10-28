{ config, lib, ... }:
{
  options.modules.orbstack = {
    enable = lib.mkEnableOption "running as an OrbStack machine";

    caCertificate = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
        OrbStack's per-install development root CA, from
        `security.pki.certificates` in the machine's generated
        /etc/nixos/configuration.nix.
      '';
    };
  };

  config = lib.mkIf config.modules.orbstack.enable {
    assertions = [
      {
        assertion = config.boot.isContainer;
        message = "modules.orbstack needs the host to import \"\${modulesPath}/virtualisation/lxc-container.nix\".";
      }
    ];

    environment.shellInit = ''
      . /opt/orbstack-guest/etc/profile-early
      . /opt/orbstack-guest/etc/profile-late
    '';

    users.mutableUsers = false;
    security.sudo.wheelNeedsPassword = false;
    users.groups.orbstack.gid = 67278;
    users.users.csimms = {
      uid = 501;
      isNormalUser = false;
      isSystemUser = true;
      group = "users";
      createHome = true;
      home = "/home/csimms";
      homeMode = "700";
      extraGroups = [
        "orbstack"
        "audio"
      ];
      initialPassword = lib.mkForce null;
    };

    security.pki.certificates = lib.optional (
      config.modules.orbstack.caCertificate != null
    ) config.modules.orbstack.caCertificate;

    services.resolved.enable = false;
    networking = {
      dhcpcd.enable = false;
      useDHCP = false;
      useHostResolvConf = false;
      resolvconf.enable = false;
    };
    environment.etc."resolv.conf".source = "/opt/orbstack-guest/etc/resolv.conf";
    systemd.network = {
      enable = true;
      networks."50-eth0" = {
        matchConfig.Name = "eth0";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };

    services.openssh.enable = false;
    programs.ssh.extraConfig = ''
      Include /opt/orbstack-guest/etc/ssh_config
    '';

    systemd.services =
      lib.genAttrs
        [
          "systemd-oomd"
          "systemd-userdbd"
          "systemd-udevd"
          "systemd-timesyncd"
          "systemd-timedated"
          "systemd-portabled"
          "systemd-nspawn@"
          "systemd-machined"
          "systemd-localed"
          "systemd-logind"
          "systemd-journald@"
          "systemd-journald"
          "systemd-journal-remote"
          "systemd-journal-upload"
          "systemd-importd"
          "systemd-hostnamed"
          "systemd-homed"
          "systemd-networkd"
        ]
        (_: {
          serviceConfig.WatchdogSec = 0;
        });

    nix.settings.extra-platforms = [
      "x86_64-linux"
      "i686-linux"
    ];
  };
}
