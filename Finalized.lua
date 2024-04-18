local RayfieldURL ='https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library' and 'https://sirius.menu/rayfield'
local Rayfield = loadstring(game:HttpGet(RayfieldURL))()
local Window = Rayfield:CreateWindow({
    Name = "DaHood-Enhanced",
    LoadingTitle = "DaHood-Enhanced",
    LoadingSubtitle = "by 7rxp",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "DH-Enhanced",
       FileName = "DH-Enhanced-Settings"
    },
    Discord = {
       Enabled = false,
       Invite = "s1ilence",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "DaHood-Enhanced",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/NRWDW38VqB)",
       FileName = "DHE-Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "Enhance"
    }
 })

local Tab1 = Window:CreateTab("Main", 12494932220)
local Tab2 = Window:CreateTab("Miscs", 12668498268)
local Tab3 = Window:CreateTab("Anti-lock", 12494932220)
local Tab4 = Window:CreateTab("Anti-lock-Toggle", 12668498268)
local Tab5 = Window:CreateTab("Anti-Configuration", 12494932220)
local Tab6 = Window:CreateTab("Resolver", 12668498268)

local function notify(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 0.7,
        Image = 10010348543
    })
end

local Section = Tab1:CreateSection("Sliders")
local Slider = Tab1:CreateSlider({
    Name = "Fov",
    Range = {70, 120},
    Increment = 1,
    Suffix = "Value",
    CurrentValue = 0,
    Callback = function(fov)
      workspace.CurrentCamera.FieldOfView = fov 
     end,
  })
 local Slider = Tab1:CreateSlider({
   Name = "Jump-Strafe",
   Range = {1, 6},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 2,
   Callback = function(x)
    essex = x
   end,
})
 getgenv().enabled = false
 game:GetService("RunService").heartbeat:Connect(function()
    if enabled then
        local Spin = Instance.new('BodyAngularVelocity');
        Spin.Name = "wildddd";
        Spin.Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart;
        Spin.MaxTorque = Vector3.new(0, (1/0), 0);
        Spin.AngularVelocity = Vector3.new(0, getgenv().Speedy, 0);
    
        else
        
        for i,v in next, game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:GetChildren() do
            if v.Name == 'wildddd' then
                v:Destroy();
            end;
        end;
    end;
end)
local Slider = Tab1:CreateSlider({
   Name = "Spinbot",
   Range = {1, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 2,
   Callback = function(x)
    getgenv().Speedy = x
    end,
 })
 local Slider = Tab1:CreateSlider({
   Name = "Fake-Lag",
   Range = {1, 10},
   Increment = 1,
   Suffix = "Amount",
   CurrentValue = 2,
   Callback = function(x)
    	SplitValue = x / 10
		getgenv().FakeLagSpeed = SplitValue
    end,
 })
 local Toggle = Tab1:CreateToggle({
   Name = "Jump-Strafe",
   CurrentValue = false,
   Callback = function(x)
    essex2 = x
    while essex2 do
    task.wait()
    if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 and game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection / essex)
        end
    end
   end,
})
 local Toggle = Tab1:CreateToggle({
   Name = "Spinbot",
   CurrentValue = false,
   Callback = function(x)
    getgenv().enabled = x
   end,
})
 local Toggle = Tab1:CreateToggle({
   Name = "Fake-Lag",
   CurrentValue = false,
   Callback = function(e)
    		FakeLag = false
		getgenv().FakeLagSpeed = 0.000001
		if e then
			FakeLag = true
			while FakeLag == true do
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
				wait(getgenv().FakeLagSpeed)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
				wait()
			end
		else
			FakeLag = false
		end
   end,
})
local hookfun
hookfun = hookfunction(wait, function(x)
    if x == 1.5 and nocooldown then
        return hookfun() end return hookfun(x)
end)
 local Toggle = Tab1:CreateToggle({
   Name = "Jump-Cooldown",
   CurrentValue = false,
   Callback = function(x)
        bhop = x
    nocooldown = x
    while bhop do
	task.wait(100000000)
        if game.Players.LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
        end
    end
   end,
})
local Toggle = Tab1:CreateToggle({
   Name = "Auto-Reload",
   CurrentValue = false,
   Callback = function(reload)
    if reload == true then
    getgenv().AutoReload = true
while getgenv().AutoReload == true and game:GetService("RunService").Heartbeat:Wait() do
if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                    wait(1)
                end
            end
        end
end
    elseif reload == false then
        getgenv().AutoReload = false
        end
   end,
})
local Toggle = Tab1:CreateToggle({
    Name = "Auto High Armor",
    CurrentValue = false,
    Callback = function(armor)
     if armor == true then
        autohigharmour = true
        repeat wait()
            if game.Players.LocalPlayer.Character.BodyEffects.Armor.Value < 10 then
                autohigharmorpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local plr = game.Players.LocalPlayer
                local lastpos = plr.Character.HumanoidRootPart.CFrame                    
                plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[High-Medium Armor] - $2440"].Head.CFrame
                wait(.3)
                fireclickdetector(game.Workspace.Ignored.Shop["[High-Medium Armor] - $2440"].ClickDetector)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(autohigharmorpos)
            end
            until autohigharmour == false
     elseif armor == false then
        autohigharmour = false
         end
    end,
 })
 local Toggle = Tab1:CreateToggle({
    Name = "Auto Fire Armor",
    CurrentValue = false,
    Callback = function(firearmor)
     if firearmor == true then
        autofirearmour = true
        repeat wait()
            if game.Players.LocalPlayer.Character.BodyEffects.FireArmor.Value < 10 then
                autohigharmorpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local plr = game.Players.LocalPlayer
                local lastpos = plr.Character.HumanoidRootPart.CFrame                    
                plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Fire Armor] - $2546"].Head.CFrame
                wait(.3)
                fireclickdetector(game.Workspace.Ignored.Shop["[Fire Armor] - $2546"].ClickDetector)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(autohigharmorpos)
            end
            until autofirearmour == false
     elseif firearmor == false then
        autofirearmour = false
         end
    end,
 })
