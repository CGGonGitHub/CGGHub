--[[
	Made by No.8#9194 // CGG // CoolGermanGuy
	Unprotected by nothing v2

	you can use the loadstring: to get updates (recommended)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Main.lua"))()
	
	Discord invite: https://discord.gg/dpy8s5dbPZ
]]

for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local Window = Library:AddWindow({
	title = {"BABFT Info & other", "No.8#9194"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
-- Players
local Players1 = Window:AddTab("Players", {default = false})
for i, v in next, game.Players:GetPlayers() do
    local PlayersSection = Players1:AddSection(v.Name, {default = false}) do
        PlayersSection:AddDualLabel({"Gold", v.Data.Gold.Value})
		PlayersSection:AddDualLabel({"Gold Blocks", v.Data.GoldBlock.Value})
		PlayersSection:AddDualLabel({"Painting Tool", v.Data.PaintingTool.Value})
		PlayersSection:AddDualLabel({"Binding Tool", v.Data.BindTool.Value})
		PlayersSection:AddDualLabel({"Properties Tool", v.Data.PropertiesTool.Value})
		PlayersSection:AddDualLabel({"Scaling Tool", v.Data.ScalingTool.Value})
		PlayersSection:AddDualLabel({"TrowelTool", v.Data.TrowelTool.Value})
		PlayersSection:AddDualLabel({"Legendary Chests", v.Data.ChestLegendary.Value})
		PlayersSection:AddDualLabel({"Epic Chests", v.Data.ChestEpic.Value})
		PlayersSection:AddDualLabel({"Rare Chests", v.Data.ChestRare.Value})
		PlayersSection:AddDualLabel({"Uncommon Chests", v.Data.ChestUncommon.Value})
		PlayersSection:AddDualLabel({"Common Chests", v.Data.ChestCommon.Value})
		PlayersSection:AddDualLabel({"Neon Blocks", v.Data.NeonBlock.Value})
		PlayersSection:AddDualLabel({"Wood Blocks", v.Data.WoodBlock.Value})
		PlayersSection:AddDualLabel({"Obsidian Blocks", v.Data.ObsidianBlock.Value})
		PlayersSection:AddDualLabel({"Neon Blocks", v.Data.NeonBlock.Value})
		PlayersSection:AddDualLabel({"Titanium Blocks", v.Data.TitaniumBlock.Value})
		PlayersSection:AddDualLabel({"Cakes", v.Data.Cake.Value})
		PlayersSection:AddDualLabel({"Stars", v.Data.Star.Value})
		PlayersSection:AddDualLabel({"Hearts", v.Data.Heart.Value})
    end
end
-- Teams
local Teams1 = Window:AddTab("Teams", {default = false})

-- Misc
local Misc = Window:AddTab("Misc", {default = false})
local TeleportSection = Misc:AddSection("Teleports", {default = false})
local Dropdown = TeleportSection:AddDropdown("Teams", {"Team White", "Team Black", "Team Red", "Team Green", "Team Blue", "Team Yellow", "Team Pink"}, {default = ""}, function(selected)
	print(selected)
	if selected == "Team White" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-50,81,-564)
		end
	if selected == "Team Red" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(440,81,-64)
	end
	if selected == "Team Blue" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(440,81,300)
	end
	if selected == "Team Black" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-547,81,-69)
	end
	if selected == "Team Green" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-547,81,294)
	end
	if selected == "Team Yellow" then 
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-547,81,641)
	end
	if selected == "Team Pink" then 
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(440,81,647)
    end
end)
function getAllPlayers()
	local playertable =  {}
	for i, v in next, game.Players:GetPlayers() do
		table.insert(playertable, v.Name)
	end
	return playertable
end
function Teleport(CFrame)
	game.Players.LocalPlayer.Character.PrimaryPart:PivotTo(CFrame)
end
local Dropdown = TeleportSection:AddDropdown("Players", getAllPlayers(), {default = ""}, function(selected)
	Teleport(game.Players[selected].Character.HumanoidRootPart.CFrame)
end)
-- Localplayer
local Local_Player = Window:AddTab("Local player", {default = false})
local Local_PlayerSection = Local_Player:AddSection("Basic Shit", {default = false})
local previousWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local WalkSpeedSlider = Local_PlayerSection:AddSlider("Walkspeed", 1, 300, 16, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
	if bool == false then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = previousWalkSpeed
	end
end)
local previousJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local JumpPowerSlider = Local_PlayerSection:AddSlider("JumpPower", 1, 3000, 50, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val2, bool2)
	if bool2 then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val2
	end
	if bool2 == false then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = previousJumpPower
	end
