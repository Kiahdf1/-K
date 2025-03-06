loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Gi7331/scripts/main/Emote.lua"))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script'))()
    local Workspace = game:GetService("Workspace");
    local Players = game:GetService("Players");
    local Player = Players.LocalPlayer
    local Terrain = Workspace.Terrain

    Terrain:FillBlock(CFrame.new(66, -10, 72.5), Vector3.new(10000, 16, 10000), Enum.Material.Asphalt)
    getgenv().CloneSettings = {
        Enabled = false,
        Bind = "G",
        Value = 15,
        Delay = 0.05
    }

    local InputService = game:GetService("UserInputService");
    local Players = game:GetService("Players");
    local Player = Players.LocalPlayer

    InputService.InputBegan:Connect(function(Input, GetInput)
        if GetInput then
            return
        end

        if Input.KeyCode == Enum.KeyCode[getgenv().CloneSettings.Bind] then
            getgenv().CloneSettings.Enabled = not getgenv().CloneSettings.Enabled
        end
    end)

    while task.wait() do
        pcall(function()
            if getgenv().CloneSettings.Enabled then
                local cOld = Player.Character.HumanoidRootPart.CFrame

                Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-getgenv().CloneSettings.Value, 0, 0)
                task.wait(getgenv().CloneSettings.Delay)
                Player.Character.HumanoidRootPart.CFrame = cOld
                task.wait(getgenv().CloneSettings.Delay)
                Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(getgenv().CloneSettings.Value, 0, 0)
                task.wait(getgenv().CloneSettings.Delay)
                Player.Character.HumanoidRootPart.CFrame = cOld
            end
        end)
    end