local Section = Tab1:CreateSection("Spoofers")
local Button = Tab1:CreateButton({
    Name = "Memory-Spoofer",
    Callback = function()
        notify('Spoof', 'Memory Spoofed', 1)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/MemorySpoofer.lua'))()
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "Ping-Spoofer",
    Callback = function()
        notify('Spoof', 'Ping Spoofed', 1)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/PingSpoofer2.lua'))()
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "Cleaner",
    Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/InfectionSpoof.lua'))()
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "Anti-Spy",
    Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/AntiSpy.lua'))()
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "IP-Spoofer",
    Callback = function()
getgenv().IpProtection = true
spoofedIP = "0.0.0.0"


IP_Trackers = {
    "https://v4.ident.me",
    "https://v6.ident.me",
    "https://api.ipify.org",
    "https://httpbin.org/get"
}

local old
old = hookfunction(game.HttpGet, function(self, url)
        -- Checking if the protection is enabled
    if type(url) == "string" and getgenv().IpProtection then
        -- Checks if the URL is in the IP_Trackers table
        if table.find(IP_Trackers, url) then
            warn(url,"tried to log your IP. It was protected.")
            return spoofedIP -- Spoofed IP
        end
    end
    return old(self, url)
end)

local oldSyn
oldSyn = hookfunction((syn and syn.request or request),function(a,b)
    if type(a) == "table" and getgenv().IpProtection then
        for i,v in pairs(a) do
            if i == "Url" and table.find(IP_Trackers, v) then
                warn(v,"tried to log your IP. It was protected.")
                return {
                    StatusCode = 200,
                    Body = spoofedIP
                }
            end
        end
    end
    return oldSyn(a,b)
end)
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "Log-Spoofer",
    Callback = function()
        notify('Spoof', 'Logs Spoofed', 1)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/LogSpoofer.lua'))()
    end,
 })
 local Section = Tab1:CreateSection("Aim-Viewer")
