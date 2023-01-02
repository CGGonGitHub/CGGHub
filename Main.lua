local Games = {
	[537413528] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Build%20A%20Boat%20For%20Treasure.lua", -- Build A Boat For Treasure
	[5149673492] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Build%20to%20survive%20the%20Bombs!.lua", -- Build To Survive The Bombs!
	[11864536793] ="https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Dig%20to%20OHIO.lua", -- Dig to OHIO
	[9498006165] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Tapping%20Simulator.lua", -- Tapping Simulator
	[142823291] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/MM2.lua" -- Murder Mystery 2
}

if Games[game.PlaceId] then
	loadstring(game:HttpGet(Games[game.PlaceId]))()
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Universal.lua"))()
end

-- [[ formatting by alyssa#2303 ]]--
