_G.autoSpinFarm = CurrentValue
        task.spawn(function()
            while _G.autoSpinFarm do
                task.wait(0.5)
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(3)
                end)
            end
        end)