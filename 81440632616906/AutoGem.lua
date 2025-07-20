_G.infiniteDominusPet = CurrentValue
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end
        end)