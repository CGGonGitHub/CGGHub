--[[
	Made by the real#5282 // CGG // CoolGermanGuy
	you can use the loadstring: to get updates (recommended)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Main.lua"))()
	
	Discord invite: https://discord.gg/qE95VSpvwW
]]--


local Games = {
	[537413528] = "https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Build%20A%20Boat%20For%20Treasure.lua", -- Build A Boat For Treasure
	[5149673492] = "https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Build%20to%20survive%20the%20Bombs!.lua", -- Build To Survive The Bombs!
	[11864536793] ="https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Dig%20to%20OHIO.lua", -- Dig to OHIO
	[9498006165] = "https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Tapping%20Simulator.lua", -- Tapping Simulator
	[6429911702] = "https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Master's%20Difficulty%20Chart%20Obby.lua", -- Master's Difficulty Chart Obby
}

if Games[game.PlaceId] then
	loadstring(game:HttpGet(Games[game.PlaceId]))()
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/CGGHub/main/Games/Universal.lua"))()
end

-- [[ formatting by alyssa#2303 ]]--
