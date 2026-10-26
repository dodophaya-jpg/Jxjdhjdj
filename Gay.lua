-- ตรวจสอบการโหลดเกม
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ป้องกันรันซ้ำ
if game:GetService("CoreGui"):FindFirstChild("BfCousinBypassHub") then
    game:GetService("CoreGui").BfCousinBypassHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BfCousinBypassHub"
ScreenGui.Parent = game:GetService("CoreGui")

-- ฟังก์ชันช่วยใส่ขอบมน (UICorner) ให้ UI ดูสวยงามขึ้น
local function addCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or UDim.new(0, 6)
    corner.Parent = parent
end

-- ==========================================
-- 1. หน้าต่างกรอกคีย์ (Key System UI)
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 190)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -95)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.BorderColor3 = Color3.fromRGB(70, 70, 70)
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui
addCorner(KeyFrame, UDim.new(0, 8))

local TitleKey = Instance.new("TextLabel")
TitleKey.Size = UDim2.new(1, 0, 0, 45)
TitleKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleKey.TextColor3 = Color3.fromRGB(255, 200, 0)
TitleKey.TextSize = 16
TitleKey.Font = Enum.Font.SourceSansBold
TitleKey.Text = "🔐 Blox Fruits Gacha Hub (Real)"
TitleKey.Parent = KeyFrame
addCorner(TitleKey, UDim.new(0, 8))

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -40, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 65)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "Enter Key (e.g., LoL996)"
TextBox.Text = ""
TextBox.TextSize = 14
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = KeyFrame
addCorner(TextBox, UDim.new(0, 6))

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -40, 0, 35)
SubmitBtn.Position = UDim2.new(0, 20, 0, 125)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Text = "Unlock Hub"
SubmitBtn.Parent = KeyFrame
addCorner(SubmitBtn, UDim.new(0, 6))


-- ==========================================
-- 2. หน้าต่างหลัก (Main Hub)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 240)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderColor3 = Color3.fromRGB(70, 70, 70)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
addCorner(MainFrame, UDim.new(0, 8))

local TitleMain = Instance.new("TextLabel")
TitleMain.Size = UDim2.new(1, 0, 0, 45)
TitleMain.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleMain.TextColor3 = Color3.fromRGB(0, 255, 128)
TitleMain.TextSize = 16
TitleMain.Font = Enum.Font.SourceSansBold
TitleMain.Text = "⚡ Cousin Gacha Auto Roller"
TitleMain.Parent = MainFrame
addCorner(TitleMain, UDim.new(0, 8))

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 50)
StatusLabel.Position = UDim2.new(0, 20, 0, 55)
StatusLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.Text = "Status: Ready to Roll from Cousin\n(Requires enough Beli & Cooldown ready)"
StatusLabel.Parent = MainFrame
addCorner(StatusLabel, UDim.new(0, 6))

-- ปุ่มกดสุ่มผลจริงผ่าน CommF_
local RealRollBtn = Instance.new("TextButton")
RealRollBtn.Size = UDim2.new(1, -40, 0, 45)
RealRollBtn.Position = UDim2.new(0, 20, 0, 125)
RealRollBtn.BackgroundColor3 = Color3.fromRGB(200, 120, 0)
RealRollBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RealRollBtn.TextSize = 15
RealRollBtn.Font = Enum.Font.SourceSansBold
RealRollBtn.Text = "🎲 Roll Random Fruit (Real)"
RealRollBtn.Parent = MainFrame
addCorner(RealRollBtn, UDim.new(0, 6))


-- ==========================================
-- ระบบตรวจสอบคีย์
-- ==========================================
local CORRECT_KEY = "LoL996"

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == CORRECT_KEY then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        SubmitBtn.Text = "Wrong Key! (Try LoL996)"
        task.wait(1.5)
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
        SubmitBtn.Text = "Unlock Hub"
    end
end)


-- ==========================================
-- ฟังก์ชันยิง Remote ไปหา Cousin ของจริง
-- ==========================================
local isRolling = false

RealRollBtn.MouseButton1Click:Connect(function()
    if isRolling then return end
    isRolling = true
    
    StatusLabel.Text = "Status: Sending request to Cousin..."
    
    local success, err = pcall(function()
        local remotes = ReplicatedStorage:WaitForChild("Remotes", 3)
        local commF = remotes and remotes:FindFirstChild("CommF_")
        
        if commF then
            local result = commF:InvokeServer("Cousin", "Buy")
            
            if result then
                StatusLabel.Text = "Result: " .. tostring(result)
            else
                StatusLabel.Text = "Status: Success! Check your inventory."
            end
        else
            StatusLabel.Text = "Error: CommF_ Remote not found!"
        end
    end)
    
    if not success then
        StatusLabel.Text = "Error: " .. tostring(err)
    end
    
    task.wait(2)
    isRolling = false
end)

print("Blox Fruits Real Cousin Roller Loaded Successfully!")
