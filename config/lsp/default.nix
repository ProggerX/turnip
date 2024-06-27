{ config, lib, ... }: {
	options = {
		turnip.lsp_servers = lib.mkOption {
			default = {
				rust-analyzer = {
					installCargo = false;
					installRustc = false;
					enable = true;
				};
				clangd.enable = true;
				nixd.enable = true;
				pyright.enable = true;
				gopls.enable = true;
			};
			description = "Lsp servers";
		};
	};

	config = let cfg = config.turnip; in {
		programs.nixvim.plugins.lsp = {
			enable = true;
			servers = cfg.lsp_servers;
		};
	};
}
