-- Все функции теперь полностью самодостаточны

-- Создаем вкладку
local tab = Window:CreateTab("Dig To Earth`s Core")
local farmingSection = tab:CreateSection("💸 Farming")
-- Добавляем элементы

_G.autoChestFarm = false
_G.autoSpinFarm = false
_G.infiniteDominusPet = false
_G.instaWinLoop = false

tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
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

tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
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
tab:CreateToggle({
    Name = "💰 Auto Farm cash",
    CurrentValue = false,
    SectionParent = farmingSection,
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
tab:CreateToggle({
    Name = "🍀 Auto Triple Dominus",
    CurrentValue = false,
    SectionParent = farmingSection,
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
tab:CreateToggle({
    Name = "🎡 Unlimited Spins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)         
    _G.infiniteDominusPet = Value
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(3)
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
