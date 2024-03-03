{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  users.users = {
    dominicfmazza = {
      openssh.authorizedKeys.keys = [
	      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUTnMjW7jO8v4nyw5XtEioOz7IuthBODYYA8V44u/12 dominicfmazza"
      ];
    };
  };
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  networking.hostName = "servotron";

}
