-- Jerry HUB Fixed for Delta Executor (Mobile & PC Friendly)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- លុប UI ចាស់ចោលបើមាន
if PlayerGui:FindFirstChild("JerryHubUI") then
    PlayerGui.JerryHubUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JerryHubUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Custom Drag Function (ដំណើរការល្អនៅលើទូរស័ព្ទ)
local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragInput, dragStart, startPos
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Button Menu (អូសបាន)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ToggleBtn.Position = UDim2.new(0, 20, 0, 100)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "JERRY"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 170, 0)
ToggleBtn.TextSize = 14

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ToggleBtn
makeDraggable(ToggleBtn, ToggleBtn)

-- Main Frame (អូសបាន)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "JERRY HUB"
Title.TextColor3 = Color3.fromRGB(255, 170, 0)
Title.TextSize = 18
makeDraggable(MainFrame, Title)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Tab Buttons Container
local tabContainer = Instance.new("Frame")
tabContainer.Parent = MainFrame
tabContainer.BackgroundTransparency = 1
tabContainer.Position = UDim2.new(0, 15, 0, 45)
tabContainer.Size = UDim2.new(1, -30, 0, 35)

local function createTabBtn(name, posX)
    local btn = Instance.new("TextButton")
    btn.Parent = tabContainer
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Position = UDim2.new(posX, 0, 0, 0)
    btn.Size = UDim2.new(0.31, 0, 1, 0)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    return btn
end

local hackTabBtn = createTabBtn("Hacks", 0)
local playerTabBtn = createTabBtn("Players", 0.345)
local infoTabBtn = createTabBtn("Profile", 0.69)

-- Pages Container
local pagesContainer = Instance.new("Frame")
pagesContainer.Parent = MainFrame
pagesContainer.BackgroundTransparency = 1
pagesContainer.Position = UDim2.new(0, 15, 0, 90)
pagesContainer.Size = UDim2.new(1, -30, 1, -100)

-- Page 1: Hacks (Noclip, Fly)
local hackPage = Instance.new("ScrollingFrame")
hackPage.Parent = pagesContainer
hackPage.BackgroundTransparency = 1
hackPage.Size = UDim2.new(1, 0, 1, 0)
hackPage.CanvasSize = UDim2.new(0, 0, 0, 200)
hackPage.ScrollBarThickness = 2
hackPage.Visible = true

local function createButton(name, posY, parent)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

-- Noclip Function - Improved
local noclipEnabled = false
local noclipConnection

local function setNoclip(enabled)
    noclipEnabled = enabled

    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end

    if enabled then
        noclipConnection = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if not character then return end

            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.CanCollide = false
                    obj.CanTouch = false
                end
            end
        end)
    else
        local character = LocalPlayer.Character
        if character then
            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.CanCollide = true
                    obj.CanTouch = true
                end
            end
        end
    end
end

local noclipBtn = createButton("Noclip: OFF", 10, hackPage)

noclipBtn.MouseButton1Click:Connect(function()
    setNoclip(not noclipEnabled)

    if noclipEnabled then
        noclipBtn.Text = "Noclip: ON"
        noclipBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        noclipBtn.Text = "Noclip: OFF"
        noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if noclipEnabled then
        setNoclip(true)
    end
end)

-- Improved Fly System
local flying = false
local flySpeed = 60

local flyConnection
local flyVelocity
local flyGyro

local flyBtn = createButton("Fly: OFF", 65, hackPage)

local function stopFly()
    flying = false

    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    if flyVelocity then
        flyVelocity:Destroy()
        flyVelocity = nil
    end

    if flyGyro then
        flyGyro:Destroy()
        flyGyro = nil
    end

    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

local function startFly()
    local character = LocalPlayer.Character
    if not character then return end

    local root = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not root or not humanoid then return end

    flying = true

    humanoid.PlatformStand = true

    flyVelocity = Instance.new("BodyVelocity")
    flyVelocity.Name = "JerryFlyVelocity"
    flyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    flyVelocity.P = 25000
    flyVelocity.Velocity = Vector3.zero
    flyVelocity.Parent = root

    flyGyro = Instance.new("BodyGyro")
    flyGyro.Name = "JerryFlyGyro"
    flyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    flyGyro.P = 25000
    flyGyro.D = 500
    flyGyro.CFrame = workspace.CurrentCamera.CFrame
    flyGyro.Parent = root

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flying then return end

        local currentCharacter = LocalPlayer.Character
        if not currentCharacter then
            stopFly()
            return
        end

        local currentRoot = currentCharacter:FindFirstChild("HumanoidRootPart")
        local currentHumanoid = currentCharacter:FindFirstChildOfClass("Humanoid")

        if not currentRoot or not currentHumanoid then
            stopFly()
            return
        end

        local camera = workspace.CurrentCamera
        if not camera then return end

        -- Camera direction
        local moveDirection = currentHumanoid.MoveDirection

        -- Mobile joystick / PC movement
        if moveDirection.Magnitude > 0 then
            flyVelocity.Velocity = moveDirection * flySpeed
        else
            flyVelocity.Velocity = Vector3.zero
        end

        -- Character follows camera rotation
        local look = camera.CFrame.LookVector

        flyGyro.CFrame = CFrame.lookAt(
            currentRoot.Position,
            currentRoot.Position + look
        )
    end)
