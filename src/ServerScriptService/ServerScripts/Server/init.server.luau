local room = require(script.Room)
--local FurnitureScript = require(script.Room.FurnitureScript)
local prevRoom = workspace.StartRoom 

local randomMath = math.random(2,3) 
local maxRooms = 4
local specificRooms = {
	[randomMath] = "LabB12", 
	[maxRooms] = "EndRoom"
}

for i = 1, maxRooms do
 prevRoom = room.Generate(prevRoom, specificRooms[i])
	--local DeskTemplate = workspace.FurnitureMain:FindFirstChild("DeskTemplate")
	--local GeneratedRooms = workspace.GeneratedRooms:GetChildren()
	--FurnitureScript.CreateFurniture(GeneratedRooms)
end






local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local root = character:WaitForChild("HumanoidRootPart")
		root.CFrame = workspace.SpawnLocation.CFrame
		print("teleported")
	end)
end)