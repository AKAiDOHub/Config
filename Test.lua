-- NotificationLibrary.lua
local NotificationLibrary = {}
local Players = game:GetService("Players")

-- Criar um ScreenGui para a notificação
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

function NotificationLibrary:CreateNotification(options)
    local title = options.Title
    local message = options.Message
    local duration = options.Duration
    local transparency = options.Transparency
    
    -- Criar um Frame para a notificação
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 120, 0, 80)
    notificationFrame.Position = UDim2.new(0.5, 200, 0.5, 250)
    notificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.AnchorPoint = Vector2.new(0.5, 0)
    notificationFrame.Parent = screenGui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 18)
    uiCorner.Parent = notificationFrame
    
    local TitleFrame = Instance.new("Frame")
    TitleFrame.Size = UDim2.new(1, 0, 0, 30)
    TitleFrame.Position = UDim2.new(0, 0, 0, 0)
    TitleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Parent = screenGui
    
    local uiCorner1 = Instance.new("UICorner")
    uiCorner1.CornerRadius = UDim.new(0, 18)
    uiCorner1.Parent = TitleFrame
    
    local TitleFrame2 = Instance.new("Frame")
    TitleFrame2.Size = UDim2.new(1, 0, 0, 15)
    TitleFrame2.Position = UDim2.new(0, 0, 0, 15)
    TitleFrame2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleFrame2.BorderSizePixel = 0
    TitleFrame2.Parent = screenGui
    
    -- Criar um Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    titleLabel.TextSize = 24
    titleLabel.Parent = TitleFrame

    -- Criar uma Mensagem
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, 0, 0.5, 0)
    messageLabel.Position = UDim2.new(0, 0, 0, 45)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    messageLabel.TextScaled = true
    messageLabel.Parent = notificationFrame

    -- Exibir a notificação
    notificationFrame.Visible = true

    -- Remover a notificação após o tempo especificado
    wait(duration)
    notificationFrame:Destroy()
end

return NotificationLibrary

