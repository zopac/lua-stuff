local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/zopac/lua-stuff/main/luagui2.lua",true))()
local Table = {}
local window = Lib:CreateWindow("amogus gui")
window:Section("scripts")
window:Search(Color3.fromRGB(255,0,255) --[[nil = Yellow]]) -- Ez searcher for if you have a lot of things


window:Button("Admin",function()
    
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
window:Button("RoBeats AutoPlay",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/robeats.lua'))()
end)
window:Button("SkoopX",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/SkoopX_Updated.lua'))()
end)
window:Button("Bark",function()
   loadstring(game:HttpGetAsync'https://cdn.applebee1558.com/bark/bark.lua')('8.4 beta released :))')
end)
window:Button("LOTBS",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/legendofthebonesword.lua'))()
end)
window:Button("MrKix YBA",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/kixhub.lua'))()
end)
window:Button("Rem.cc YBA",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/remcc.lua'))()
end)
window:Button("YBA Gui",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/yba2.lua'))()
end)
window:Button("Vesteria Pear Sell",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/vesteriapearsell.lua.lua'))()
end)
window:Button("AOTLB Killaura",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/aotlbkillaura.lua'))()
end)
window:Button("Nullware",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/nullware.lua'))()
end)
window:Button("NetBypass",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/NetBypass.lua'))()
end)
window:Button("HellReaver Quake",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/hellreaver.lua'))()
end)
window:Button("Notoriety",function()
   loadstring(game:GetObjects("rbxassetid://4763830754")[1].Source)()
end)


window:Section("hubs")

window:Button("DivinityHub",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/zopac/lua-stuff/main/scripts/DivinityHub_Cracked.lua'))()
end)
window:Button("OwlHub",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua'))()
end)
window:Button("BruhHub",function()
   loadstring(game:HttpGet('https://bruh.keshhub.com/.lua'))()
end)


window:Section("misc")

window:Dropdown("Player List",{location = Table,flag = "list",search = true --[[AddsSearchBar]], list = {"1","2","3","4","5","6","7","8","9","0"} --[[Wont work when PlayerList = true]], PlayerList = true --[[ Turns the list into the players in the server ]]},function()
end)
window:Toggle("Toggle",{location = Table, flag = "Toggle"},function()
   print(Table["Toggle"])
end)
window:Slider("Slider",{location = Table, min = 1, max = 100, default = 50, precise = true --[[ 0.00 instead of 0 ]], flag = "Slider"},function()
   print(Table["Slider"])
end)
window:Dropdown("Dropdown",{location = Table,flag = "Dropdown",search = true --[[AddsSearchBar]], list = {"1","2","3","4","5","6","7","8","9","0"} --[[Wont work when PlayerList = true]], PlayerList = false --[[ Turns the list into the players in the server ]]},function()
   print(Table["Dropdown"])
end)
window:Bind("KeyBind",{location = Table, flag = "KeyBind", default = Enum.KeyCode.B},function() -- Automatically stops when the gui is removed
   print(Table["KeyBind"])
end)
window:Box("Box",{location = Table,flag = "Box", type = "number" --[[ Only Numbers automatically on false ]], hold = "Numbers" --[[ PlaceHolderText ]]},function()
   print(Table["Box"])
end)


window:String({string = "String"})
