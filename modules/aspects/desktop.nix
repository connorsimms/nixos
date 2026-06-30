{ den, __findFile ? __findFile, ... }:
{
  den.aspects.desktop = {
    includes = [
      <linux/graphics>
      <linux/keyboard>
      <linux/ly>
      <linux/niri>
      <linux/nvidia>
      <linux/pipewire>
      <linux/containers>
      <linux/steam>
    ];

    provides.csimms.includes = [
      <linux/fuzzel>
      <linux/hyprpaper>
      <linux/niri>
      <linux/containers>
    ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        wget
        curl
        exfatprogs
      ];
    };
  };
}