local Button = Tab1:CreateButton({
    Name = "Vin-Aimviewer",
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/VinGUI"))()
    end,
 })

local oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

local function Sign()
    if not game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('[StopSign]') then
        oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-226, 22, -77)
        wait(0.3)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[StopSign] - $318"].ClickDetector)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos1) * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
    end
end

local function Bag()
    if not game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('[BrownBag]') then
        oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-316, 51, -724)
        wait(0.3)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[BrownBag] - $27"].ClickDetector)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos1) * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
    end
end

local function Recall()
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(12)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos1)
    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
end

local function GetPlayer(String)
    local plr
    local strl = String:lower()
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() or v.DisplayName:lower():sub(1, #String) == String:lower() then
                if v ~= game:GetService("Players").LocalPlayer and v.Character:FindFirstChild("Humanoid").Sit == false then
                    plr = v
                end
            end 
        end
        if String == "" or String == " " then
           plr = nil
        end
    return plr
end

local Section = Tab2:CreateSection("Stopper")
local Button = Tab2:CreateButton({
   Name = "Stop-Process",
   Callback = function()
    getgenv().Enabled = false
    getgenv().Enabled2 = false
    getgenv().Orbit = false
    game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
   end,
})

local Section = Tab2:CreateSection("Inputs")
local Input = Tab2:CreateInput({
    Name = "Go-To",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
     local Target = GetPlayer(name)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
    end,
 })
local Input = Tab2:CreateInput({
   Name = "View Player",
   PlaceholderText = "Name",
   RemoveTextAfterFocusLost = true,
   Callback = function(name)
    local Target = GetPlayer(name)
    game:GetService("Workspace").CurrentCamera.CameraSubject = Target.Character 
   end,
})
local Input = Tab2:CreateInput({
    Name = "Bring",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
     oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
     Sign()
         wait(0.2)
             pcall(function()
                 local Target = GetPlayer(name)
                 game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                 repeat
                     wait()
                     if game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]') then
                         game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]').Parent = game.Players.LocalPlayer.Character
                         game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                     else
                         game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                     end
                     wait(0.01)
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                 until Target.Character.BodyEffects["K.O"].Value == true 
                 repeat
         wait(0.1)
         game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.UpperTorso.CFrame * CFrame.new(0,0,0)
         wait(0.3)
         game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
                 wait(0.3)
                 until Target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                 Recall()
                 wait(0.2)
                 game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
             end)
    end,
 })
