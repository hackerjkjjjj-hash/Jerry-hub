local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaCustomUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (game:GetService("CoreGui"):FindFirstChild("RobloxGui") and game:GetService("CoreGui")) or LocalPlayer:WaitForChild("PlayerGui")

-- Main UI Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

---------------------------------------------------------
-- Circular Floating Toggle Button (ជាមួយ Texture ID ថ្មី)
---------------------------------------------------------
local OpenButton = Instance.new("ImageButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0, 15, 0.5, -25)
OpenButton.Image = "rbxassetid://135995313313068"
OpenButton.BackgroundTransparency = 1
OpenButton.Active = true
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

local openCorner = Instance.new("UICorner", OpenButton)
openCorner.CornerRadius = UDim.new(1, 0)

local openStroke = Instance.new("UIStroke", OpenButton)
openStroke.Color = Color3.fromRGB(150, 0, 255)
openStroke.Thickness = 2

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

---------------------------------------------------------
-- Top Header Logo, Title & Close Button
---------------------------------------------------------
local MainLogo = Instance.new("ImageLabel")
MainLogo.Name = "MainLogo"
MainLogo.Size = UDim2.new(0, 35, 0, 35)
MainLogo.Position = UDim2.new(0, 10, 0, 8)
MainLogo.Image = "rbxassetid://133870737244711"
MainLogo.BackgroundTransparency = 1
MainLogo.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Position = UDim2.new(0, 50, 0, 8)
Title.Text = "JERRY v1.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0, 10)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Parent = MainFrame

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Sidebar Section
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 110, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

-- Container for Pages
local PageContainer = Instance.new("Frame")
PageContainer.Size = UDim2.new(1, -125, 1, -60)
PageContainer.Position = UDim2.new(0, 120, 0, 55)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

-- Page Instances
local HomePage = Instance.new("Frame", PageContainer)
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true

local PlayerPage = Instance.new("Frame", PageContainer)
PlayerPage.Size = UDim2.new(1, 0, 1, 0)
PlayerPage.BackgroundTransparency = 1
PlayerPage.Visible = false

local InfoPage = Instance.new("Frame", PageContainer)
InfoPage.Size = UDim2.new(1, 0, 1, 0)
InfoPage.BackgroundTransparency = 1
InfoPage.Visible = false

local function hideAllPages()
    HomePage.Visible = false
    PlayerPage.Visible = false
    InfoPage.Visible = false
end

-- Tab Button Generator
local function createTabBtn(name, pos, page)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Parent = Sidebar
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        hideAllPages()
        page.Visible = true
    end)
end

createTabBtn("Home", 10, HomePage)
createTabBtn("Player", 50, PlayerPage)
createTabBtn("Info", 90, InfoPage)

---------------------------------------------------------
-- PAGE 1: HOME (Noclip, Fly, ESP Box Line)
---------------------------------------------------------
local function createToggleBtn(parent, text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, pos)
    btn.Text = text .. " [OFF]"
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 15
    btn.Parent = parent
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. (state and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 170, 100) or Color3.fromRGB(45, 45, 45)
        callback(state)
    end)
end

-- 1. Noclip Logic (Optimized)
local noclipEnabled = false
local noclipConnection = nil

local function toggleNoclip(state)
    noclipEnabled = state
    if noclipEnabled then
        if not noclipConnection then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.Name == "HumanoidRootPart" or part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Torso" or part.Name == "Head" then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
end

createToggleBtn(HomePage, "Noclip", 0, toggleNoclip)

---------------------------------------------------------
-- 2. Fly Logic (Optimized for Mobile & PC)
---------------------------------------------------------
local flyEnabled = false
local flySpeed = 50
local flyConnection = nil
local flyBV, flyBG

local function disableFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    if flyConnection then flyConnection:Disconnect() flyConnection = nil end
    
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Velocity = Vector3.zero
    end
end

