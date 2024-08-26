-- FluentOrionLibrary.lua
local FluentOrionLibrary = {}
FluentOrionLibrary.__index = FluentOrionLibrary

function FluentOrionLibrary.new()
    local self = setmetatable({}, FluentOrionLibrary)
    return self
end

function FluentOrionLibrary:CreateWindow(options)
    local window = {}
    window.Title = options.Title or ""
    window.SubTitle = options.SubTitle or ""
    window.TabWidth = options.TabWidth or 80
    window.Size = options.Size or UDim2.fromOffset(400, 260)
    window.Acrylic = options.Acrylic or false
    window.Theme = options.Theme or "Darker"
    window.Tabs = {}
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = window.Size
    frame.BackgroundColor3 = self:GetThemeColor(window.Theme)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0.5, -window.Size.X.Offset/2, 0.5, -window.Size.Y.Offset/2)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui

    if window.Acrylic then
        local blur = Instance.new("BlurEffect")
        blur.Parent = frame
    end

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = window.Title
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 24
    titleLabel.Parent = frame

    local subTitleLabel = Instance.new("TextLabel")
    subTitleLabel.Text = window.SubTitle
    subTitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subTitleLabel.Position = UDim2.new(0, 0, 0, 50)
    subTitleLabel.BackgroundTransparency = 1
    subTitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subTitleLabel.Font = Enum.Font.Gotham
    subTitleLabel.TextSize = 14
    subTitleLabel.Parent = frame

    window.Frame = frame
    
    if options.KeySystem then
        self:CreateKeySystem(window, options.KeySettings)
    end

    return window
end

function FluentOrionLibrary:AddTab(window, options)
    local tab = {}
    tab.Title = options.Title or "Tab"
    tab.Icon = options.Icon or ""
    tab.Elements = {}

    local tabButton = Instance.new("TextButton")
    tabButton.Text = tab.Title
    tabButton.Size = UDim2.new(0, window.TabWidth, 0, 50)
    tabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 14
    tabButton.Parent = window.Frame

    if tab.Icon ~= "" then
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://" .. tab.Icon
        icon.Size = UDim2.new(0, 24, 0, 24)
        icon.Position = UDim2.new(0, 5, 0.5, -12)
        icon.BackgroundTransparency = 1
        icon.Parent = tabButton
    end

    tab.Button = tabButton
    table.insert(window.Tabs, tab)
    return tab
end

function FluentOrionLibrary:CreateButton(tab, text, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 200, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Parent = tab.Button

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    table.insert(tab.Elements, button)
    return button
end

function FluentOrionLibrary:CreateLabel(tab, text)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(0, 200, 0, 50)
    label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.Parent = tab.Button

    table.insert(tab.Elements, label)
    return label
end

function FluentOrionLibrary:CreateSlider(tab, min, max, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0, 200, 0, 50)
    slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    slider.Parent = tab.Button

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, 0, 0.2, 0)
    sliderBar.Position = UDim2.new(0, 0, 0.5, -10)
    sliderBar.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderBar.Parent = slider

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 0, 0.5, -10)
    knob.BackgroundColor3 = Color3.new(0, 0, 0)
    knob.Parent = sliderBar

    -- Adicione lógica para mover o knob e ajustar o valor do slider

    table.insert(tab.Elements, slider)
    return slider
end

