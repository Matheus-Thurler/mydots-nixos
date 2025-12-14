{
  description = "Configuração do NixOS do Matheus com Flakes";

  inputs = {
    # Fonte do NixOS (Unstable, pois você usa stateVersion 25.11)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Usa o mesmo nixpkgs do sistema
    
    # Quickshell
    quickshell.url = "github:outfoxxed/quickshell";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # O NOME AQUI DEVE SER O MESMO DO SEU HOSTNAME (nixos)
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Passa os inputs para dentro dos módulos
        modules = [
          # Importa seu arquivo de configuração antigo
          ./configuration.nix

          # Importa o módulo do Home Manager via Flake
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.matheus = import ./home.nix;
            
            # Passa argumentos para o home.nix caso precise
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}