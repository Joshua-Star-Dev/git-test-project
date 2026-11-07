local FurnitureScript = {}
local GeneratedRooms = workspace:WaitForChild("GeneratedRooms")
local FurnitureMain = workspace:WaitForChild("FurnitureMain")
local DeskTemplate = FurnitureMain.ChemDeskModel


print("GeneratedRooms:", GeneratedRooms)
print("DeskTemplate:", DeskTemplate)

if not DeskTemplate then
	error("DeskTemplate is missing!")
end
function FurnitureScript.CreateFurniture(GeneratedRooms)
	print(typeof(GeneratedRooms))

for _, room in pairs(GeneratedRooms) do
		local furnitureFolder = room:FindFirstChild("FurnitureFolder")

if furnitureFolder then 
	for _, furnitureSpawn in pairs(furnitureFolder:GetChildren()) do
		if furnitureSpawn.Colour == BrickColor.new("Bright red") then
			print("fefef")
		end
				local clonedDeskTemplate = DeskTemplate:Clone()
				print("FurnitureSpawn")
				clonedDeskTemplate:PivotTo(furnitureSpawn.CFrame)
				print("Cloned")
				clonedDeskTemplate.Parent = workspace.FurnitureMain
				furnitureSpawn:Destroy()
				--furnitureSpawn.Parent = ChemDeskModel.Parent
				--ChemDesk:Destroy()
	
			end
		end
	end
end

--[[function Furniture.FurnishRoom(Furniture)
	for _, Rooms in pairs(Rooms) do
		local FurnitureFolder = Rooms.FurnitureFolder
		if  FurnitureFolder:GetChildren("furnitureSpawn") then

		end
	end
	
	
end]]

return FurnitureScript
