local aot = library:CreateSection("AOT");
aot:Label ("Scripts")
aot:Button("Nape Hitboxes", function()
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Loading..", Text = "Nape Expander"})
wait(3)
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Nape Expander", Text = "created by zopac"})

_G.Color =Color3.fromRGB(255,255,255)
_G.NapeSize = 80
_G.Trans = 0.7

while true do
    wait(2)

for i,v in pairs(game:GetService('Workspace').Titans:GetDescendants()) do 
    if v.Name == ("Nape") then

v.CanCollide = false
v.Anchored = false
v.Transparency = _G.Trans
v.Material = "Neon"
v.Color = _G.Color
v.Size = Vector3.new(_G.NapeSize,_G.NapeSize,_G.NapeSize)
end
end
end
end)

--end 
aot:Label("Hitbox Settings")

aot:ColorPicker("Hitbox Color",Color3.fromRGB(255,255,255),function(color2)
    while true do
    wait(1)
    _G.Color = (color2)
    end
end)


aot:Label("Default Hitbox Size Already Set at 80")
aot:Slider("HitBox Size",{min = 0, max = 1000, precise = true}, function(slidervalue)
     _G.NapeSize = (slidervalue)
end)

aot:Slider("Hitbox Opactiy", {min = 0.1, max = 1, precise = true}, function (slidervalue1)
    _G.Trans = (slidervalue1)
end)