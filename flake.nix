{
  description = "Configuração do NixOS do Matheus com Flakes";

  inputs = {
    # Fonte do NixOS (Unstable, pois você usa stateVersion 25.11)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Usa o mesmo nixpkgs do sistema
    
    # Antigravity (Google AI IDE)
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # COSMIC Desktop
    # nixos-cosmic = {
    #   url = "github:lilyinstarlight/nixos-cosmic";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    # Quickshell
    quickshell.url = "github:outfoxxed/quickshell";

    # Astal
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #colorshell = {
    #  url = "path:./colorshell-temp";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    # colorshell = {
    #   url = "github:retrozinndev/colorshell/ryo";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      vars = import ./variables.nix;
    in
    {
      nixosConfigurations = {
        # O NOME AQUI DEVE SER O MESMO DO SEU HOSTNAME (nixos)
        "${vars.hostName}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            inherit vars; # Passa as variaveis para todos os modulos do sistema
          };
          modules = [
            # Importa seu arquivo de configuração antigo
            ./configuration.nix
  
            # Importa o módulo do Home Manager via Flake
            home-manager.nixosModules.home-manager
            
            # DMS nixosModule
            inputs.dms.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users."${vars.username}" = import ./home.nix;
              
              # Passa argumentos para o home.nix caso precise
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit vars; # Passa as variaveis para o Home Manager
              };
              home-manager.sharedModules = [
                inputs.caelestia-shell.homeManagerModules.default
              ];
            }
            
            # COSMIC Desktop
            # inputs.nixos-cosmic.nixosModules.default
          ];
        };
      };
    };
}