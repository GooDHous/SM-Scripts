-- Made by SM-Team
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/libui.lua'))()
local placename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

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


-- Tabs
local farmingTab = Window:CreateTab(placename, nil)
local farmingSection = farmingTab:CreateSection("💸 Farming Tools")
local universal = Window:CreateTab("Universal", 4483362458)
local misc = Window:CreateTab("Misc", 4483362458)
local infoTab = Window:CreateTab("❓ Info", nil)

-- Sections
local PlayerSection = universal:CreateSection("👤 Player")


_G.autoChestFarm = false
_G.autoGemFarm = false
_G.autoCashFarm = false
_G.autoDominusFarm = false
_G.autoSpinsFarm = false


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

-- Values
local currentSpeed = 16
local currentJumpPower = 50



local function setPlayerJumpPower(power)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = power
    end
end

local function setPlayerSpeed(speed)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

local speedSlider = universal:CreateSlider({
    Name = "Speed",
    Range = {16, 300},
	SectionParent = PlayerSection,
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = currentSpeed,
    Callback = function(Value)
        currentSpeed = Value
        setPlayerSpeed(Value)
    end
})



local jumpSlider = universal:CreateSlider({
    Name = "Jump power",
    Range = {50, 200},
	SectionParent = PlayerSection, 
    Increment = 1,
    Suffix = "units",
    CurrentValue = currentJumpPower,
    Callback = function(Value)
        currentJumpPower = Value
    	setPlayerJumpPower(Value)
    end
})


game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    setPlayerJumpPower(50)
	setPlayerSpeed(16)
	speedSlider:Set(16)
	jumpSlider:Set(50)
end)


local infiniteJumpEnabled = false
universal:CreateToggle({
    Name = "Infinite Jump",
	SectionParent = PlayerSection,
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
	SectionParent = PlayerSection,
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
	SectionParent = PlayerSection,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/fly.lua'))()
    end
})

universal:CreateButton({
    Name = "Suicide",
	SectionParent = PlayerSection,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/suicide.lua'))()
    end
})

universal:CreateButton({
    Name = "Server Hop",
	SectionParent = PlayerSection,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/main/serverhop.lua'))()
    end
})
local CameraSection = universal:CreateSection("🎥 Camera")

fovSlider = universal:CreateSlider({
    Name = "FOV",
	SectionParent = CameraSection,
    Range = {5, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = 70,
    Callback = function(Value)
        game:GetService("Workspace").CurrentCamera.FieldOfView = Value
    end
})

misc:CreateButton({
    Name = "Infinity Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

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
local creditsPar = "Made by SM-Team with Rayfield UI\nFly menu by me_ozoneYT\nInfinity Yield by EdgeIY\n"

infoTab:CreateParagraph({Title = "Credits", Content = creditsPar})
infoTab:CreateLabel("Game: " .. placename)
infoTab:CreateLabel("Hub Version: 1.0")
infoTab:CreateButton({
    Name = "Unload UI",
    Callback = function()
		game:GetService("Workspace").CurrentCamera.FieldOfView = 70
        Rayfield:Destroy()
    end
})

Rayfield:Init()