createToggleBtn(HomePage, "Fly", 45, function(state)
    flyEnabled = state
    
    if not flyEnabled then
        disableFly()
        return
    end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    
    if not hrp or not humanoid then return end

    -- បង្កើត Physics Controllers សម្រាប់ហោះ
    flyBV = Instance.new("BodyVelocity")
    flyBV.Name = "FlyVelocity"
    flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = hrp

    flyBG = Instance.new("BodyGyro")
    flyBG.Name = "FlyGyro"
    flyBG.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
    flyBG.CFrame = hrp.CFrame
    flyBG.Parent = hrp

    -- Loop សម្រាប់បញ្ជាទិសដៅតាម Camera លើទូរស័ព្ទ និង PC
    flyConnection = RunService.RenderStepped:Connect(function()
        if not flyEnabled or not hrp or not hrp.Parent then
            disableFly()
            return
        end

        local cam = workspace.CurrentCamera
        local moveDir = humanoid.MoveDirection -- ទាញយកទិសដៅដើរពី Joystick ទូរស័ព្ទ ឬ WASD PC

        flyBG.CFrame = cam.CFrame

        if moveDir.Magnitude > 0 then
            -- ហោះទៅមុខតាមទិសដៅដែលក្រឡេកមើល (Camera LookVector)
            local flyVector = (cam.CFrame.LookVector * moveDir.Z * -1) + (cam.CFrame.RightVector * moveDir.X)
            flyBV.Velocity = flyVector * flySpeed
        else
            flyBV.Velocity = Vector3.zero
        end
    end)
end)

-- សម្អាត Fly ស្វ័យប្រវត្តិពេលងាប់ (Respawn)
LocalPlayer.CharacterAdded:Connect(function()
    flyEnabled = false
    disableFly()
end)

---------------------------------------------------------
-- 3. ESP Box + Line Logic (Anti-Cheat Safe & Optimized)
---------------------------------------------------------
local espEnabled = false

-- បង្កើត Folder ជាមួយឈ្មោះ Random ការពារ Anti-Cheat Scan រកឃើញ
local espFolder = Instance.new("Folder")
espFolder.Name = "ESP_Container_" .. math.random(1000, 9999)
espFolder.Parent = ScreenGui

local function removePlayerESP(plr)
    if not espFolder then return end
    local container = espFolder:FindFirstChild(plr.Name)
    if container then
        container:Destroy()
    end
end

local function applyESP(plr)
    if not espEnabled or plr == LocalPlayer or not plr.Character then return end
    
    local char = plr.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    
    if not hrp or not myHRP then return end
    
    removePlayerESP(plr)

    local pContainer = Instance.new("Folder")
    pContainer.Name = plr.Name
    pContainer.Parent = espFolder

    -- 1. ESP Box (BillboardGui ដាក់ក្នុង ScreenGui មិនបន្សល់ក្នុង Character គេ - Safe 100%)
    local bb = Instance.new("BillboardGui")
    bb.Name = "ESPBox"
    bb.Adornee = hrp
    bb.Size = UDim2.new(4, 0, 5.5, 0)
    bb.AlwaysOnTop = true
    bb.Parent = pContainer

    local boxFrame = Instance.new("Frame")
    boxFrame.Size = UDim2.new(1, 0, 1, 0)
    boxFrame.BackgroundTransparency = 1
    boxFrame.Parent = bb

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 1.5
    stroke.Parent = boxFrame

    -- 2. ESP Line / Tracer (Beam)
    local myAttachment = myHRP:FindFirstChild("MyESPAttachment")
    if not myAttachment then
        myAttachment = Instance.new("Attachment")
        myAttachment.Name = "MyESPAttachment"
        myAttachment.Parent = myHRP
    end

    local targetAttachment = hrp:FindFirstChild("TargetESPAttachment")
    if not targetAttachment then
        targetAttachment = Instance.new("Attachment")
        targetAttachment.Name = "TargetESPAttachment"
        targetAttachment.Parent = hrp
    end

    local beam = Instance.new("Beam")
    beam.Name = "ESPLine"
    beam.Attachment0 = myAttachment
    beam.Attachment1 = targetAttachment
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    beam.Width0 = 0.05
    beam.Width1 = 0.05
    beam.FaceCamera = true
    beam.Parent = pContainer
end

local function updateAllESP()
    if not espFolder then return end
    espFolder:ClearAllChildren()
    if not espEnabled then return end
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            applyESP(plr)
        end
    end
end

createToggleBtn(HomePage, "ESP Box Line", 90, function(state)
    espEnabled = state
    updateAllESP()
end)

-- Auto update ពេល Player ថ្មីចូល ឬ Respawn
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(0.5)
        if espEnabled then applyESP(plr) end
    end)
end)

