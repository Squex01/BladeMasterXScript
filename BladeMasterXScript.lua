local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/BladeMasterXScript/main/BladeMasterX.lua')))()
local w = library:CreateWindow("Saber Master X")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoBuy")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

b:Toggle("AutoClicker",function(bool)
    shared.toggle = bool
    AutoClicker = bool
end)

b:Toggle("AutoSell",function(bool)
    shared.toggle = bool
    AutoSell = bool
end)

b:Toggle("AutoTpHoops",function(bool)
    shared.toggle = bool
    AutoTpHoops = bool
end)

b:Toggle("AutoTpGems",function(bool)
    shared.toggle = bool
    AutoTpGems = bool
end)

f:Toggle("Swords",function(bool)
    shared.toggle = bool
    Swords = bool
end)

f:Toggle("Backpack",function(bool)
    shared.toggle = bool
    Backpack = bool
end)

f:Toggle("Skills",function(bool)
    shared.toggle = bool
    Skills = bool
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discord Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)

game:GetService('RunService').Stepped:connect(function()
    spawn(function()
        if AutoTpHoops == true or AutoTpGems == true then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
    
    spawn(function()
        if Backpack == true then
            game:GetService("ReplicatedStorage").Modules.Events.BuyItem:InvokeServer("Backpack","Backpack","BuyAll")
        end
    end)
    
    spawn(function()
        if Swords == true then
            game:GetService("ReplicatedStorage").Modules.Events.BuyItem:InvokeServer("Sword","Sword","BuyAll")
        end
    end)
    
    spawn(function()
        if Skills == true then
            game:GetService("ReplicatedStorage").Modules.Events.BuySkill:InvokeServer("Skill","BuyAll")
        end
    end)
    
    spawn(function()
        if AutoClicker == true then
            pcall(function()
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                game:GetService("ReplicatedStorage").Modules.Events.Sword:FireServer(tool.Name)
            end)
        end
    end)
    
    spawn(function()
        if AntiAfk == true then
            local bb=game:service'VirtualUser'
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end
    end)
    
    spawn(function()
        if AutoSell == true then
            pcall(function()
                Numbers = {}
                for i,v in pairs(game:GetService("Workspace").Sells:GetDescendants()) do
                    if v.ClassName == "NumberValue" then
                        table.insert(Numbers,v.Value)
                    end
                end
                
                for i,v in pairs(game:GetService("Workspace").Sells:GetDescendants()) do
                    if v.ClassName == "NumberValue" then
                        if v.Value == math.max(unpack(Numbers)) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent.Parent.Touch, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent.Parent.Touch, 1)
                        end
                    end
                end
            end)
        end
    end)
end)

while wait() do
    if AutoTpHoops == true then
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    if AutoTpHoops == true then
                        for i,v1 in pairs(v.Parent.Parent:GetDescendants()) do
                            if v1.ClassName == "Part" or v1.ClassName == "MeshPart" then
                                v1.Rotation = Vector3.new(90,0,-180)
                            end
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,30))
                        local tweenInfo = TweenInfo.new(
                        1
                        )
                        local t = game.TweenService:Create(game.Players.LocalPlayer.Character.PrimaryPart, tweenInfo, {CFrame = CFrame.new(
                        v.Parent.CFrame.Position + Vector3.new(0,0,-20)
                        )})
                        t:Play()
                        wait(1)
                    end
                end
            end
        end)
    end
    
    if AutoTpGems == true then
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Coins:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    if AutoTpGems == true then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                        wait(.5)
                    end
                end
            end
        end)
    end
end