local Input = Tab2:CreateInput({
    Name = "Knock",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
		oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        Sign()
        wait(0.2)
            pcall(function()
                local Target = GetPlayer(name)
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                repeat
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]') then
                        game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]').Parent = game.Players.LocalPlayer.Character
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    else
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    end
                    wait(0.01)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                until Target.Character.BodyEffects["K.O"].Value == true 
                wait(0.1)
                Recall()
            end)
    end,
 })
 local Input = Tab2:CreateInput({
    Name = "Void",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
	oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    Sign()
    wait(0.2)
            pcall(function()
                local Target = GetPlayer(name)
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                repeat
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]') then
                        game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]').Parent = game.Players.LocalPlayer.Character
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    else
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    end
                    wait(0.001)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                until Target.Character.BodyEffects["K.O"].Value == true 
                repeat
		wait(0.3)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.UpperTorso.CFrame * CFrame.new(0,0,0)
		wait(0.3)
		game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
		wait(0.3)
                until Target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                game:service('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83192.7656, 4066.64478, 181443.297, -0.99935019, 0.00446274364, -0.0357667245, 6.94059876e-09, 0.992305517, 0.123813346, 0.0360440649, 0.123732895, -0.991660714)
                wait(0.1)
                game.ReplicatedStorage.MainEvent:FireServer("Grabbing")
                wait(.2)
                Recall()
            end)
    end,
 })
 local Input = Tab2:CreateInput({
    Name = "Stomp",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
	oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        Sign()
        wait(0.2)
            pcall(function()
                local Target = GetPlayer(name)
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                repeat wait(0.01)
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]') then
                        game.Players.LocalPlayer.Backpack:FindFirstChild('[StopSign]').Parent = game.Players.LocalPlayer.Character
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    else
                        game.Players.LocalPlayer.Character:FindFirstChild('[StopSign]'):Activate()
                    end
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                until Target.Character.BodyEffects["K.O"].Value == true
                repeat
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.UpperTorso.CFrame * CFrame.new(0,0,0)
					wait(0.5)
                until Target.Character.BodyEffects.Dead.Value == false
                repeat wait(0.5)
                    game.ReplicatedStorage.MainEvent:FireServer("Stomp")
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.UpperTorso.CFrame * CFrame.new(0,0,0)
	            until Target.Character.BodyEffects.Dead.Value == true
                wait(.4)
                Recall()
            end)
    end,
 })
 local Input = Tab2:CreateInput({
    Name = "Bag",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        Bag()
        wait(0.2)
            pcall(function()
                local Target = GetPlayer(name)
                repeat
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('[BrownBag]') then
                        game.Players.LocalPlayer.Backpack:FindFirstChild('[BrownBag]').Parent = game.Players.LocalPlayer.Character
                        game.Players.LocalPlayer.Character:FindFirstChild('[BrownBag]'):Activate()
                    else
                        game.Players.LocalPlayer.Character:FindFirstChild('[BrownBag]'):Activate()
                    end
                    wait(0.01)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                until Target.Character:FindFirstChild("Christmas_Sock") == false
                wait(0.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos1)
            end)
    end,
 })
 local Input = Tab2:CreateInput({
    Name = "Fling",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        pcall(function()
            local power = 70000
            local Players = game:GetService('Players')
            local oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local target = GetPlayer(name)
                if target then
                    local Loop
                    flinging = true
                    local loopFunction = function()
                        local success,err = pcall(function()
                            if target.Character then
                                local OrientationX = game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.X
                                local OrientationY = game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Y
                                local OrientationZ = game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Z
                                local dis = 3.85
                                local randomx = math.random(-dis,dis)
                                local randomz = math.random(-dis,dis)
                                local enemycheck = target.Character
                                if enemycheck then
                                    local enemy = enemycheck:FindFirstChild('UpperTorso')
                                    if enemy then
                                        local increase = 5
                                        
                                        local xchange
                                        local zchange
                                        local xp = tostring(enemy.Parent:WaitForChild('Humanoid').MoveDirection.X)
                                        local zp = tostring(enemy.Parent:WaitForChild('Humanoid').MoveDirection.Z)
                        
                                        if string.find(xp, '-') then
                                            xchange = -increase
                                        else
                                            xchange = increase
                                        end
                                        if string.find(zp, '-') then
                                            zchange = -increase
                                        else
                                            zchange = increase
                                        end
                                        if enemy.Parent.Humanoid.MoveDirection.X == 0 then
                                            xchange = 0
                                        end
                                        if enemy.Parent.Humanoid.MoveDirection.Z == 0 then
                                            zchange = 0 
                                        end
                                        
                                        if game.Players.LocalPlayer.Character then
                                            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid'):ChangeState(11)
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(enemy.Position.X + randomx + enemy.Parent.Humanoid.MoveDirection.X + xchange, enemy.Position.Y, enemy.Position.Z + randomz + enemy.Parent.Humanoid.MoveDirection.Z + zchange) * CFrame.Angles(math.rad(OrientationX + 210),math.rad(OrientationY + 110),math.rad(OrientationZ + 130))
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(power,power,power)
                                        end
                                    end
                                end
                            end
                        end)
                    end
                    local Start = function()
                        oldpos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
                    end;
                    local Pause = function()
                        Loop:Disconnect()
                        flinging = false
                        local vectorZero = Vector3.new(0, 0, 0)
                        game.Players.LocalPlayer.Character.PrimaryPart.Velocity = vectorZero
                        game.Players.LocalPlayer.Character.PrimaryPart.RotVelocity = vectorZero
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos1) * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
                    end;
                    Start()	
                        wait(3)
                            if flinging == true then
                            Pause()
                            Pause()
                            wait(5)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(12)
                end
            end
        end)
    end,
 })
