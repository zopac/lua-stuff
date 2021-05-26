-- Generating, please wait... (click to reload)
-- (If this message persists, the remote args are likely extremely long)
while true do
local args = {
    [1] = {
        ["id"] = 253,
        ["position"] = 1
    },
    [2] = 11
}

game:GetService("ReplicatedStorage").modules.network.playerRequest_sellItemToShop:InvokeServer(unpack(args))
wait(0.4)
end