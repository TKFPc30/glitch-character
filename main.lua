local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

task.spawn(function()
	local meshTypes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}

	for _, partName in pairs({"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}) do    
		local part = char:FindFirstChild(partName)    
		if part then    
			local mesh = part:FindFirstChildOfClass("SpecialMesh") or Instance.new("SpecialMesh", part)    
			mesh.MeshType = Enum.MeshType.Head    
		end    
	end    

	while true do    
		wait(0.1)    
		for _, part in ipairs(char:GetChildren()) do    
			if part:IsA("Part") and part:FindFirstChildOfClass("SpecialMesh") then    
				local mesh = part:FindFirstChildOfClass("SpecialMesh")    
				mesh.MeshType = Enum.MeshType[meshTypes[math.random(1, #meshTypes)]]    
				part.BrickColor = BrickColor.Random()    
			end    
		end    
	end
end)
