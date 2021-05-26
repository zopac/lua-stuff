_G.Farm = true

while _G.Farm and wait() do
   for i,v in pairs(game:GetService("Workspace")["Touch"]:GetDescendants()) do
       if string.match(v.name, "Coin") then
           v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
           wait()
       end
   end
end