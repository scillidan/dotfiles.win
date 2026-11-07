-- zellij.lua: clear the cmd.exe startup banner on the first prompt inside
-- Zellij. Clink does not clear it when injected from cmd's AutoRun the way
-- cmd /k init.cmd does, so the Windows banner stays above the prompt.

local cleared = false

clink.onbeginedit(function()
    if cleared then
        return
    end
    cleared = true
    if os.getenv("ZELLIJ") then
        os.execute("cls")
    end
end)
