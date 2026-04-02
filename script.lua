-- Muscle Legends PRO Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer

getgenv().autoFarm = false
getgenv().autoEat = false
getgenv().autoRebirth = false

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,220,0,220)
frame.Position = UDim2.new(0,20,0,100)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "💪 Muscle Legends PRO"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(15,15,15)

local function makeButton(text, posY)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1,0,0,40)
    btn.Position = UDim2.new(0,0,0,posY)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    return btn
end

local farmBtn = makeButton("Auto Farm: OFF",40)
local eatBtn = makeButton("Auto Eat: OFF",85)
local rebirthBtn = makeButton("Auto Rebirth: OFF",130)
local hideBtn = makeButton("Hide GUI",175)

-- BOTONES
farmBtn.MouseButton1Click:Connect(function()
    getgenv().autoFarm = not getgenv().autoFarm
    farmBtn.Text = "Auto Farm: " .. (getgenv().autoFarm and "ON" or "OFF")
end)

eatBtn.MouseButton1Click:Connect(function()
    getgenv().autoEat = not getgenv().autoEat
    eatBtn.Text =
