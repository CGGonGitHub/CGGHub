--[[
	Made by the real#5282 // CGG // CoolGermanGuy
	you can use the loadstring: to get updates (recommended)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Main.lua"))()
	
	Discord invite: https://discord.gg/qE95VSpvwW
]]--


for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local Window = Library:AddWindow({
	title = {"Tapping Simulator", "CGGHub"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
-- Main
local MainTab = Window:AddTab("Main", {default = false})
local MainshitSection = MainTab:AddSection("Main shit", {default = false})
local looping = false
local Toggle = MainshitSection:AddToggle("AutoClicker", {flag = "Toggle_Flag", default = false}, function(bool)
    looping = bool 
    
    task.spawn(function() 
        while looping == true do
            game:GetService("ReplicatedStorage").Events.Tap:FireServer(1)
            wait()
        end
    end)
end)
local Toggle = MainshitSection:AddToggle("Auto Rebirth", {flag = "Toggle_Flag", default = false}, function(bool2)
	looping2 = bool2

	task.spawn(function()
		while looping2 == true do
			local VIM = game:GetService("VirtualInputManager")
			VIM:SendKeyEvent(false, Enum.KeyCode.F, false, game)
			wait()
		end
	end)
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
