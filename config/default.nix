{ config, lib, ... }: {
	options = {
		turnip = {
			enable = lib.mkEnableOption "Enable turnip";
			vimAlias = lib.mkOption {
				type = lib.types.bool;
				default = true;
				example = true;
				description = "Enable vim alias to turnip";
			};
			custom = lib.mkOption {
				default = {};
				description = "turnip.custom is literally programs.nixvim so you can set custom options";
			};
		};
	};
	config = let cfg = config.turnip; in lib.mkIf cfg.enable {
		programs.nixvim = lib.mkMerge [cfg.custom {
			enable = true;
			vimAlias = cfg.vimAlias;
			extraConfigLua = ''
if vim.g.neovide then
		vim.o.guifont = "JetBrainsMono Nerd Font:h17";
end
'';
		}];
	};
	imports = [
		./opts
		./keymaps
		./plugins
		./lsp
		./cmp
	];
}
