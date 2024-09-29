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
    
    -- Criar um Frame para a notificação
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
    notificationFrame.Position = UDim2.new(0.5, -0.15 * 1920, 0, 0)
    notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.AnchorPoint = Vector2.new(0.5, 0)
    notificationFrame.Parent = screenGui

    -- Criar um Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.5, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 24
    titleLabel.Parent = notificationFrame

    -- Criar uma Mensagem
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, 0, 0.5, 0)
    messageLabel.Position = UDim2.new(0, 0, 0.5, 0)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageLabel.TextSize = 18
    messageLabel.Parent = notificationFrame

    -- Exibir a notificação
    notificationFrame.Visible = true

    -- Remover a notificação após o tempo especificado
    wait(duration)
    notificationFrame:Destroy()
end

return NotificationLibrary
