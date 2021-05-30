local loader = {}

loader.Games = {
	["Your Bizarre Adventure"] = {
		["Id"] = 2809202155,
		["Loadstring"] = "https://raw.githubusercontent.com/zopac/lua-stuff/main/joemama.lua",
		["Extra_Args"] = {
		}
	}
}

function loader.ValidGame(id)
	local found = {false, nil}
	for i,v in pairs(loader.Games) do
		if string.match(id, v.Id) then
			found = {true, {i,v}}
		end	
	end
	return found;
end

function loader.GetGame()
	return loader.ValidGame(game.PlaceId)
end

function loader.Instance(inst,props)
	local newInst = Instance.new(inst)
	for i,v in pairs(props) do
		newInst[i] = v;
	end
	return newInst
end

function loader.Tween(asset, dt, info)
	game:GetService("TweenService"):Create(asset, TweenInfo.new(dt), info):Play();
end

function loader.Typewrite(text,textBox)
	for i = 1,#text do
		textBox.Text = string.sub(text, 0, i)
		wait(0.05)
	end
end

function loader.zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end

function loader.Init()
	local isValid = loader.GetGame()

	local MenuBlur = loader.Instance("BlurEffect", {
		["Name"] = "MenuBlur",
		["Parent"] = game.Lighting,
		["Size"] = 0
	})

	loader.Tween(MenuBlur, 2, {Size = 56})

	--UI
	local Launcher = loader.Instance("ScreenGui", {
		["Parent"] = game.Players.LocalPlayer.PlayerGui,
		["Name"] = "Launcher",
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	})

	local Cover = loader.Instance("Frame", {
		["Name"] = "Cover",
		["Parent"] = Launcher,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(1, 0, 0, 0)
	})

	local Circle = loader.Instance("Frame", {
		["Parent"] = Cover,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(70, 70, 70),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 150, 0, 150)
	})

	local UICorner = loader.Instance("UICorner", {
		["CornerRadius"] = UDim.new(0, 300),
		["Parent"] = Circle
	})

	local XE = loader.Instance("ImageLabel", {
		["Name"] = "XE",
		["Parent"] = Circle,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Image"] = "http://www.roblox.com/asset/?id=6698597116"
	})

	local LoaderMenu = loader.Instance("Frame", {
		["Name"] = "LoaderMenu",
		["Parent"] = Launcher,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(70, 70, 70),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Visible"] = false
	})

	local UICorner_2 = loader.Instance("UICorner", {
		["CornerRadius"] = UDim.new(0, 12),
		["Parent"] = LoaderMenu
	})

	local GM = loader.Instance("TextLabel", {
		["Name"] = "Game",
		["Parent"] = LoaderMenu,
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1.000,
		["Position"] = UDim2.new(0, 0, 0.0614035092, 0),
		["Size"] = UDim2.new(1, 0, 0.285714298, 0),
		["Font"] = Enum.Font.SourceSans,
		["Text"] = "",
		["TextColor3"] = Color3.fromRGB(180, 180, 180),
		["TextScaled"] = true,
		["TextSize"] = 14.000,
		["TextWrapped"] = true
	})

	local Button = loader.Instance("TextButton", {
		["Name"] = "Button",
		["Parent"] = LoaderMenu,
		["BackgroundColor3"] = Color3.fromRGB(180, 180, 180),
		["BorderColor3"] = Color3.fromRGB(27, 42, 53),
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(0.0508474559, 0, 0.409237623, 0),
		["Size"] = UDim2.new(0.898305058, 0, 0.46938777, 0),
		["Font"] = Enum.Font.SourceSans,
		["Text"] = "",
		["TextColor3"] = Color3.fromRGB(241, 241, 241),
		["TextSize"] = 45.000,
		["TextWrapped"] = true,
		["AutoButtonColor"] = false
	})

	local UICorner_3 = loader.Instance("UICorner", {
		["CornerRadius"] = UDim.new(0, 6),
		["Parent"] = Button
	})
	
	--[[
	local Stroke = loader.Instance("UIStroke", {
		["Thickness"] = 2,
		["Color"] = Color3.fromRGB(255,255,255),
		["Parent"] = LoaderMenu
	})--]]
	
	local RGB = loader.Instance("Frame", {
		["Name"] = "RGB",
		["Parent"] = Launcher,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(70, 70, 70),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Visible"] = false,
		["ZIndex"] = 0
	})
	
	local UICorner_4 = loader.Instance("UICorner", {
		["Parent"] = RGB,
		["CornerRadius"] = UDim.new(0, 14)
	})
	
	--Preload
	wait(1)
	---------

	loader.Tween(Cover, 6, {Size = UDim2.new(1,0,1,0)})
	wait(1.25)
	loader.Tween(XE, 0.5, {Size = UDim2.new(1,0,1,0)})
	wait(4)
	loader.Tween(XE, 0.5, {Size = UDim2.new(0,0,0,0)})
	wait(0.5)
	loader.Tween(Cover, 1, {Size = UDim2.new(1,0,0,0)})
	wait(1.25)
	LoaderMenu.Visible = true
	RGB.Visible = true
	loader.Tween(LoaderMenu, 1, {Size = UDim2.new(0.139, 0, 0.092, 0)})
	loader.Tween(RGB, 1, {Size = UDim2.new(0.142, 0, 0.096, 0)})

	local counter, rainbow = 0, nil

	rainbow = game:GetService("RunService").RenderStepped:Connect(function()
		RGB.BackgroundColor3 = Color3.fromHSV(loader.zigzag(counter),1,1)
		counter += 0.005
	end)

	wait(1)

	if isValid[1] then
		loader.Typewrite(isValid[2][1], GM)
		loader.Typewrite("Load", Button)
		local cp = true
		Button.MouseButton1Click:Connect(function()
			if cp then
				cp = false
				Button.Text = ""
				GM.Text = ""
				loader.Tween(LoaderMenu, 1, {Size = UDim2.new(0, 0, 0, 0)})
				loader.Tween(RGB, 1, {Size = UDim2.new(0, 0, 0, 0)})
				wait(1)
				for i,v in pairs(isValid[2][2]["Extra_Args"]) do
					_G[i] = v
				end
				loadstring(game:HttpGet(isValid[2][2]["Loadstring"], true))()
				loader.Tween(MenuBlur, 1, {Size = 0})
				rainbow:Disconnect()
				Launcher:Destroy()
			end
		end)
	else
		loader.Typewrite("Unsupported Game", GM)
		loader.Typewrite("Exit", Button)
		local cp = true
		Button.MouseButton1Click:Connect(function()
			if cp then
				cp=false
				Button.Text = ""
				GM.Text = ""
				loader.Tween(LoaderMenu, 1, {Size = UDim2.new(0, 0, 0, 0)})
				loader.Tween(RGB, 1, {Size = UDim2.new(0, 0, 0, 0)})
				wait(1)
				loader.Tween(MenuBlur, 1, {Size = 0})
				rainbow:Disconnect()
				Launcher:Destroy()
			end
		end)
	end
end

loader.Init()
