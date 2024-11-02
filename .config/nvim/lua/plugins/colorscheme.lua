return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		init = function()
			local xxx = 2
			vim.cmd.colorscheme("solarized-osaka")
			--vim.cmd.colorscheme 'solarized-osaka-day'
			--vim.cmd.colorscheme 'solarized-osaka-moon'
			--vim.cmd.colorscheme 'solarized-osaka-night'
			--vim.cmd.colorscheme 'solarized-osaka-storm'
			--
		end,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
}
