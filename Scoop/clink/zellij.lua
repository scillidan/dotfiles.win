-- zellij.lua: clarify the Zellij 0.46 tab name.
--
-- In 0.46 a tab without an explicit name is named after the shell's console
-- title, which cmd sets to the full "cmd.exe - ...zellij-autorun.cmd" string.
-- Overriding it with the cwd's leaf directory gives short, meaningful names
-- ("dotfiles", "Downloads"). Tabs renamed with Ctrl-g then t (rename-tab) keep
-- their own name; this only runs when the prompt first appears.

local cleared = false

local function set_title()
    local cwd = os.getcwd()
    if not cwd then
        return
    end
    local leaf = cwd:gsub("[/\\]+$", ""):match("([^/\\]+)$") or cwd
    os.execute('title "' .. leaf .. '"')
end

clink.onbeginedit(function()
    if cleared then
        return
    end
    cleared = true
    if os.getenv("ZELLIJ") then
        set_title()
        os.execute("cls")
    end
end)
