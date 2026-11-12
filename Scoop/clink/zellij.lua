-- zellij.lua: per-prompt setup for cmd.exe inside Zellij.
--
-- Zellij 0.46 names a tab after its pane title, and cmd's default title is the
-- full "cmd.exe - ...zellij-autorun.cmd" string. console.settitle() is the global
-- table Clink exposes (not clink.console), and it takes the string verbatim, which
-- is why the `title` builtin's added quotes do not appear here.
--
-- The title is set on every prompt so the tab follows `cd`; the cmd banner is
-- cleared once.

local function set_title()
    if not (_G.console and console.settitle) then
        return
    end
    local cwd = os.getcwd()
    if not cwd then
        return
    end
    local leaf = cwd:gsub("[/\\]+$", ""):match("([^/\\]+)$") or cwd
    console.settitle(leaf)
end

local cleared = false

clink.onbeginedit(function()
    if not os.getenv("ZELLIJ") then
        return
    end
    set_title()
    if not cleared then
        cleared = true
        os.execute("cls")
    end
end)
