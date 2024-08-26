local Cam = workspace.CurrentCamera
local hotkey = true

local SettingsA = {
    FovColor = Color3.new(128/255, 25/255, 25/255),
    Aimbot = false,
    TeamCheck = false,
    AimbotWallCheck = false,
    Fov = false,
    FovPreencher = false,
    AimbotParts = "Head",
    SafePlayer = nil,
    FovRadius = 50,
    FovTransparency = 0.7
}

local FovCircle = Drawing.new("Circle")
FovCircle.Visible = SettingsA.Fov
FovCircle.Thickness = 2
FovCircle.Color = SettingsA.FovColor
FovCircle.Filled = SettingsA.FovPreencher
FovCircle.Radius = SettingsA.FovRadius
FovCircle.Position = Cam.ViewportSize / 2
FovCircle.Transparency = SettingsA.FovTransparency

function lookAt(target, eye)
    Cam.CFrame = CFrame.new(target, eye)
end

function isPlayerVisible(player)
    if not SettingsA.AimbotWallCheck then
        return true
    end

    local startPos = Cam.CFrame.p
    local endPos = player.Character[SettingsA.AimbotParts].Position
    local direction = (endPos - startPos).unit * (endPos - startPos).magnitude
    local ray = Ray.new(startPos, direction)
    local ignoreList = {game.Players.LocalPlayer.Character}

    local hitPart, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
    
    return hitPart == nil or hitPart:IsDescendantOf(player.Character) -- Retorna true se não houver obstruções
end

function getClosestVisiblePlayer(trg_part)
    local nearest = nil
    local last = math.huge
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Name ~= SettingsA.SafePlayer and player.Character and player.Character:FindFirstChild(trg_part) then
            local ePos, vis = workspace.CurrentCamera:WorldToViewportPoint(player.Character[trg_part].Position)
            local AccPos = Vector2.new(ePos.x, ePos.y)
            local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
            local distance = (AccPos - mousePos).magnitude
            if distance < last and vis and hotkey and distance < 400 then
                if distance < SettingsA.FovRadius then
                    if SettingsA.TeamCheck and player.Team ~= game.Players.LocalPlayer.Team then
                        if isPlayerVisible(player) then -- Verifica se o jogador está visível
                            last = distance
                            nearest = player
                        end
                    elseif not SettingsA.TeamCheck then
                        if isPlayerVisible(player) then -- Verifica se o jogador está visível
                            last = distance
                            nearest = player
                        end
                    end
                end
            end
        end
    end
    return nearest
end

game:GetService("RunService").RenderStepped:Connect(function()
    local closest = getClosestVisiblePlayer(SettingsA.AimbotParts)
    if SettingsA.Aimbot and closest and closest.Character:FindFirstChild(SettingsA.AimbotParts) then
        lookAt(Cam.CFrame.p, closest.Character:FindFirstChild(SettingsA.AimbotParts).Position)
    end
end)
