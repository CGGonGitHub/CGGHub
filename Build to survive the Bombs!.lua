for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
Library:Notify({
    title = "Welcome",
    text = "Please join our Discord thanks",
    duration = 10,
    color = Color3.fromRGB(0, 255, 0),
}) 
local Window = Library:AddWindow({
	title = {"Build to survive the Bombs!", "No.9#5768"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
local player123 = game.Players.LocalPlayer.Name
local HumanTab = Window:AddTab("Human", {default = false})

local HumanSection = HumanTab:AddSection("Human", {default = false})

local Button = HumanSection:AddButton("Kill All E (pitchfork needed)", function()
	local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
    if key == "E" then
        up = true
        while up do
            task.wait()
            for i, v in pairs(game.Players:GetChildren()) do
            if v.Team == game:GetService("Teams")["Bombs"] then
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

                local function CFrameBypass(tool,pos)
                    local Arm = game.Players.LocalPlayer.Character['RightHand'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                    local cframe = Arm:toObjectSpace(pos):inverse()
                    tool.Parent = game.Players.LocalPlayer.Backpack
                    tool.Grip = cframe
                    tool.Parent = game.Players.LocalPlayer.Character
                end
                CFrameBypass(tool, v.Character.HumanoidRootPart.CFrame)
                game.ReplicatedStorage.Events.CreateThrow:FireServer(CFrame.new(0,-10000,0), Workspace.player123["Pitchfork"])
            end
            end
            end
    end
end)
mouse.KeyUp:connect(function(key)
    if key == "E" then
        up = false
    end
end)
end)
function getAllPlayers()
    local playertable =  {}
    for i, v in next, game.Players:GetPlayers() do
        table.insert(playertable, v.Name)
    end
    return playertable
end

local Dropdown = HumanSection:AddDropdown("Trap someone ez L", getAllPlayers(), {default = "Item1"}, function(selected)

	playerPos = game.Players[selected].Character.HumanoidRootPart.Position
    blockPos = playerPos
    speed = 0.01

    blockPos = playerPos + Vector3.new(0,-1,4.5)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(0,-1,-4.5)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(4.5,-1,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(-4.5,-1,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(0,3,-4.5)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(0,3,4.5)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(4.5,3,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(-4.5,3,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(-4.5,7,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

    blockPos = playerPos + Vector3.new(-0.5,7,0)
    wait(speed)
    game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", blockPos.x , blockPos.y, blockPos.z, 0, Workspace.Blocks)

end)
local Button = HumanSection:AddButton("enable R to Draw (enhance your free spirit)", function()
	local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    local up = false

    mouse.KeyDown:connect(function(key)
    if key == "r" then
        up = true
            while up do
            task.wait()
                game.ReplicatedStorage.Events.PlacementEvent:InvokeServer("Sand", mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z, 0, Workspace.Blocks)
            end
    end
    end)
    mouse.KeyUp:connect(function(key)
    if key == "r" then
        up = false
    end
    end)
end)

-- Bomb
local BombTab = Window:AddTab("Bomb", {default = false})
local BombSection = BombTab:AddSection("while bomb", {default = false})
function getAllPlayers()
    local playertable =  {}
    for i, v in next, game.Teams.Humans:GetPlayers() do
        table.insert(playertable, v.Name)
    end
    return playertable
end
local Dropdown = BombSection:AddDropdown("Target", getAllPlayers(), {default = ""}, function(selected)
    x = tostring(selected)
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

        game.ReplicatedStorage.Events.Explode:FireServer()
        task.wait(3.85)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[x].Character.HumanoidRootPart.CFrame
end)
game.Teams.Humans.PlayerAdded:Connect(function()
    Dropdown:ClearList()
    Dropdown:SetList(getAllPlayers())
end)
game.Teams.Humans.PlayerRemoved:Connect(function()
    Dropdown:ClearList()
    DropDown:SetList(getAllPlayers())
end)
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
game.Players.PlayerAdded:Connect(function()
    Dropdown:ClearList()
    Dropdown:SetList(getAllPlayers())
end)
game.Players.PlayerRemoving:Connect(function()
    Dropdown:ClearList()
    DropDown:SetList(getAllPlayers())
end)

-- Misc
local MiscTab = Window:AddTab("Misc", {default = false})
local MiscSection = MiscTab:AddSection("funny stuff", {default = false})
local Button = MiscSection:AddButton("Redeem all codes", function()
	game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer("15K")
game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer("AMOGUS")
game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer("WILBIMO")
game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer("BOOM")
end)
