return function(Window, Rayfield)
    -- Получаем название игры
    local gameName = "Current Game"
    pcall(function()
        gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)

    -- Создаем вкладку
    local gameTab = Window:CreateTab(gameName, 7733960981)
    
    -- Секция автофарма
    local farmSection = gameTab:CreateSection("Auto Farm")
    
    -- Auto Gem Farm
    gameTab:CreateToggle({
        Name = "💎 Auto Gem Farm",
        CurrentValue = false,
        SectionParent = farmSection,
        Callback = function(Value)
            _G.AutoGem = Value
            while _G.AutoGem and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
                end)
            end
        end
    })
    
    -- Auto Chest Farm
    gameTab:CreateToggle({
        Name = "💰 Auto Chest Farm",
        CurrentValue = false,
        SectionParent = farmSection,
        Callback = function(Value)
            _G.AutoChest = Value
            while _G.AutoChest and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
                end)
            end
        end
    })

    -- Секция телепортации
    local tpSection = gameTab:CreateSection("Teleport")
    
    -- Insta-Win
    gameTab:CreateToggle({
        Name = "🏆 Insta-Win",
        CurrentValue = false,
        SectionParent = tpSection,
        Callback = function(Value)
            _G.InstaWin = Value
            while _G.InstaWin and task.wait(0.5) do
                pcall(function()
                    -- Ваш код телепортации к WinPart
                end)
            end
        end
    })

    -- Уведомление о загрузке
    Rayfield:Notify({
        Title = gameName.." Features",
        Content = "Special features loaded!",
        Duration = 5,
        Image = 7733960981
    })
end