end

flyBtn.MouseButton1Click:Connect(function()
    if flying then
        stopFly()

        flyBtn.Text = "Fly: OFF"
        flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        startFly()

        if flying then
            flyBtn.Text = "Fly: ON"
            flyBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    stopFly()

    task.wait(0.5)

    flyBtn.Text = "Fly: OFF"
    flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Page 2: Players List (Avatar + Teleport)
local playerPage = Instance.new("ScrollingFrame")
playerPage.Parent = pagesContainer
playerPage.BackgroundTransparency = 1
playerPage.Size = UDim2.new(1, 0, 1, 0)
playerPage.CanvasSize = UDim2.new(0, 0, 0, 0)
playerPage.ScrollBarThickness = 4
playerPage.Visible = false

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = playerPage
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

local function updatePlayerList()
    for _, child in pairs(playerPage:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local pBtn = Instance.new("TextButton")
            pBtn.Parent = playerPage
            pBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            pBtn.Size = UDim2.new(1, 0, 0, 45)
            pBtn.Font = Enum.Font.SourceSansBold
            pBtn.Text = "       " .. player.Name
            pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            pBtn.TextSize = 14
            pBtn.TextXAlignment = Enum.TextXAlignment.Left

            local pCornerBtn = Instance.new("UICorner")
            pCornerBtn.CornerRadius = UDim.new(0, 8)
            pCornerBtn.Parent = pBtn

            local avatarImg = Instance.new("ImageLabel")
            avatarImg.Parent = pBtn
            avatarImg.BackgroundTransparency = 1
            avatarImg.Position = UDim2.new(0, 5, 0.5, -17)
            avatarImg.Size = UDim2.new(0, 34, 0, 34)
            
            local success, url = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end)
            if success then
                avatarImg.Image = url
            end

            pBtn.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                end
            end)
        end
    end
    playerPage.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
updatePlayerList()

-- Page 3: Profile Info Page (Avatar, Username, Nickname, ID)
local infoPage = Instance.new("Frame")
infoPage.Parent = pagesContainer
infoPage.BackgroundTransparency = 1
infoPage.Size = UDim2.new(1, 0, 1, 0)
infoPage.Visible = false

local myAvatar = Instance.new("ImageLabel")
myAvatar.Parent = infoPage
myAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
myAvatar.Position = UDim2.new(0.5, -45, 0, 10)
myAvatar.Size = UDim2.new(0, 90, 0, 90)
local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = myAvatar

pcall(function()
    myAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)

local function createInfoLabel(textVal, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = infoPage
    lbl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    lbl.Position = UDim2.new(0.05, 0, 0, posY)
    lbl.Size = UDim2.new(0.9, 0, 0, 40)
    lbl.Font = Enum.Font.SourceSansBold
    lbl.Text = textVal
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextSize = 14
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = lbl
    return lbl
end

createInfoLabel(" Username: " .. LocalPlayer.Name, 115)
createInfoLabel(" Nickname: " .. LocalPlayer.DisplayName, 165)
createInfoLabel(" ID Account: " .. tostring(LocalPlayer.UserId), 215)

-- Tab Switch Logic
local function switchTab(activeTab)
    hackPage.Visible = (activeTab == hackPage)
    playerPage.Visible = (activeTab == playerPage)
    infoPage.Visible = (activeTab == infoPage)

    hackTabBtn.BackgroundColor3 = (activeTab == hackPage) and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(40, 40, 40)
    playerTabBtn.BackgroundColor3 = (activeTab == playerPage) and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(40, 40, 40)
    infoTabBtn.BackgroundColor3 = (activeTab == infoPage) and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(40, 40, 40)
    
    hackTabBtn.TextColor3 = (activeTab == hackPage) and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    playerTabBtn.TextColor3 = (activeTab == playerPage) and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    infoTabBtn.TextColor3 = (activeTab == infoPage) and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
end

hackTabBtn.MouseButton1Click:Connect(function() switchTab(hackPage) end)
playerTabBtn.MouseButton1Click:Connect(function() switchTab(playerPage) end)
infoTabBtn.MouseButton1Click:Connect(function() switchTab(infoPage) end)

switchTab(hackPage)
