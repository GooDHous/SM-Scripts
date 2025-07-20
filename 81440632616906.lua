-- Все функции теперь полностью самодостаточны

-- Создаем вкладку
local tab = Window:CreateTab("Game Features", 7733960981)
local farmingSection = tab:CreateSection("💸 Farming")
-- Добавляем элементы

tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    _G.autoChestFarm = CurrentValue
        task.spawn(function()
            while _G.autoChestFarm do
                task.wait(0)
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end
        end)              
    end,
})

tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    _G.infiniteDominusPet = CurrentValue
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end
        end)                      
    end,
})
tab:CreateToggle({
    Name = "💰 Auto Farm cash",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    _G.infiniteDominusPet = CurrentValue
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(8)
            end
        end)        
    end,
})
tab:CreateToggle({
    Name = "🍀 Auto Triple Dominus",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    _G.infiniteDominusPet = CurrentValue
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(4)
            end
        end)                        
    end,
})          
tab:CreateToggle({
    Name = "🎡 Unlimited Spins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()         
    _G.autoSpinFarm = CurrentValue
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



-- Уведомление
Rayfield:Notify({
    Title = "Success",
    Content = "Game features loaded!",
    Duration = 3,
    Image = 7733960981
})
