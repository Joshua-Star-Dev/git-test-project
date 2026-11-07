local room = {}
room.info = require(script.RoomInfo)
room.LastTurnDirection = nil
room.Random = Random.new()
local LabB12 = workspace.Rooms.LabB12
local LabA1 = workspace.Rooms.LabA1
local LabA2 = workspace.Rooms.LabA2
local ServerStorage = game:GetService("ServerStorage")

local Items = ServerStorage:WaitForChild("Items")
local KeyCard = Items:WaitForChild("KeyCard")


function room.GetRandom(prevRoom)
	local possibleRooms = workspace.Rooms:GetChildren()
	local randomRoom = possibleRooms[room.Random:NextInteger(1,#possibleRooms)]
	--[1] next room must be different from the previous room
	--[2] if there is a corner must use opposite corner
	local direction = room.info[randomRoom.Name]["Direction"]
	local weight = room.info[randomRoom.Name]["weight"]
	
	if (prevRoom.Name == randomRoom.Name)
		or (direction and direction == room.LastTurnDirection) or  (prevRoom == LabA1)  or (prevRoom == LabA2) or (weight == 0)
	then
		print("HIIII")
		return room.GetRandom(prevRoom)
	else 
		return randomRoom
	end		
	
end

function room.SpawnKeyCard(newRoom)

	print("=== SPAWN KEYCARD START ===")
	print("Room:", newRoom.Name)

	local itemSpawns = newRoom:FindFirstChild("ItemSpawns")

	if not itemSpawns then
		warn("NO ITEMSPAWNS FOUND IN:", newRoom.Name)
		return
	end

	print("Found ItemSpawns:", itemSpawns:GetFullName())

	local spawns = itemSpawns:GetChildren()

	print("Number of spawns:", #spawns)

	if #spawns == 0 then
		warn("ITEMSPAWNS IS EMPTY IN:", newRoom.Name)
		return
	end

	local randomSpawn = spawns[room.Random:NextInteger(1, #spawns)]

	print("Chosen spawn:", randomSpawn.Name)
	print("Spawn CFrame:", randomSpawn.CFrame)

	print("KeyCard template:", KeyCard)

	local clone = KeyCard:Clone()

	print("KeyCard cloned:", clone.Name)

	clone.Parent = workspace.GameObjects.Items

	print("KeyCard parent:", clone.Parent:GetFullName())

	clone:PivotTo(randomSpawn.CFrame)

	print("KeyCard moved to:", clone:GetPivot().Position)

	for _, part in ipairs(clone:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Anchored = true
		end
	end

	print("=== SPAWN KEYCARD FINISHED ===")

end


function room.Generate(prevRoom, specificRoomsName)
	local newRoom =nil
	
	local randomRoom = room.GetRandom(prevRoom)
	newRoom = randomRoom:Clone()
	
	if specificRoomsName and workspace.Rooms:FindFirstChild(specificRoomsName) then
		newRoom = workspace.Rooms[specificRoomsName]:Clone()
		print("HEYYY")
	end

	newRoom.PrimaryPart = newRoom.Entrance
	newRoom.Entrance.Transparency = 1
	newRoom:PivotTo(prevRoom.Exit.CFrame)

if newRoom:FindFirstChild("Exit")  then
		newRoom.Exit.Transparency = 1	
	end
	
	newRoom.PrimaryPart = newRoom.Entrance
	newRoom.Entrance.Transparency = 1
	newRoom.Parent = workspace.GeneratedRooms
	
	room.SpawnKeyCard(newRoom)
	
	return newRoom
end
return room
