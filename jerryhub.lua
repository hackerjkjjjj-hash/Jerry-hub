local Players = game:GetService("Players")[span_1](start_span)[span_1](end_span)
local LocalPlayer = Players.LocalPlayer[span_2](start_span)[span_2](end_span)
local RunService = game:GetService("RunService")[span_3](start_span)[span_3](end_span)
local UserInputService = game:GetService("UserInputService")[span_4](start_span)[span_4](end_span)

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")[span_5](start_span)[span_5](end_span)
ScreenGui.Name = "DeltaCustomUI[span_6](start_span)"[span_6](end_span)
ScreenGui.ResetOnSpawn = false[span_7](start_span)[span_7](end_span)
ScreenGui.Parent = (game:GetService("CoreGui"):FindFirstChild("RobloxGui") and game:GetService("CoreGui")) or LocalPlayer:WaitForChild("PlayerGui")[span_8](start_span)[span_8](end_span)

-- Main UI Frame
local MainFrame = Instance.new("Frame")[span_9](start_span)[span_9](end_span)
MainFrame.Name = "MainFrame[span_10](start_span)"[span_10](end_span)
MainFrame.Size = UDim2.new(0, 480, 0, 320)[span_11](start_span)[span_11](end_span)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)[span_12](start_span)[span_12](end_span)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)[span_13](start_span)[span_13](end_span)
MainFrame.BorderSizePixel = 0[span_14](start_span)[span_14](end_span)
MainFrame.Visible = true[span_15](start_span)[span_15](end_span)
MainFrame.Active = true[span_16](start_span)[span_16](end_span)
MainFrame.Draggable = true[span_17](start_span)[span_17](end_span)
MainFrame.Parent = ScreenGui[span_18](start_span)[span_18](end_span)

local UICorner = Instance.new("UICorner", MainFrame)[span_19](start_span)[span_19](end_span)
UICorner.CornerRadius = UDim.new(0, 8)[span_20](start_span)[span_20](end_span)

---------------------------------------------------------
-- Circular Floating Toggle Button
---------------------------------------------------------
local OpenButton = Instance.new("ImageButton")[span_21](start_span)[span_21](end_span)
OpenButton.Name = "OpenButton[span_22](start_span)"[span_22](end_span)
OpenButton.Size = UDim2.new(0, 50, 0, 50)[span_23](start_span)[span_23](end_span)
OpenButton.Position = UDim2.new(0, 15, 0.5, -25)[span_24](start_span)[span_24](end_span)
OpenButton.Image = "rbxassetid://135995313313068[span_25](start_span)"[span_25](end_span)
OpenButton.BackgroundTransparency = 1[span_26](start_span)[span_26](end_span)
OpenButton.Active = true[span_27](start_span)[span_27](end_span)
OpenButton.Draggable = true[span_28](start_span)[span_28](end_span)
OpenButton.Parent = ScreenGui[span_29](start_span)[span_29](end_span)

local openCorner = Instance.new("UICorner", OpenButton)[span_30](start_span)[span_30](end_span)
openCorner.CornerRadius = UDim.new(1, 0)[span_31](start_span)[span_31](end_span)

local openStroke = Instance.new("UIStroke", OpenButton)[span_32](start_span)[span_32](end_span)
openStroke.Color = Color3.fromRGB(150, 0, 255)[span_33](start_span)[span_33](end_span)
openStroke.Thickness = 2[span_34](start_span)[span_34](end_span)

OpenButton.MouseButton1Click:Connect(function()[span_35](start_span)[span_35](end_span)
    MainFrame.Visible = not MainFrame.Visible[span_36](start_span)[span_36](end_span)
end)[span_37](start_span)[span_37](end_span)

---------------------------------------------------------
-- Top Header Logo, Title & Close Button
---------------------------------------------------------
local MainLogo = Instance.new("ImageLabel")[span_38](start_span)[span_38](end_span)
MainLogo.Name = "MainLogo[span_39](start_span)"[span_39](end_span)
MainLogo.Size = UDim2.new(0, 35, 0, 35)[span_40](start_span)[span_40](end_span)
MainLogo.Position = UDim2.new(0, 10, 0, 8)[span_41](start_span)[span_41](end_span)
MainLogo.Image = "rbxassetid://133870737244711[span_42](start_span)"[span_42](end_span)
MainLogo.BackgroundTransparency = 1[span_43](start_span)[span_43](end_span)
MainLogo.Parent = MainFrame[span_44](start_span)[span_44](end_span)

local Title = Instance.new("TextLabel")[span_45](start_span)[span_45](end_span)
Title.Size = UDim2.new(0, 200, 0, 35)[span_46](start_span)[span_46](end_span)
Title.Position = UDim2.new(0, 50, 0, 8)[span_47](start_span)[span_47](end_span)
Title.Text = "JERRY v1.0[span_48](start_span)"[span_48](end_span)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)[span_49](start_span)[span_49](end_span)
Title.TextXAlignment = Enum.TextXAlignment.Left[span_50](start_span)[span_50](end_span)
Title.Font = Enum.Font.SourceSansBold[span_51](start_span)[span_51](end_span)
Title.TextSize = 18[span_52](start_span)[span_52](end_span)
Title.BackgroundTransparency = 1[span_53](start_span)[span_53](end_span)
Title.Parent = MainFrame[span_54](start_span)[span_54](end_span)

local CloseBtn = Instance.new("TextButton")[span_55](start_span)[span_55](end_span)
CloseBtn.Name = "CloseBtn[span_56](start_span)"[span_56](end_span)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)[span_57](start_span)[span_57](end_span)
CloseBtn.Position = UDim2.new(1, -38, 0, 10)[span_58](start_span)[span_58](end_span)
CloseBtn.Text = "X[span_59](start_span)"[span_59](end_span)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)[span_60](start_span)[span_60](end_span)
CloseBtn.TextSize = 16[span_61](start_span)[span_61](end_span)
CloseBtn.Font = Enum.Font.SourceSansBold[span_62](start_span)[span_62](end_span)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)[span_63](start_span)[span_63](end_span)
CloseBtn.Parent = MainFrame[span_64](start_span)[span_64](end_span)

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)[span_65](start_span)[span_65](end_span)

