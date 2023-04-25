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
	title = {"Universal", "CGGHub"},
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
_G.spam = "CGGHub on top!"
_G.spamenabled = true
_G.infinitespamenabled = true
_G.loopteleportenabled = true
spectateplayer = game.Players:FindFirstChild("a")
ESPbool = false
lp = game:GetService("Players").LocalPlayer
VU = game:GetService("VirtualUser")
Mouses = lp:GetMouse()
cmdm = Mouses
speedofthefly = 1
speedofthevfly = 1
-- Localplayer
local Local_Player = Window:AddTab("Local player", {default = false})
local Local_PlayerSection = Local_Player:AddSection("Basic Shit", {default = false})
local previousWalkSpeed = lp.Character:WaitForChild("Humanoid").WalkSpeed
local WalkSpeedSlider = Local_PlayerSection:AddSlider("Walkspeed", 1, 300, lp.Character:WaitForChild("Humanoid").WalkSpeed, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		lp.Character:WaitForChild("Humanoid").WalkSpeed = val
    elseif not bool then
		lp.Character:WaitForChild("Humanoid").WalkSpeed = previousWalkSpeed
	end
end)
local previousJumpPower = lp.Character:WaitForChild("Humanoid").JumpPower
local JumpPowerSlider = Local_PlayerSection:AddSlider("JumpPower", 1, 3000, lp.Character:WaitForChild("Humanoid").JumpPower, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		lp.Character:WaitForChild("Humanoid").JumpPower = val
    elseif not bool then
		lp.Character:WaitForChild("Humanoid").JumpPower = previousJumpPower
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
local lp = game.Players.LocalPlayer
Mouses = lp:GetMouse()
mouse = Mouses

local Update
function sFLY(vfly)
	FLYING = false

	while not lp or not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') or not lp.Character:FindFirstChild('Humanoid') or not cmdm do
		 wait()
	end 
	local T = lp.Character:WaitForChild("HumanoidRootPart")
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 3
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			while FLYING do
				if not vfly then
					lp.Character:FindFirstChild("Humanoid").PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
				wait()
			end
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			lp.Character:WaitForChild("Humanoid").PlatformStand = false
		end)
	end
	cmdm.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = speedofthevfly
			else
				CONTROL.F = speedofthefly
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - speedofthevfly
			else
				CONTROL.B = - speedofthefly
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - speedofthevfly
			else
				CONTROL.L = - speedofthefly
			end
		elseif KEY:lower() == 'd' then
			if vfly then
				CONTROL.R = speedofthevfly
			else
				CONTROL.R = speedofthefly
			end
		elseif KEY:lower() == 'y' then
			if vfly then
				CONTROL.Q = speedofthevfly*2
			else
				CONTROL.Q = speedofthefly*2
			end
		elseif KEY:lower() == 't' then
			if vfly then
				CONTROL.E = -speedofthevfly*2
			else
				CONTROL.E = -speedofthefly*2
			end
		end
	end)
	cmdm.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'y' then
			CONTROL.Q = 0
		elseif KEY:lower() == 't' then
			CONTROL.E = 0
		end
	end)
	FLY()
    Update = function()
        speedofthefly = flyval
        speedofthevfly = flyval
    end
end

