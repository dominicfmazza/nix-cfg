# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    allowed-users = [
      dominicfmazza
    ];
  };

  boot.loader.systemd-boot.enable = true;

  users.users = {
    dominicfmazza = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker"];
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
  };
  system.stateVersion = "23.11";
}