local Input = Tab2:CreateInput({
   Name = "Orbit",
   PlaceholderText = "Name",
   RemoveTextAfterFocusLost = true,
   Callback = function(name)
    getgenv().Orbit = true
while getgenv().Orbit == true do
    for i = 0, 360, getgenv().Speed do
        local Target = GetPlayer(name)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.HumanoidRootPart.Position) * CFrame.Angles(0, math.rad(i), 0) * CFrame.new(0, getgenv().Height, getgenv().Distance)
        task.wait()
    end
end
   end,
})
local Section = Tab2:CreateSection("Sliders")
 local Slider = Tab2:CreateSlider({
   Name = "Orbit-Speed",
   Range = {0.4, 4},
   Increment = 0.1,
   Suffix = "Speed",
   CurrentValue = 1,
   Callback = function(x)
    getgenv().Speed = x
   end,
})
 local Slider = Tab2:CreateSlider({
   Name = "Orbit-Distance",
   Range = {1, 30},
   Increment = 1,
   Suffix = "Distance",
   CurrentValue = 10,
   Callback = function(x)
    getgenv().Distance = x
   end,
})
 local Slider = Tab2:CreateSlider({
   Name = "Orbit-Height",
   Range = {-8, 30},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 1,
   Callback = function(x)
    getgenv().Height = x
   end,
})
local Section = Tab3:CreateSection("AA-Anti")
local Toggleee1 = Tab3:CreateToggle({
   Name = "Blatant-Rage",
   CurrentValue = false,
   Callback = function(Desync)
    if Desync == true then
getgenv().BlatantAA = true

local Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
while getgenv().BlatantAA == true  do
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (CFrame.new(Position) + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))) * CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)))
end
    elseif Desync == false then
        getgenv().BlatantAA = false
        end
   end,
})
local Toggleee2 = Tab3:CreateToggle({
   Name = "Reverse-Anti",
   CurrentValue = false,
   Callback = function(Desync)
    if Desync == true then
     getgenv().reversed = true
 game:GetService("RunService").Heartbeat:Connect(
    function()
        if getgenv().reversed then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +- game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().antilockspeed
        end
    end)
    elseif Desync == false then
        getgenv().reversed = false
        end
   end,
})
local Toggleee3 = Tab3:CreateToggle({
   Name = "AA-Anti",
   CurrentValue = false,
   Callback = function(Desync)
    if Desync == true then
    getgenv().AA = true 
--    getgenv().Amounts = 825
game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().AA ~= false then 
    local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,getgenv().Amounts,0) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
    elseif Desync == false then
        getgenv().AA = false 
        end
   end,
})
local Section = Tab3:CreateSection("Desync")
local Toggleee4 = Tab3:CreateToggle({
   Name = "Normal-Desync",
   CurrentValue = false,
   Callback = function(Desync)
    if Desync == true then
        getgenv().CrazyAnti = true 
game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().CrazyAnti ~= false then 
    local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(getgenv().X,getgenv().Y,getgenv().Z) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
    elseif Desync == false then
         getgenv().CrazyAnti = false 
        end
   end,
})
local Toggleee5 = Tab3:CreateToggle({
    Name = "Vertical-Desync",
    CurrentValue = false,
    Callback = function(Desync)
     if Desync == true then
         getgenv().Desync = true
         game.RunService.Heartbeat:Connect(function()
         if getgenv().Desync then
         local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(0),0)
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(7),0)
         game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(getgenv().X,getgenv().Y,getgenv().Z)
         game.RunService.RenderStepped:Wait()
         game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
             end
     end)
     elseif Desync == false then
         getgenv().Desync = false
     end
    end,
 })
 local Section = Tab3:CreateSection("Network")
 local Toggleee6 = Tab3:CreateToggle({
    Name = "Network-Sleeper",
    CurrentValue = false,
    Callback = function(state)
    if state == true then
        getgenv().NetworkSleepPower = 8

        getgenv().NetworkSleepPower2 = 13 - getgenv().NetworkSleepPower
                setfflag("S2PhysicsSenderRate", getgenv().NetworkSleepPower2)
                setfflag("PhysicsSenderMaxBandwidthBps", math.round(math.pi * getgenv().NetworkSleepPower2))
                sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
                task.wait()
                sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
    elseif state == false then
        getgenv().NetworkSleepPower = 0
 
        getgenv().NetworkSleepPower2 = 13 - getgenv().NetworkSleepPower
                setfflag("S2PhysicsSenderRate", getgenv().NetworkSleepPower2)
                setfflag("PhysicsSenderMaxBandwidthBps", math.round(math.pi * getgenv().NetworkSleepPower2))
                sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
                task.wait()
                sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
    end
    end,
 })
