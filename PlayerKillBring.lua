
local PlayerControl = Instance.new("ScreenGui")
local Menu = Instance.new("Frame")
local Targetbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local Kill = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Bring = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local Goto = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

PlayerControl.Name = "PlayerControl"
PlayerControl.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerControl.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PlayerControl.ResetOnSpawn = false

Menu.Name = "Menu"
Menu.Parent = PlayerControl
Menu.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
Menu.Position = UDim2.new(0.644702238, 0, 0.515789449, 0)
Menu.Size = UDim2.new(0.154679045, 0, 0.25029242, 0)
Menu.Visible = false

Targetbox.Name = "Targetbox"
Targetbox.Parent = Menu
Targetbox.BackgroundColor3 = Color3.fromRGB(197, 197, 197)
Targetbox.Size = UDim2.new(1, 0, 0.116822436, 0)
Targetbox.Font = Enum.Font.SourceSans
Targetbox.PlaceholderText = "[Write player name]"
Targetbox.Text = "[Write player name]"
Targetbox.TextColor3 = Color3.fromRGB(0, 0, 0)
Targetbox.TextScaled = true
Targetbox.TextSize = 14.000
Targetbox.TextWrapped = true

UICorner.Parent = Targetbox

UICorner_2.Parent = Menu

Kill.Name = "Kill"
Kill.Parent = Menu
Kill.BackgroundColor3 = Color3.fromRGB(173, 173, 173)
Kill.Position = UDim2.new(0.0250000004, 0, 0.166364431, 0)
Kill.Size = UDim2.new(0.949999988, 0, 0.210280374, 0)
Kill.Font = Enum.Font.Code
Kill.Text = "Kill"
Kill.TextColor3 = Color3.fromRGB(0, 0, 0)
Kill.TextScaled = true
Kill.TextSize = 14.000
Kill.TextWrapped = true

UICorner_3.Parent = Kill

Bring.Name = "Bring"
Bring.Parent = Menu
Bring.BackgroundColor3 = Color3.fromRGB(173, 173, 173)
Bring.Position = UDim2.new(0.0250000004, 0, 0.423373759, 0)
Bring.Size = UDim2.new(0.949999988, 0, 0.210280374, 0)
Bring.Font = Enum.Font.Code
Bring.Text = " Bring"
Bring.TextColor3 = Color3.fromRGB(0, 0, 0)
Bring.TextScaled = true
Bring.TextSize = 14.000
Bring.TextWrapped = true

UICorner_4.Parent = Bring

Goto.Name = "Goto"
Goto.Parent = Menu
Goto.BackgroundColor3 = Color3.fromRGB(173, 173, 173)
Goto.Position = UDim2.new(0.0250000004, 0, 0.694401741, 0)
Goto.Size = UDim2.new(0.949999988, 0, 0.210280374, 0)
Goto.Font = Enum.Font.Code
Goto.Text = "Goto"
Goto.TextColor3 = Color3.fromRGB(0, 0, 0)
Goto.TextScaled = true
Goto.TextSize = 14.000
Goto.TextWrapped = true

UICorner_5.Parent = Goto

