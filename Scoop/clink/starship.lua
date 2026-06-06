local user = os.getenv("USERHOME") or os.getenv("USERPROFILE")
os.setenv("STARSHIP_CONFIG", user .. "\\Share\\dotfiles\\.config\\starship.toml")
os.setenv("STARSHIP_CACHE", user .. "\\.cache\\starship")

function starship_transient_prompt_func(prompt)
	return io.popen("starship module character" .. " --keymap=" .. rl.getvariable("keymap")):read("*a")
end

load(io.popen("starship init cmd"):read("*a"))()
