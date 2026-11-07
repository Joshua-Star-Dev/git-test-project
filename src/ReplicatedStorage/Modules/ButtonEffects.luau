local ButtonEffects = {}
local button = script.Parent
local TweenService = game:GetService("TweenService")

function ButtonEffects.applyHoverEffect(button)
	local imageLabel = button:WaitForChild("ImageLabel")

	-- Center the button
	button.AnchorPoint = Vector2.new(0.5, 0.5)
	button.Position = UDim2.new(0.5, 0, 0.5, 0)

	-- Make image fill button
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	imageLabel.Position = UDim2.new(0, 0, 0, 0)

	local normalSize = UDim2.new(0, 667, 0, 357)
	local hoverSize = UDim2.new(0, 700, 0, 390)

	button.Size = normalSize

	button.MouseEnter:Connect(function()
		local tween = TweenService:Create(
			button,
			TweenInfo.new(0.2),
			{Size = UDim2.new(0, 680, 0, 370)}
		)
		tween:Play()
	end)

	button.MouseLeave:Connect(function()
		local tween = TweenService:Create(
			button,
			TweenInfo.new(0.2),
			{Size = UDim2.new(0, 667, 0, 357)}
		)
		tween:Play()
	end)
end

function ButtonEffects.ButtonSizes(ClassifiedFolderImage, XButton, LabTeleport, Letter)
	--print(ClassifiedFolderImage)
	--print(XButton)
	--print(LabTeleport)
	--print(Letter)
	ClassifiedFolderImage.Visible = true
	ClassifiedFolderImage.Size = UDim2.new(0, 714, 0, 424)
	ClassifiedFolderImage.Position = UDim2.new(0.143, 0, 0.044, 0)
	ClassifiedFolderImage.AnchorPoint = Vector2.new(0,0)
	XButton.Visible = true
	XButton.Size = UDim2.new(0, 24, 0, 25)
	XButton.Position = UDim2.new(0.999, 0, -0.05, 0)
	XButton.AnchorPoint = Vector2.new(0,0)
	LabTeleport.Visible = true
	LabTeleport.Size = UDim2.new(0, 255, 0, 52)
	LabTeleport.Position = UDim2.new(0.077, 0, 0.439, 0)
	LabTeleport.AnchorPoint = Vector2.new(0,0)
	Letter.Visible = true
	Letter.AnchorPoint = Vector2.new(0,0)
	Letter.Size = UDim2.new(0, 311, 0, 386)
	Letter.Position = UDim2.new(0.51, 0, 0.042, 0)
end

function ButtonEffects.applyClickEffect(XButton, ClassifiedFolderImage, LabTeleport, Letter)
	-- Make sure it shrinks toward its center
	print(ClassifiedFolderImage)
	print(ClassifiedFolderImage.ClassName)
	print(XButton)
	print(XButton.ClassName)
	XButton.MouseButton1Click:Connect(function()
		local tween = TweenService:Create(
			ClassifiedFolderImage,
			TweenInfo.new(
				0.2,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{Size = UDim2.new(0, 0, 0, 0)}
		)

		tween:Play()

		tween.Completed:Connect(function()
			ClassifiedFolderImage.Visible = false

		end)

	end)
end


return ButtonEffects