CloseBtn.MouseButton1Click:Connect(function()[span_66](start_span)[span_66](end_span)
    MainFrame.Visible = false[span_67](start_span)[span_67](end_span)
end)[span_68](start_span)[span_68](end_span)

-- Sidebar Section
local Sidebar = Instance.new("Frame")[span_69](start_span)[span_69](end_span)
Sidebar.Size = UDim2.new(0, 110, 1, -50)[span_70](start_span)[span_70](end_span)
Sidebar.Position = UDim2.new(0, 0, 0, 50)[span_71](start_span)[span_71](end_span)
Sidebar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)[span_72](start_span)[span_72](end_span)
Sidebar.BorderSizePixel = 0[span_73](start_span)[span_73](end_span)
Sidebar.Parent = MainFrame[span_74](start_span)[span_74](end_span)

-- Container for Pages
local PageContainer = Instance.new("Frame")[span_75](start_span)[span_75](end_span)
PageContainer.Size = UDim2.new(1, -125, 1, -60)[span_76](start_span)[span_76](end_span)
PageContainer.Position = UDim2.new(0, 120, 0, 55)[span_77](start_span)[span_77](end_span)
PageContainer.BackgroundTransparency = 1[span_78](start_span)[span_78](end_span)
PageContainer.Parent = MainFrame[span_79](start_span)[span_79](end_span)

-- Page Instances
local HomePage = Instance.new("Frame", PageContainer)[span_80](start_span)[span_80](end_span)
HomePage.Size = UDim2.new(1, 0, 1, 0)[span_81](start_span)[span_81](end_span)
HomePage.BackgroundTransparency = 1[span_82](start_span)[span_82](end_span)
HomePage.Visible = true[span_83](start_span)[span_83](end_span)

local PlayerPage = Instance.new("Frame", PageContainer)[span_84](start_span)[span_84](end_span)
PlayerPage.Size = UDim2.new(1, 0, 1, 0)[span_85](start_span)[span_85](end_span)
PlayerPage.BackgroundTransparency = 1[span_86](start_span)[span_86](end_span)
PlayerPage.Visible = false[span_87](start_span)[span_87](end_span)

local InfoPage = Instance.new("Frame", PageContainer)[span_88](start_span)[span_88](end_span)
InfoPage.Size = UDim2.new(1, 0, 1, 0)[span_89](start_span)[span_89](end_span)
InfoPage.BackgroundTransparency = 1[span_90](start_span)[span_90](end_span)
InfoPage.Visible = false[span_91](start_span)[span_91](end_span)

local EmotePage = Instance.new("Frame", PageContainer)[span_92](start_span)[span_92](end_span)
EmotePage.Size = UDim2.new(1, 0, 1, 0)[span_93](start_span)[span_93](end_span)
EmotePage.BackgroundTransparency = 1[span_94](start_span)[span_94](end_span)
EmotePage.Visible = false[span_95](start_span)[span_95](end_span)

local AnimPage = Instance.new("Frame", PageContainer)
AnimPage.Size = UDim2.new(1, 0, 1, 0)
AnimPage.BackgroundTransparency = 1
AnimPage.Visible = false

local function hideAllPages()[span_96](start_span)[span_96](end_span)
    HomePage.Visible = false[span_97](start_span)[span_97](end_span)
    PlayerPage.Visible = false[span_98](start_span)[span_98](end_span)
    InfoPage.Visible = false[span_99](start_span)[span_99](end_span)
    EmotePage.Visible = false[span_100](start_span)[span_100](end_span)
    AnimPage.Visible = false
end

-- Tab Button Generator
local function createTabBtn(name, pos, page)[span_101](start_span)[span_101](end_span)
    local btn = Instance.new("TextButton")[span_102](start_span)[span_102](end_span)
    btn.Size = UDim2.new(1, -10, 0, 35)[span_103](start_span)[span_103](end_span)
    btn.Position = UDim2.new(0, 5, 0, pos)[span_104](start_span)[span_104](end_span)
    btn.Text = name[span_105](start_span)[span_105](end_span)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)[span_106](start_span)[span_106](end_span)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)[span_107](start_span)[span_107](end_span)
    btn.Font = Enum.Font.SourceSansBold[span_108](start_span)[span_108](end_span)
    btn.TextSize = 15[span_109](start_span)[span_109](end_span)
    btn.Parent = Sidebar[span_110](start_span)[span_110](end_span)
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)[span_111](start_span)[span_111](end_span)
    
    btn.MouseButton1Click:Connect(function()[span_112](start_span)[span_112](end_span)
        hideAllPages()[span_113](start_span)[span_113](end_span)
        page.Visible = true[span_114](start_span)[span_114](end_span)
    end)[span_115](start_span)[span_115](end_span)
end

createTabBtn("Home", 10, HomePage)[span_116](start_span)[span_116](end_span)
createTabBtn("Player", 50, PlayerPage)[span_117](start_span)[span_117](end_span)
createTabBtn("Info", 90, InfoPage)[span_118](start_span)[span_118](end_span)
createTabBtn("Emotes", 130, EmotePage)[span_119](start_span)[span_119](end_span)
createTabBtn("Animations", 170, AnimPage)