local Section = Tab3:CreateSection("Walkable")
local Toggleee7 = Tab3:CreateToggle({
    Name = "Walkable-Desync",
    CurrentValue = false,
    Callback = function(Desync)
        if Desync == true then
                    _G.niggers = true
            game:GetService("RunService").heartbeat:Connect(function()
                    if _G.niggers then
                    local abc = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0.0001,0)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(3000), math.random(3000), math.random(3000))
                game.RunService.RenderStepped:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = abc
                end 
            end)
        elseif Desync == false then
                    _G.niggers = false
                end
    end,
 })
local Toggleee8 = Tab3:CreateToggle({
   Name = "Walkable-Desync-V2",
   CurrentValue = false,
   Callback = function(Desyncc)
       if Desyncc == true then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Anti/Walkable.lua'))()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Anti/Walkable.lua'))()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Anti/Walkable.lua'))()
    elseif Desyncc == false then
        getgenv().DDOsama1 = false
        end
   end,
})
local Toggleee9 = Tab3:CreateToggle({
   Name = "Unhittable-Desync",
   CurrentValue = false,
   Callback = function(Desync)
    if Desync == true then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Anti/Unhittable.lua'))()        
    elseif Desync == false then
        getgenv().DesynxRX = false
        end
   end,
})
local Section = Tab4:CreateSection("AA-Anti-Toggle")
local Toggle1 = Tab4:CreateKeybind({
    Name = "Blatant-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle1",
    Callback = function(Keybind)
    Toggleee1:Set(true)
    end,
 })
 local Toggle2 = Tab4:CreateKeybind({
    Name = "Reverse-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle2",
    Callback = function(Keybind)
    Toggleee2:Set(true)
    end,
 })
 local Toggle3 = Tab4:CreateKeybind({
    Name = "AA-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle3",
    Callback = function(Keybind)
    Toggleee3:Set(true)
    end,
 })
local Section = Tab4:CreateSection("Desync-Toggle")
local Toggle4 = Tab4:CreateKeybind({
    Name = "Normal-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle4",
    Callback = function(Keybind)
    Toggleee4:Set(true)
    end,
 })
 local Toggle5 = Tab4:CreateKeybind({
    Name = "Vertical-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle5",
    Callback = function(Keybind)
    Toggleee5:Set(true)
    end,
 })
 local Section = Tab4:CreateSection("Network-Toggle")
 local Toggle6 = Tab4:CreateKeybind({
    Name = "Network-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle6",
    Callback = function(Keybind)
    Toggleee6:Set(true)
    end,
 })
local Section = Tab4:CreateSection("Walkable-Toggle")
local Toggle7 = Tab4:CreateKeybind({
    Name = "Walkable-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle7",
    Callback = function(Keybind)
    Toggleee7:Set(true)
    end,
 })

 local Toggle8 = Tab4:CreateKeybind({
    Name = "WalkableV2-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle8",
    Callback = function(Keybind)
    Toggleee8:Set(true)
    end,
 })

 local Toggle9 = Tab4:CreateKeybind({
    Name = "Unhittable-Toggle",
    CurrentKeybind = "None",
    HoldToInteract = false,
    Flag = "Toggle9",
    Callback = function(Keybind)
    Toggleee9:Set(true)
    end,
 })
