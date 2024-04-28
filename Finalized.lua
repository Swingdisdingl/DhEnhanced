--Finalized
repeat wait() until game:IsLoaded()

--local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArcaneAw/UIS/main/ModdedBackupV1.lua"))()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArcaneAw/UIS/main/ModdedBackupV2.lua"))()

Library.theme.fontsize = 15
Library.theme.titlesize = 17
Library.theme.font = Enum.Font.Code
Library.theme.background = "rbxassetid://5553946656"
Library.theme.tilesize = 90
Library.theme.cursor = true
Library.theme.cursorimg = "https://t0.rbxcdn.com/42f66da98c40252ee151326a82aab51f"
Library.theme.backgroundcolor = Color3.fromRGB(20, 20, 20)
Library.theme.tabstextcolor = Color3.fromRGB(240, 240, 240)
Library.theme.bordercolor = Color3.fromRGB(60, 60, 60)
Library.theme.accentcolor = Color3.fromRGB(203, 9, 61)
Library.theme.accentcolor2 = Color3.fromRGB(203, 9, 61)
Library.theme.outlinecolor = Color3.fromRGB(60, 60, 60)
Library.theme.outlinecolor2 = Color3.fromRGB(0, 0, 0)
Library.theme.sectorcolor = Color3.fromRGB(30, 30, 30)
Library.theme.toptextcolor = Color3.fromRGB(255, 255, 255)
Library.theme.topheight = 50
Library.theme.topcolor = Color3.fromRGB(30, 30, 30)
Library.theme.topcolor2 = Color3.fromRGB(30, 30, 30)
Library.theme.buttoncolor = Color3.fromRGB(49, 49, 49)
Library.theme.buttoncolor2 = Color3.fromRGB(39, 39, 39)
Library.theme.itemscolor = Color3.fromRGB(200, 200, 200)
Library.theme.itemscolor2 = Color3.fromRGB(210, 210, 210)

local NewWindow = Library:CreateWindow("DH Enhanced", Vector2.new(492, 598), Enum.KeyCode.End)
-- TABS
local MainTab = NewWindow:CreateTab("Main")
local MiscTab = NewWindow:CreateTab("Misc")
local AntiAimTab = NewWindow:CreateTab("Anti")
local VisualTab = NewWindow:CreateTab("Visuals")
local SettingsTab = NewWindow:CreateTab("Settings")
-- MAIN
local TargetAimbotSec = MainTab:CreateSector("Target Aimbot", "left")
local UniversalResolverSec = MainTab:CreateSector("Universal Resolver", "left")
local CameraAimbotSec = MainTab:CreateSector("Camera Aimbot", "right")
-- MISC
local UtilitiesSec = MiscTab:CreateSector("Utilities", "left")
local MovementSec = MiscTab:CreateSector("Movement", "left")
local AimViewerSec = MiscTab:CreateSector("Aim Viewer", "right")
local AutoBuySec = MiscTab:CreateSector("Auto Buys", "right")
local SelfDotSec = MiscTab:CreateSector("Self Dot", "right")
-- ANTI AIM
local AntiLockSec = AntiAimTab:CreateSector("Anti Lock", "right")
local AntiAimSec = AntiAimTab:CreateSector("Anti Aim", "left")
local TargetStrafeSec = AntiAimTab:CreateSector("Target Strafe", "left")
-- VISUALS
local CursorSec = VisualTab:CreateSector("Cursor", "left")
local SelfVisual = VisualTab:CreateSector("Self Visual", "right")
local WorldVisual = VisualTab:CreateSector("World Visual", "right")
-- SETTINGS
local SettingsSec = SettingsTab:CreateSector("Settings", "left")

local Toggles = {}
local Sliders = {}
local Keybinds = {}

local CursorPath = Instance.new("ScreenGui")
local Swastika = Instance.new("TextLabel")

CursorPath.Name = "CursorPath"
CursorPath.Parent = game.CoreGui
CursorPath.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Swastika.Name = "Swastika"
Swastika.Parent = CursorPath
Swastika.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Swastika.BackgroundTransparency = 1.000
Swastika.BorderSizePixel = 2
Swastika.Position = UDim2.new(0, 0, 0, 0)
Swastika.Size = UDim2.new(0, 93, 0, 84)
Swastika.Font = Enum.Font.SourceSans
Swastika.Text = "卍"
Swastika.TextColor3 = Color3.fromRGB(0, 0, 0)
Swastika.TextSize = 46.000
Swastika.TextTransparency = 0
Swastika.Rotation = 45
Swastika.Visible = false

local TargetPlr, CamlockPlr

local TargBindEnabled, CamBindEnabled = false, false

local AntiCheatNamecall, TargNamecall

local StrafeSpeed = 0

local TargDotCircle = Drawing.new("Circle")
TargDotCircle.Filled = true
TargDotCircle.Thickness = 1
TargDotCircle.Radius = 7

local TargFovCircle = Drawing.new("Circle")
TargFovCircle.Thickness = 1.5

local TargTracerLine = Drawing.new("Line")
TargTracerLine.Thickness = 2

local SelfDotCircle = Drawing.new("Circle")
SelfDotCircle.Filled = true
SelfDotCircle.Thickness = 1
SelfDotCircle.Radius = 7

local SelfTracerLine = Drawing.new("Line")
SelfTracerLine.Thickness = 2

local CamFovCircle = Drawing.new("Circle")
CamFovCircle.Thickness = 1.5

local CamTracerLine = Drawing.new("Line")
CamTracerLine.Thickness = 2

local TargStats = Instance.new("ScreenGui", game:GetService("CoreGui"))
TargStats.Name = "AntiGUI"
TargStats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local TargHighlight = Instance.new("Highlight", game:GetService("CoreGui"))
local CamHighlight = Instance.new("Highlight", game:GetService("CoreGui"))

local VisualizerFolder = Instance.new("Folder")
VisualizerFolder.Parent = game.Workspace.Terrain

function createvisualizer()
    local Visualizer = Instance.new("Part")
    Visualizer.Anchored = true
    Visualizer.CanCollide = false
    Visualizer.Size = Vector3.new(2, 2, 2)
    Visualizer.Parent = VisualizerFolder
    Visualizer.Color = Color3.fromRGB(0, 0, 0)
    Visualizer.Shape = Enum.PartType.Ball
    if VelocityDesync and not CFrameDesync and getgenv().VisualizerVelocity ~= nil then
        Visualizer.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + getgenv().VisualizerVelocity * 0.1413
    else
        Visualizer.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
    Visualizer.Transparency = 1
    BoxVar = Instance.new("BoxHandleAdornment", Visualizer)
    BoxVar.Name = "Box"
    BoxVar.AlwaysOnTop = true
    BoxVar.ZIndex = 4
    BoxVar.Adornee = Visualizer
    BoxVar.Color3 = VisualizeColor
    BoxVar.Transparency = 0.5
    BoxVar.Size = Visualizer.Size
    game:GetService("RunService").RenderStepped:Wait()
    Visualizer:Destroy()
end

