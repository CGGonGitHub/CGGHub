local Games = {
	[537413528] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Build%20A%20Boat%20For%20Treasure.lua", -- Build A Boat For Treasure
	[5149673492] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Build%20to%20survive%20the%20Bombs!.lua", -- Build To Survive The Bombs!
	[9498006165] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Tapping%20Simulator.lua", -- Tapping Simulator
	[142823291] = "https://raw.githubusercontent.com/CGGonGitHub/Loader/main/MM2.lua" -- Murder Mystery 2
}

if Games[game.PlaceId] then
	loadstring(game:HttpGet(Games[game.PlaceId]))()
else
	game.StarterGui:SetCore("SendNotification", {
	    Title = "CGG says";
	    Text = "Game not supported, here is a universal one";
	    Duration = 10;
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Universal.lua"))()
else
    })
end

-- [[ formatting by alyssa#2303 ]]--
