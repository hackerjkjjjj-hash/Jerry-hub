local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaCustomUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (game:GetService("CoreGui"):FindFirstChild("RobloxGui") and game:GetService("CoreGui")) or LocalPlayer:WaitForChild("PlayerGui")

-- Logo Button (Toggle Open/Close UI)
local OpenButton = Instance.new("ImageButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0, 15, 0.5, -25)
OpenButton.Image = "rbxassetid://131681030058686"
OpenButton.BackgroundTransparency = 1
OpenButton.Parent = ScreenGui

-- Main UI Frame (Draggable)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true -- អាចអូស UI បាន
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Top Header Logo & Title
local MainLogo = Instance.new("ImageLabel")
MainLogo.Name = "MainLogo"
MainLogo.Size = UDim2.new(0, 35, 0, 35)
MainLogo.Position = UDim2.new(0, 10, 0, 8)
MainLogo.Image = "rbxassetid://74724530538319"
MainLogo.BackgroundTransparency = 1
MainLogo.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Position = UDim2.new(0, 50, 0, 8)
Title.Text = "DELTA EXECUTOR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Toggle UI Function
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
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
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    
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
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. (state and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 170, 100) or Color3.fromRGB(45, 45, 45)
        callback(state)
    end)
end

-- 1. Noclip Logic (Optimized & Smooth)
local noclipEnabled = false
local noclipConnection = nil

local function toggleNoclip(state)
    noclipEnabled = state
    
    if noclipEnabled then
        -- បើក Noclip: ដំណើរការ Loop កាត់បន្ថយការ Lag
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
        -- បិទ Noclip: ផ្ដាច់ Loop និងកំណត់ CanCollide មកធម្មតាវិញ
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

createToggleBtn(HomePage, "Noclip", 0, function(state)
    toggleNoclip(state)
end)

-- 2. Fly Logic
local flyEnabled = false
local flyBV, flyBG
createToggleBtn(HomePage, "Fly", 45, function(state)
    flyEnabled = state
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if flyEnabled and hrp then
        flyBV = Instance.new("BodyVelocity", hrp)
        flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        flyBV.Velocity = Vector3.zero
        
        flyBG = Instance.new("BodyGyro", hrp)
        flyBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        flyBG.CFrame = hrp.CFrame
    else
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
    end
end)

RunService.RenderStepped:Connect(function()
    if flyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local cam = workspace.CurrentCamera
        local moveDir = Vector3.zero
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        
        if flyBV then flyBV.Velocity = moveDir * 50 end
        if flyBG then flyBG.CFrame = cam.CFrame end
    end
end)

-- 3. ESP Box Line Logic
local espEnabled = false
local espFolder = Instance.new("Folder", ScreenGui)
espFolder.Name = "ESPFolder"

createToggleBtn(HomePage, "ESP Box Line", 90, function(state)
    espEnabled = state
    if not espEnabled then
        espFolder:ClearAllChildren()
    end
end)

RunService.RenderStepped:Connect(function()
    if not espEnabled then return end
    espFolder:ClearAllChildren()
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = plr.Character
            highlight.FillColor = Color3.fromRGB(255, 50, 50)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Parent = espFolder
        end
    end
end)

---------------------------------------------------------
-- PAGE 2: PLAYER (GOTO Player, Avatar & Username)
---------------------------------------------------------
local TargetBox = Instance.new("TextBox")
TargetBox.Size = UDim2.new(1, 0, 0, 35)
TargetBox.Position = UDim2.new(0, 0, 0, 0)
TargetBox.PlaceholderText = "បញ្ចូល Username ឬ Nickname..."
TargetBox.Text = ""
TargetBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.Font = Enum.Font.SourceSans
TargetBox.TextSize = 14
TargetBox.Parent = PlayerPage
Instance.new("UICorner", TargetBox).CornerRadius = UDim.new(0, 6)

local TargetAvatar = Instance.new("ImageLabel")
TargetAvatar.Size = UDim2.new(0, 75, 0, 75)
TargetAvatar.Position = UDim2.new(0, 0, 0, 45)
TargetAvatar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TargetAvatar.Image = ""
TargetAvatar.Parent = PlayerPage
Instance.new("UICorner", TargetAvatar).CornerRadius = UDim.new(0, 6)

local TargetInfoLabel = Instance.new("TextLabel")
TargetInfoLabel.Size = UDim2.new(1, -85, 0, 35)
TargetInfoLabel.Position = UDim2.new(0, 85, 0, 45)
TargetInfoLabel.Text = "Username: N/A"
TargetInfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetInfoLabel.BackgroundTransparency = 1
TargetInfoLabel.Font = Enum.Font.SourceSans
TargetInfoLabel.TextSize = 15
TargetInfoLabel.Parent = PlayerPage

local GoToBtn = Instance.new("TextButton")
GoToBtn.Size = UDim2.new(1, -85, 0, 35)
GoToBtn.Position = UDim2.new(0, 85, 0, 85)
GoToBtn.Text = "GoTo Player"
GoToBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
GoToBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GoToBtn.Font = Enum.Font.SourceSansBold
GoToBtn.TextSize = 15
GoToBtn.Parent = PlayerPage
Instance.new("UICorner", GoToBtn).CornerRadius = UDim.new(0, 6)

local targetPlayer = nil

TargetBox.FocusLost:Connect(function()
    local search = TargetBox.Text:lower()
    targetPlayer = nil
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():sub(1, #search) == search or p.DisplayName:lower():sub(1, #search) == search then
            targetPlayer = p
            break
        end
    end
    
    if targetPlayer then
        TargetInfoLabel.Text = "User: " .. targetPlayer.Name .. "\nNick: " .. targetPlayer.DisplayName
        TargetAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. targetPlayer.UserId .. "&w=150&h=150"
    else
        TargetInfoLabel.Text = "User: រកមិនឃើញ"
        TargetAvatar.Image = ""
    end
end)

GoToBtn.MouseButton1Click:Connect(function()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        end
    end
end)

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
