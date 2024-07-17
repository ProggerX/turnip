{
	description = "Turnip - lightweight and bloat-free Nixvim configuration";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
	};
	
	outputs = { ... }@inputs: {
		nixosModules.turnip = { ... }: {imports = [inputs.nixvim.nixosModules.nixvim ./config];};
		homeManagerModules.turnip = { ... }: {imports = [inputs.nixvim.homeManagerModules.nixvim ./config];};
	};
}
