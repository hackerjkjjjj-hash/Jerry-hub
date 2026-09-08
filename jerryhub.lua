-- Jerry HUB Script UI (Draggable, Hacks, Players + Avatar, Profile Info Page)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- លុប UI ចាស់ចោលបើមាន
if CoreGui:FindFirstChild("JerryHubUI") then
    CoreGui.JerryHubUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JerryHub v1.0"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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
ToggleBtn.Active = true
ToggleBtn.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ToggleBtn

-- Main Frame (អូសបាន)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

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

-- Noclip Function
local noclipEnabled = false
local noclipBtn = createButton("Noclip: OFF", 10, hackPage)
noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        noclipBtn.Text = "Noclip: ON"
        noclipBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        noclipBtn.Text = "Noclip: OFF"
        noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

RunService.Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Fly Function
local flying = false
local flyBtn = createButton("Fly: OFF", 65, hackPage)
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local speeds = 50

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        flyBtn.Text = "Fly: ON"
        flyBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local bg = Instance.new("BodyGyro", hrp)
            bg.Name = "FlyGyro"
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.CFrame = hrp.CFrame
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "FlyVelocity"
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            
            task.spawn(function()
                while flying and char and char:FindFirstChild("HumanoidRootPart") do
                    RunService.RenderStepped:Wait()
                    local camera = workspace.CurrentCamera
                    bv.Velocity = ((camera.CFrame.LookVector * (ctrl.f + ctrl.b)) + ((camera.CFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - camera.CFrame.p)) * speeds
                    bg.CFrame = camera.CFrame
                end
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
            end)
        end
    else
        flyBtn.Text = "Fly: OFF"
        flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        flying = false
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if char.HumanoidRootPart:FindFirstChild("FlyGyro") then char.HumanoidRootPart.FlyGyro:Destroy() end
            if char.HumanoidRootPart:FindFirstChild("FlyVelocity") then char.HumanoidRootPart.FlyVelocity:Destroy() end
        end
    end
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
