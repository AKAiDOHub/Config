
local UILibrary = {}

function UILibrary:CreateUI(config)
    local tabs = {}
    local currentTab

    -- Configurações padrão
    config = config or {}
    local titleText = config.title or "Título"
    local subtitleText = config.subtitle or "Subtítulo"
    local menuHeight = config.menuHeight or 260
    local menuLargura = config.menuLargura or 400
    local tabNames = config.tabs or {"Tab 1"}

    -- Criar ScreenGui
    local screen = Instance.new("ScreenGui")
    screen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Criar Frame para o menu
    local frameMenu = Instance.new("Frame")
    frameMenu.Size = UDim2.new(0, menuLargura, 0, menuHeight)
    frameMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
    frameMenu.AnchorPoint = Vector2.new(0.5, 0.5)
    frameMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frameMenu.BorderSizePixel = 0
    frameMenu.Visible = false
    frameMenu.Active = true
    frameMenu.Draggable = true
    frameMenu.Parent = screen
    
    local U = Instance.new("UICorner")
    U.CornerRadius = UDim.new(0, 12)
    U.Parent = frameMenu

    -- Barra de título
    local frameTitle = Instance.new("Frame")
    frameTitle.Size = UDim2.new(1, 0, 0, 30)
    frameTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frameTitle.BorderSizePixel = 0
    frameTitle.Parent = frameMenu
    
    local U1 = U:Clone()
    U1.Parent = frameTitle

    local frameT = Instance.new("Frame")
    frameT.Size = UDim2.new(1, 0, 0.5, 0)
    frameMenu.Position = UDim2.new(0, 0, 0.5, 0)
    frameT.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frameT.BorderSizePixel = 0
    frameT.Parent = frameTitle

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 7, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    titleLabel.Text = titleText
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frameTitle

    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subtitleLabel.Position = UDim2.new(0, 87, 0, 0)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitleLabel.Text = subtitleText
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subtitleLabel.Parent = frameTitle

    -- Barra de abas
    local tabBar = Instance.new("Frame")
    tabBar.Size = UDim2.new(0, 120, 0, menuHeight - 60)
    tabBar.Position = UDim2.new(0, 10, 0, 40)
    tabBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tabBar.BorderSizePixel = 0
    tabBar.Parent = frameMenu

    local U2 = U:Clone()
    U2.Parent = tabBar
    
    -- Criar abas
    for i, tabName in ipairs(tabNames) do
        local buttonTab = Instance.new("TextButton")
        buttonTab.Size = UDim2.new(0, 107, 0, 25)
        buttonTab.Position = UDim2.new(0, 7, 0, 7 + (i - 1) * 32)
        buttonTab.BackgroundTransparency = 1
        buttonTab.Text = tabName
        buttonTab.TextScaled = true
        buttonTab.TextColor3 = Color3.fromRGB(240, 240, 240)
        buttonTab.Parent = tabBar
        
        local tabFrameT = Instance.new("ScrollingFrame")
        tabFrameT.Size = UDim2.new(0, 257, 0, 200)
        tabFrameT.Position = UDim2.new(0, 137, 0, 40)
        tabFrameT.BackgroundTransparency = 1
        tabFrameT.BorderSizePixel = 0
        tabFrameT.Visible = false
        tabFrameT.Parent = frameMenu
        
        local U5 = U:Clone()
        U5.Parent = frameToggle

        -- Criar ScrollingFrame para cada aba
        local tabFrame = Instance.new("ScrollingFrame")
        tabFrame.Size = UDim2.new(0, 257, 0, menuHeight - 60)
        tabFrame.Position = UDim2.new(0, 137, 0, 40)
        tabFrame.BackgroundTransparency = 1
        tabFrame.BorderSizePixel = 0
        tabFrame.ScrollBarThickness = 6
        tabFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
        tabFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
        tabFrame.Visible = false
        tabFrame.Parent = frameMenu

        -- Associar aba ao botão
        tabs[tabName] = tabFrame
        buttonTab.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.Visible = false
            end
            tabFrame.Visible = true
            currentTab = tabFrame
        end)
    end

    -- Mostrar a primeira aba por padrão
    currentTab = tabs[tabNames[1]]
    currentTab.Visible = true

    -- Funções para adicionar elementos
    function self:AddSection(tabName, sectionText)
        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Size = UDim2.new(1, 0, 0, 30)
        sectionLabel.Position = UDim2.new(0, 7, 0, 7)
        sectionLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
        sectionLabel.BackgroundTransparency = 1
        sectionLabel.TextSize = 15
        sectionLabel.Text = sectionText
        sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        sectionLabel.Parent = tabs[tabName]
    end

    function self:AddButton(tabName, buttonText, Callback)
        local frameButton = Instance.new("Frame")
        frameButton.Size = UDim2.new(0, 242, 0, 30)
        frameButton.Position = UDim2.new(0, 7, 0, 37)
        frameButton.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        frameButton.BorderSizePixel = 0
        frameButton.Parent = tabs[tabName]
        
        local U6 = U:Clone()
        U6.CornerRadius = UDim.new(0, 7)
        U6.Parent = frameButton

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 1, 0)
        button.Position = UDim2.new(0, 7, 0, 0)
        button.TextColor3 = Color3.fromRGB(240, 240, 240)
        button.BackgroundTransparency = 1
        button.TextStrokeTransparency = 1
        button.TextSize = 15
        button.Text = buttonText
        button.TextXAlignment = Enum.TextXAlignment.Left
        button.Parent = frameButton

        button.MouseButton1Click:Connect(function()
            if Callback then
                Callback()
            end
        end)
    end

    function self:AddToggle(tabName, toggleText, Callback)
        local frameToggle = Instance.new("Frame")
        frameToggle.Size = UDim2.new(0, 242, 0, 30)
        frameToggle.Position = UDim2.new(0, 7, 0, 77)
        frameToggle.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        frameToggle.BorderSizePixel = 0
        frameToggle.Parent = tabs[tabName]
        
        local U3 = U:Clone()
        U3.Parent = frameToggle

        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(1, 0, 1, 0)
        toggle.Position = UDim2.new(0, 7, 0, 0)
        toggle.TextColor3 = Color3.fromRGB(240, 240, 240)
        toggle.BackgroundTransparency = 1
        toggle.TextStrokeTransparency = 1
        toggle.TextSize = 15
        toggle.Text = toggleText
        toggle.TextXAlignment = Enum.TextXAlignment.Left
        toggle.Parent = frameToggle

        local frameOnOff = Instance.new("Frame")
        frameOnOff.Size = UDim2.new(0, 20, 0, 20)
        frameOnOff.Position = UDim2.new(0, 213, 0, 5)
        frameOnOff.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        frameOnOff.BorderSizePixel = 0
        frameOnOff.Parent = frameToggle
        
        local U4 = U:Clone()
        U4.CornerRadius = UDim.new(0, 7)
        U4.Parent = frameOnOff

        local indicator = Instance.new("TextLabel")
        indicator.Size = UDim2.new(1, 0, 1, 0)
        indicator.Position = UDim2.new(0, 0, 0, 0)
        indicator.TextColor3 = Color3.fromRGB(240, 240, 240)
        indicator.BackgroundTransparency = 1
        indicator.TextSize = 10
        indicator.Text = " "
        indicator.Parent = frameOnOff

        local toggleState = false
        toggle.MouseButton1Click:Connect(function()
            toggleState = not toggleState
            indicator.Text = toggleState and "✓" or " "
            if Callback then
                Callback(toggleState)
            end
        end)
    end

    -- Botão para abrir/fechar o menu
    local FrameB = Instance.new("Frame")
    FrameB.Size = UDim2.new(0, 80, 0, 30)
    FrameB.Position = UDim2.new(0, 70, 0.9, 0)
    FrameB.AnchorPoint = Vector2.new(0.5, 0.5)
    FrameB.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    FrameB.BorderSizePixel = 0
    FrameB.Active = false
    FrameB.Draggable = false
    FrameB.Parent = screen
    
    local u = U:Clone()
    u.Parent = frameToggle

    local Menu = Instance.new("TextButton")
    Menu.Size = UDim2.new(1, 0, 1, 0)
    Menu.Position = UDim2.new(0, 0, 0, 0)
    Menu.BackgroundTransparency = 1
    Menu.Text = "Menu"
    Menu.TextScaled = true
    Menu.TextColor3 = Color3.fromRGB(240, 240, 240)
    Menu.Parent = FrameB

    local menuVisible = false
    Menu.MouseButton1Click:Connect(function()
        menuVisible = not menuVisible
        frameMenu.Visible = menuVisible
    end)

    return self
end

return UILibrary
