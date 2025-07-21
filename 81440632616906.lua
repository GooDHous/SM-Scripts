local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/libui.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Dig to Earth's Core Hub",
    LoadingTitle = "Loading SM-Script Hub...",
    LoadingSubtitle = "Powered by Rayfield UI",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SM-HubConfig",
        FileName = "cfg"
    }
})

_G.autoChestFarm = false
_G.autoGemFarm = false
_G.autoCashFarm = false
_G.autoDominusFarm = false
_G.autoSpinsFarm = false
_G.placename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local farmingTab = Window:CreateTab(_G.placename, nil)
local farmingSection = farmingTab:CreateSection("💸 Farming Tools")
local Universal = Window:CreateTab("Universal", 4483362458)
local Misc = Window:CreateTab("Misc", 4483362458)
local infoTab = Window:CreateTab("❓ Info", nil)

farmingTab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)
        _G.autoChestFarm = Value
        task.spawn(function()
            while _G.autoChestFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
                end)
            end
        end)              
    end,
})

farmingTab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)
        _G.autoGemFarm = Value
        task.spawn(function()
            while _G.autoGemFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
                end)
            end
        end)                      
    end,
})

farmingTab:CreateToggle({
    Name = "💰 Auto Farm Cash",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)
        _G.autoCashFarm = Value
        task.spawn(function()
            while _G.autoCashFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(8)
                end)
            end
        end)        
    end,
})

farmingTab:CreateToggle({
    Name = "🍀 Auto Triple Dominus",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)
        _G.autoDominusFarm = Value
        task.spawn(function()
            while _G.autoDominusFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(4)
                end)
            end
        end)                        
    end,
})

farmingTab:CreateToggle({
    Name = "🎡 Unlimited Spins",
    CurrentValue = false,
    SectionParent = farmingSection,
    Callback = function(Value)         
        _G.autoSpinsFarm = Value
        task.spawn(function()
            while _G.autoSpinsFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(3)
                end)
            end
        end)
    end,
})

local infiniteJumpEnabled = false
universal:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    SectionParent = funSection,
    Callback = function(Value)
        infiniteJumpEnabled = Value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local noclipEnabled = false
universal:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    SectionParent = funSection,
    Callback = function(Value)
        noclipEnabled = Value
    end
})

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

universal:CreateButton({
    Name = "Fly Menu",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/fly.lua'))()
    end
})

universal:CreateButton({
    Name = "Server Hop",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/serverhop.lua'))()
    end
})

misc:CreateButton({
    Name = "Infinity Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'))()
    end
})

-- Dex Explorer
misc:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/DexExplorer.lua'))()
    end
})

Rayfield:Notify({
    Title = "SM-Scripts hub loaded",
    Content = "Welcome to our comunity!",
    Duration = 5,
    Image = 8581940575
})

infoTab:CreateLabel("Game: " .. _G.placename)
infoTab:CreateLabel("Hub Version: 1.0")
infoTab:CreateLabel("Made with Rayfield UI")
infoTab:CreateLabel("Made by SM-Team")
infoTab:CreateButton({
    Name = "Unload UI",
    Callback = function()
        Rayfield:Destroy()
    end
})

Rayfield:Init()