---------------------------------------------------------
-- PAGE 1: HOME (Noclip, Fly, ESP Box Line, Anti-AFK)
---------------------------------------------------------
local function createToggleBtn(parent, text, pos, callback)[span_120](start_span)[span_120](end_span)
    local btn = Instance.new("TextButton")[span_121](start_span)[span_121](end_span)
    btn.Size = UDim2.new(1, 0, 0, 35)[span_122](start_span)[span_122](end_span)
    btn.Position = UDim2.new(0, 0, 0, pos)[span_123](start_span)[span_123](end_span)
    btn.Text = text .. " [OFF][span_124](start_span)"[span_124](end_span)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)[span_125](start_span)[span_125](end_span)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)[span_126](start_span)[span_126](end_span)
    btn.Font = Enum.Font.SourceSans[span_127](start_span)[span_127](end_span)
    btn.TextSize = 15[span_128](start_span)[span_128](end_span)
    btn.Parent = parent[span_129](start_span)[span_129](end_span)
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)[span_130](start_span)[span_130](end_span)
    
    local state = false[span_131](start_span)[span_131](end_span)
    btn.MouseButton1Click:Connect(function()[span_132](start_span)[span_132](end_span)
        state = not state[span_133](start_span)[span_133](end_span)
        btn.Text = text .. (state and " [ON]" or " [OFF]")[span_134](start_span)[span_134](end_span)
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 170, 100) or Color3.fromRGB(45, 45, 45)[span_135](start_span)[span_135](end_span)
        callback(state)[span_136](start_span)[span_136](end_span)
    end)[span_137](start_span)[span_137](end_span)
end

-- 1. Noclip Logic
local noclipEnabled = false[span_138](start_span)[span_138](end_span)
local noclipConnection = nil[span_139](start_span)[span_139](end_span)

local function toggleNoclip(state)[span_140](start_span)[span_140](end_span)
    noclipEnabled = state[span_141](start_span)[span_141](end_span)
    if noclipEnabled then[span_142](start_span)[span_142](end_span)
        if not noclipConnection then[span_143](start_span)[span_143](end_span)
            noclipConnection = RunService.Stepped:Connect(function()[span_144](start_span)[span_144](end_span)
                local char = LocalPlayer.Character[span_145](start_span)[span_145](end_span)
                if char then[span_146](start_span)[span_146](end_span)
                    for _, part in ipairs(char:GetDescendants()) do[span_147](start_span)[span_147](end_span)
                        if part:IsA("BasePart") then[span_148](start_span)[span_148](end_span)
                            part.CanCollide = false[span_149](start_span)[span_149](end_span)
                        end[span_150](start_span)[span_150](end_span)
                    end[span_151](start_span)[span_151](end_span)
                end[span_152](start_span)[span_152](end_span)
            end)[span_153](start_span)[span_153](end_span)
        end[span_154](start_span)[span_154](end_span)
    else[span_155](start_span)[span_155](end_span)
        if noclipConnection then[span_156](start_span)[span_156](end_span)
            noclipConnection:Disconnect()[span_157](start_span)[span_157](end_span)
            noclipConnection = nil[span_158](start_span)[span_158](end_span)
        end[span_159](start_span)[span_159](end_span)
        local char = LocalPlayer.Character[span_160](start_span)[span_160](end_span)
        if char then[span_161](start_span)[span_161](end_span)
            for _, part in ipairs(char:GetDescendants()) do[span_162](start_span)[span_162](end_span)
                if part:IsA("BasePart") then[span_163](start_span)[span_163](end_span)
                    if part.Name == "HumanoidRootPart" or part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Torso" or part.Name == "Head" then[span_164](start_span)[span_164](end_span)
                        part.CanCollide = true[span_165](start_span)[span_165](end_span)
                    end[span_166](start_span)[span_166](end_span)
                end[span_167](start_span)[span_167](end_span)
            end[span_168](start_span)[span_168](end_span)
        end[span_169](start_span)[span_169](end_span)
    end[span_170](start_span)[span_170](end_span)
end

createToggleBtn(HomePage, "Noclip", 0, toggleNoclip)[span_171](start_span)[span_171](end_span)

-- 2. Fly Logic
local flyEnabled = false[span_172](start_span)[span_172](end_span)
local flySpeed = 50[span_173](start_span)[span_173](end_span)
local flyConnection = nil[span_174](start_span)[span_174](end_span)
local flyBV, flyBG[span_175](start_span)[span_175](end_span)

local function disableFly()[span_176](start_span)[span_176](end_span)
    if flyBV then flyBV:Destroy() flyBV = nil end[span_177](start_span)[span_177](end_span)
    if flyBG then flyBG:Destroy() flyBG = nil end[span_178](start_span)[span_178](end_span)
    if flyConnection then flyConnection:Disconnect() flyConnection = nil end[span_179](start_span)[span_179](end_span)
    
    local char = LocalPlayer.Character[span_180](start_span)[span_180](end_span)
    local hrp = char and char:FindFirstChild("HumanoidRootPart")[span_181](start_span)[span_181](end_span)
    if hrp then[span_182](start_span)[span_182](end_span)
        hrp.Velocity = Vector3.zero[span_183](start_span)[span_183](end_span)
    end[span_184](start_span)[span_184](end_span)
end

