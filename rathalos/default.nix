{ lib, home-manager, user, nixpkgs, inputs, ... }:
let
  system = "x86_64";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  # Desktop
  rathalos = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./system
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [ ./home ];
        };
      }
    ];
  };
}