function FluentOrionLibrary:CreateDropdown(tab, text, options, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(0, 200, 0, 50)
    dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    dropdown.Parent = tab.Button

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Text = text
    dropdownButton.Size = UDim2.new(1, 0, 1, 0)
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.TextSize = 14
    dropdownButton.Parent = dropdown

    local dropdownList = Instance.new("Frame")
    dropdownList.Size = UDim2.new(1, 0, 0, #options * 50)
    dropdownList.Position = UDim2.new(0, 0, 1, 0)
    dropdownList.Visible = false
    dropdownList.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    dropdownList.Parent = dropdown

    dropdownButton.MouseButton1Click:Connect(function()
        dropdownList.Visible = not dropdownList.Visible
    end)

    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Text = option
        optionButton.Size = UDim2.new(1, 0, 0, 50)
        optionButton.Position = UDim2.new(0, 0, 0, (i - 1) * 50)
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        optionButton.Font = Enum.Font.Gotham
        optionButton.TextSize = 14
        optionButton.Parent = dropdownList

        optionButton.MouseButton1Click:Connect(function()
            if callback then
                callback(option)
            end
            dropdownButton.Text = text .. ": " .. option
            dropdownList.Visible = false
        end)
    end

    table.insert(tab.Elements, dropdown)
    return dropdown
end

function FluentOrionLibrary:CreateToggle(tab, text, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(0, 200, 0, 50)
    toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    toggle.Parent = tab.Button

    local toggleButton = Instance.new("TextButton")
    toggleButton.Text = text
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.Gotham
    toggleButton.TextSize = 14
    toggleButton.Parent = toggle

    local isEnabled = false

    toggleButton.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        toggleButton.Text = text .. ": " .. (isEnabled and "On" or "Off")
        if callback then
            callback(isEnabled)
        end
    end)

    table.insert(tab.Elements, toggle)
    return toggle
end

function FluentOrionLibrary:CreateKeySystem(window, settings)
    local keySystemFrame = Instance.new("Frame")
    keySystemFrame.Size = UDim2.new(1, 0, 1, 0)
    keySystemFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    keySystemFrame.Parent = window.Frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = settings.Title or "Enter Key"
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 24
    titleLabel.Parent = keySystemFrame

    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Text = settings.Subtitle or ""
    subtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subtitleLabel.Position = UDim2.new(0, 0, 0, 50)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitleLabel.Font = Enum.Font.Gotham
    subtitleLabel.TextSize = 14
    subtitleLabel.Parent = keySystemFrame

    local noteLabel = Instance.new("TextLabel")
    noteLabel.Text = settings.Note or ""
    noteLabel.Size = UDim2.new(1, 0, 0, 30)
    noteLabel.Position = UDim2.new(0, 0, 0, 80)
    noteLabel.BackgroundTransparency = 1
    noteLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    noteLabel.Font = Enum.Font.Gotham
    noteLabel.TextSize = 14
    noteLabel.Parent = keySystemFrame

    local keyBox = Instance.new("TextBox")
    keyBox.PlaceholderText = "Enter your key here..."
    keyBox.Size = UDim2.new(0.8, 0, 0, 50)
    keyBox.Position = UDim2.new(0.1, 0, 0, 120)
    keyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.Gotham
    keyBox.TextSize = 14
    keyBox.Text = ""
    keyBox.ClearTextOnFocus = false
    keyBox.Parent = keySystemFrame

    local submitButton = Instance.new("TextButton")
    submitButton.Text = "Submit Key"
    submitButton.Size = UDim2.new(0.8, 0, 0, 50)
    submitButton.Position = UDim2.new(0.1, 0, 0, 180)
    submitButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.Font = Enum.Font.Gotham
    submitButton.TextSize = 14
    submitButton.Parent = keySystemFrame

    submitButton.MouseButton1Click:Connect(function()
        local enteredKey = keyBox.Text
        for _, key in ipairs(settings.Key) do
            if enteredKey == key then
                if settings.SaveKey then
                    self:SaveKey(settings.FileName, enteredKey)
                end
                keySystemFrame:Destroy()
                return
            end
        end
        keyBox.Text = "Invalid Key"
    end)

    if settings.Actions then
        for _, action in ipairs(settings.Actions) do
            local actionButton = Instance.new("TextButton")
            actionButton.Text = action.Text
            actionButton.Size = UDim2.new(0.8, 0, 0, 50)
            actionButton.Position = UDim2.new(0.1, 0, 0, 240 + (_ - 1) * 60)
            actionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            actionButton.Font = Enum.Font.Gotham
            actionButton.TextSize = 14
            actionButton.Parent = keySystemFrame

            actionButton.MouseButton1Click:Connect(function()
                if action.OnPress then
                    action.OnPress()
                end
            end)
        end
    end
end

function FluentOrionLibrary:SaveKey(fileName, key)
    local folder = "AkaidoHub"
    if not isfolder(folder) then
        makefolder(folder)
    end
    writefile(folder .. "/" .. fileName .. ".txt", key)
end

function FluentOrionLibrary:GetThemeColor(theme)
    local themes = {
        ["Darker"] = Color3.fromRGB(45, 45, 45),
        ["Amethyst"] = Color3.fromRGB(102, 51, 153),
        -- Adicione mais temas conforme necessário
    }
    return themes[theme] or Color3.fromRGB(45, 45, 45)
end

return FluentOrionLibrary
