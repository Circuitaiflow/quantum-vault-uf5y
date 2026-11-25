local PlayerService = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local localPlayer = PlayerService.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local isToggled = false
local flySpeed = 70

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Q then
        isToggled = not isToggled
    end
end)

RunService.RenderStepped:Connect(function()
    if isToggled and character:FindFirstChild("Humanoid") then
        local moveDirection = character.Humanoid.MoveDirection
        if moveDirection.Magnitude > 0 then
            rootPart.CFrame = rootPart.CFrame + (moveDirection * (flySpeed / 10))
        end
        rootPart.Velocity = Vector3.new(0, 0.1, 0)
    end
end)
