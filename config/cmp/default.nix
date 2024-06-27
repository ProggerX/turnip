{ ... }: {
	programs.nixvim.plugins.cmp = {
		enable = true;
		autoEnableSources = true;
		settings = {
			sources = [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
			mapping = {
				"<M-CR>" = "cmp.mapping.confirm({ select = true })";
				"<C-Space>" = "cmp.mapping.complete()";
				"<Tab>" = "cmp.mapping(function(fallback)\n	if cmp.visible() then\n		cmp.select_next_item()\n	else\n		fallback()\n	end\n	end, {'i', 's'})\n";
				"<S-Tab>" = "cmp.mapping(function(fallback)\n	if cmp.visible() then\n		cmp.select_prev_item()\n	else\n		fallback()\n	end\n	end, {'i', 's'})\n";
			};
		};
	};
}
