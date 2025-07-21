-- Murder Mystery 2 Hub
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Функция определения ролей
local function GetRolePlayer(role)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local back = player.Character:FindFirstChild("Back")
            if back then
                local tool = back:FindFirstChildOfClass("Tool")
                if tool then
                    if (role == "Sheriff" and tool.Name == "Gun") or
                       (role == "Murderer" and tool.Name == "Knife") then
                        return player
                    end
                end
            end
        end
    end
end

-- Создаем вкладку MM2
local MM2Tab = Window:CreateTab("Murder Mystery 2", 4483345998)

-- Секция телепортации
local TeleportSection = MM2Tab:CreateSection("Teleportation")

MM2Tab:CreateButton({
    Name = "Teleport to Sheriff",
    Callback = function()
        local sheriff = GetRolePlayer("Sheriff")
        if sheriff and sheriff.Character then
            local hrp = sheriff.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
                Rayfield:Notify({
                    Title = "Teleported to Sheriff!",
                    Duration = 3
                })
            end
        end
    end
})

MM2Tab:CreateButton({
    Name = "Teleport to Murderer",
    Callback = function()
        local murderer = GetRolePlayer("Murderer")
        if murderer and murderer.Character then
            local hrp = murderer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
                Rayfield:Notify({
                    Title = "Teleported to Murderer!",
                    Duration = 3
                })
            end
        end
    end
})

-- Секция автоматизации
local AutoSection = MM2Tab:CreateSection("Automation")

MM2Tab:CreateToggle({
    Name = "Auto-Teleport to Murderer",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoMurdererTP = Value
        while _G.AutoMurdererTP do
            local murderer = GetRolePlayer("Murderer")
            if murderer and murderer.Character and LocalPlayer.Character then
                local hrp = murderer.Character:FindFirstChild("HumanoidRootPart")
                local myHrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and myHrp then
                    myHrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
                end
            end
            task.wait(1)
        end
    end
})

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "MM2 Hub Loaded",
    Content = "Special features activated!",
    Duration = 5,
    Image = 4483345998
})
