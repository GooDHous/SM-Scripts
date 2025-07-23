-- Made by SM-Team
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/GooDHous/SM-Scripts/refs/heads/main/libui.lua'))()


-- Config
local placename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Window = Rayfield:CreateWindow({
    Name = placename,
    LoadingTitle = "Loading Hub...",
    LoadingSubtitle = "Powered by Rayfield UI",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SM-HubConfig",
        FileName = "cfg"
    }
})


-- Tabs and sections
local universal = Window:CreateTab("Universal", 4483362458)
local misc = Window:CreateTab("Misc", 4483362458)
local infoTab = Window:CreateTab("❓ Info", nil)

-- Sections
local PlayerSection = universal:CreateSection("👤 Player")



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