local Section = Tab4:CreateSection("Toggle-Off")
local Toggle100 = Tab4:CreateKeybind({
    Name = "Toggle-Off",
    CurrentKeybind = "Backspace",
    HoldToInteract = false,
    Flag = "Toggle100",
    Callback = function(Keybind)
    Toggleee8:Set(false)
    Toggleee7:Set(false)
    Toggleee9:Set(false)
    Toggleee1:Set(false)
    Toggleee2:Set(false)
    Toggleee3:Set(false)
    Toggleee4:Set(false)
    Toggleee5:Set(false)
    Toggleee6:Set(false)
    end,
 })
local Section = Tab5:CreateSection("AA-Configuration")
local Slider = Tab5:CreateSlider({
   Name = "AA-Amount",
   Range = {-10000, 10000},
   Increment = 1,
   Suffix = "XYZ",
   CurrentValue = 0,
   Callback = function(Amount)
   getgenv().Amounts = Amount
   end,
})
local Section = Tab5:CreateSection("Reverse-Configuration")
local Slider = Tab5:CreateSlider({
   Name = "Reverse-Amount",
   Range = {0.01, 0.2},
   Increment = 0.01,
   Suffix = "Speed",
   CurrentValue = 0,
   Callback = function(Amount)
   getgenv().antilockspeed = Amount
   end,
})
local Section = Tab5:CreateSection("Desync-Configuration")
local Slider = Tab5:CreateSlider({
   Name = "X-Amount",
   Range = {-10000, 10000},
   Increment = 1,
   Suffix = "X",
   CurrentValue = 0,
   Callback = function(Amount)
   getgenv().X = Amount
   end,
})
local Slider = Tab5:CreateSlider({
   Name = "Y-Amount",
   Range = {-10000, 10000},
   Increment = 1,
   Suffix = "Y",
   CurrentValue = 0,
   Callback = function(Amount)
   getgenv().Y = Amount
   end,
})
local Slider = Tab5:CreateSlider({
   Name = "Z-Amount",
   Range = {-10000, 10000},
   Increment = 1,
   Suffix = "Z",
   CurrentValue = 0,
   Callback = function(Amount)
   getgenv().Z = Amount
   end,
})
local Section = Tab6:CreateSection("Desync-Resolver")
local Button = Tab6:CreateButton({
   Name = "Universal-Resolver",
   Callback = function()
    getgenv().MichaelJackson = true --/keep this true
    getgenv().ArcaneBeNigga = false --/ toggle true if u want it to be forever
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ArcaneAw/Locking/main/Resolver/Desync2.lua"))()
   end,
})
local Button = Tab6:CreateButton({
   Name = "Universal-Resolver2",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Resolver/Desync.lua'))()
   end,
})
local Button = Tab6:CreateButton({
   Name = "Linear-Resolver",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Locking/main/Resolver/Linear.lua'))()
  end,
})
local Section = Tab6:CreateSection("AA-Resolver")
local Button = Tab6:CreateButton({
   Name = "AA-Resolver",
   Callback = function()
    notify('Resolver', 'Doesnt resolve desync', 1)
    local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
   end,
})
local Button = Tab6:CreateButton({
   Name = "AA-Cam-Resolver",
   Callback = function()
local Target = game.Players.LocalPlayer --camlock resolver

local Y = -0
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        Target = v.Name 
        if Target ~= game.Players.LocalPlayer.Name then
        old_vel = game.Players[Target].Character.HumanoidRootPart.Velocity
        game.Players[Target].Character.HumanoidRootPart.Velocity = Vector3.new(old_vel.X, Y, old_vel.Z)
    end
    end
end) 
   end,
})
