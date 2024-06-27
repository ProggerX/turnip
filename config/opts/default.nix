{ config, lib, ... }: {
	imports = [
		./colors.nix
	];
	options = {
		turnip.options = {
			wrap = lib.mkOption {
				description = "Allow wrapping";
				default = false;
				example = false;
				type = lib.types.bool;
			};
			relativenumber = lib.mkOption {
				description = "Set relativenumber";
				default = true;
				example = false;
				type = lib.types.bool;
			};
		};
	};
	config = let cfg = config.turnip.options; in {
		programs.nixvim = {
			globals.mapleader = " ";
			opts = {
				showmode = false;
				wrap = cfg.wrap;
				conceallevel = 2;
				number = true;
				relativenumber = cfg.relativenumber;
				shiftwidth = 4;
				tabstop = 4;
				smartindent = true;
			};
			clipboard.register = "unnamedplus";
		};
	};
}
