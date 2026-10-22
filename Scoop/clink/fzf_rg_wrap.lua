-- Wrapper for clink-gizmos' fzf_rg.lua: standalone `clink lua` ignores
-- clink_settings, so fzf_rg.show_preview / fzf_rg.height are injected here
-- (override via FZF_RG_SHOW_PREVIEW / FZF_RG_HEIGHT env vars).  It also adds
-- the ENTER / ALT-ENTER / ALT-N key bindings used by the `fg` alias.
local home = os.getenv("USERHOME")
local real = os.getenv("FZF_RG_LUA")
if not real or real == "" then
	real = home..[[/Local/Source/clink/clink-gizmos/fzf_rg.lua]]
end

if arg and arg[1] == "--fromcmdline" then
	local real_get = settings.get
	local overrides = {
		["fzf_rg.show_preview"] = os.getenv("FZF_RG_SHOW_PREVIEW") or "bottom",
		["fzf_rg.height"] = os.getenv("FZF_RG_HEIGHT") or "99%",
	}
	settings.get = function(name, ...)
		local value = overrides[name]
		if value == nil or value == "" then
			value = real_get(name, ...)
		end
		return value
	end

	-- ENTER edits without closing fzf; ALT-ENTER edits and closes; ALT-N edits
	-- in Neovim.  ALT-ENTER is free here (wezterm.lua already uses SHIFT-ENTER
	-- for opencode, and CTRL-ENTER is not distinguishable from ENTER), and
	-- ALT-N is unbound in fzf.  trigger(alt-e) reuses the upstream edit action.
	local extra = table.concat({
		"--expect=alt-enter",
		[[--bind "enter:trigger(alt-e)"]],
		[[--bind "alt-enter:accept"]],
		[[--bind "alt-n:execute(nvim +{2} {1})"]],
	}, " ")
	local opts = os.getenv("FZF_RG_FZF_OPTIONS") or ""
	os.setenv("FZF_RG_FZF_OPTIONS", opts == "" and extra or (opts .. " " .. extra))
end

dofile(real)
