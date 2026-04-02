-- Muscle Legends GUI Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

getgenv().autoFarm = false
getgenv().autoEat = false

-- CREAR GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", Frame)
local FarmBtn = Instance.new("TextButton", Frame)
local EatBtn = Instance.new("TextButton", Frame)

Frame.Size = UDim2.new(0,200,0,150)
Frame.Position = UDim2.new(0,20,0,100)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Active = true
Frame.Draggable = true

Title.Size = UDim2.new(1,0,0,30)
Title.Text = "Muscle Script"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(20,20,20)

FarmBtn.Size = UDim2.new(1,0,0,50)
FarmBtn.Position = UDim2.new(0,0,0,40)
FarmBtn.Text = "Auto Farm: OFF"
FarmBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
FarmBtn.TextColor3 = Color3.new(1,1,1)

EatBtn.Size = UDim2.new(1,0,0,50)
EatBtn.Position = UDim2.new(0,0,0,95)
EatBtn.Text = "Auto Eat: OFF"
EatBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
EatBtn.TextColor3 = Color3.new(1,1,1)

-- BOTONES
FarmBtn.MouseButton1Click:Connect(function()
    getgenv().autoFarm = not getgenv().autoFarm
    FarmBtn.Text = "Auto Farm: " .. (getgenv().autoFarm and "ON" or "OFF")
end)

EatBtn.MouseButton1Click:Connect(function()
    getgenv().autoEat = not getgenv().autoEat
    EatBtn.Text = "Auto Eat: " .. (getgenv().autoEat and "ON" or "OFF")
end)

-- AUTO FARM
task.spawn(function()
    while true do
        task.wait(0.3)

        if not getgenv().autoFarm then continue end

        local char = player.Character
        if not char then continue end

        local durability = player:FindFirstChild("Durability")
        if durability and durability.Value >= 1000000 then
            for _, v in pairs(workspace.machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 1000000 then
                    
                    if char:FindFirstChild("RightHand") and char:FindFirstChild("LeftHand") then
                        firetouchinterest(v.Parent.Rock, char.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, char.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 1)
                    end
                end
            end
        end
    end
end)

-- AUTO EAT
local muscleEvent = player:WaitForChild("muscleEvent")

local foods = {
    "Tropical Shake",
    "Energy Shake",
    "Protein Bar"
}

task.spawn(function()
    while true do
        task.wait(0.5)

        if not getgenv().autoEat then continue end

        for _, item in ipairs(foods) do
            local tool = player.Backpack:FindFirstChild(item)
            if tool then
                muscleEvent:FireServer(item, tool)
            end
        end
    end
end)
