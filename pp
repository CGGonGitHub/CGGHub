local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

local Window = Library:AddWindow({
	title = {"thefartmaker101", "idk"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})

local Tab = Window:AddTab("Main", {default = false})

local Section = Tab:AddSection("Utilities", {default = false})

local Dropdown = Section:AddDropdown("target E", getAllPlayers(), {default = ""}, function(selected)
	local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
_G.target = game.Players[selected]

mouse.KeyDown:connect(function(key)
    if key == "e" then
        task.wait(3.85)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.target.Character.HumanoidRootPart.CFrame
    end
end)
end)

local Button = Section:AddButton("Kill all heheheha", function()
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