Players.PlayerRemoving:Connect(removePlayerESP)

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        plr.CharacterAdded:Connect(function()
            task.wait(0.5)
            if espEnabled then applyESP(plr) end
        end)
    end
end

---------------------------------------------------------
-- PAGE 2: PLAYER (បង្ហាញ Player ទាំងអស់ក្នុង Server)
---------------------------------------------------------
local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(1, 0, 1, 0)
PlayerScroll.BackgroundTransparency = 1
PlayerScroll.BorderSizePixel = 0
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.Parent = PlayerPage

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = PlayerScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- តម្រូវទំហំ Scrolling ស្វ័យប្រវត្តិតាមចំនួន Player
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

local function refreshPlayerList()
    -- សម្អាត បញ្ជីចាស់ៗ
    for _, item in pairs(PlayerScroll:GetChildren()) do
        if item:IsA("Frame") then
            item:Destroy()
        end
    end

    -- បង្កើត Card សម្រាប់ Player ម្នាក់ៗក្នុង Server
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local Card = Instance.new("Frame")
            Card.Size = UDim2.new(1, -10, 0, 50)
            Card.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Card.Parent = PlayerScroll
            Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 6)

            -- Avatar រូបថត Player
            local Avatar = Instance.new("ImageLabel")
            Avatar.Size = UDim2.new(0, 40, 0, 40)
            Avatar.Position = UDim2.new(0, 5, 0, 5)
            Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150"
            Avatar.BackgroundTransparency = 1
            Avatar.Parent = Card
            Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

            -- ឈ្មោះ Username & Nickname
            local InfoText = Instance.new("TextLabel")
            InfoText.Size = UDim2.new(1, -135, 1, 0)
            InfoText.Position = UDim2.new(0, 50, 0, 0)
            InfoText.Text = plr.DisplayName .. "\n(@" .. plr.Name .. ")"
            InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            InfoText.TextXAlignment = Enum.TextXAlignment.Left
            InfoText.BackgroundTransparency = 1
            InfoText.Font = Enum.Font.SourceSans
            InfoText.TextSize = 13
            InfoText.TextTruncate = Enum.TextTruncate.AtEnd
            InfoText.Parent = Card

            -- ប៊ូតុង GoTo សម្រាប់ Player ម្នាក់ៗ
            local GoTo = Instance.new("TextButton")
            GoTo.Size = UDim2.new(0, 70, 0, 30)
            GoTo.Position = UDim2.new(1, -75, 0, 10)
            GoTo.Text = "GoTo"
            GoTo.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            GoTo.TextColor3 = Color3.fromRGB(255, 255, 255)
            GoTo.Font = Enum.Font.SourceSansBold
            GoTo.TextSize = 14
            GoTo.Parent = Card
            Instance.new("UICorner", GoTo).CornerRadius = UDim.new(0, 6)

            GoTo.MouseButton1Click:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    end
                end
            end)
        end
    end
end

-- Update ស្វ័យប្រវត្តិពេលមាន Player ចូល ឬ ចេញពី Server
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

-- Refresh បញ្ជី Player លើកដំបូង
refreshPlayerList()

---------------------------------------------------------
-- PAGE 3: INFO (My Profile Account Details)
---------------------------------------------------------
local MyAvatar = Instance.new("ImageLabel")
MyAvatar.Size = UDim2.new(0, 85, 0, 85)
MyAvatar.Position = UDim2.new(0, 0, 0, 10)
MyAvatar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MyAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
MyAvatar.Parent = InfoPage
Instance.new("UICorner", MyAvatar).CornerRadius = UDim.new(0, 8)

local MyInfoText = Instance.new("TextLabel")
MyInfoText.Size = UDim2.new(1, -95, 0, 85)
MyInfoText.Position = UDim2.new(0, 95, 0, 10)
MyInfoText.Text = "Username: " .. LocalPlayer.Name .. "\nNickname: " .. LocalPlayer.DisplayName .. "\nAccount ID: " .. LocalPlayer.UserId
MyInfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
MyInfoText.TextXAlignment = Enum.TextXAlignment.Left
MyInfoText.TextYAlignment = Enum.TextYAlignment.Top
MyInfoText.BackgroundTransparency = 1
MyInfoText.Font = Enum.Font.SourceSans
MyInfoText.TextSize = 16
MyInfoText.Parent = InfoPage
