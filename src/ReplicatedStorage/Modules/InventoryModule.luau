local Inventory = {}
local maxSlots = 4
Inventory.PlayerInventories = {}
function Inventory.CreateInventory(player)
	Inventory.PlayerInventories[player] = {
		[1] = nil,
		[2] = nil,
		[3] = nil,
		[4] = nil,

	}
end


function Inventory.AddItem(player, itemName)

	local inventory = Inventory.PlayerInventories[player]

	if not inventory then
		return nil
	end

	for slot = 1, maxSlots do

		if inventory[slot] == nil then
			inventory[slot] = itemName
			--inventory[slot] = image
			return slot
		end

	end

	return nil
end


function Inventory.RemoveItem(player, slot)
	local inventory = Inventory.PlayerInventories[player]

	if not inventory then
		return nil
	end

	local itemName = inventory[slot]

	if not itemName then
		return nil
	end

	inventory[slot] = nil

	return itemName
end


function Inventory.GetInventory(player)
	return Inventory.PlayerInventories[player]
end

function Inventory.HasItem(player, itemName)

	local inventory = Inventory.PlayerInventories[player]

	if not inventory then
		return false
	end

	for _, item in pairs(inventory) do
		if item == itemName then
			return true
		end
	end

	return false
end

function Inventory.RemovePlayer(player)
	Inventory.PlayerInventories[player] = nil
end

return Inventory