createToggleBtn(HomePage, "Fly", 45, function(state)[span_185](start_span)[span_185](end_span)
    flyEnabled = state[span_186](start_span)[span_186](end_span)
    
    if not flyEnabled then[span_187](start_span)[span_187](end_span)
        disableFly()[span_188](start_span)[span_188](end_span)
        return[span_189](start_span)[span_189](end_span)
    end[span_190](start_span)[span_190](end_span)

    local char = LocalPlayer.Character[span_191](start_span)[span_191](end_span)
    local hrp = char and char:FindFirstChild("HumanoidRootPart")[span_192](start_span)[span_192](end_span)
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")[span_193](start_span)[span_193](end_span)
    
    if not hrp or not humanoid then return end[span_194](start_span)[span_194](end_span)

    flyBV = Instance.new("BodyVelocity")[span_195](start_span)[span_195](end_span)
    flyBV.Name = "FlyVelocity[span_196](start_span)"[span_196](end_span)
    flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)[span_197](start_span)[span_197](end_span)
    flyBV.Velocity = Vector3.zero[span_198](start_span)[span_198](end_span)
    flyBV.Parent = hrp[span_199](start_span)[span_199](end_span)

    flyBG = Instance.new("BodyGyro")[span_200](start_span)[span_200](end_span)
    flyBG.Name = "FlyGyro[span_201](start_span)"[span_201](end_span)
    flyBG.MaxTorque = Vector3.new(1e6, 1e6, 1e6)[span_202](start_span)[span_202](end_span)
    flyBG.CFrame = hrp.CFrame[span_203](start_span)[span_203](end_span)
    flyBG.Parent = hrp[span_204](start_span)[span_204](end_span)

    flyConnection = RunService.RenderStepped:Connect(function()[span_205](start_span)[span_205](end_span)
        if not flyEnabled or not hrp or not hrp.Parent then[span_206](start_span)[span_206](end_span)
            disableFly()[span_207](start_span)[span_207](end_span)
            return[span_208](start_span)[span_208](end_span)
        end[span_209](start_span)[span_209](end_span)

        local cam = workspace.CurrentCamera[span_210](start_span)[span_210](end_span)
        local moveDir = humanoid.MoveDirection[span_211](start_span)[span_211](end_span)

        flyBG.CFrame = cam.CFrame[span_212](start_span)[span_212](end_span)

        if moveDir.Magnitude > 0 then[span_213](start_span)[span_213](end_span)
            local flyVector = (cam.CFrame.LookVector * moveDir.Z * -1) + (cam.CFrame.RightVector * moveDir.X)[span_214](start_span)[span_214](end_span)
            flyBV.Velocity = flyVector * flySpeed[span_215](start_span)[span_215](end_span)
        else[span_216](start_span)[span_216](end_span)
            flyBV.Velocity = Vector3.zero[span_217](start_span)[span_217](end_span)
        end[span_218](start_span)[span_218](end_span)
    end)[span_219](start_span)[span_219](end_span)
end)[span_220](start_span)[span_220](end_span)

LocalPlayer.CharacterAdded:Connect(function()[span_221](start_span)[span_221](end_span)
    flyEnabled = false[span_222](start_span)[span_222](end_span)
    disableFly()[span_223](start_span)[span_223](end_span)
end)[span_224](start_span)[span_224](end_span)

-- 3. ESP Box + Line Logic
local espEnabled = false[span_225](start_span)[span_225](end_span)
local espFolder = Instance.new("Folder")[span_226](start_span)[span_226](end_span)
espFolder.Name = "ESP_Container_" .. math.random(1000, 9999)[span_227](start_span)[span_227](end_span)
espFolder.Parent = ScreenGui[span_228](start_span)[span_228](end_span)

local function removePlayerESP(plr)[span_229](start_span)[span_229](end_span)
    if not espFolder then return end[span_230](start_span)[span_230](end_span)
    local container = espFolder:FindFirstChild(plr.Name)[span_231](start_span)[span_231](end_span)
    if container then[span_232](start_span)[span_232](end_span)
        container:Destroy()[span_233](start_span)[span_233](end_span)
    end[span_234](start_span)[span_234](end_span)
end[span_235](start_span)[span_235](end_span)

local function applyESP(plr)[span_236](start_span)[span_236](end_span)
    if not espEnabled or plr == LocalPlayer or not plr.Character then return end[span_237](start_span)[span_237](end_span)
    
    local char = plr.Character[span_238](start_span)[span_238](end_span)
    local hrp = char:FindFirstChild("HumanoidRootPart")[span_239](start_span)[span_239](end_span)
    local myChar = LocalPlayer.Character[span_240](start_span)[span_240](end_span)
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")[span_241](start_span)[span_241](end_span)
    
    if not hrp or not myHRP then return end[span_242](start_span)[span_242](end_span)
    
    removePlayerESP(plr)[span_243](start_span)[span_243](end_span)

    local pContainer = Instance.new("Folder")[span_244](start_span)[span_244](end_span)
    pContainer.Name = plr.Name[span_245](start_span)[span_245](end_span)
    pContainer.Parent = espFolder[span_246](start_span)[span_246](end_span)

    local bb = Instance.new("BillboardGui")[span_247](start_span)[span_247](end_span)
    bb.Name = "ESPBox[span_248](start_span)"[span_248](end_span)
    bb.Adornee = hrp[span_249](start_span)[span_249](end_span)
    bb.Size = UDim2.new(4, 0, 5.5, 0)[span_250](start_span)[span_250](end_span)
    bb.AlwaysOnTop = true[span_251](start_span)[span_251](end_span)
    bb.Parent = pContainer[span_252](start_span)[span_252](end_span)

    local boxFrame = Instance.new("Frame")[span_253](start_span)[span_253](end_span)
    boxFrame.Size = UDim2.new(1, 0, 1, 0)[span_254](start_span)[span_254](end_span)
    boxFrame.BackgroundTransparency = 1[span_255](start_span)[span_255](end_span)
    boxFrame.Parent = bb[span_256](start_span)[span_256](end_span)

    local stroke = Instance.new("UIStroke")[span_257](start_span)[span_257](end_span)
    stroke.Color = Color3.fromRGB(255, 0, 0)[span_258](start_span)[span_258](end_span)
    stroke.Thickness = 1.5[span_259](start_span)[span_259](end_span)
    stroke.Parent = boxFrame[span_260](start_span)[span_260](end_span)

    local myAttachment = myHRP:FindFirstChild("MyESPAttachment")[span_261](start_span)[span_261](end_span)
    if not myAttachment then[span_262](start_span)[span_262](end_span)
        myAttachment = Instance.new("Attachment")[span_263](start_span)[span_263](end_span)
        myAttachment.Name = "MyESPAttachment[span_264](start_span)"[span_264](end_span)
        myAttachment.Parent = myHRP[span_265](start_span)[span_265](end_span)
    end[span_266](start_span)[span_266](end_span)

    local targetAttachment = hrp:FindFirstChild("TargetESPAttachment")[span_267](start_span)[span_267](end_span)
    if not targetAttachment then[span_268](start_span)[span_268](end_span)
        targetAttachment = Instance.new("Attachment")[span_269](start_span)[span_269](end_span)
        targetAttachment.Name = "TargetESPAttachment[span_270](start_span)"[span_270](end_span)
        targetAttachment.Parent = hrp[span_271](start_span)[span_271](end_span)
    end[span_272](start_span)[span_272](end_span)

    local beam = Instance.new("Beam")[span_273](start_span)[span_273](end_span)
    beam.Name = "ESPLine[span_274](start_span)"[span_274](end_span)
    beam.Attachment0 = myAttachment[span_275](start_span)[span_275](end_span)
    beam.Attachment1 = targetAttachment[span_276](start_span)[span_276](end_span)
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))[span_277](start_span)[span_277](end_span)
    beam.Width0 = 0.05[span_278](start_span)[span_278](end_span)
    beam.Width1 = 0.05[span_279](start_span)[span_279](end_span)
    beam.FaceCamera = true[span_280](start_span)[span_280](end_span)
    beam.Parent = pContainer[span_281](start_span)[span_281](end_span)
