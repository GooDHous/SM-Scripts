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
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/81440632616906/AutoChestFarm.lua'))()                 
    end,
})

tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/81440632616906/AutoGem.lua'))()                        
    end,
})
tab:CreateToggle({
    Name = "💰 Auto Farm Coins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/81440632616906/AutoCash.lua'))()        
    end,
})
tab:CreateToggle({
    Name = "🍀 Auto Triple Dominus",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/81440632616906/AutoTripleDominus.lua'))()                         
    end,
})          
tab:CreateToggle({
    Name = "🎡 Unlimited Spins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function()         
    loadstring(game:HttpGet(''))()        
    end,
})



-- Уведомление
Rayfield:Notify({
    Title = "Success",
    Content = "Game features loaded!",
    Duration = 3,
    Image = 7733960981
})
