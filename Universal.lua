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
Library:Notify({
    title = "Game unsupported - loading universal",
    text = "Please join my discord and ask me nicely to add the game",
    duration = 10,
    color = Color3.fromRGB(0, 255, 0),
}) 
local Window = Library:AddWindow({
	title = {"Universal", "thereal#5282"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
_G.FillColor = Color3.fromRGB(255,0,0)
_G.FillTransparency = 0.5
_G.OutlineColor = Color3.fromRGB(1,1,1)
_G.OutlineTransparency = 0
_G.spam = "hello, this is the spammer from CGG's ui"
_G.spamenabled = true
_G.loopteleportenabled = true
ESPbool = false
VU = game:GetService("VirtualUser")
-- Localplayer
local Local_Player = Window:AddTab("Local player", {default = false})
local Local_PlayerSection = Local_Player:AddSection("Basic Shit", {default = false})
local previousWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local WalkSpeedSlider = Local_PlayerSection:AddSlider("Walkspeed", 1, 300, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    elseif not bool then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = previousWalkSpeed
	end
end)
local previousJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local JumpPowerSlider = Local_PlayerSection:AddSlider("JumpPower", 1, 3000, game.Players.LocalPlayer.Character.Humanoid.JumpPower, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
    elseif not bool then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = previousJumpPower
	end
end)
local previousGravity = game.Workspace.Gravity
local Slider = Local_PlayerSection:AddSlider("Gravity", 1, 500, game.Workspace.Gravity, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Workspace.Gravity = val
    elseif not bool then
		game.Workspace.Gravity = previousGravity
	end
end)
local previousFOV = game.Workspace.CurrentCamera.FieldOfView
local FOVSlider = Local_PlayerSection:AddSlider("FOV", 1, 120, game.Workspace.CurrentCamera.FieldOfView, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Workspace.CurrentCamera.FieldOfView = val
	end
	if bool == false then
		game.Workspace.CurrentCamera.FieldOfView = previousFOV
	end
end)
local NoClipToggle = Local_PlayerSection:AddToggle("Noclip", {flag = "Toggle_Flag", default = false}, function(bool)
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local Plr = Players.LocalPlayer
    
    if bool == true then
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
    elseif bool == false then
        Clipon = false
    end
end)
local Toggle = Local_PlayerSection:AddToggle("Anchored", {flag = "Toggle_Flag", default = false}, function(bool)
	if bool then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    elseif not bool then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
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
local Dropdown = TeleportSection:AddDropdown("Player to teleport to", getAllPlayers(), {default = ""}, function(selected)
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
local LoopTeleportSection = TeleportTab:AddSection("Loop teleport", {default = false})
local Dropdown = LoopTeleportSection:AddDropdown("Players", getAllPlayers(), {default = ""}, function(selected)
    xyz = selected
end)
game.Players.PlayerAdded:Connect(function(player)
    Dropdown:Add(player.Name)
end)
game.Players.PlayerRemoving:Connect(function(player)
    Dropdown:Remove(player.Name)
end)
local function loopteleport()
    _G.loopteleportenabled = not _G.loopteleportenabled
    while _G.loopteleportenabled do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[xyz].Character.HumanoidRootPart.CFrame
        task.wait()
    end
end
local Toggle = LoopTeleportSection:AddToggle("Loop teleport", {flag = "Toggle_Flag", default = false}, function(bool)
    loopteleport()
end)

-- Features
local FeaturesTab = Window:AddTab("Features", {default = false})
local SpamSection = FeaturesTab:AddSection("Spam", {default = false})
local Box = SpamSection:AddBox("text to spam", {fireonempty = true}, function(text)
	_G.spam = text
    print(_G.spam)
end)
local function spam()
    _G.spamenabled = not _G.spamenabled
    while _G.spamenabled do
        for count = 0, 6, 1 do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.spam, "All")
        end
        task.wait(16)
    end
end
local Toggle = SpamSection:AddToggle("Spam", {flag = "Toggle_Flag", default = false}, function(bool)
    spam()
end)
local AntiafkSection = FeaturesTab:AddSection("Anti AFK", {default = false})
local function antiafk()
    VU:Button2Down(Vector2.zero, workspace.CurrentCamera.CFrame) -- you can use Vector2.zero as shorthand for (0, 0)
    task.wait(1)
    VU:Button2Up(Vector2.zero, workspace.CurrentCamera.CFrame)
end
local afkConnection
local Toggle = AntiafkSection:AddToggle("no more idle 20 min kick >:(", {flag = "Toggle_Flag", default = false}, function(bool)
if bool then
    afkConnection = game.Players.LocalPlayer.Idled:Connect(antiafk)
else 
    afkConnection:Disconnect()
end
end)
-- Visuals
local VisualsTab = Window:AddTab("Visuals", {default = false})
local ESPSection = VisualsTab:AddSection("ESP", {default = false})
local Update

local function ESP(Player) -- outside so its only defined once
    local highlightClone = Instance.new("Highlight")
    highlightClone.Adornee = Player.Character
    highlightClone.Parent = Player.Character:WaitForChild("HumanoidRootPart")
    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlightClone.FillColor = _G.FillColor
    highlightClone.FillTransparency = _G.FillTransparency
    highlightClone.OutlineColor = _G.OutlineColor
    highlightClone.OutlineTransparency = _G.OutlineTransparency
    highlightClone.Name = "Highlight"
    
    Update = function()
        highlightClone.FillColor = _G.FillColor
        highlightClone.FillTransparency = _G.FillTransparency
        highlightClone.OutlineColor = _G.OutlineColor
        highlightClone.OutlineTransparency = _G.OutlineTransparency
    end
end

local Toggle = ESPSection:AddToggle("Toggle", {flag = "Toggle_Flag", default = false}, function(bool)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do -- for loop through players
        local Highlight = v.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Highlight") -- highlight for if check
        if Highlight then -- if the highlight is in the character
            Highlight.Enabled = bool -- set the highlight's enabled to bool so if its true or false then thats the enabled
        elseif v ~= game:GetService("Players").LocalPlayer and bool then -- localplayer check and bool check to see if its enabled
            ESP(v) -- add esp
        end
    end
    ESPbool = bool
end)
game:GetService("Players").PlayerAdded:Connect(function(player)
    if ESPbool then
        e = player.Character or player.CharacterAdded:Wait()
        ESP(player)
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
    if ESPbool then
        e = player.Character or player.CharacterAdded:Wait()
        ESP(player)
    end
end)
local Picker = ESPSection:AddPicker("FillColor", {color = Color3.fromRGB(255, 0, 0)}, function(color)
    _G.FillColor = color
    
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local Character = v.Character or v.CharacterAdded:Wait()
        local Highlight = Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Highlight")
        if Highlight then
            Highlight.FillColor = _G.FillColor
            Highlight.FillTransparency = _G.FillTransparency
            Highlight.OutlineColor = _G.OutlineColor
            Highlight.OutlineTransparency = _G.OutlineTransparency
        end
    end
end)
local Box = ESPSection:AddBox("FillTransparency (0, 0.1, 0.2,... 1)", {fireonempty = true}, function(text)
    _G.FillTransparency = text

    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local Character = v.Character or v.CharacterAdded:Wait()
        local Highlight = Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Highlight")
        if Highlight then
            Highlight.FillColor = _G.FillColor
            Highlight.FillTransparency = _G.FillTransparency
            Highlight.OutlineColor = _G.OutlineColor
            Highlight.OutlineTransparency = _G.OutlineTransparency
        end
    end
end)

local Picker = ESPSection:AddPicker("OutlineColor", {color = Color3.fromRGB(255, 0, 0)}, function(color)
    _G.OutlineColor = color

    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local Character = v.Character or v.CharacterAdded:Wait()
        local Highlight = Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Highlight")
        if Highlight then
            Highlight.FillColor = _G.FillColor
            Highlight.FillTransparency = _G.FillTransparency
            Highlight.OutlineColor = _G.OutlineColor
            Highlight.OutlineTransparency = _G.OutlineTransparency
        end
    end
end)
local Box = ESPSection:AddBox("OutlineTransparency (0, 0.1, 0.2,... 1)", {fireonempty = true}, function(text)
    _G.OutlineTransparency = text

    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local Character = v.Character or v.CharacterAdded:Wait()
        local Highlight = Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Highlight")
        if Highlight then
            Highlight.FillColor = _G.FillColor
            Highlight.FillTransparency = _G.FillTransparency
            Highlight.OutlineColor = _G.OutlineColor
            Highlight.OutlineTransparency = _G.OutlineTransparency
        end
    end
end)



-- Misc
local MiscTab = Window:AddTab("Misc", {default = false})
local UISettingsSection = MiscTab:AddSection("UI Settings", {default = false})
local Picker = UISettingsSection:AddPicker("UI Color", {color = Color3.fromRGB(0, 255, 0)}, function(color)
	Window:SetAccent(color)
end)
local Button =UISettingsSection:AddButton("Destroy UI", function()
	game.CoreGui["Vynixius UI Library"]:Destroy()
end)
local JoinSection = MiscTab:AddSection("Rejoin & Co", {default = false})
local Button = JoinSection:AddButton("Rejoin", function()
	JobId = game.JobId
    PlaceId = game.PlaceId
    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
end)
local Button = JoinSection:AddButton("Serverhop", function()
	local TeleportService = game:GetService("TeleportService")
local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Dsc&limit=100")).data

-- just to remove some servers roblox likely yeeted but still in their cache
local c = 0
for i = 1, #data do
    local server = data[i-c]
    if not server.playing then
        table.remove(data, i-c)
        c += 1
    end
end

local function fyshuffle( tInput )
    local tReturn = {}
    for i = #tInput, 1, -1 do
        local j = math.random(i)
        tInput[i], tInput[j] = tInput[j], tInput[i]
        table.insert(tReturn, tInput[i])
    end
    return tReturn
end

data = fyshuffle(data)

-- this is a horrible, idea, never do what I did here
-- horrible use-case for recursion...
local function randomhop(data, failed)
    failed = failed or {}
    for _, s in pairs(data) do
        local id = s.id
        if not failed[id] and id ~= game.JobId then
            if s.playing < s.maxPlayers then
                local connection
                connection = TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
                    connection:Disconnect()
                    failed[id] = true
                    randomhop(data, failed)
                end)
                TeleportService:TeleportToPlaceInstance(game.PlaceId, id)
                break
            end
        end
    end
end

randomhop(data)
end)

local InfoLabel = JoinSection:AddLabel("Your Friend can get their JobId by executing the following script:")
local ClipboardLabel = JoinSection:AddClipboardLabel("print(game.JobId)", function()
	return "print(game.JobId)"
end)
local CreditsSection = MiscTab:AddSection("Credits", {default = false})
local DualLabel = CreditsSection:AddDualLabel({"Vynixius", "providing the ui lib and discord utility"})
local DualLabel = CreditsSection:AddDualLabel({"thereal#5282", "everything else"})
local Button = CreditsSection:AddButton("Join the Discord", function()
	local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
    Inviter.Join("https://discord.gg/qE95VSpvwW")
end)