end[span_282](start_span)[span_282](end_span)

local function updateAllESP()[span_283](start_span)[span_283](end_span)
    if not espFolder then return end[span_284](start_span)[span_284](end_span)
    espFolder:ClearAllChildren()[span_285](start_span)[span_285](end_span)
    if not espEnabled then return end[span_286](start_span)[span_286](end_span)
    
    for _, plr in pairs(Players:GetPlayers()) do[span_287](start_span)[span_287](end_span)
        if plr ~= LocalPlayer and plr.Character then[span_288](start_span)[span_288](end_span)
            applyESP(plr)[span_289](start_span)[span_289](end_span)
        end[span_290](start_span)[span_290](end_span)
    end[span_291](start_span)[span_291](end_span)
end[span_292](start_span)[span_292](end_span)

createToggleBtn(HomePage, "ESP Box Line", 90, function(state)[span_293](start_span)[span_293](end_span)
    espEnabled = state[span_294](start_span)[span_294](end_span)
    updateAllESP()[span_295](start_span)[span_295](end_span)
end)[span_296](start_span)[span_296](end_span)

Players.PlayerAdded:Connect(function(plr)[span_297](start_span)[span_297](end_span)
    plr.CharacterAdded:Connect(function()[span_298](start_span)[span_298](end_span)
        task.wait(0.5)[span_299](start_span)[span_299](end_span)
        if espEnabled then applyESP(plr) end[span_300](start_span)[span_300](end_span)
    end)[span_301](start_span)[span_301](end_span)
end)[span_302](start_span)[span_302](end_span)

Players.PlayerRemoving:Connect(removePlayerESP)[span_303](start_span)[span_303](end_span)

for _, plr in pairs(Players:GetPlayers()) do[span_304](start_span)[span_304](end_span)
    if plr ~= LocalPlayer then[span_305](start_span)[span_305](end_span)
        plr.CharacterAdded:Connect(function()[span_306](start_span)[span_306](end_span)
            task.wait(0.5)[span_307](start_span)[span_307](end_span)
            if espEnabled then applyESP(plr) end[span_308](start_span)[span_308](end_span)
        end)[span_309](start_span)[span_309](end_span)
    end[span_310](start_span)[span_310](end_span)
end[span_311](start_span)[span_311](end_span)

-- 4. Anti-AFK Logic
local VirtualUser = game:GetService("VirtualUser")[span_312](start_span)[span_312](end_span)
local antiAFKConnection = nil[span_313](start_span)[span_313](end_span)

createToggleBtn(HomePage, "Anti-AFK Infinity", 135, function(state)[span_314](start_span)[span_314](end_span)
    if state then[span_315](start_span)[span_315](end_span)
        antiAFKConnection = LocalPlayer.Idled:Connect(function()[span_316](start_span)[span_316](end_span)
            VirtualUser:CaptureController()[span_317](start_span)[span_317](end_span)
            VirtualUser:ClickButton2(Vector2.new())[span_318](start_span)[span_318](end_span)
        end)[span_319](start_span)[span_319](end_span)
    else[span_320](start_span)[span_320](end_span)
        if antiAFKConnection then[span_321](start_span)[span_321](end_span)
            antiAFKConnection:Disconnect()[span_322](start_span)[span_322](end_span)
            antiAFKConnection = nil[span_323](start_span)[span_323](end_span)
        end[span_324](start_span)[span_324](end_span)
    end[span_325](start_span)[span_325](end_span)
end)[span_326](start_span)[span_326](end_span)

---------------------------------------------------------
-- PAGE 2: PLAYER
---------------------------------------------------------
local PlayerScroll = Instance.new("ScrollingFrame")[span_327](start_span)[span_327](end_span)
PlayerScroll.Size = UDim2.new(1, 0, 1, 0)[span_328](start_span)[span_328](end_span)
PlayerScroll.BackgroundTransparency = 1[span_329](start_span)[span_329](end_span)
PlayerScroll.BorderSizePixel = 0[span_330](start_span)[span_330](end_span)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)[span_331](start_span)[span_331](end_span)
PlayerScroll.ScrollBarThickness = 4[span_332](start_span)[span_332](end_span)
PlayerScroll.Parent = PlayerPage[span_333](start_span)[span_333](end_span)

local UIListLayout = Instance.new("UIListLayout")[span_334](start_span)[span_334](end_span)
UIListLayout.Parent = PlayerScroll[span_335](start_span)[span_335](end_span)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder[span_336](start_span)[span_336](end_span)
UIListLayout.Padding = UDim.new(0, 8)[span_337](start_span)[span_337](end_span)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()[span_338](start_span)[span_338](end_span)
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)[span_339](start_span)[span_339](end_span)
end)[span_340](start_span)[span_340](end_span)

