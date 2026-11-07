local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryModule = require(ReplicatedStorage.Modules.InventoryModule)
local Inventory = require(
	ReplicatedStorage.Modules.InventoryModule
)

local UpdateHotbar = ReplicatedStorage.Remotes.UpdateHotbar


Players.PlayerAdded:Connect(function(player)

	Inventory.CreateInventory(player)

	UpdateHotbar:FireClient(
		player,
		Inventory.GetInventory(player)
	)

end)


Players.PlayerRemoving:Connect(function(player)

	Inventory.RemovePlayer(player)

end)


local ServerStorage = game:GetService("ServerStorage")

local RemoveItem = ReplicatedStorage.Remotes.RemoveItem

local InventoryModule = require(
	ReplicatedStorage.Modules.InventoryModule
)

local Items = ServerStorage.Items

RemoveItem.OnServerEvent:Connect(function(player, selectedSlot)

	local itemName = InventoryModule.RemoveItem(player, selectedSlot)

	if not itemName then
		return
	end

	-- Find the player's character
	local character = player.Character

	if not character then
		return
	end

	local root = character:FindFirstChild("HumanoidRootPart")

	if not root then
		return
	end

	-- Find the item template
	local itemTemplate = Items:FindFirstChild(itemName)

	if not itemTemplate then
		warn("Couldn't find item:", itemName)
		return
	end

	-- Clone the item
	local item = itemTemplate:Clone()

	-- Put it in Workspace
	item.Parent = workspace.GameObjects.Items

	-- Spawn it 3 studs in front of the player
	local spawnCFrame = root.CFrame * CFrame.new(0, 0, -3)
   
	for _, part in ipairs(item:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Anchored = false
		end
	end

   
	if item:IsA("Model") then
		item:PivotTo(spawnCFrame)
	elseif item:IsA("BasePart") then
		item.CFrame = spawnCFrame
	end

	-- Update the player's hotbar
	local inventory = InventoryModule.PlayerInventories[player]

	UpdateHotbar:FireClient(player, inventory)
	
	for _, part in ipairs(item:GetDescendants()) do
		if part:IsA("BasePart") then
			wait(1)
			part.Anchored = true
		end
	end

end)