TargetAimbotEnabled = false
local Toggle1 = TargetAimbotSec:AddToggle("Enabled", false, function(Value)
	TargetAimbotEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Target Aimbot "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle1)

TargetAimbotKeybind = nil
local Keybind1 = TargetAimbotSec:AddKeybind("Keybind", nil, function(Value)
	TargetAimbotKeybind = Value
end)
table.insert(Keybinds,Keybind1)

TargetAimbotPrediction = nil
TargetAimbotRealPrediction = nil
TargetAimbotSec:AddTextbox("Prediction", nil, function(Value)
	TargetAimbotPrediction = Value
	TargetAimbotRealPrediction = Value
end)

TargetAimbotResolver = false
local TargResolverTog = TargetAimbotSec:AddToggle("Antilock Resolver", false, function(Value)
	TargetAimbotResolver = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Target Resolver "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,TargResolverTog)

local Keybind2 = TargResolverTog:AddKeybind(nil)
table.insert(Keybinds,Keybind2)

TargetAimbotJumpOffset = 0
TargetAimbotRealJumpOffset = nil
local Slider1 = TargetAimbotSec:AddSlider("Jump Offset", -2, 0, 2, 100, function(Value)
	TargetAimbotJumpOffset = Value
	TargetAimbotRealJumpOffset = Value
end)
table.insert(Sliders,Slider1)

TargetAimbotHitParts = {"HumanoidRootPart"}
TargetAimbotRealHitPart = nil
TargetAimbotSec:AddDropdown("Hit Part(s)", {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso", "RightUpperArm", "LeftUpperArm", "RightLowerArm", "LeftLowerArm", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg"}, {"HumanoidRootPart"}, true, function(Value)
	TargetAimbotHitParts = Value
end)

TargetAimbotAutoPred = false
local Toggle2 =TargetAimbotSec:AddToggle("Auto Pred", false, function(Value)
	TargetAimbotAutoPred = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Prediction "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle2)

TargetAimbotNotify = false
local Toggle3 =TargetAimbotSec:AddToggle("Notify", false, function(Value)
	TargetAimbotNotify = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Notification "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle3)

TargetAimbotKoCheck = false
local Toggle5 =TargetAimbotSec:AddToggle("KO Check", false, function(Value)
	TargetAimbotKoCheck = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("KO Check "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle5)

TargetAimbotLookAt = false
local Toggle6 =TargetAimbotSec:AddToggle("Look At", false, function(Value)
	TargetAimbotLookAt = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Look At "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle6)

TargetAimbotViewAt = false
local ViewAtTog = TargetAimbotSec:AddToggle("View At", false, function(Value)
	TargetAimbotViewAt = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("View At "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,ViewAtTog)

local Keybind3 = ViewAtTog:AddKeybind(nil)
table.insert(Keybinds,Keybind3)

TargetAimbotDot = false
local TargDotTog = TargetAimbotSec:AddToggle("Dot", false, function(Value)
	TargetAimbotDot = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Dot "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,TargDotTog)

TargDotTog:AddColorpicker(Color3.fromRGB(170, 120, 210), function(Value)
	TargDotCircle.Color = Value
	TargTracerLine.Color = Value
end)

TargetAimbotDotOnCursor = false
local Toggle7 = TargetAimbotSec:AddToggle("Dot on Cursor", false, function(Value)
	TargetAimbotDotOnCursor = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Dot on Cursor "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle7)

TargetAimbotTracer = false
local Toggle8 =TargetAimbotSec:AddToggle("Tracer", false, function(Value)
	TargetAimbotTracer = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Tracer "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle8)

TargetAimbotHighlight = false
local TargHighlightTog = TargetAimbotSec:AddToggle("Highlight", false, function(Value)
	TargetAimbotHighlight = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Highlight "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,TargHighlightTog)

TargHighlightTog:AddColorpicker(Color3.fromRGB(170, 120, 210), function(Value)
	TargHighlight.FillColor = Value
end)

TargHighlightTog:AddColorpicker(Color3.fromRGB(90, 65, 110), function(Value)
	TargHighlight.OutlineColor = Value
end)

TargetAimbotUseFov = false
local Toggle9 = TargetAimbotSec:AddToggle("Use FOV", false, function(Value)
	TargetAimbotUseFov = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target FOV "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle9)

local TargFovTog = TargetAimbotSec:AddToggle("FOV Visible", false, function(Value)
	TargFovCircle.Visible = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("FOV Visible "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,TargFovTog)

TargFovTog:AddColorpicker(Color3.fromRGB(80, 15, 180), function(Value)
	TargFovCircle.Color = Value
end)

local Toggle10 = TargetAimbotSec:AddToggle("FOV Filled", false, function(Value)
	TargFovCircle.Filled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("FOV Filled "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle10)

local Slider2 = TargetAimbotSec:AddSlider("FOV Transparency", 0, 0.75, 1, 100, function(Value)
	TargFovCircle.Transparency = Value
end)
table.insert(Sliders,Slider2)

local Slider3 = TargetAimbotSec:AddSlider("FOV Size", 5, 80, 500, 1, function(Value)
	TargFovCircle.Radius = Value * 2
end)
table.insert(Sliders,Slider3)

ResolverEnabled = false
local Toggle11 = UniversalResolverSec:AddToggle("Move Direction", false, function(Value)
    ResolverEnabled = Value
local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
    notify("Universal Resolver "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle11)

Resolver2Enabled = false
local Toggle12 = UniversalResolverSec:AddToggle("Universal Resolver", false, function(Value)
    Resolver2Enabled = Value
local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
    notify("Universal Resolver2  "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle12)

local Slider4 = UniversalResolverSec:AddSlider("Resolver Prediction", 30, 1, 250, 1, function(Value)
	ResolverPrediction = Value
end)
table.insert(Sliders,Slider4)
-- Target Strafe

TargetStrafeEnabled = false
local TargStrafeTog = TargetStrafeSec:AddToggle("Target Strafe", false, function(Value)
	TargetStrafeEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Strafe "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,TargStrafeTog)

local Keybind4 = TargStrafeTog:AddKeybind(nil)
table.insert(Keybinds,Keybind4)

DesyncStrafe = false
local DesyncStrafeTog = TargetStrafeSec:AddToggle("Desync Strafe", false, function(Value)
    DesyncStrafe = Value
    if CFrameDesync == false and DesyncStrafe then
        notify("CFrame Desync must be enabled for this to work",getgenv().NotificationColor,2,false)
    else
        local realstate = Value and "Enabled" or "Disabled"
        notify("Desync Strafe "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,DesyncStrafeTog)

local Keybind5 = DesyncStrafeTog:AddKeybind(nil)
table.insert(Keybinds,Keybind5)

RandomStrafe = false
local RandomStrafeTog = TargetStrafeSec:AddToggle("Random Strafe", false, function(Value)
    RandomStrafe = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
        notify("Target Strafe "..realstate,getgenv().NotificationColor,2,false)
    end 
end)
table.insert(Toggles,RandomStrafeTog)

local Keybind6 = RandomStrafeTog:AddKeybind(nil)
table.insert(Keybinds,Keybind6)

TargetStrafeSpeed = 1
local Slider5 = TargetStrafeSec:AddSlider("Speed", 0.5, 0.5, 10, 2, function(Value)
	TargetStrafeSpeed = Value
end)
table.insert(Sliders,Slider5)

TargetStrafeDistance = 1
local Slider6 = TargetStrafeSec:AddSlider("Distance", 1, 1, 20, 2, function(Value)
	TargetStrafeDistance = Value
end)
table.insert(Sliders,Slider6)

TargetStrafeHeight = 1
local Slider7 = TargetStrafeSec:AddSlider("Height", 1, 1, 20, 2, function(Value)
	TargetStrafeHeight = Value
end)
table.insert(Sliders,Slider7)
-- Camera Aimbot

CameraAimbotEnabled = false
local Toggle13 = CameraAimbotSec:AddToggle("Enabled", false, function(Value)
	CameraAimbotEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Camera Aimbot "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle13)

local CameraAimbotKeybind = CameraAimbotSec:AddKeybind("Keybind", nil, function(Value)
	CameraAimbotKeybind = Value
end)
table.insert(Keybinds,CameraAimbotKeybind)


CameraAimbotPrediction = nil
CameraAimbotRealPrediction = nil
CameraAimbotSec:AddTextbox("Prediction", nil, function(Value)
	CameraAimbotPrediction = Value
	CameraAimbotRealPrediction = Value
end)

CameraAimbotResolver = false
local CamResolverTog = CameraAimbotSec:AddToggle("Antilock Resolver", false, function(Value)
	CameraAimbotResolver = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Camlock Resolver "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,CamResolverTog)

local Keybind8 = CamResolverTog:AddKeybind(nil)
table.insert(Keybinds,Keybind8)

CameraAimbotJumpOffset = 0
CameraAimbotRealJumpOffset = nil
local Slider8 = CameraAimbotSec:AddSlider("Jump Offset", -2, 0, 2, 100, function(Value)
	CameraAimbotJumpOffset = Value
	CameraAimbotRealJumpOffset = Value
end)
table.insert(Sliders,Slider8)

CameraAimbotHitPart = "HumanoidRootPart"
CameraAimbotRealHitPart = nil
CameraAimbotSec:AddDropdown("Hit Part", {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, "HumanoidRootPart", false, function(Value)
	CameraAimbotHitPart = Value
	CameraAimbotRealHitPart = Value
end)

CameraAimbotUseAirPart = false
local Toggle14 = CameraAimbotSec:AddToggle("Use Air Part", false, function(Value)
	CameraAimbotUseAirPart = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Air Part "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle14)

CameraAimbotAirPart = "LowerTorso" 
CameraAimbotSec:AddDropdown("Air Part", {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso", "RightHand", "LeftHand", "RightFoot", "LeftFoot"}, "LowerTorso", false, function(Value)
	CameraAimbotAirPart = Value
end)

CameraAimbotAirCheckType = "Once in Air"
CameraAimbotSec:AddDropdown("Air Check Type", {"Once in Air", "Once Freefalling"}, "Once in Air", false, function(Value)
	CameraAimbotAirCheckType = Value
end)

CameraAimbotAutoPred = false
local Toggle15 = CameraAimbotSec:AddToggle("Auto Pred", false, function(Value)
	CameraAimbotAutoPred = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Prediction "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle15)

CameraAimbotNotify = false
local Toggle16 = CameraAimbotSec:AddToggle("Notify", false, function(Value)
	CameraAimbotNotify = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Notification "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle16)

CameraAimbotKoCheck = false
local Toggle17 = CameraAimbotSec:AddToggle("KO Check", false, function(Value)
	CameraAimbotKoCheck = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("KO Check "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle17)

CameraAimbotTracer = false
local CamTracerTog = CameraAimbotSec:AddToggle("Tracer", false, function(Value)
	CameraAimbotTracer = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Tracer "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,CamTracerTog)

CamTracerTog:AddColorpicker(Color3.fromRGB(170, 120, 210), function(Value)
	CamTracerLine.Color = Value
end)

CameraAimbotHighlight = false
local CamHighlightTog = CameraAimbotSec:AddToggle("Highlight", false, function(Value)
	CameraAimbotHighlight = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Target Highlight "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,CamHighlightTog)

CamHighlightTog:AddColorpicker(Color3.fromRGB(170, 120, 210), function(Value)
	CamHighlight.FillColor = Value
end)

CamHighlightTog:AddColorpicker(Color3.fromRGB(90, 65, 110), function(Value)
	CamHighlight.OutlineColor = Value
end)

CameraAimbotAimMethod = "Camera"
if game["PlaceId"] == 9825515356 then
	CameraAimbotSec:AddDropdown("Aim Method", {"Camera", "Mouse"}, "Mouse", false, function(Value)
		CameraAimbotAimMethod = Value
	end)
else
	CameraAimbotSec:AddDropdown("Aim Method", {"Camera", "Mouse"}, "Camera", false, function(Value)
		CameraAimbotAimMethod = Value
	end)
end

CameraAimbotSmoothing = false
local Toggle18 = CameraAimbotSec:AddToggle("Smoothing", false, function(Value)
	CameraAimbotSmoothing = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Smoothing "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle18)

CameraAimbotSmoothness = nil
CameraAimbotSec:AddTextbox("Smoothness", nil, function(Value)
	CameraAimbotSmoothness = Value
end)

CameraAimbotUseFov = false
local Toggle19 = CameraAimbotSec:AddToggle("Use FOV", false, function(Value)
	CameraAimbotUseFov = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Use FOV "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle19)

local CamFovTog = CameraAimbotSec:AddToggle("FOV Visible", false, function(Value)
	CamFovCircle.Visible = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("FOV Visible "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,CamFovTog)

CamFovTog:AddColorpicker(Color3.fromRGB(80, 15, 180), function(Value)
	CamFovCircle.Color = Value
end)

local Toggle20 = CameraAimbotSec:AddToggle("FOV Filled", false, function(Value)
	CamFovCircle.Filled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("FOV Filled "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle20)

local Slider9 = CameraAimbotSec:AddSlider("FOV Transparency", 0, 0.75, 1, 100, function(Value)
	CamFovCircle.Transparency = Value
end)
table.insert(Sliders,Slider9)

local Slider10 = CameraAimbotSec:AddSlider("FOV Size", 5, 80, 500, 1, function(Value)
	CamFovCircle.Radius = Value * 2
end)
table.insert(Sliders,Slider10)
-- Utilities

UtilitiesNoJumpCooldown = false
local Toggle21 = UtilitiesSec:AddToggle("No Jump Cooldown", false, function(Value)
	UtilitiesNoJumpCooldown = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("No Jump Cooldown "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle21)

UtilitiesNoSlowdown = false
local Toggle22 = UtilitiesSec:AddToggle("No Slowdown", false, function(Value)
	UtilitiesNoSlowdown = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("No Slowdown "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle22)

UtilitiesAutoStomp = false
local Toggle23 = UtilitiesSec:AddToggle("Auto Stomp", false, function(Value)
	UtilitiesAutoStomp = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Stomp "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle23)

UtilitiesAutoReload = false
local Toggle24 = UtilitiesSec:AddToggle("Auto Reload", false, function(Value)
	UtilitiesAutoReload = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Reload "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle24)

UtilitiesAutoHighArmor = false
local Toggle25 = UtilitiesSec:AddToggle("Auto High Armor", false, function(Value)
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto High Armor "..realstate,getgenv().NotificationColor,2,false)
end
    if Value == true then
        UtilitiesAutoHighArmor = true
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
            until UtilitiesAutoHighArmor == false
     elseif Value == false then
        UtilitiesAutoHighArmor = false
         end
end)
table.insert(Toggles,Toggle25)

UtilitiesAutoFireArmor = false
local Toggle26 = UtilitiesSec:AddToggle("Auto Fire Armor", false, function(Value)
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Fire Armor "..realstate,getgenv().NotificationColor,2,false)
end
    if Value == true then
        UtilitiesAutoFireArmor = true
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
            until UtilitiesAutoFireArmor == false
     elseif Value == false then
        UtilitiesAutoFireArmor = false
         end
end)
table.insert(Toggles,Toggle26)

local Toggle27 = UtilitiesSec:AddToggle("Disable Seats", false, function(Value)
    for i,v in pairs(Workspace:GetDescendants()) do 
        if v:IsA("Seat") then 
            v.Disabled = Value
        end 
    end 
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Disable Seats "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle27)

local Toggle28 = UtilitiesSec:AddToggle("Anti Void", false, function(Value)
game:GetService("Workspace").FallenPartsDestroyHeight = Value and -50000 or -500
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Anti Void "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle28)

UtilitiesSec:AddButton("Mask", function()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") then
        game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
        wait(.2)
        game.Players.LocalPlayer.Character:FindFirstChild('Mask'):Activate()
        return
    end
        
                    wearmasksavepos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    
                    wait(.1)
    
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
    
                    local plr = game.Players.LocalPlayer
                    plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Surgeon Mask] - $27"].Head.CFrame
                  wait(.3)
                 fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $27"].ClickDetector)
                    wait(.3)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(wearmasksavepos)
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("[Mask]") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("[Mask]").Parent = game.Players.LocalPlayer.Character
                    end
                    wait(.2)
                    game.Players.LocalPlayer.Character:FindFirstChild('[Mask]'):Activate()
                    wait()
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
end)

UtilitiesSec:AddButton("Chat Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dehoisted/Chat-Spy/main/source/main.lua"))()
end)

UtilitiesSec:AddButton("Force Reset", function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
            v:Remove()
        end
    end
--game.Players.LocalPlayer.Character.Humanoid.RigType = "R6"
--game:GetService("ReplicatedStorage").MainEvent:FireServer("ResetNew")
end)

UtilitiesSec:AddButton("Rejoin", function()
task.wait()
queue_on_teleport([[
repeat task.wait() until game:IsLoaded()
wait(2)

]])
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

UtilitiesSec:AddDropdown("Spoofer", {"Memory", "Ping", "Log", "IP", "Cleaner", "Anti Spy"}, nil, false, function(Value)
	if Value == "Memory" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/MemorySpoofer.lua'))()
	elseif Value == "Ping" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/PingSpoofer2.lua'))()
	elseif Value == "Log" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/LogSpoofer.lua'))()
    elseif Value == "IP" then
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
    elseif Value == "Cleaner" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/InfectionSpoof.lua'))()
    elseif Value == "Anti Spy" then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ArcaneAw/Spoofing/main/AntiSpy.lua'))()
	end
end)

local Slider11 = UtilitiesSec:AddSlider("FOV Amount", 70, 70, 120, 1, function(Value)
	workspace.CurrentCamera.FieldOfView = Value
end)
table.insert(Sliders,Slider11)

-- Movement

MovementSpeedEnabled = false
local SpeedTog = MovementSec:AddToggle("Speed", false, function(Value)
	MovementSpeedEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Cframe "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,SpeedTog)

local Keybind9 = SpeedTog:AddKeybind(nil)
table.insert(Keybinds,Keybind9)

MovementSpeedAmount = 1
local Slider12 = MovementSec:AddSlider("Speed Amount", 1, 1, 5000, 1, function(Value)
	MovementSpeedAmount = Value / 1000
end)
table.insert(Sliders,Slider12)

MovementAutoJump = false
local Toggle29 = MovementSec:AddToggle("Auto Jump", false, function(Value)
	MovementAutoJump = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Auto Jump "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle29)

MovementBunnyHop = false
local Toggle30 = MovementSec:AddToggle("Bunny Hop", false, function(Value)
	MovementBunnyHop = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Bunny Hop "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle30)

MovementHopAmount = 1
local Slider13 = MovementSec:AddSlider("Hop Amount", 1, 1, 50, 1, function(Value)
	MovementHopAmount = Value / 100
end)
table.insert(Sliders,Slider13)

MovementFlightEnabled = false
local FlightTog = MovementSec:AddToggle("Flight", false, function(Value)
	MovementFlightEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Flight "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,FlightTog)

local Keybind10 = FlightTog:AddKeybind(nil)
table.insert(Keybinds,Keybind10)

MovementFlightAmount = 1
local Slider14 = MovementSec:AddSlider("Flight Amount", 1, 1, 5000, 1, function(Value)
	MovementFlightAmount = Value / 20
end)
table.insert(Sliders,Slider14)


local FakeLagTog = MovementSec:AddToggle("Fake Lag", false, function(Value)
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Fake Lag "..realstate,getgenv().NotificationColor,2,false)
end
    FakeLagEnabled = false
    FakeLagAmount = 0.000001
    if Value then
        FakeLagEnabled = true
        while FakeLagEnabled == true do
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(FakeLagAmount)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait()
        end
    else
        FakeLagEnabled = false
    end
end)
table.insert(Toggles,FakeLagTog)

local Keybind11 = FakeLagTog:AddKeybind(nil)
table.insert(Keybinds,Keybind11)

FakeLagAmount = 0.000001
local Slider15 = MovementSec:AddSlider("Fake Lag Amount", 1, 1, 10, 1, function(Value)
    FakeLagAmount = Value / 10
end)
table.insert(Sliders,Slider15)

-- Self Dot

SelfDotEnabled = false
local SelfDotTog = SelfDotSec:AddToggle("Enabled", false, function(Value)
	SelfDotEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Self Dot "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,SelfDotTog)

SelfDotTog:AddColorpicker(Color3.fromRGB(170, 120, 210), function(Value)
	SelfDotCircle.Color = Value
	SelfTracerLine.Color = Value
end)

SelfDotTracer = false
local Toggle31 = SelfDotSec:AddToggle("Tracer", false, function(Value)
	SelfDotTracer = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Self Dot Tracer "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle31)

SelfDotRandomHitPart = false
local Toggle32 = SelfDotSec:AddToggle("Random Hit Part", false, function(Value)
	SelfDotRandomHitPart = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Random Hit Part "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,Toggle32)

SelfDotPrediction = 1
local Slider16 = SelfDotSec:AddSlider("Prediction", 1, 1, 5, 2, function(Value)
	SelfDotPrediction = Value / 20
end)
table.insert(Sliders,Slider16)

SelfDotHitPart = "HumanoidRootPart"
SelfDotRealHitPart = nil
SelfDotSec:AddDropdown("Hit Part", {"Head", "Torso"}, "Torso", false, function(Value)
	if Value == "Head" then
		SelfDotHitPart = "Head"
		SelfDotRealHitPart = "Head"
	else
		SelfDotHitPart = "HumanoidRootPart"
		SelfDotRealHitPart = "HumanoidRootPart"
	end
end)

-- Aimviewer

AimViewerEnabled = false
local AimViewerTog = AimViewerSec:AddToggle("Aim Viewer", false, function(Value)
    AimViewerEnabled = Value
local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
    notify("Aimviewer "..realstate,Color3.fromRGB(255, 255, 255),2,false)
end
target = closest()
end)
table.insert(Toggles,AimViewerTog)

AimViewerKeybind = "x"
AimViewerSec:AddDropdown("Keybind", {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}, "x", false, function(Value)
    AimViewerKeybind = Value
end)

AimViewerMaterial = "ForceField"
AimViewerSec:AddDropdown("Material", {"Plastic","ForceField","Neon","SmoothPlastic","Wood","WoodPlanks","Marble","Basalt","Slate","CrackedLava","Concrete","Limestone","Granite","Pavement","Brick","Pebble","Cobblestone","Rock","Sandstone","CorrodedMetal","DiamondPlate","Foil","Metal","Grass","LeafyGrass","Sand","Fabric","Snow","Mud","Ground","Asphalt","Salt","Ice","Glacier","Glass","Air","Water"}, "ForceField", false, function(Value)
    AimViewerMaterial = Value
end)

AimViewerPOVViewer = false
local Toggle33 = AimViewerSec:AddToggle("POV Viewer", false, function(Value)
    AimViewerPOVViewer = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("POV Viewing "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle33)

AimViewerColor = Color3.fromRGB(19, 119, 255)
AimViewerTog:AddColorpicker(Color3.fromRGB(19, 119, 255), function(Value)
    AimViewerColor = Value
end)

AimViewerRainbow = false
local Toggle34 = AimViewerSec:AddToggle("Rainbow", false, function(Value)
    AimViewerRainbow = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Rainbow Visual "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle34)

AimViewerWidth = 3
local Slider17 = AimViewerSec:AddSlider( "Width", 0, 3, 10, 1, function(Value)
    AimViewerWidth = Value/10
end)
table.insert(Sliders,Slider17)

-- Anti Lock

AntiLockEnabled = false
local AntiLockTog = AntiLockSec:AddToggle("Enabled", false, function(Value)
	AntiLockEnabled = Value
    local realstate = Value and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Anti Lock "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,AntiLockTog)

local Keybind12 = AntiLockTog:AddKeybind(nil)
table.insert(Keybinds,Keybind12)

AntiLockMode = "Custom"
AntiLockSec:AddDropdown("Mode", {"Custom", "Prediction Changer", "Up", "Down", "Prediction Tripler", "Prediction Reverser", "LookVector", "AirOrthodox", "Prediction Multiplier", "Spinbot Desync"}, "Custom", false, function(Value)
	AntiLockMode = Value
end)

AntiLockSec:AddLabel("Custom")

AntiLockCustomX = 10000
local Slider18 = AntiLockSec:AddSlider("Custom X", -10000, 10000, 10000, 1, function(Value)
	AntiLockCustomX = Value
end)
table.insert(Sliders,Slider18)

AntiLockCustomY = 10000
local Slider19 = AntiLockSec:AddSlider("Custom Y", -10000, 10000, 10000, 1, function(Value)
	AntiLockCustomY = Value
end)
table.insert(Sliders,Slider19)

AntiLockCustomZ = 10000
local Slider20 = AntiLockSec:AddSlider("Custom Z", -10000, 10000, 10000, 1, function(Value)
	AntiLockCustomZ = Value
end)
table.insert(Sliders,Slider20)

AntiLockSec:AddLabel("Prediction Reverser")

AntiLockPredReverseAmt = 3.5
local Slider21 = AntiLockSec:AddSlider("Reverse Amount", 0.5, 3.5, 10, 2, function(Value)
	AntiLockPredReverseAmt = Value
end)
table.insert(Sliders,Slider21)

local AntiLockTog3 = AntiLockSec:AddToggle("FFlag", false, function(Value)
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
        notify("FFlag "..realstate,getgenv().NotificationColor,2,false)
    end
if Value == true then
    getgenv().NetworkSleepPower = 12

    getgenv().NetworkSleepPower2 = 17 - getgenv().NetworkSleepPower
            setfflag("S2PhysicsSenderRate", getgenv().NetworkSleepPower2)
            setfflag("PhysicsSenderMaxBandwidthBps", math.round(math.pi * getgenv().NetworkSleepPower2))
            sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
            task.wait()
            sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
elseif Value == false then
    getgenv().NetworkSleepPower = 0

    getgenv().NetworkSleepPower2 = 17 - getgenv().NetworkSleepPower
            setfflag("S2PhysicsSenderRate", getgenv().NetworkSleepPower2)
            setfflag("PhysicsSenderMaxBandwidthBps", math.round(math.pi * getgenv().NetworkSleepPower2))
            sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", true)
            task.wait()
            sethiddenproperty(game.Players.LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", false)
end
end)
table.insert(Toggles,AntiLockTog3)

local Keybind14 = AntiLockTog3:AddKeybind(nil)
table.insert(Keybinds,Keybind14)

local Slider22 = AntiLockSec:AddSlider("FFlag Rate", 0, 1, 15, 1, function(Value)
    getgenv().NetworkSleepPower = Value
end)
table.insert(Sliders,Slider22)

AntiLockSec:AddLabel("LookVector")

AntiLockLookVecAmt = 500
local Slider23 = AntiLockSec:AddSlider("LookVector Amount", -10000, 10000, 10000, 1, function(Value)
	AntiLockLookVecAmt = Value
end)
table.insert(Sliders,Slider23)

AntiLockSec:AddLabel("Prediction Changer")

AntiLockPredChangeAmt = 5
local Slider24 = AntiLockSec:AddSlider("Prediction Amount", -20, 5, 20, 2, function(Value)
	AntiLockPredChangeAmt = Value
end)
table.insert(Sliders,Slider24)

AntiLockSec:AddLabel("Spinbot Desync")

AntiLockDesyncVel = Vector3.new(9e9, 9e9, 9e9)
AntiLockSec:AddDropdown("Desync Velocity", {"Default", "Sky", "Underground"}, "Default", false, function(Value)
	if Value == "Default" then
		AntiLockDesyncVel = Vector3.new(9e9, 9e9, 9e9)
	elseif Value == "Sky" then
		AntiLockDesyncVel = Vector3.new(15, 9e9, 15)
	elseif Value == "Underground" then
		AntiLockDesyncVel = Vector3.new(15, -9e9, 15)
	end
end)

AntiLockDesyncAngles = 0.5
local Slider25 = AntiLockSec:AddSlider("Desync Angles", -50, 0.5, 50, 2, function(Value)
	AntiLockDesyncAngles = Value
end)
table.insert(Sliders,Slider25)

JitterBot = false
local JitterTog = AntiAimSec:AddToggle("Jitter", false, function(Boolean)
    JitterBot = Boolean
    if Boolean then
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
    else
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
    end
    local realstate = Boolean and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Jitter "..realstate,getgenv().NotificationColor,2,false)
end
end)
table.insert(Toggles,JitterTog)

local Keybind15 = JitterTog:AddKeybind(nil)
table.insert(Keybinds,Keybind15)

SpinBot = false
local SpinBotTog = AntiAimSec:AddToggle("SpinBot", false, function(Boolean)
    SpinBot = Boolean
    if Boolean then
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
    else
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
    end
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Spinbot "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,SpinBotTog)

local Keybind16 = SpinBotTog:AddKeybind(nil)
table.insert(Keybinds,Keybind16)

DestroyCheaters = false
local DestroyCheatersTog = AntiAimSec:AddToggle("Destroy Cheaters", false, function(Boolean)
    DestroyCheaters = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Destroy Cheaters "..realstate,getgenv().NotificationColor,2,false)
    end
    local Position; 
    game:GetService("RunService").heartbeat:Connect(function()
        if game.Players.LocalPlayer.Character then 
            local Char = game.Players.LocalPlayer.Character.HumanoidRootPart
            local Offset = Char.CFrame * CFrame.new(9e9, 0/0, math.huge)
            
            if DestroyCheaters then 
                Position = Char.CFrame
                Char.CFrame = Offset
                game:GetService("RunService").RenderStepped:Wait()
                Char.CFrame = Position
            end 
        end 
    end)
    
    if DestroyCheaters and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
        if game.Players.LocalPlayer.Character.HumanoidRootPart and Position ~= nil then
            return Position
        end
    end
end)
table.insert(Toggles,DestroyCheatersTog)

local Keybind17 = DestroyCheatersTog:AddKeybind(nil)
table.insert(Keybinds,Keybind17)

SpinBotSpeed = 7
local Slider26 = AntiAimSec:AddSlider("Spinbot Speed", 1, 100, 100, 1, function(Value)
    SpinBotSpeed = Value
end)
table.insert(Sliders,Slider26)

AntiAimSec:AddSeperator("Desync")

DesyncSpinPower = 0.001
DesyncPower = 16
VelocityDesync = false
local VelocityDesyncTog = AntiAimSec:AddToggle("Velocity Desync", false, function(Boolean)
    VelocityDesync = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Velocity Desync "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,VelocityDesyncTog)

local Keybind18 = VelocityDesyncTog:AddKeybind(nil)
table.insert(Keybinds,Keybind18)

Visualize = false
VisualizeColor = Color3.fromRGB(255, 0, 125)
local Visualizenigga = AntiAimSec:AddToggle("Visualize", false, function(Boolean)
    Visualize = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Velocity Visualizer "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Visualizenigga)

Visualizenigga:AddColorpicker(Color3.fromRGB(203, 9, 61), function(Color)
    VisualizeColor = Color
end)

VelocityDesyncX = 0
local Slider27 = AntiAimSec:AddSlider("Position X", -50, 0, 50, 1, function(Value)
    VelocityDesyncX = Value / 2500
end)
table.insert(Sliders,Slider27)

VelocityDesyncY = 0
local Slider28 = AntiAimSec:AddSlider("Position Y", -50, 0, 50, 1, function(Value)
    VelocityDesyncY = Value / 2500
end)
table.insert(Sliders,Slider28)

VelocityDesyncZ = 0
local Slider29 = AntiAimSec:AddSlider("Position Z", -50, 0, 50, 1, function(Value)
    VelocityDesyncZ = Value / 2500
end)
table.insert(Sliders,Slider29)

local AntiLockTog2 = AntiAimSec:AddToggle("Unhittable", false, function(Value)
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Unhittable "..realstate,getgenv().NotificationColor,2,false)
    end
    if Value == true then 
        getgenv().Desync1 = true
    elseif Value == false then
        getgenv().Desync1 = false
    end
    end)
    table.insert(Toggles,AntiLockTog2)
    
    local Keybind13 = AntiLockTog2:AddKeybind(nil)
    table.insert(Keybinds,Keybind13)
    
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().Desync1 == true then
        task.wait()
            abc = game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0.01,0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(-AntiLockCustomX,AntiLockCustomX),math.random(-AntiLockCustomY,AntiLockCustomY),math.random(-AntiLockCustomZ,AntiLockCustomZ))
            game:GetService("RunService").RenderStepped:Wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = abc
        end
    end)

AntiAimSec:AddSeperator("-")

CFrameDesync = false
local CframeDesyncTog = AntiAimSec:AddToggle("CFrame Desync", false, function(Boolean)
    CFrameDesync = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Cframe Desync "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,CframeDesyncTog)

local Keybind19 = CframeDesyncTog:AddKeybind(nil)
table.insert(Keybinds,Keybind19)

RandomMode = false
local Toggle36 = AntiAimSec:AddToggle("Random Mode", false, function(Boolean)
    RandomMode = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Random Mode "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle36)

local Slider30 = AntiAimSec:AddSlider("Power", 0, 0, 50, 1, function(Value)
    RandomModePower = Value
end)
table.insert(Sliders,Slider30)

local Toggle37 = AntiAimSec:AddToggle("Manual", false, function(Boolean)
    Manual = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Manual Desync "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle37)

CframeDesyncX = 0
local Slider31 = AntiAimSec:AddSlider("X", -50, 0, 50, 1, function(Value)
    CframeDesyncX = Value
end)
table.insert(Sliders,Slider31)

CframeDesyncY = 0
local Slider32 = AntiAimSec:AddSlider("Y", -50, 0, 50, 1, function(Value)
    CframeDesyncY = Value
end)
table.insert(Sliders,Slider32)

CframeDesyncZ = 0
local Slider33 = AntiAimSec:AddSlider("Z", -50, 0, 50, 1, function(Value)
    CframeDesyncZ = Value
end)
table.insert(Sliders,Slider33)

local Slider34 = AntiAimSec:AddSlider("Rotation X", -6, 0, 6, 1,
function(Value)
    RotationX = Value
end)
table.insert(Sliders,Slider34)

local Slider35 = AntiAimSec:AddSlider("Rotation Y", -6, 0, 6, 1, function(Value)
    RotationY = Value
end)
table.insert(Sliders,Slider35)

local Slider36 = AntiAimSec:AddSlider("Rotation Z", -6, 0, 6, 1, function(Value)
    RotationZ = Value
end)
table.insert(Sliders,Slider36)

local TopCursorToggle = CursorSec:AddToggle( "Color", true, function(Boolean)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = Boolean
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Visible = Boolean
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = Boolean
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = Boolean
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Cursor Color "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,TopCursorToggle)

TopCursorToggle:AddColorpicker( Color3.fromRGB(255, 255, 255), function(color)
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = color
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = color
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = color
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = color
    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = color
end)

local Spin = CursorSec:AddToggle( "Spin", false, function(Boolean)
    getgenv().SpinningCursor = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Spinning Cursor "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Spin)

local Spin = CursorSec:AddToggle( "Rainbow", false, function(Boolean)
    getgenv().RainbowColor = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Rainbow Cursor "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Spin)

local Slider37 = CursorSec:AddSlider("Spinning Cursor Speed", 0, 1, 50, 1, function(Value)
    getgenv().SpinPower = Value
end)
table.insert(Sliders,Slider37)

local SwastikaTog = CursorSec:AddToggle("Hakenkreuz", false, function(Boolean)
    Swastika.Visible = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Hakenkreuz "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,SwastikaTog)

SwastikaTog:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
    Swastika.TextColor3 = Color
end)

CursorRainbow = false
local Toggle38 = CursorSec:AddToggle("Rainbow Hakenkreuz", false, function(Boolean)
    CursorRainbow = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Rainbow Hakenkreuz "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle38)

CursorSpin = false
local Toggle39 = CursorSec:AddToggle("Spinning Hakenkreuz", false, function(Boolean)
    CursorSpin = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Spinning Hakenkreuz "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle39)

CursorSpinSpeed = 1
local Slider38 = CursorSec:AddSlider("Hakenkreuz Spin Speed", 0, 1, 5, 1, function(Value)
    CursorSpinSpeed = Value
end)
table.insert(Sliders,Slider38)

local BulletTog = WorldVisual:AddToggle("Bullet Tracers", false, function(Boolean)
    BulletTracers = Boolean
    local realstate = Boolean and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Bullet Tracers "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,BulletTog)

BulletTog:AddColorpicker(Color3.fromRGB(255, 0, 0), function(Color)
    BulletTracerColor = Color
end)

local Slider39 = WorldVisual:AddSlider("Bullet Thickness", 0, 5, 10, 1, function(Value)
    BulletWidth = Value
end)
table.insert(Sliders,Slider39)

Ambient = nil
local Ambient = WorldVisual:AddToggle("Ambient", false, function(Boolean)
        Ambient = Boolean
    
        local realstate = Boolean and "Enabled" or "Disabled"
        if getgenv().SendNotifs then
                notify("Ambient  "..realstate,getgenv().NotificationColor,2,false)
        end
        if not Ambient then
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(152, 152, 146)
            game:GetService("Lighting").Ambient = Color3.fromRGB(0, 0, 0)
        end
    end)
    table.insert(Toggles,Ambient)

game:GetService("Lighting").Ambient = Color3.fromRGB(0, 0, 0)
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(152, 152, 146)

Ambient:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
    if Ambient then
        game:GetService("Lighting").Ambient = Color
    end
end)

game:GetService("Lighting").Ambient = Color3.fromRGB(0, 0, 0)
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(152, 152, 146)

Ambient:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
    if Ambient then
        game:GetService("Lighting").OutdoorAmbient = Color
    end
end)

game:GetService("Lighting").Ambient = Color3.fromRGB(0, 0, 0)
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(152, 152, 146)

local highlight = SelfVisual:AddToggle("Shadow", false, function(state)
FFBody = state

local realstate = state and "Enabled" or "Disabled"
if getgenv().SendNotifs then
        notify("Shadow "..realstate,getgenv().NotificationColor,2,false)
end

if not FFBody then
    if game.Players.LocalPlayer.Character then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Plastic
                end
            end
        end
    end
end)
table.insert(Toggles,highlight)

local Toggle40 = SelfVisual:AddToggle("Rainbow Shadow", false, function(state)
    FFBodyRainbow = state
    
    local realstate = state and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Shadow "..realstate,getgenv().NotificationColor,2,false)
    end
    
    if not FFBodyRainbow then
        if game.Players.LocalPlayer.Character then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.Plastic
                    end
                end
            end
        end
    end)
    table.insert(Toggles,Toggle40)

function Weld(x, y)
    local W = Instance.new("Weld")
    W.Part0 = x
    W.Part1 = y
    local CJ = CFrame.new(x.Position)
    local C0 = x.CFrame:inverse() * CJ
    local C1 = y.CFrame:inverse() * CJ
    W.C0 = C0
    W.C1 = C1
    W.Parent = x
end

local Toggle41 = SelfVisual:AddToggle("Custom Character", false, function(state)
    local realstate = state and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Character "..realstate,getgenv().NotificationColor,2,false)
    end
        if state then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then
                    v.Transparency = 1
                end
            end

            getgenv().Custom =
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(
                function()
                    fuc:Destroy()
                    wait(5)
                    fuc = Instance.new("Part", workspace)
                    fuc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    fuc.CanCollide = false
                    fuck = Instance.new("SpecialMesh")
                    fuck.Parent = fuc
                    fuck.MeshType = "FileMesh"
                    if getgenv().CharacterType == "AmongUs" then
                        fuck.Scale = Vector3.new(0.2, 0.2, 0.2)
                        fuck.TextureId = "http://www.roblox.com/asset/?id=6686375937"
                        fuck.MeshId = "http://www.roblox.com/asset/?id=6686375902"
                    elseif getgenv().CharacterType == "Sonic" then
                        fuck.Scale = Vector3.new(0.1, 0.1, 0.1)
                        fuck.TextureId = "http://www.roblox.com/asset/?id=6901422268"
                        fuck.MeshId = "http://www.roblox.com/asset/?id=6901422170"
                    elseif getgenv().CharacterType == "Chicken" then
                        fuck.Scale = Vector3.new(3, 3, 3)
                        fuck.TextureId = "http://www.roblox.com/asset/?id=2114220248"
                        fuck.MeshId = "http://www.roblox.com/asset/?id=2114220154"
                    end

                    Weld(game.Players.LocalPlayer.Character.HumanoidRootPart, fuc)

                    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") or v:IsA("Decal") then
                            v.Transparency = 1
                        end
                    end
                end
            )

            fuc = Instance.new("Part", workspace)
            fuc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            fuc.CanCollide = false
            fuck = Instance.new("SpecialMesh")
            fuck.Parent = fuc
            fuck.MeshType = "FileMesh"

            if getgenv().CharacterType == "AmongUs" then
                fuck.Scale = Vector3.new(0.2, 0.2, 0.2) --sizerbxassetid://6901422268
                fuck.TextureId = "http://www.roblox.com/asset/?id=6686375937" --Texture / Skin
                fuck.MeshId = "http://www.roblox.com/asset/?id=6686375902" -- Mesh Id
            elseif getgenv().CharacterType == "Sonic" then
                fuck.Scale = Vector3.new(0.1, 0.1, 0.1) --sizerbxassetid://6901422268
                fuck.TextureId = "http://www.roblox.com/asset/?id=6901422268" --Texture / Skin
                fuck.MeshId = "http://www.roblox.com/asset/?id=6901422170"
            elseif getgenv().CharacterType == "Chicken" then
                fuck.Scale = Vector3.new(3, 3, 3) --sizerbxassetid://6901422268
                fuck.TextureId = "http://www.roblox.com/asset/?id=2114220248" --Texture / Skin
                fuck.MeshId = "http://www.roblox.com/asset/?id=2114220154" -- Mesh Id
            end

            Weld(game.Players.LocalPlayer.Character.HumanoidRootPart, fuc)
        else
            fuc:Destroy()

            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") and v.Name ~= "CUFF" then
                    v.Transparency = 0
                end

                if v.Name == "CUFF" then
                    v:Destroy()
                end
            end

        for i, v in pairs(game.Players.LocalPlayer.Character.BodyEffects.SpecialParts:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = 1
            end
        end

        getgenv().Custom:Disconnect()

        game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
    end
end)
table.insert(Toggles,Toggle41)

SelfVisual:AddDropdown("Character Type", {"AmongUs", "Sonic", "Chicken"}, "AmongUs", false, function(Option)
        getgenv().CharacterType = Option

        if Option == "AmongUs" then
            fuck.Scale = Vector3.new(0.2, 0.2, 0.2) --sizerbxassetid://6901422268
            fuck.TextureId = "http://www.roblox.com/asset/?id=6686375937" --Texture / Skin
            fuck.MeshId = "http://www.roblox.com/asset/?id=6686375902" -- Mesh Id
        elseif Option == "Sonic" then
            fuck.Scale = Vector3.new(0.25, 0.25, 0.25) --sizerbxassetid://6901422268
            fuck.TextureId = "http://www.roblox.com/asset/?id=6901422268" --Texture / Skin
            fuck.MeshId = "http://www.roblox.com/asset/?id=6901422170"
        elseif Option == "Chicken" then
            fuck.Scale = Vector3.new(3, 3, 3) --sizerbxassetid://6901422268
            fuck.TextureId = "http://www.roblox.com/asset/?id=2114220248" --Texture / Skin
            fuck.MeshId = "http://www.roblox.com/asset/?id=2114220154" -- Mesh Id
    end
    if getgenv().SendNotifs then
            notify("Character Set To "..Option,getgenv().NotificationColor,2,false)
    end
end)

highlight:AddColorpicker(Color3.fromRGB(255, 255, 255),function(Color)
    FFBodyColour = Color
end)

SettingsTab:CreateConfigSystem("right")

SettingsSec:AddButton("Reset Settings", function()
    for i,v in pairs(Toggles) do
        v:Set(false)
    end
    for i,v in pairs(Sliders) do
        v:Set(0)
    end
    for i,v in pairs(Keybinds) do
        v:Set(Enum.KeyCode.Clear)
    end
end)

SettingsSec:AddDropdown("UI Key",{"RightControl","Tab","Minus","Comma","Period","Semicolon","V","Insert","Home","End"},"End",false,function(choice)
    NewWindow.hidebutton = Enum.KeyCode[choice]
    if getgenv().SendNotifs then
            notify("Keybind Set To "..choice,getgenv().NotificationColor,2,false)
    end
end)

local Toggle42 = SettingsSec:AddToggle("Velocity Stats", false, function(Value)
    getgenv().velostats = Value
    local realstate = Value and "Enabled" or "Disabled"
    if getgenv().SendNotifs then
            notify("Velocity Stats "..realstate,getgenv().NotificationColor,2,false)
    end
end)
table.insert(Toggles,Toggle42)

local Toggle43 = SettingsSec:AddToggle("Notification", true, function(Value)
    getgenv().SendNotifs = Value
end)
table.insert(Toggles,Toggle43)

Toggle43:AddColorpicker(Color3.fromRGB(255, 255, 255),function(Color)
    getgenv().NotificationColor = Color
end)

SettingsSec:AddTextbox("Watermark Text", nil, function(Value)
    CheatName = Value
    Library:CreateWatermark("" .. CheatName .. " | {fps} | {game}")
end)

local Toggle44 = SettingsSec:AddToggle("Watermark", true, function(Value)
    game:GetService("CoreGui").Watermark.Enabled = Value
end)
table.insert(Toggles,Toggle44)

local BuysUwu = AutoBuySec:AddDropdown("Other", Buys, "Pick me", false, function(Option)
        if Option then
            local OldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game:GetService("Workspace").Ignored.Shop[Option].Head.CFrame
            wait(0.3)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPosition
    end
end)

local BuyOptions = AutoBuySec:AddDropdown("Ammo", Buys, "Ammo", false, function(Option)
        if Option then
            local OldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game:GetService("Workspace").Ignored.Shop[Option].Head.CFrame
            wait(0.3)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop[Option].ClickDetector)
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPosition
    end
end)

local Buys = {}

for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do 
    if v:IsA("Model") then 
     if not string.match(v.Name, "Food") then
        if not string.match(v.Name, "Ammo") then
            if not string.match(v.Name, "Phone") then 
                if not string.match(v.Name, "Mask") then 
                    if not string.match(v.Name, "Weights") then 
                        BuysUwu:Add(v.Name)
                    end 
                end 
            end 
        end 
     end
    end 
end

for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do 
    if v:IsA("Model") then 
        if string.match(v.Name, "Ammo") then
            BuyOptions:Add(v.Name)
        end 
    end 
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/ArcaneAw/Locking/main/AAV/DhEnhancedAntiNotification.lua"))()

-- Aimviewer Code

function closest()
    local a = math.huge
    local b

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and
                v.Character:FindFirstChild("HumanoidRootPart")
         then
            local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local d = (Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) - Vector2.new(c.X, c.Y)).Magnitude

            if a > d then
                b = v
                a = d
            end
        end
    end

    return b
end

function ClosestPlr(Part, UseFov, FovCircle)
	local Distance, Closest = math.huge, nil

	for I, Target in pairs(game:GetService("Players"):GetPlayers()) do
		if Target ~= game:GetService("Players").LocalPlayer then
			local Position = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Target.Character[Part].Position)
			local Magnitude = (Vector2.new(Position.X, Position.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude

			if UseFov then
				if Magnitude < Distance and Magnitude < FovCircle.Radius then
					Closest = Target
					Distance = Magnitude
				end
			else
				if Magnitude < Distance then
					Closest = Target
					Distance = Magnitude
				end
			end
		end
	end

	return Closest
end

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
    function(z)
        if z == AimViewerKeybind and AimViewerEnabled == true then
            target = closest()
            if getgenv().SendNotifs then
                notify("Aimviewing "..tostring(target.Name),getgenv().NotificationColor,2,false)
            end

        end
end)

local avp = Instance.new("Part",game.Workspace)
avp.CanCollide = false
avp.Anchored = true
avp.Size = Vector3.new(0.1,0.1,0.1)

task.spawn(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if not target or not target.Character then
                    return
                end
                if AimViewerEnabled and target.Character:FindFirstChildWhichIsA("Tool") and target.Character:FindFirstChild("BodyEffects") and target.Character:FindFirstChild("Head") then
                    local unfixedval = target.Character.BodyEffects["MousePos"].Value -- Raw vector3 from player
                    
                    avp.Size = Vector3.new(AimViewerWidth,AimViewerWidth,(target.Character.Head.Position-unfixedval).Magnitude)
                    avp.CFrame = CFrame.lookAt((target.Character.Head.Position+unfixedval)/2,unfixedval,Vector3.new(0,0.1,0))
                    local midpoint = (target.Character.Head.Position+unfixedval)/2
                    local offset = (midpoint).Magnitude >= 1000 and (midpoint).Magnitude or 0
                    avp.CFrame = avp.CFrame * CFrame.new(0,0,offset)
                    
                    if not AimViewerRainbow then
                        avp.Color = AimViewerColor
                    end
                    avp.Material = Enum.Material[AimViewerMaterial]
                else
                    avp.Position = Vector3.new(2^16,2^16,2^16)
                    avp.Size = Vector3.new(0.1,0.1,0.1)
                end
                if AimViewerPOVViewer then
                    workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChild("Humanoid")
                    --game.Workspace.CurrentCamera.CoordinateFrame = CFrame.new(game.Workspace.CurrentCamera.CoordinateFrame.p, target.Character.BodyEffects["MousePos"].Value)
                    avp.Transparency = 0
                else
                    workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    avp.Transparency = 0
                end 
            end)
    end)
task.spawn(
function()
    while wait() do
        if AimViewerRainbow then
            for i = 0,1, 0.01 do
                avp.Color = Color3.fromHSV(i, 1, 1)
                wait()
            end
        else
            avp.Color = AimViewerColor
        end
    end
end)

-- Code

if game:GetService("CorePackages").Packages then
	game:GetService("CorePackages").Packages:Destroy()
end

-- Heartbeat Functions

game:GetService("RunService").Heartbeat:Connect(function()
	if MovementFlightEnabled and not AntiLockEnabled then
		local FlyVelocity = Vector3.new(0, 0.9, 0)

		if not game:GetService("UserInputService"):GetFocusedTextBox() then
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
				FlyVelocity = FlyVelocity + (game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * MovementFlightAmount)
			end

			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
				FlyVelocity = FlyVelocity + (game:GetService("Workspace").CurrentCamera.CoordinateFrame.rightVector * -MovementFlightAmount)
			end

			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
				FlyVelocity = FlyVelocity + (game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * -MovementFlightAmount)
			end

			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
				FlyVelocity = FlyVelocity + (game:GetService("Workspace").CurrentCamera.CoordinateFrame.rightVector * MovementFlightAmount)
			end
		end

		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = FlyVelocity
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Freefall")
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	local Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(game:GetService("Players").LocalPlayer.Character[SelfDotRealHitPart].Position + (game:GetService("Players").LocalPlayer.Character[SelfDotRealHitPart].AssemblyLinearVelocity * SelfDotPrediction))

	if SelfDotEnabled and OnScreen then
		SelfDotCircle.Visible = true
		SelfDotCircle.Position = Vector2.new(Position.X, Position.Y)
	else
		SelfDotCircle.Visible = false
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	local Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(game:GetService("Players").LocalPlayer.Character[SelfDotRealHitPart].Position + (game:GetService("Players").LocalPlayer.Character[SelfDotRealHitPart].AssemblyLinearVelocity * SelfDotPrediction))

	if SelfDotTracer and OnScreen then
		SelfTracerLine.Visible = true
		SelfTracerLine.From = game:GetService("UserInputService"):GetMouseLocation()
		SelfTracerLine.To = Vector2.new(Position.X, Position.Y)
	else
		SelfTracerLine.Visible = false
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if AntiLockEnabled then
		local RootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		local Velocity, AssemblyVelocity, Cframe = RootPart.Velocity, RootPart.AssemblyLinearVelocity, RootPart.CFrame

		if AntiLockMode == "Custom" then
			RootPart.Velocity = Vector3.new(AntiLockCustomX, AntiLockCustomY, AntiLockCustomZ)
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Prediction Changer" then
			RootPart.Velocity = Velocity * AntiLockPredChangeAmt
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Up" then
			RootPart.Velocity = Vector3.new(Velocity.X, 9e9, Velocity.Z)
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Down" then
			RootPart.Velocity = Vector3.new(Velocity.X, -9e9, Velocity.Z)
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Prediction Tripler" then
			RootPart.Velocity = Velocity * 3
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Prediction Reverser" then
			RootPart.CFrame = Cframe - game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * AntiLockPredReverseAmt / 10

		elseif AntiLockMode == "LookVector" then
			RootPart.Velocity = Cframe.lookVector * AntiLockLookVecAmt
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "AirOrthodox" then
			RootPart.Velocity = Vector3.new(777, 777, 777)
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Prediction Multiplier" then
			RootPart.Velocity = Velocity * 7
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif AntiLockMode == "Spinbot Desync" then
			RootPart.AssemblyLinearVelocity = AntiLockDesyncVel
			RootPart.CFrame = Cframe * CFrame.Angles(0, math.rad(AntiLockDesyncAngles), 0)
			game:GetService("RunService").RenderStepped:Wait()
			RootPart.AssemblyLinearVelocity = AssemblyVelocity
		end
	end
end)
-- Stepped Functions

game:GetService("RunService").Stepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
		TargetAimbotRealJumpOffset = TargetAimbotJumpOffset
	else
		TargetAimbotRealJumpOffset = 0
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if TargetAimbotEnabled then
		TargetAimbotRealHitPart = TargetAimbotHitParts[math.random(#TargetAimbotHitParts)]
		wait(0.6)
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotAutoPred then
		local Ping = math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())

		if Ping < 10 then
			TargetAimbotRealPrediction = 0.097

		elseif Ping < 20 then
			TargetAimbotRealPrediction = 0.112

		elseif Ping < 30 then
			TargetAimbotRealPrediction = 0.115

		elseif Ping < 40 then
			TargetAimbotRealPrediction = 0.125

		elseif Ping < 50 then
			TargetAimbotRealPrediction = 0.122

		elseif Ping < 60 then
			TargetAimbotRealPrediction = 0.123

		elseif Ping < 70 then
			TargetAimbotRealPrediction = 0.132

		elseif Ping < 80 then
			TargetAimbotRealPrediction = 0.134

		elseif Ping < 90 then
			TargetAimbotRealPrediction = 0.137

		elseif Ping < 100 then
			TargetAimbotRealPrediction = 0.146

		elseif Ping < 110 then
			TargetAimbotRealPrediction = 0.148

		elseif Ping < 120 then
			TargetAimbotRealPrediction = 0.144

		elseif Ping < 130 then
			TargetAimbotRealPrediction = 0.157

		elseif Ping < 140 then
			TargetAimbotRealPrediction = 0.122

		elseif Ping < 150 then
			TargetAimbotRealPrediction = 0.152

		elseif Ping < 160 then
			TargetAimbotRealPrediction = 0.163

		elseif Ping < 170 then
			TargetAimbotRealPrediction = 0.192

		elseif Ping < 180 then
			TargetAimbotRealPrediction = 0.193

		elseif Ping < 190 then
			TargetAimbotRealPrediction = 0.167

		elseif Ping < 200 then
			TargetAimbotRealPrediction = 0.166

		elseif Ping < 210 then
			TargetAimbotRealPrediction = 0.168

		elseif Ping < 220 then
			TargetAimbotRealPrediction = 0.166

		elseif Ping < 230 then
			TargetAimbotRealPrediction = 0.157

		elseif Ping < 240 then
			TargetAimbotRealPrediction = 0.168

		elseif Ping < 250 then
			TargetAimbotRealPrediction = 0.165

		elseif Ping < 260 then
			TargetAimbotRealPrediction = 0.176

		elseif Ping < 270 then
			TargetAimbotRealPrediction = 0.177

		elseif Ping < 280 then
			TargetAimbotRealPrediction = 0.181

		elseif Ping < 290 then
			TargetAimbotRealPrediction = 0.182

		elseif Ping < 300 then
			TargetAimbotRealPrediction = 0.185
		end
	else
		TargetAimbotRealPrediction = TargetAimbotPrediction
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotLookAt then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(TargetPlr.Character.HumanoidRootPart.Position.X, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y, TargetPlr.Character.HumanoidRootPart.Position.Z))
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetStrafeEnabled then
		StrafeSpeed = StrafeSpeed + TargetStrafeSpeed

		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafeHeight, TargetStrafeDistance)
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if CameraAimbotEnabled and CamBindEnabled and CamlockPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
		CameraAimbotRealJumpOffset = CameraAimbotJumpOffset
	else
		CameraAimbotRealJumpOffset = 0
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	local AirCheckType

	if CameraAimbotAirCheckType == "Once in Air" then
		AirCheckType = CamlockPlr.Character.Humanoid.FloorMaterial == Enum.Material.Air
	else
		AirCheckType = CamlockPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall
	end

	if CameraAimbotEnabled and CamBindEnabled and CameraAimbotUseAirPart and AirCheckType then
		CameraAimbotRealHitPart = CameraAimbotAirPart
	else
		CameraAimbotRealHitPart = CameraAimbotHitPart
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if CameraAimbotEnabled and CamBindEnabled and CameraAimbotAutoPred then
		local Ping = math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())

		if Ping < 10 then
			CameraAimbotRealPrediction = 0.097

		elseif Ping < 20 then
			CameraAimbotRealPrediction = 0.112

		elseif Ping < 30 then
			CameraAimbotRealPrediction = 0.115

		elseif Ping < 40 then
			CameraAimbotRealPrediction = 0.125

		elseif Ping < 50 then
			CameraAimbotRealPrediction = 0.122

		elseif Ping < 60 then
			CameraAimbotRealPrediction = 0.123

		elseif Ping < 70 then
			CameraAimbotRealPrediction = 0.132

		elseif Ping < 80 then
			CameraAimbotRealPrediction = 0.134

		elseif Ping < 90 then
			CameraAimbotRealPrediction = 0.137

		elseif Ping < 100 then
			CameraAimbotRealPrediction = 0.146

		elseif Ping < 110 then
			CameraAimbotRealPrediction = 0.148

		elseif Ping < 120 then
			CameraAimbotRealPrediction = 0.144

		elseif Ping < 130 then
			CameraAimbotRealPrediction = 0.157

		elseif Ping < 140 then
			CameraAimbotRealPrediction = 0.122

		elseif Ping < 150 then
			CameraAimbotRealPrediction = 0.152

		elseif Ping < 160 then
			CameraAimbotRealPrediction = 0.163

		elseif Ping < 170 then
			CameraAimbotRealPrediction = 0.192

		elseif Ping < 180 then
			CameraAimbotRealPrediction = 0.193

		elseif Ping < 190 then
			CameraAimbotRealPrediction = 0.167

		elseif Ping < 200 then
			CameraAimbotRealPrediction = 0.166

		elseif Ping < 210 then
			CameraAimbotRealPrediction = 0.168

		elseif Ping < 220 then
			CameraAimbotRealPrediction = 0.166

		elseif Ping < 230 then
			CameraAimbotRealPrediction = 0.157

		elseif Ping < 240 then
			CameraAimbotRealPrediction = 0.168

		elseif Ping < 250 then
			CameraAimbotRealPrediction = 0.165

		elseif Ping < 260 then
			CameraAimbotRealPrediction = 0.176

		elseif Ping < 270 then
			CameraAimbotRealPrediction = 0.177

		elseif Ping < 280 then
			CameraAimbotRealPrediction = 0.181

		elseif Ping < 290 then
			CameraAimbotRealPrediction = 0.182

		elseif Ping < 300 then
			CameraAimbotRealPrediction = 0.185
		end
	else
		CameraAimbotRealPrediction = CameraAimbotPrediction
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	game:GetService("Players").LocalPlayer.Character.Humanoid.UseJumpPower = not UtilitiesNoJumpCooldown
end)

game:GetService("RunService").Stepped:Connect(function()
	if UtilitiesNoSlowdown then
		local Slowdowns = game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping") or game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") or game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed")

		if Slowdowns then
			Slowdowns:Destroy()
		end

		if game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value then
			game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value = false
		end

		if game:GetService("Players").LocalPlayer.Character.BodyEffects.Reloading.Value then
			game:GetService("Players").LocalPlayer.Character.BodyEffects.Reloading.Value = false
		end
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if UtilitiesAutoStomp then
		game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if UtilitiesAutoReload and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Ammo.Value <= 0 then
		game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"))
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if MovementSpeedEnabled then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * MovementSpeedAmount
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if MovementAutoJump and game:GetService("Players").LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if MovementBunnyHop and game:GetService("Players").LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * MovementHopAmount
	end
end)

-- RenderStepped Functions

game:GetService("RunService").RenderStepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotKoCheck and (TargetPlr.Character.Humanoid.Health <= 2.25 or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 2.25) then
		TargBindEnabled = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotViewAt then
		game:GetService("Workspace").CurrentCamera.CameraSubject = TargetPlr.Character.Humanoid
	else
		game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	local Position, OnScreen

	if TargetAimbotResolver then
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character.Humanoid.MoveDirection * TargetAimbotRealPrediction * TargetPlr.Character.Humanoid.WalkSpeed))
	else
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character[TargetAimbotRealHitPart].Velocity * TargetAimbotRealPrediction))
	end

	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotDot then
		if OnScreen then
			TargDotCircle.Visible = true
			TargDotCircle.Position = Vector2.new(Position.X, Position.Y)
		else
			TargDotCircle.Visible = false
		end
	else
		if TargetAimbotEnabled and not TargBindEnabled and TargetAimbotDot and TargetAimbotDotOnCursor then
			TargDotCircle.Visible = true
			TargDotCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
		else
			TargDotCircle.Visible = false
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	local Position, OnScreen

	if TargetAimbotResolver then
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character.Humanoid.MoveDirection * TargetAimbotRealPrediction * TargetPlr.Character.Humanoid.WalkSpeed))
	else
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character[TargetAimbotRealHitPart].Velocity * TargetAimbotRealPrediction))
	end

	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotTracer and OnScreen then
		TargTracerLine.Visible = true
		TargTracerLine.From = game:GetService("UserInputService"):GetMouseLocation()
		TargTracerLine.To = Vector2.new(Position.X, Position.Y)
	else
		TargTracerLine.Visible = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled and TargetAimbotHighlight then
		TargHighlight.Parent = TargetPlr.Character
	else
		TargHighlight.Parent = game:GetService("CoreGui")
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if TargetAimbotEnabled and TargBindEnabled then
		StatsFrame.Visible = true
		StatsName.Text = TargetPlr.DisplayName .. " [" .. TargetPlr.Name .. "]"
		StatsPicture.Image = "rbxthumb://type=AvatarHeadShot&id=" .. TargetPlr.UserId .. "&w=420&h=420"
		StatsHealthBar:TweenSize(UDim2.new(TargetPlr.Character.Humanoid.Health / TargetPlr.Character.Humanoid.MaxHealth, 0, 1, 0), "In", "Linear", 0.25)
	else
		StatsFrame.Visible = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	TargFovCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
end)

game:GetService("RunService").Heartbeat:Connect(function()
if ResolverEnabled then
    for i, Target in pairs(game:GetService("Players"):GetPlayers()) do
        if Target ~= game:GetService("Players").LocalPlayer then
            for i, Part in pairs(Target.Character:GetChildren()) do
                if Part:IsA("BasePart") then
                    Part.Velocity = Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed
                    Part.AssemblyLinearVelocity = Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed
                end
           end
         end
      end
    end
end)


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
    
game:GetService("RunService").Heartbeat:Connect(function()
pcall(function()
if Resolver2Enabled == true then
    for i, player in pairs(game.Players:GetChildren()) do
if player.Name ~= game.Players.LocalPlayer.Name then
    local hrp = player.Character.HumanoidRootPart
    local lastPosition = hrp.Position
        task.wait()
    local currentPosition = hrp.Position
    local velocity = (currentPosition - lastPosition) * ResolverPrediction
    local lastPosition = currentPosition
    hrp.AssemblyLinearVelocity = velocity 
    hrp.Velocity = velocity 
    zeroOutYVelocity(hrp)
   end
end
end
end)
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if CameraAimbotEnabled and CamBindEnabled then
		if CameraAimbotAimMethod == "Camera" then
			if CameraAimbotResolver then
				if CameraAimbotSmoothing then
					game:GetService("Workspace").CurrentCamera.CFrame = game:GetService("Workspace").CurrentCamera.CFrame:Lerp(CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character.Humanoid.MoveDirection * CameraAimbotRealPrediction * CamlockPlr.Character.Humanoid.WalkSpeed)), CameraAimbotSmoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				else
					game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character.Humanoid.MoveDirection * CameraAimbotRealPrediction * CamlockPlr.Character.Humanoid.WalkSpeed))
				end
			else
				if CameraAimbotSmoothing then
					game:GetService("Workspace").CurrentCamera.CFrame = game:GetService("Workspace").CurrentCamera.CFrame:Lerp(CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbotRealHitPart].Velocity * CameraAimbotRealPrediction)), CameraAimbotSmoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				else
					game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbotRealHitPart].Velocity * CameraAimbotRealPrediction))
				end
			end
		else
			local Position

			if CameraAimbotResolver then
				Position = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character.Humanoid.MoveDirection * CameraAimbotRealPrediction * CamlockPlr.Character.Humanoid.WalkSpeed))
			else
				Position = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbotRealHitPart].Velocity * CameraAimbotRealPrediction))
			end

			if CameraAimbotSmoothing then
				mousemoverel((Position.X - game:GetService("UserInputService"):GetMouseLocation().X) * CameraAimbotSmoothness, (Position.Y - game:GetService("UserInputService"):GetMouseLocation().Y) * CameraAimbotSmoothness)
			else
				mousemoverel(Position.X - game:GetService("UserInputService"):GetMouseLocation().X, Position.Y - game:GetService("UserInputService"):GetMouseLocation().Y)
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if CameraAimbotEnabled and CamBindEnabled and CameraAimbotKoCheck and (CamlockPlr.Character.Humanoid.Health <= 2.25 or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 2.25) then
		CamBindEnabled = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	local Position, OnScreen

	if CameraAimbotResolver then
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character.Humanoid.MoveDirection * CameraAimbotRealPrediction * CamlockPlr.Character.Humanoid.WalkSpeed))
	else
		Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbotRealHitPart].Position + Vector3.new(0, CameraAimbotRealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbotRealHitPart].Velocity * CameraAimbotRealPrediction))
	end

	if CameraAimbotEnabled and CamBindEnabled and CameraAimbotTracer and OnScreen then
		CamTracerLine.Visible = true
		CamTracerLine.From = game:GetService("UserInputService"):GetMouseLocation()
		CamTracerLine.To = Vector2.new(Position.X, Position.Y)
	else
		CamTracerLine.Visible = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if CameraAimbotEnabled and CamBindEnabled and CameraAimbotHighlight then
		CamHighlight.Parent = CamlockPlr.Character
	else
		CamHighlight.Parent = game:GetService("CoreGui")
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	CamFovCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if (SelfDotEnabled or SelfDotTracer) and SelfDotRandomHitPart then
		local RandomHitParts = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso", "RightUpperArm", "LeftUpperArm", "RightLowerArm", "LeftLowerArm", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg"}

		SelfDotRealHitPart = RandomHitParts[math.random(#RandomHitParts)]
		wait(0.6)
	else
		SelfDotRealHitPart = SelfDotHitPart
	end
end)

-- InputBegan Functions

game:GetService("UserInputService").InputBegan:Connect(function(Key)
	if TargetAimbotEnabled and Key.KeyCode == TargetAimbotKeybind and not game:GetService("UserInputService"):GetFocusedTextBox() then
		local Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(ClosestPlr(TargetAimbotRealHitPart, TargetAimbotUseFov, TargFovCircle).Character[TargetAimbotRealHitPart].Position)

		if TargBindEnabled then
			TargBindEnabled = false

			if TargetAimbotNotify then
                if getgenv().SendNotifs then
                    notify("Unlocked ",getgenv().NotificationColor,2,false)
                end
			end
		else
			if OnScreen then
				TargBindEnabled = true
				TargetPlr = ClosestPlr(TargetAimbotRealHitPart, TargetAimbotUseFov, TargFovCircle)

				if TargetAimbotNotify then
                    if getgenv().SendNotifs then
                        notify("Locked onto:  "..tostring(TargetPlr.DisplayName),getgenv().NotificationColor,2,false)
                    end
				end
			end
		end
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(Key)
	if CameraAimbotEnabled and Key.KeyCode == CameraAimbotKeybind and not game:GetService("UserInputService"):GetFocusedTextBox() then
		local Position, OnScreen = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(ClosestPlr(CameraAimbotRealHitPart, CameraAimbotUseFov, CamFovCircle).Character[CameraAimbotRealHitPart].Position)

		if CamBindEnabled then
			CamBindEnabled = false

			if CameraAimbotNotify then
                if getgenv().SendNotifs then
                    notify("Unlocked ",getgenv().NotificationColor,2,false)
                end
			end
		else
			if OnScreen then
				CamBindEnabled = true
				CamlockPlr = ClosestPlr(CameraAimbotRealHitPart, CameraAimbotUseFov, CamFovCircle)

				if CameraAimbotNotify then
                    if getgenv().SendNotifs then
                        notify("Locked onto:  "..tostring(CamlockPlr.DisplayName),getgenv().NotificationColor,2,false)
                    end
				end
			end
		end
	end
end)

-- Hookmetamethod functions

AntiCheatNamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
	local Arguments = {...}
	local AntiCheats = {"BreathingHAMON", "TeleportDetect", "JJARC", "TakePoisonDamage", "CHECKER_1", "CHECKER", "GUI_CHECK", "OneMoreTime", "checkingSPEED", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "FORCEFIELD", "Christmas_Sock", "VirusCough", "Symbiote", "Symbioted", "RequestAFKDisplay"}

	if table.find(AntiCheats, Arguments[1]) and getnamecallmethod() == "FireServer" then
		return
	end

	return AntiCheatNamecall(Self, ...)
end))

TargNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
	local Arguments = {...}
	local MousePositions = {"UpdateMousePos", "GetMousePos", "MousePos"}

	if TargetAimbotEnabled and TargBindEnabled and table.find(MousePositions, Arguments[2]) and getnamecallmethod() == "FireServer" then
		if TargetAimbotResolver then
			Arguments[3] = TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character.Humanoid.MoveDirection * TargetAimbotRealPrediction * TargetPlr.Character.Humanoid.WalkSpeed)
		else
			Arguments[3] = TargetPlr.Character[TargetAimbotRealHitPart].Position + Vector3.new(0, TargetAimbotRealJumpOffset, 0) + (TargetPlr.Character[TargetAimbotRealHitPart].Velocity * TargetAimbotRealPrediction)
		end

		return TargNamecall(unpack(Arguments))
	end

	return TargNamecall(...)
end))

        game:GetService("RunService").heartbeat:Connect(
            function()
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
                        v:Destroy()
                    end
                end


                if Swastika.Visible then
                    CursorPath.Swastika.Position = UDim2.fromOffset(game.Players.LocalPlayer:GetMouse().X - 43, game.Players.LocalPlayer:GetMouse().Y - 39)

                    if CursorRainbow then
                        CursorPath.Swastika.TextColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                    end

                    if CursorSpin == true then
                        CursorPath.Swastika.Rotation = CursorPath.Swastika.Rotation + CursorSpinSpeed
                    end
                end

                if BulletTracers then
                    local ColourSequence =
                        ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0, BulletTracerColor),
                            ColorSequenceKeypoint.new(1, BulletTracerColor)
                        }
                    )

                    for _, v in pairs(game:GetService("Workspace").Ignored:GetDescendants()) do
                        if v.Name == "BULLET_RAYS" then
                            if 100 > (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                v.GunBeam.Texture = "http://www.roblox.com/asset/?id=9150561638"
                                v.GunBeam.Width0 = BulletWidth
                                v.GunBeam.Width1 = BulletWidth
                                v.GunBeam.Color = ColourSequence
                            end
                        end
                    end
                end

                if getgenv().RainbowColor == true then
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                    game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Color3.fromHSV(tick() % 6 / 6, 1, 1)
                end

                if getgenv().SpinningCursor then
                    game.Players.LocalPlayer.PlayerGui.MainScreenGui.Aim.Rotation =
                    game.Players.LocalPlayer.PlayerGui.MainScreenGui.Aim.Rotation + getgenv().SpinPower
                end

                if FFBody then
                    if game.Players.LocalPlayer.Character then
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.Material = Enum.Material.ForceField
                                v.Color = FFBodyColour
                            end
                        end
                    end
                end
            
                if FFBodyRainbow then
                    if game.Players.LocalPlayer.Character then
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.Material = Enum.Material.ForceField
                                v.Color = Color3.fromHSV(tick()%5/5,1,1)
                            end
                        end
                    end
                end

                if SpinBot and not JitterBot then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *
                        CFrame.Angles(0, SpinBotSpeed * 0.01234, 0)
                end

                if JitterBot and not SpinBot then
                    local RandomJit = math.random(30, 90)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
                        CFrame.Angles(
                            0,
                            math.rad(180) + math.rad((math.random(1, 2) == 1 and RandomJit or -RandomJit)),
                            0
                        )
                end

                if VelocityDesync then
                    local lvle = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
                    local lcf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        lcf * CFrame.Angles(0, math.rad(DesyncSpinPower * 10), 0)

                    game:GetService("RunService").RenderStepped:Wait()

                    getgenv().VisualizerVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity

                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = lvle
                end

                if Visualize then
                    createvisualizer()
                end
            end
        )

        game:GetService("RunService").heartbeat:Connect(function()
                if CFrameDesync then
                    getgenv().hrppos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                    if RandomMode then
                        local TargetPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            (CFrame.new(TargetPos) +
                            Vector3.new(
                                math.random(-RandomModePower, RandomModePower),
                                math.random(-RandomModePower, RandomModePower),
                                math.random(-RandomModePower, RandomModePower)
                            )) *
                            CFrame.Angles(
                                math.rad(math.random(-180, 180)),
                                math.rad(math.random(-180, 180)),
                                math.rad(math.random(-180, 180))
                            )
                    end

                    if TargetAimbotEnabled and TargBindEnabled and DesyncStrafe then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -8, 0)
                    end

                    if TargetAimbotEnabled and TargBindEnabled and RandomStrafe then
                        local TargetPos = TargetPlr.Character.HumanoidRootPart.Position
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            (CFrame.new(TargetPos) +
                            Vector3.new(
                                math.random(-RandomModePower, RandomModePower),
                                math.random(-RandomModePower, RandomModePower),
                                math.random(-RandomModePower, RandomModePower)
                            )) *
                            CFrame.Angles(
                                math.rad(math.random(-180, 180)),
                                math.rad(math.random(-180, 180)),
                                math.rad(math.random(-180, 180))
                            )
                    end

                    if Manual then
                        local Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            (CFrame.new(Position) +
                            Vector3.new(CframeDesyncX, CframeDesyncY, CframeDesyncZ)) *
                            CFrame.Angles(
                                RotationX,
                                RotationY,
                                RotationZ
                            )
                    end

                    game:GetService("RunService").RenderStepped:Wait()

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().hrppos

                    getgenv().hrppos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        )

        local oldIndex
        oldIndex =
            hookmetamethod(
            game,
            "__index",
            newcclosure(
                function(self, key)
                    if not checkcaller() then
                        if
                            key == "CFrame" and CFrameDesync and game.Players.LocalPlayer.Character and
                            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                         then
                            if self == game.Players.LocalPlayer.Character.HumanoidRootPart then
                                return getgenv().hrppos
                            end
                        end
                    end
                    return oldIndex(self, key)
                end
            )
        )