local function refreshPlayerList()[span_341](start_span)[span_341](end_span)
    for _, item in pairs(PlayerScroll:GetChildren()) do[span_342](start_span)[span_342](end_span)
        if item:IsA("Frame") then[span_343](start_span)[span_343](end_span)
            item:Destroy()[span_344](start_span)[span_344](end_span)
        end[span_345](start_span)[span_345](end_span)
    end[span_346](start_span)[span_346](end_span)

    for _, plr in pairs(Players:GetPlayers()) do[span_347](start_span)[span_347](end_span)
        if plr ~= LocalPlayer then[span_348](start_span)[span_348](end_span)
            local Card = Instance.new("Frame")[span_349](start_span)[span_349](end_span)
            Card.Size = UDim2.new(1, -10, 0, 50)[span_350](start_span)[span_350](end_span)
            Card.BackgroundColor3 = Color3.fromRGB(35, 35, 35)[span_351](start_span)[span_351](end_span)
            Card.Parent = PlayerScroll[span_352](start_span)[span_352](end_span)
            Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 6)[span_353](start_span)[span_353](end_span)

            local Avatar = Instance.new("ImageLabel")[span_354](start_span)[span_354](end_span)
            Avatar.Size = UDim2.new(0, 40, 0, 40)[span_355](start_span)[span_355](end_span)
            Avatar.Position = UDim2.new(0, 5, 0, 5)[span_356](start_span)[span_356](end_span)
            Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150[span_357](start_span)"[span_357](end_span)
            Avatar.BackgroundTransparency = 1[span_358](start_span)[span_358](end_span)
            Avatar.Parent = Card[span_359](start_span)[span_359](end_span)
            Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)[span_360](start_span)[span_360](end_span)

            local InfoText = Instance.new("TextLabel")[span_361](start_span)[span_361](end_span)
            InfoText.Size = UDim2.new(1, -135, 1, 0)[span_362](start_span)[span_362](end_span)
            InfoText.Position = UDim2.new(0, 50, 0, 0)[span_363](start_span)[span_363](end_span)
            InfoText.Text = plr.DisplayName .. "\n(@" .. plr.Name .. ")[span_364](start_span)"[span_364](end_span)
            InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)[span_365](start_span)[span_365](end_span)
            InfoText.TextXAlignment = Enum.TextXAlignment.Left[span_366](start_span)[span_366](end_span)
            InfoText.BackgroundTransparency = 1[span_367](start_span)[span_367](end_span)
            InfoText.Font = Enum.Font.SourceSans[span_368](start_span)[span_368](end_span)
            InfoText.TextSize = 13[span_369](start_span)[span_369](end_span)
            InfoText.TextTruncate = Enum.TextTruncate.AtEnd[span_370](start_span)[span_370](end_span)
            InfoText.Parent = Card[span_371](start_span)[span_371](end_span)

            local GoTo = Instance.new("TextButton")[span_372](start_span)[span_372](end_span)
            GoTo.Size = UDim2.new(0, 70, 0, 30)[span_373](start_span)[span_373](end_span)
            GoTo.Position = UDim2.new(1, -75, 0, 10)[span_374](start_span)[span_374](end_span)
            GoTo.Text = "GoTo[span_375](start_span)"[span_375](end_span)
            GoTo.BackgroundColor3 = Color3.fromRGB(0, 120, 215)[span_376](start_span)[span_376](end_span)
            GoTo.TextColor3 = Color3.fromRGB(255, 255, 255)[span_377](start_span)[span_377](end_span)
            GoTo.Font = Enum.Font.SourceSansBold[span_378](start_span)[span_378](end_span)
            GoTo.TextSize = 14[span_379](start_span)[span_379](end_span)
            GoTo.Parent = Card[span_380](start_span)[span_380](end_span)
            Instance.new("UICorner", GoTo).CornerRadius = UDim.new(0, 6)[span_381](start_span)[span_381](end_span)

            GoTo.MouseButton1Click:Connect(function()[span_382](start_span)[span_382](end_span)
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then[span_383](start_span)[span_383](end_span)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then[span_384](start_span)[span_384](end_span)
                        LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)[span_385](start_span)[span_385](end_span)
                    end[span_386](start_span)[span_386](end_span)
                end[span_387](start_span)[span_387](end_span)
            end)[span_388](start_span)[span_388](end_span)
        end[span_389](start_span)[span_389](end_span)
    end[span_390](start_span)[span_390](end_span)
end[span_391](start_span)[span_391](end_span)

Players.PlayerAdded:Connect(refreshPlayerList)[span_392](start_span)[span_392](end_span)
Players.PlayerRemoving:Connect(refreshPlayerList)[span_393](start_span)[span_393](end_span)
refreshPlayerList()[span_394](start_span)[span_394](end_span)

---------------------------------------------------------
-- PAGE 3: INFO
---------------------------------------------------------
local MyAvatar = Instance.new("ImageLabel")[span_395](start_span)[span_395](end_span)
MyAvatar.Size = UDim2.new(0, 85, 0, 85)[span_396](start_span)[span_396](end_span)
MyAvatar.Position = UDim2.new(0, 0, 0, 10)[span_397](start_span)[span_397](end_span)
MyAvatar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)[span_398](start_span)[span_398](end_span)
MyAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150[span_399](start_span)"[span_399](end_span)
MyAvatar.Parent = InfoPage[span_400](start_span)[span_400](end_span)
Instance.new("UICorner", MyAvatar).CornerRadius = UDim.new(0, 8)[span_401](start_span)[span_401](end_span)

