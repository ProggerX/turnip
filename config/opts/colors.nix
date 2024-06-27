{ config, lib, ... }: {
	options = {
		turnip.colorscheme = lib.mkOption {
			type = lib.types.str;
			description = "colorscheme (string)";
			default = "base16";
			example = "gruvbox";
		};
	};
	config = let cfg = config.turnip; in {
		programs.nixvim.colorschemes.${cfg.colorscheme}.enable = true;
	};
}
