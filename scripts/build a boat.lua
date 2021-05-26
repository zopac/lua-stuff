local TweenService = game:GetService('TweenService')

spawn(function()
    local debounce = false
    game:GetService('RunService').RenderStepped:Connect(function()
        if debounce == true then
            return
        end
        debounce = true
        
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        
        char.HumanoidRootPart.CFrame = CFrame.new(-55.7047195, -9.92602158, -274.044922, -0.999055862, 2.2645871e-08, 0.0434471555, 2.07044444e-08, 1, -4.51347049e-08, -0.0434471555, -4.41925856e-08, -0.999055862) + Vector3.new(0, 50, 0)
        wait(1)
        TweenService:Create(char.HumanoidRootPart, TweenInfo.new(30), {CFrame = CFrame.new(-62.3435783, 37.1261864, 9309.92871, 0.966365039, -8.40041281e-09, 0.257176876, 2.07044444e-08, 1, -4.51347049e-08, -0.257176876, 4.89412777e-08, 0.966365039)}):Play()
        wait(29)
        TweenService:Create(char.HumanoidRootPart, TweenInfo.new(2), {CFrame = CFrame.new(-56.427002, -360.430267, 9483.74902, -0.999547422, 4.76316799e-08, 0.0300814454, 4.78301097e-08, 1, 5.87685989e-09, -0.0300814454, 7.31299954e-09, -0.999547422)}):Play()
        wait(20)
        debounce = false
    end)
end)

game:GetService('RunService').RenderStepped:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end)
