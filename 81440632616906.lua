
--==[ Create Tabs ]==--
local tab1 = Window:CreateTab("Farming")
local tab2 = Window:CreateTab("Credits")


--==[ Farming Tab ]==--
local farmingSection = tab1:CreateSection("Farming Scripts")

_G.autoChestFarm = false
_G.autoSpinFarm = false
_G.infiniteDominusPet = false
_G.instaWinLoop = false

tab1:CreateToggle({
    Name = "Chest Auto Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "ChestFarm",
    Callback = function(Value)
        _G.autoChestFarm = Value
        task.spawn(function()
            while _G.autoChestFarm do
                task.wait(0)
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end
        end)
    end,
})

tab1:CreateToggle({
    Name = "Unlimited Spins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "SpinFarm",
    Callback = function(Value)
        _G.autoSpinFarm = Value
        task.spawn(function()
            while _G.autoSpinFarm do
                task.wait(0.5)
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(3)
                end)
            end
        end)
    end,
})

tab1:CreateToggle({
    Name = "Auto Triple Dominus",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "DominusFarm",
    Callback = function(Value)
        _G.infiniteDominusPet = Value
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(4)
            end
        end)
    end,
})

tab1:CreateToggle({
    Name = "Auto Gem",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "GemFarm",
    Callback = function(Value)
        _G.infiniteDominusPet = Value
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end
        end)
    end,
})

tab1:CreateToggle({
    Name = "Auto Cash",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "CashFarm",
    Callback = function(Value)
        _G.infiniteDominusPet = Value
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(8)
            end
        end)
    end,
})


tab1:CreateToggle({
    Name = "Smart Insta-Win (Auto Detect World)",
    CurrentValue = false,
    SectionParent = farmingSection,
    Flag = "SmartInstaWinToggle",
    Callback = function(Value)
        _G.instaWinLoop = Value
        task.spawn(function()
            local player = game.Players.LocalPlayer

            while _G.instaWinLoop do
                task.wait(0.0)

                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                local closestWinPart = nil
                local shortestDistance = math.huge
                local worldIndex = nil

                -- Search all 10 worlds and find the closest WinPart
                for i = 1, 10 do
                    local world = workspace:FindFirstChild("World" .. i)
                    if world then
                        local winPart = world:FindFirstChild("WinPart")
                        if winPart then
                            local distance = (hrp.Position - winPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestWinPart = winPart
                                worldIndex = i
                            end
                        end
                    end
                end

                if closestWinPart then
                    hrp.CFrame = closestWinPart.CFrame + Vector3.new(0, 8, 0)

                    Rayfield:Notify({
                        Title = "Insta-Win",
                        Content = "Teleported to World " .. tostring(worldIndex) .. " WinPart!",
                        Duration = 2,
                        Image = 9605261863
                    })
                end
            end
        end)
    end,
})








--==[ Credits Tab ]==--
tab2:CreateLabel("Original script made by MyDadsSoft")
tab2:CreateLabel("Modified by SM-Team for Keyless SM-Script hub")
tab2:CreateLabel("UI Framework: Rayfield (Sirius Project)")


