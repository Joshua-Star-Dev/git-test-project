local players = game.Players:GetPlayers() -- gets all players then puts in lobby spawn
for _, player in pairs(players) do
	local character = player.Character -- teleports plr to baseplate
	if character then
		local root = character.HumanoidRootPart
		root.CFrame = workspace.GameObjects.Lobby.LobbySpawn.CFrame
		print("teleported")
		 
        end
	end

function GameStart(players)
	print("game started")
	wait(2)
	for _, player in pairs(players) do
		local character = player.Character -- teleports plr to baseplate
		if character then
			local root = character.HumanoidRootPart
			root.CFrame = workspace.GameObjects.Lobby.CitySpawn.CFrame
			print("teleported")

		end
	end
end
function GameEnd(players)
	print("game ended")
	wait(2)
	for _, player in pairs(players) do
		local character = player.Character -- teleports plr to baseplate
		if character then
			local root = character.HumanoidRootPart
			root.CFrame = workspace.GameObjects.Lobby.LobbySpawn.CFrame
			print("teleported")
		end	
	end 
end


local playercount = #game.Players:GetPlayers()
local minimumplayers = game.
if playercount >= minimumplayers then
		print("teleported")
		GameStart()
		wait(300)
		GameEnd()
	end































--[[local RoundConfig = require(game.ReplicatedStorage:WaitForChild("RoundConfig"))

while true do  -- infinite loop for lobby requirements
	wait(1) -- wait 1 second
	local lobbytime = RoundConfig.lobbytime
	local roundtime = RoundConfig.roundtime
	local minimumplayers = RoundConfig.minimumplayers
	local playercount = #game.Players:GetPlayers()
	
	if playercount >= minimumplayers then
		print("enough players")
		StartCountdown = RoundConfig.lobbytime
		wait(30)
		return
	  end
	end
end


--[[local ReplicatedStorage = game:GetService("ReplicatedStorage") -- makes sure their are no ghost groups
local Players = game:GetService("Players")
local activeGroups = ReplicatedStorage:WaitForChild("ActiveGroups")

Players.PlayerRemoving:Connect(function(player)
	-- Destroy their group if they leave the Roblox server
	local playerGroup = activeGroups:FindFirstChild(player.Name .. "s_Group")
	if playerGroup then
		playerGroup:Destroy()
	end
end)
--]]