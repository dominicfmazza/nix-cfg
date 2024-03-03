{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.nvim
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "dominicfmazza";
    homeDirectory = "/home/dominicfmazza";
  };

  home.packages = with pkgs; [ 
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
