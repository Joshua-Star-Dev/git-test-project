local items = game.ServerStorage.Items:GetChildren()

local itemSpawnsFolder = game.Workspace.GameObjects.ItemSpawns
local itemSpawns = itemSpawnsFolder:GetChildren()


function spawnItem(itemName)

	-- Pick a random number
	local randomNumber = math.random(1, #itemSpawns)

	-- Find Spawn1, Spawn2, or Spawn3
	local randomSpawn = itemSpawnsFolder:FindFirstChild("Spawn" .. randomNumber)

	print("Random number:", randomNumber)
	print("Random spawn:", randomSpawn)

	-- Find the item
	for _, item in pairs(items) do

		if item.Name == itemName then

			local clone = item:Clone()
			clone.Parent = game.Workspace.GameObjects.Items

			clone:PivotTo(randomSpawn.CFrame)

			for _, part in ipairs(clone:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Anchored = true
				end
			end

			return
		end
	end

	warn("Could not find item:", itemName)
end


spawnItem("KeyCard")