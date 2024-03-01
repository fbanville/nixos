{
  description = "Waf nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url   = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
#    sops-nix.url = "github:Mic92/sops-nix";
#    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  #outputs = { self, nixpkgs, nixos-hardware, disko, home-manager, sops-nix, }: {
  outputs = { self, nixpkgs, nixos-hardware, disko, home-manager, }: {
    nixosConfigurations = {
      satori = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          nixos-hardware.nixosModules.framework-11th-gen-intel
          #sops-nix.nixosModules.sops
          ./hosts/satori/configuration.nix
          ./config/base.nix
          ./users/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.users.fba = import ./users/fba.nix;
          }
#          ./users/sops.nix
          ./config/gnome.nix
          ./config/fonts.nix
          ./config/print.nix
          ./config/sound.nix
          ./config/rust-cli.nix
          ./config/apps.nix
          ./config/misc.nix
          #./config/virt.nix
        ];
      };
      zen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          nixos-hardware.nixosModules.framework-11th-gen-intel
#          sops-nix.nixosModules.sops
          ./hosts/zen/configuration.nix
          ./config/base.nix
          ./users/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.users.fba = import ./users/fba.nix;
          }
          ./config/gnome.nix
          ./config/fonts.nix
          ./config/print.nix
          ./config/sound.nixframework-11th-gen-intel
          ./config/rust-cli.nix
          ./config/apps.nix
          ./config/misc.nix
          #./config/virt.nix
        ];
      };
      yoga = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          nixos-hardware.nixosModules.lenovo-yoga-6-13ALC6
#          sops-nix.nixosModules.sops
          ./hosts/yoga/configuration.nix
          ./config/base.nix
          ./users/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.users.fba = import ./users/fba.nix;
          }
          ./config/gnome.nix
          ./config/fonts.nix
          ./config/print.nix
          ./config/sound.nix
          ./config/rust-cli.nix
          ./config/apps.nix
          ./config/misc.nix
          #./config/virt.nix
        ];
      };
    };
  };
}

