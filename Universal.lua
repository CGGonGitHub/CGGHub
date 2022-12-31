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
