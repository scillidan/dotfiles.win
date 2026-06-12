-- z_fzf_rg_no_header.lua (备选方案)

if not fzf_ripgrep then
	return
end

local original_fzf_ripgrep = fzf_ripgrep

function fzf_ripgrep(rl_buffer, line_state)
	local original_popen = io.popen

	io.popen = function(command, ...)
		local opts = os.getenv("FZF_DEFAULT_OPTS")
		if opts then
			opts = opts:gsub('%-%-header%s+"[^"]*"', '--header ""')
			opts = opts:gsub("%-%-header%-border%s+%S+", "")
			os.setenv("FZF_DEFAULT_OPTS", opts)
		end
		return original_popen(command, ...)
	end

	local ok, err = pcall(original_fzf_ripgrep, rl_buffer, line_state)
	io.popen = original_popen
	if not ok then
		error(err)
	end
end