end)
local previousGravity = game.Workspace.Gravity
local Slider = Local_PlayerSection:AddSlider("Gravity", 0, 300, previousGravity, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val3, bool3)
	if bool3 then
		game.Workspace.Gravity = val3
	end
	if bool3 == false then
		game.Workspace.Gravity = previousGravity
	end
end)
-- Trolling
local Trolling = Window:AddTab("Trolling", {default = false})
local fakeGoldSection = Trolling:AddSection("Give yourself Gold!!!!!", {default = false})
local Box = fakeGoldSection:AddBox("Gold Amount", {fireonempty = true}, function(text)
	function fakeGold()
		game.Players.LocalPlayer.Data.Gold.Value = text
	end
	fakeGold()
end)
local Box = fakeGoldSection:AddBox("Get Gold +", {fireonempty = true}, function(text2)
	function fakeGold2()
		game.Players.LocalPlayer.Data.Gold.Value = game.Players.LocalPlayer.Data.Gold.Value + text2
	end
	fakeGold2()
end)
local Box = fakeGoldSection:AddBox("Gold text", {fireonempty = true}, function(text)
	function textGold()
		game.Players.LocalPlayer.PlayerGui.GoldGui.Frame.Amount.Text = text
	end	
	textGold()
end)
-- Buy
local BuyTab = Window:AddTab("Buy", {default = false})
local ChestsSection = BuyTab:AddSection("Buy Stuff in Bulks!", {default = false})
local Dropdown = ChestsSection:AddDropdown("Chests", {"Common Chest", "Uncommon Chest", "Rare Chest", "Epic Chest", "Legendary Chest"}, {default = ""}, function(selectedChest)
	selectedChestReal = selectedChest
end)
local AmountSection = BuyTab:AddSection("How much?", {default = false})
local Slider = AmountSection:AddSlider("Amount", 1, 100, 1, {toggleable = false, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	amount = val
end)
local Button = AmountSection:AddButton("Buy it!", function()
	workspace.ItemBoughtFromShop:InvokeServer(selectedChestReal,amount)
end)
-- Utilities
local Utilities = Window:AddTab("Utilities", {default = false})
local UtilitiesSection = Utilities:AddSection("Utilities", {default = false})
local Button = UtilitiesSection:AddButton("Remove Water", function()
	for i, v in next, game.workspace:GetDescendants() do
		if string.find(string.lower(v.Name), "Water") then
			v:Destroy()
			end
	end
end)
local Button = UtilitiesSection:AddButton("Rejoin", function()
	varPlaceId = game.PlaceId
	varJobId = game.JobId
	game:GetService("TeleportService"):TeleportToPlaceInstance(varPlaceId, varJobId, game.Players.LocalPlayer)
end)
local Button = UtilitiesSection:AddButton("ServerHop", function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(537413528, game.Players.LocalPlayer)
end)
local Toggle = UtilitiesSection:AddToggle("Auto Farm", {flag = "Toggle_Flag", default = false}, function(bool)
    local previousPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    looping = bool 
    local waittime = 2
    task.spawn(function() 
        while looping == true do
            x = Instance.new("Part")
			x.Parent = game.Workspace
			x.Anchored = true
			x.Size = Vector3.new(6,6,6)
			x.CFrame = CFrame.new(-51, 60, 1369)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 1369)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 2139)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 2139)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 2909)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 2909)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 3679)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 3679)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 4449)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 4449)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 5219)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 5219)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 5989)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 5989)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 6759)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 6759)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 7529)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 7529)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			x.CFrame = CFrame.new(-51, 60, 8299)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 8299)
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55, -358, 9492)
			task.wait(9)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55, -358, 9492)
			game.Players.LocalPlayer.CharacterAdded:Wait()
			task.wait(waittime)
			if not looping then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = previousPosition x:Destroy() break end
			
        end
    end)
end)

local Toggle = UtilitiesSection:AddToggle("Autofarm v2", {flag = "Toggle_Flag", default = false}, function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51, 65, 1000)
local TS = game:GetService("TweenService")

local Root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local info = TweenInfo.new(20)
local Anim = TS:Create(Root, info, {CFrame = CFrame.new(-51, 65, 9492)})
Anim:Play()
task.wait(2)
end)
-- Settings
local Settings = Window:AddTab("Settings", {default = false})
local Section = Settings:AddSection("real", {default = false})
-- very cool!1!!
local verycool = Window:AddTab("very cool!1!!", {default = false})
local Credits = verycool:AddSection("Credits", {default = false})
local Label = Credits:AddLabel("Everything - No.8#9194")
local Label = Credits:AddLabel("Scripting Help - Gi#7331")
local Discords = verycool:AddSection("Discord", {default = false})
local Button = Discords:AddButton("My Discord", function()
	setclipboard("https://discord.gg/dpy8s5dbPZ")
    toclipboard("https://discord.gg/dpy8s5dbPZ")
end)