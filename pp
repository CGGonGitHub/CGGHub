for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

local Window = Library:AddWindow({
	title = {"Vynixius", "UI Library"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})

local Tab = Window:AddTab("Tab", {default = false})

local Section = Tab:AddSection("Section", {default = false})

local Button = Section:AddButton("Button", function()
	local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
    if key == "f" then
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
                game.ReplicatedStorage.Events.CreateThrow:FireServer(CFrame.new(0,-10000,0), Workspace.thefartmaker101["Corrupt Trident"])
            end
            end
            end
    end
end)
mouse.KeyUp:connect(function(key)
    if key == "f" then
        up = false
    end
end)
end)

local Box = Section:AddBox("Box", {fireonempty = true}, function(text)
    game.ReplicatedStorage.Events.Explode:FireServer()
	local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    _G.target = game.Players[text]

        task.wait(3.85)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.target.Character.HumanoidRootPart.CFrame
end)
function getAllPlayers()
    local playertable =  {}
    for i, v in next, game.Players:GetPlayers() do
        table.insert(playertable, v.Name)
    end
    return playertable
end
local Dropdown = Section:AddDropdown("Target", getAllPlayers(), {default = ""}, function(selected)
    x = tostring(selected)
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

        game.ReplicatedStorage.Events.Explode:FireServer()
        task.wait(3.85)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[x].Character.HumanoidRootPart.CFrame
end)

local Dropdown = Section:AddDropdown("Trap someone ez L", getAllPlayers(), {default = "Item1"}, function(selected)
	playerPos = game.Players.CGGonRoblox.Character.HumanoidRootPart.Position
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
