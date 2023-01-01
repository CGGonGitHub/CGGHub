--[[
	Made by the real#5282 // CGG // CoolGermanGuy
	Unprotected by nothing v2
	you can use the loadstring: to get updates (recommended)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Main.lua"))()

]]

for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local Window = Library:AddWindow({
	title = {"Universal", "the real#5282"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
-- Localplayer
local Local_Player = Window:AddTab("Local player", {default = false})
local Local_PlayerSection = Local_Player:AddSection("Basic Shit", {default = false})
local previousWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local WalkSpeedSlider = Local_PlayerSection:AddSlider("Walkspeed", 1, 300, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
	if bool == false then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = previousWalkSpeed
	end
end)
local previousJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local JumpPowerSlider = Local_PlayerSection:AddSlider("JumpPower", 1, 3000, game.Players.LocalPlayer.Character.Humanoid.JumpPower, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val2, bool2)
	if bool2 then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val2
	end
	if bool2 == false then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = previousJumpPower
	end
end)
local previousGravity = game.Workspace.Gravity
local Slider = Local_PlayerSection:AddSlider("Gravity", 1, 500, game.Workspace.Gravity, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val3, bool3)
	if bool3 then
		game.Workspace.Gravity = val3
	end
	if bool3 == false then
		game.Workspace.Gravity = previousGravity
	end
end)
local NoClipToggle = Local_PlayerSection:AddToggle("Noclip", {flag = "Toggle_Flag", default = false}, function(bool4)
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local Plr = Players.LocalPlayer
    
    if bool4 == true then
        Clipon = true
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Clipon == false then
                for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
            else
                Stepped:Disconnect()
            end
        end)
    elseif bool4 == false then
        Clipon = false
    end
end)

-- Teleports
local TeleportTab = Window:AddTab("Teleports", {default = false})
local TeleportSection = TeleportTab:AddSection("Players", {default = false})
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
    x = Instance.new("Part")
    x.Shape = Enum.PartType.Cylinder
    x.Size = Vector3.new(1000,0.5,0.5)
    x.Material = Enum.Material.Neon
    x.Color = Color3.fromRGB(0, 225, 255)
    x.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    x.Rotation = Vector3.new(0,0,90)
    x.CanCollide = false
    x.Anchored = true
    x.Parent = game.Workspace
    local TS = game:GetService("TweenService")
    local Anim = TS:Create(x, TweenInfo.new(1), {Size=Vector3.new(1000,5,5)})
    Anim:Play()
    task.wait(1)
    x:Destroy()
    Teleport(game.Players[selected].Character.HumanoidRootPart.CFrame)
    x = Instance.new("Part")
    
    x.Shape = Enum.PartType.Cylinder
    x.Size = Vector3.new(1000,5,5)
    x.Material = Enum.Material.Neon
    x.Color = Color3.fromRGB(0, 225, 255)
    x.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    x.Rotation = Vector3.new(0,0,90)
    x.CanCollide = false
    x.Parent = game.Workspace
    x.Anchored = true
    local TS = game:GetService("TweenService")
    local Anim = TS:Create(x, TweenInfo.new(0.5), {Size=Vector3.new(1000,0.5,0.5)})
    Anim:Play()
    Anim.Completed:Connect(function()
        x:Destroy()
    end)
end)
game.Players.PlayerAdded:Connect(function(player)
    Dropdown:Add(player.Name)
end)
game.Players.PlayerRemoving:Connect(function(player)
    Dropdown:Remove(player.Name)
end)

-- Visuals
local VisualsTab = Window:AddTab("Visuals", {default = false})
local ESPSection = VisualsTab:AddSection("ESP", {default = false})
local Button = ESPSection:AddButton("ESP", function()
	local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
            highlightClone.FillColor = _G.FillColor
            highlightClone.FillTransparency = _G.FillTransparency
            highlightClone.OutlineColor = _G.OutlineColor
            highlightClone.OutlineTransparency = _G.OutlineTransparency
        end
    end

    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.FillColor = _G.FillColor
            highlightClone.FillTransparency = _G.FillTransparency
            highlightClone.OutlineColor = _G.OutlineColor
            highlightClone.OutlineTransparency = _G.OutlineTransparency
            highlightClone.Name = "Highlight"
        end    
    end)

    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)

    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Hightlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.FillColor = _G.FillColor
                highlightClone.FillTransparency = _G.FillTransparency
                highlightClone.OutlineColor = _G.OutlineColor
                highlightClone.OutlineTransparency = _G.OutlineTransparency
                highlightClone.Name = "Highlight"
                task.wait()
            end
        end
    end)
end)
local Picker = ESPSection:AddPicker("FillColor", {color = Color3.fromRGB(255, 0, 0)}, function(color)
	_G.FillColor = color
end)
local Box = ESPSection:AddBox("FillTransparency (0, 0.1, 0.2,... 1)", {fireonempty = true}, function(text)
	_G.FillTransparency = text
end)

local Picker = ESPSection:AddPicker("OutlineColor", {color = Color3.fromRGB(255, 0, 0)}, function(color)
	_G.OutlineColor = color
end)
local Box = ESPSection:AddBox("OutlineTransparency (0, 0.1, 0.2,... 1)", {fireonempty = true}, function(text)
	_G.OutlineTransparency = text
end)
-- Misc
local MiscTab = Window:AddTab("Misc", {default = false})
local JoinSection = MiscTab:AddSection("Rejoin & Co", {default = false})
local Button = JoinSection:AddButton("Button", function()
	JobId = game.JobId
    PlaceId = game.PlaceId
    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
end)
local InfoLabel = JoinSection:AddLabel("Your Friend can get their JobId by executing the following script:")
local ClipboardLabel = JoinSection:AddClipboardLabel("print(game.JobId)", function()
	return "print(game.JobId)"
end)
local CreditsSection = MiscTab:AddSection("Credits", {default = false})
local DualLabel = CreditsSection:AddDualLabel({"Vynixius", "providing the ui lib and discord utility"})
local DualLabel = CreditsSection:AddDualLabel({"CGG (Me)", "everything else"})
local Button = CreditsSection:AddButton("Join the Discord", function()
	local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
    Inviter.Join("https://discord.gg/qE95VSpvwW")
end)
