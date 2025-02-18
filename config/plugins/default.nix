{ pkgs, ... }: {
	programs.nixvim.plugins = {
		indent-blankline.enable = true;
		telescope.enable = true;
		flash.enable = true;
		persistence.enable = true;
		surround.enable = true;
		trouble.enable = true;
		trouble.settings.auto_close = true;
		emmet.enable = true;
		treesitter.enable = true;
		treesitter.settings = {
			ensure_installed = ["go"];
			auto_install = false;
		};
		oil.enable = true;
		tmux-navigator.enable = true;
		nvim-autopairs.enable = true;
		toggleterm.enable = true;
		lualine.enable = true;
		barbar.enable = true;
		comment.enable = true;
		lazygit.enable = true;
		codeium-nvim = {
			enable = true;
			extraOptions = {
				enable_chat = true;
			};
		};
		alpha.enable = true;
		alpha.layout = [
			{
				type = "text";
				opts = {
					hl = "AlphaHeader";
					position = "center";
				};
				val = [
					"  _______               _       "
					" |__   __|             (_)      "
					"    | |_   _ _ __ _ __  _ _ __  "
					"    | | | | | '__| '_ \\| | '_ \\ "
					"    | | |_| | |  | | | | | |_) |"
					"    |_|\\__,_|_|  |_| |_|_| .__/ "
					"                         | |    "
					"                         |_|    "
				];
			}
		];
	};
	programs.nixvim.extraPlugins = with pkgs; [
		{
			plugin = vimPlugins.aerial-nvim;
			config = "lua require('aerial').setup({on_attach = function(bufnr) vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})end})\n";
		}
		vimPlugins.vim-go
		vimPlugins.dressing-nvim
		{
			plugin = vimUtils.buildVimPlugin {
				name = "nerdy.nvim";
				src = fetchFromGitHub {
					owner = "2KAbhishek";
					repo = "nerdy.nvim";
					rev = "1ad36242f40a8fd95ae5711258540a07a5dabb51";
					sha256 = "sha256-xIWeN4/wY8Jzi7iEuJFkEUXmTVQ6OK+r/7XYDX/5NqM=";
				};
			};
		}
		{
			plugin = vimUtils.buildVimPlugin {
				name = "cmp-emmet-vim";
				src = fetchFromGitHub {
					owner = "dcampos";
					repo = "cmp-emmet-vim";
					rev = "0fb9a6eae7c1a56b7f460a80a09a402a57a7cc99";
					hash = "sha256-w37CmFNh33ACmWgYU2kM7MbuRdwi7URVquJgjRPE1gA=";
				};
			};
		}
	];
}
