{ ... }: {
	programs.nixvim.plugins.cmp = {
		enable = true;
		autoEnableSources = true;
		settings = {
			window = {
				__raw = ''{
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},'';
			};
			sources = [ { name = "emmet_vim"; } { name = "codeium"; } { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; }];
			mapping = {
				"<M-CR>" = "cmp.mapping.confirm({ select = true })";
				"<C-Space>" = "cmp.mapping.complete()";
				"<Tab>" = "cmp.mapping(function(fallback)\n	if cmp.visible() then\n		cmp.select_next_item()\n	else\n		fallback()\n	end\n	end, {'i', 's'})\n";
				"<S-Tab>" = "cmp.mapping(function(fallback)\n	if cmp.visible() then\n		cmp.select_prev_item()\n	else\n		fallback()\n	end\n	end, {'i', 's'})\n";
			};
		};
	};
}