local MyInfoText = Instance.new("TextLabel")[span_402](start_span)[span_402](end_span)
MyInfoText.Size = UDim2.new(1, -95, 0, 85)[span_403](start_span)[span_403](end_span)
MyInfoText.Position = UDim2.new(0, 95, 0, 10)[span_404](start_span)[span_404](end_span)
MyInfoText.Text = "Username: " .. LocalPlayer.Name .. "\nNickname: " .. LocalPlayer.DisplayName .. "\nAccount ID: " .. LocalPlayer.UserId[span_405](start_span)[span_405](end_span)
MyInfoText.TextColor3 = Color3.fromRGB(255, 255, 255)[span_406](start_span)[span_406](end_span)
MyInfoText.TextXAlignment = Enum.TextXAlignment.Left[span_407](start_span)[span_407](end_span)
MyInfoText.TextYAlignment = Enum.TextYAlignment.Top[span_408](start_span)[span_408](end_span)
MyInfoText.BackgroundTransparency = 1[span_409](start_span)[span_409](end_span)
MyInfoText.Font = Enum.Font.SourceSans[span_410](start_span)[span_410](end_span)
MyInfoText.TextSize = 16[span_411](start_span)[span_411](end_span)
MyInfoText.Parent = InfoPage[span_412](start_span)[span_412](end_span)

---------------------------------------------------------
-- PAGE 4: EMOTES
---------------------------------------------------------
local currentTrack = nil[span_413](start_span)[span_413](end_span)

local function playEmote(animId)[span_414](start_span)[span_414](end_span)
    local char = LocalPlayer.Character[span_415](start_span)[span_415](end_span)
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")[span_416](start_span)[span_416](end_span)
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")[span_417](start_span)[span_417](end_span)
    
    if animator then[span_418](start_span)[span_418](end_span)
        if currentTrack then[span_419](start_span)[span_419](end_span)
            currentTrack:Stop()[span_420](start_span)[span_420](end_span)
        end[span_421](start_span)[span_421](end_span)
        
        local anim = Instance.new("Animation")[span_422](start_span)[span_422](end_span)
        anim.AnimationId = "rbxassetid://" .. tostring(animId)[span_423](start_span)[span_423](end_span)
        
        currentTrack = animator:LoadAnimation(anim)[span_424](start_span)[span_424](end_span)
        currentTrack:Play()[span_425](start_span)[span_425](end_span)
    end[span_426](start_span)[span_426](end_span)
end[span_427](start_span)[span_427](end_span)

local StopEmoteBtn = Instance.new("TextButton")[span_428](start_span)[span_428](end_span)
StopEmoteBtn.Size = UDim2.new(1, 0, 0, 30)[span_429](start_span)[span_429](end_span)
StopEmoteBtn.Position = UDim2.new(0, 0, 0, 0)[span_430](start_span)[span_430](end_span)
StopEmoteBtn.Text = "Stop Emote[span_431](start_span)"[span_431](end_span)
StopEmoteBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)[span_432](start_span)[span_432](end_span)
StopEmoteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)[span_433](start_span)[span_433](end_span)
StopEmoteBtn.Font = Enum.Font.SourceSansBold[span_434](start_span)[span_434](end_span)
StopEmoteBtn.TextSize = 14[span_435](start_span)[span_435](end_span)
StopEmoteBtn.Parent = EmotePage[span_436](start_span)[span_436](end_span)
Instance.new("UICorner", StopEmoteBtn).CornerRadius = UDim.new(0, 6)[span_437](start_span)[span_437](end_span)

StopEmoteBtn.MouseButton1Click:Connect(function()[span_438](start_span)[span_438](end_span)
    if currentTrack then[span_439](start_span)[span_439](end_span)
        currentTrack:Stop()[span_440](start_span)[span_440](end_span)
        currentTrack = nil[span_441](start_span)[span_441](end_span)
    end[span_442](start_span)[span_442](end_span)
end)[span_443](start_span)[span_443](end_span)

local EmoteScroll = Instance.new("ScrollingFrame")[span_444](start_span)[span_444](end_span)
EmoteScroll.Size = UDim2.new(1, 0, 1, -38)[span_445](start_span)[span_445](end_span)
EmoteScroll.Position = UDim2.new(0, 0, 0, 38)[span_446](start_span)[span_446](end_span)
EmoteScroll.BackgroundTransparency = 1[span_447](start_span)[span_447](end_span)
EmoteScroll.BorderSizePixel = 0[span_448](start_span)[span_448](end_span)
EmoteScroll.ScrollBarThickness = 4[span_449](start_span)[span_449](end_span)
EmoteScroll.Parent = EmotePage[span_450](start_span)[span_450](end_span)

local UIGrid = Instance.new("UIGridLayout")[span_451](start_span)[span_451](end_span)
UIGrid.CellSize = UDim2.new(0, 105, 0, 35)[span_452](start_span)[span_452](end_span)
UIGrid.CellPadding = UDim2.new(0, 8, 0, 8)[span_453](start_span)[span_453](end_span)
UIGrid.Parent = EmoteScroll[span_454](start_span)[span_454](end_span)

UIGrid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()[span_455](start_span)[span_455](end_span)
    EmoteScroll.CanvasSize = UDim2.new(0, 0, 0, UIGrid.AbsoluteContentSize.Y + 10)[span_456](start_span)[span_456](end_span)
end)[span_457](start_span)[span_457](end_span)