TextLabel.Parent = Menu
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0, 0, 0.904682159, 0)
TextLabel.Size = UDim2.new(1, 0, 0.0953178033, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Made by GHOSTY#5159"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000
------------------------------------------------------
local plr = game:GetService('Players').LocalPlayer
local mouse = plr:GetMouse()
local Visible = false
mouse.KeyDown:Connect(function(key)
if key == 'g' then
    if Visible then
        Menu.Visible = false
        Visible = false
    elseif Visible == false then
        Visible = true
        Menu.Visible = true
    end
end
end)
local function callback(Text)
end
 
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
 
game.StarterGui:SetCore("SendNotification", {
    Title = "Welcome!";
    Text = "G to open Menu";
    Duration = "5";
    Callback = NotificationBindable;
})
Kill.MouseButton1Click:Connect(function()
    local pgoint = Targetbox.Text
local point = string.lower(pgoint)
print(point)
for _,b in pairs(game:GetService('Players'):GetChildren()) do
    player = string.lower(b.Name)
    dispay = string.lower(b.DisplayName)
    print(player)
if string.find(player, point) or string.find(dispay, point) then
    target = b.Name
    print(target)
end
end
    
local plr = game:GetService('Players').LocalPlayer
for _,object in pairs(plr.Character:GetChildren()) do
    if object:IsA('Tool') then
        htool = object
    end
end
local tool = htool.Name
local camera = game.workspace.CurrentCamera
local humanoid = plr.Character:FindFirstChild('Humanoid')
if game:GetService('Players'):FindFirstChild(target) then
humanoid:UnequipTools()
local newhum = humanoid:Clone()
newhum.Name = 'Humanoid'
newhum.Parent = plr.Character
humanoid:Destroy()
camera.CameraSubject = plr.Character
newhum:EquipTool(plr.Backpack:FindFirstChild(tool))
while not plr.Parent[target].Character:FindFirstChild(tool) do
    wait()
    plr.Character.HumanoidRootPart.CFrame = plr.Parent[target].Character.HumanoidRootPart.CFrame
end
wait(0.05)
local teleport = plr.Character.HumanoidRootPart
teleport.CFrame = CFrame.new(0,-200,0)
wait(1)
newhum.Health = 0
plr.Character.UpperTorso:BreakJoints()
plr.Character.Torso:BreakJoints()
newhum:Destroy()
end
end)
Goto.MouseButton1Click:Connect(function()
    local pgoint = Targetbox.Text
local point = string.lower(pgoint)
print(point)
for _,b in pairs(game:GetService('Players'):GetChildren()) do
    player = string.lower(b.Name)
    dispay = string.lower(b.DisplayName)
    print(player)
if string.find(player, point) or string.find(dispay, point) then
    target = b.Name
    print(target)
end
end
    
local plr = game:GetService('Players').LocalPlayer
plr.Character.HumanoidRootPart.CFrame = plr.Parent[target].Character.HumanoidRootPart.CFrame
end)

Bring.MouseButton1Click:Connect(function()
        local pgoint = Targetbox.Text
local point = string.lower(pgoint)
print(point)
for _,b in pairs(game:GetService('Players'):GetChildren()) do
    player = string.lower(b.Name)
    dispay = string.lower(b.DisplayName)
    print(player)
if string.find(player, point) or string.find(dispay, point) then
    target = b.Name
    print(target)
end
end
    
local plr = game:GetService('Players').LocalPlayer
for _,object in pairs(plr.Character:GetChildren()) do
    if object:IsA('Tool') then
        htool = object
    end
end
pos = plr.Character.HumanoidRootPart.CFrame
local tool = htool.Name
local camera = game.workspace.CurrentCamera
local humanoid = plr.Character:FindFirstChild('Humanoid')
if game:GetService('Players'):FindFirstChild(target) then
humanoid:UnequipTools()
local newhum = humanoid:Clone()
newhum.Name = 'Humanoid'
newhum.Parent = plr.Character
humanoid:Destroy()
camera.CameraSubject = plr.Character
newhum:EquipTool(plr.Backpack:FindFirstChild(tool))
while not plr.Parent[target].Character:FindFirstChild(tool) do
    wait()
    plr.Character.HumanoidRootPart.CFrame = plr.Parent[target].Character.HumanoidRootPart.CFrame
end
wait(0.05)
local teleport = plr.Character.HumanoidRootPart
teleport.CFrame = pos
wait(1)
newhum.Health = 0
plr.Character.UpperTorso:BreakJoints()
plr.Character.Torso:BreakJoints()
while newhum do
wait()
end
plr.Character.HumanoidRootPart.CFrame = pos
end
end)