local FlySlider = Local_PlayerSection:AddSlider("Fly", 1, 10, 1, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(flyval, bool)

    if bool then
        speedofthefly = flyval
        speedofthevfly = flyval
        sFLY(vfly)
    elseif not bool then
        FLYING = false
        lp.Character:WaitForChild("Humanoid").PlatformStand = false
    end
end)
local AnchoredToggle = Local_PlayerSection:AddToggle("Anchored", {flag = "Toggle_Flag", default = false}, function(bool)
	if bool then 
        lp.Character:WaitForChild("HumanoidRootPart").Anchored = true
    elseif not bool then
        lp.Character:WaitForChild("HumanoidRootPart").Anchored = false
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
    lp.Character.PrimaryPart:PivotTo(CFrame)
end
local Dropdown = TeleportSection:AddDropdown("Player to teleport to", getAllPlayers(), {default = ""}, function(selected)
    x = Instance.new("Part")
    x.Shape = Enum.PartType.Cylinder
    x.Size = Vector3.new(1000,0.5,0.5)
    x.Material = Enum.Material.Neon
    x.Color = Color3.fromRGB(0, 225, 255)
    x.CFrame = lp.Character:WaitForChild("HumanoidRootPart").CFrame
    x.Rotation = Vector3.new(0,0,90)
    x.CanCollide = false
    x.Anchored = true
    x.Parent = game.Workspace
    local TS = game:GetService("TweenService")
    local Anim = TS:Create(x, TweenInfo.new(1), {Size=Vector3.new(1000,5,5)})
    Anim:Play()
    task.wait(1)
    x:Destroy()
    Teleport(game.Players[selected].Character:WaitForChild("HumanoidRootPart").CFrame)
    x = Instance.new("Part")
    
    x.Shape = Enum.PartType.Cylinder
    x.Size = Vector3.new(1000,5,5)
    x.Material = Enum.Material.Neon
    x.Color = Color3.fromRGB(0, 225, 255)
    x.CFrame = lp.Character:WaitForChild("HumanoidRootPart").CFrame
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

local function loopteleport()
    _G.loopteleportenabled = not _G.loopteleportenabled
    while _G.loopteleportenabled do
        lp.Character:WaitForChild("HumanoidRootPart").CFrame = game.Players[xyz].Character:WaitForChild("HumanoidRootPart").CFrame
        task.wait()
    end
end
local Toggle = LoopTeleportSection:AddToggle("Loop teleport", {flag = "Toggle_Flag", default = false}, function(bool)
    loopteleport()
end)

-- Features
local FeaturesTab = Window:AddTab("Features", {default = false})
local SpamSection = FeaturesTab:AddSection("Chat Spam", {default = false})
local Box = SpamSection:AddBox("text to spam", {fireonempty = true}, function(text)
	_G.spam = text
    print(_G.spam)
end)
local function spam()
    _G.spamenabled = not _G.spamenabled
    while _G.spamenabled do
        for count = 0, 6, 1 do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.spam, "normalchat")
        end
        task.wait(15)
    end
end
local Toggle = SpamSection:AddToggle("spam", {flag = "Toggle_Flag", default = false}, function(bool)
    spam()
end)
local function infinitespam()
    _G.infinitespamenabled = not _G.infinitespamenabled
    while _G.infinitespamenabled do
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.spam,"normalchat")
        task.wait(2.15)
    end
end
local Toggle = SpamSection:AddToggle("spam v2", {flag = "Toggle_Flag", default = false}, function(bool)
	infinitespam()
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
    afkConnection = lp.Idled:Connect(antiafk)
else 
    afkConnection:Disconnect()
end
end)
-- Visuals
local VisualsTab = Window:AddTab("Visuals", {default = false})
local ESPSection = VisualsTab:AddSection("ESP", {default = false})
local Update2

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
    
    Update2 = function()
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

local SpectateSection = VisualsTab:AddSection("Spectate", {default = false})
local Toggle = SpectateSection:AddToggle("Spectate", {flag = "Toggle_Flag", default = false}, function(bool)
	if bool then
		workspace.CurrentCamera.CameraSubject = game.Players[_G.spectateplayer].Character.Humanoid
	else
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end
end)
local Dropdown = SpectateSection:AddDropdown("Player to spectate", getAllPlayers(), {default = ""}, function(selected)
	_G.spectateplayer = selected
end)

game.Players.PlayerAdded:Connect(function(player)
    Dropdown:Add(player.Name)
end)
game.Players.PlayerRemoving:Connect(function(player)
    Dropdown:Remove(player.Name)
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
    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, JobId, lp)
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