local emoteList = {[span_458](start_span)[span_458](end_span)
    {Name = "Floss", ID = 5915773155},[span_459](start_span)[span_459](end_span)
    {Name = "Dab", ID = 2743286196},[span_460](start_span)[span_460](end_span)
    {Name = "Stadium", ID = 3337966581},[span_461](start_span)[span_461](end_span)
    {Name = "Tilt", ID = 3337973718},[span_462](start_span)[span_462](end_span)
    {Name = "Shrug", ID = 3337969828},[span_463](start_span)[span_463](end_span)
    {Name = "Point", ID = 3337968369},[span_464](start_span)[span_464](end_span)
    {Name = "Salute", ID = 3338025257},[span_465](start_span)[span_465](end_span)
    {Name = "Wave", ID = 3338026826},[span_466](start_span)[span_466](end_span)
    {Name = "Cheer", ID = 3338002931},[span_467](start_span)[span_467](end_span)
    {Name = "Laugh", ID = 3338008828},[span_468](start_span)[span_468](end_span)
    {Name = "Dance 1", ID = 3337985387},[span_469](start_span)[span_469](end_span)
    {Name = "Dance 2", ID = 3337988892},[span_470](start_span)[span_470](end_span)
    {Name = "Dance 3", ID = 3337994332},[span_471](start_span)[span_471](end_span)
    {Name = "Zombie", ID = 3338018241},[span_472](start_span)[span_472](end_span)
    {Name = "Infinite", ID = 10714340552},[span_473](start_span)[span_473](end_span)
}[span_474](start_span)[span_474](end_span)

for _, data in ipairs(emoteList) do[span_475](start_span)[span_475](end_span)
    local btn = Instance.new("TextButton")[span_476](start_span)[span_476](end_span)
    btn.Text = data.Name[span_477](start_span)[span_477](end_span)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)[span_478](start_span)[span_478](end_span)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)[span_479](start_span)[span_479](end_span)
    btn.Font = Enum.Font.SourceSansBold[span_480](start_span)[span_480](end_span)
    btn.TextSize = 13[span_481](start_span)[span_481](end_span)
    btn.Parent = EmoteScroll[span_482](start_span)[span_482](end_span)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)[span_483](start_span)[span_483](end_span)
    
    btn.MouseButton1Click:Connect(function()[span_484](start_span)[span_484](end_span)
        playEmote(data.ID)[span_485](start_span)[span_485](end_span)
    end)[span_486](start_span)[span_486](end_span)
end[span_487](start_span)[span_487](end_span)

---------------------------------------------------------
-- PAGE 5: ANIMATIONS
---------------------------------------------------------
local animTrack = nil

local function playAnim(animId)
    local char = LocalPlayer.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    
    if animator then
        if animTrack then
            animTrack:Stop()
        end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://" .. tostring(animId)
        
        animTrack = animator:LoadAnimation(anim)
        animTrack:Play()
    end
end

-- 1. Stop Animation Button
local StopAnimBtn = Instance.new("TextButton")
StopAnimBtn.Size = UDim2.new(1, 0, 0, 30)
StopAnimBtn.Position = UDim2.new(0, 0, 0, 0)
StopAnimBtn.Text = "Stop Animation"
StopAnimBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StopAnimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopAnimBtn.Font = Enum.Font.SourceSansBold
StopAnimBtn.TextSize = 14
StopAnimBtn.Parent = AnimPage
Instance.new("UICorner", StopAnimBtn).CornerRadius = UDim.new(0, 6)

StopAnimBtn.MouseButton1Click:Connect(function()
    if animTrack then
        animTrack:Stop()
        animTrack = nil
    end
end)

-- 2. Custom Animation ID Box & Play Button
local CustomAnimBox = Instance.new("TextBox")
CustomAnimBox.Size = UDim2.new(0.7, -5, 0, 32)
CustomAnimBox.Position = UDim2.new(0, 0, 0, 36)
CustomAnimBox.PlaceholderText = "Enter Animation ID..."
CustomAnimBox.Text = ""
CustomAnimBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CustomAnimBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomAnimBox.Font = Enum.Font.SourceSans
CustomAnimBox.TextSize = 14
CustomAnimBox.Parent = AnimPage
Instance.new("UICorner", CustomAnimBox).CornerRadius = UDim.new(0, 6)

local PlayCustomBtn = Instance.new("TextButton")
PlayCustomBtn.Size = UDim2.new(0.3, 0, 0, 32)
PlayCustomBtn.Position = UDim2.new(0.7, 5, 0, 36)
PlayCustomBtn.Text = "Play"
PlayCustomBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
PlayCustomBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayCustomBtn.Font = Enum.Font.SourceSansBold
PlayCustomBtn.TextSize = 14
PlayCustomBtn.Parent = AnimPage
Instance.new("UICorner", PlayCustomBtn).CornerRadius = UDim.new(0, 6)

PlayCustomBtn.MouseButton1Click:Connect(function()
    local id = tonumber(CustomAnimBox.Text)
    if id then
        playAnim(id)
    end
end)

-- 3. Preset Animations Container
local AnimScroll = Instance.new("ScrollingFrame")
AnimScroll.Size = UDim2.new(1, 0, 1, -75)
AnimScroll.Position = UDim2.new(0, 0, 0, 75)
AnimScroll.BackgroundTransparency = 1
AnimScroll.BorderSizePixel = 0
AnimScroll.ScrollBarThickness = 4
AnimScroll.Parent = AnimPage

local AnimGrid = Instance.new("UIGridLayout")
AnimGrid.CellSize = UDim2.new(0, 105, 0, 35)
AnimGrid.CellPadding = UDim2.new(0, 8, 0, 8)
AnimGrid.Parent = AnimScroll

AnimGrid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    AnimScroll.CanvasSize = UDim2.new(0, 0, 0, AnimGrid.AbsoluteContentSize.Y + 10)
end)

local animPresets = {
    {Name = "Ninja Run", ID = 656118852},
    {Name = "Zombie Idle", ID = 616158929},
    {Name = "Levitation", ID = 616008087},
    {Name = "Vampire Walk", ID = 1083445855},
    {Name = "Superhero Fly", ID = 616117082},
    {Name = "Sit Down", ID = 2506281703},
    {Name = "Lay Down", ID = 313762630},
    {Name = "Head Spin", ID = 188632011},
    {Name = "Float Idle", ID = 616006778},
    {Name = "Mage Float", ID = 708553116},
}

for _, data in ipairs(animPresets) do
    local btn = Instance.new("TextButton")
    btn.Text = data.Name
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = AnimScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        playAnim(data.ID)
    end)
end
