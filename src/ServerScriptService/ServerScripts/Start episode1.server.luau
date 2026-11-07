--[[
local Players = game:GetService("Players")
local function onPlayerAdded(player)
	local playerGui = player:WaitForChild("PlayerGui")
	local screengui = playerGui:WaitForChild("ScreenGui")
	local textbutton = screengui:WaitForChild("TextButton")
		textbutton.Visible = true
		
end

Players.PlayerAdded:Connect(onPlayerAdded)


StartEpisode1 = game.ReplicatedStorage.RemoteEvents:FindFirstChild("StartEpisode1") --receices mssg from button to start game
StartEpisode1.OnServerEvent:Connect(function(player)
	local playerGui = player:WaitForChild("PlayerGui")
	local screengui = playerGui:WaitForChild("ScreenGui")
	local textbutton = screengui:WaitForChild("TextButton")
	print("start game.Server")
	local character = player.Character -- teleports plr to baseplate
	if character then
		local root = character.HumanoidRootPart
		root.CFrame = workspace.GameObjects.DetectiveOfficeFolder.DetectiveOffice.DetectiveOfficeSpawn.CFrame
		textbutton.Visible = false
		print("teleported")
	end
end)
--]]