local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local Roact = require(RS.Common:WaitForChild("Roact"))
local UIS = game:GetService("UserInputService")
local ReloadTime = 5
local Mouse = Player:GetMouse()
local Values = Player:WaitForChild("Values")
UIS.MouseIconEnabled = false
Mouse.TargetFilter = game.Workspace.BaseplateMap

local SGUI = Roact.createElement("ScreenGui",{
    IgnoreGuiInset = true;
    ResetOnSpawn = false
})

local FPSMouse = Roact.createElement("ScreenGui", {
    IgnoreGuiInset = true;
    ResetOnSpawn = false
}, {Roact.createElement("ImageLabel", {
    Name = "RegularImageOfMouse";
    Image = "http://www.roblox.com/asset/?id=7712992977";
    AnchorPoint = Vector2.new(0.5, 0.5);
    Position = UDim2.new(0.5,0,0.5,0);
    Size = UDim2.new(0.039, 0,0.069, 0);
    BackgroundTransparency = 1
})})

Roact.mount(SGUI, Player.PlayerGui, "SwordVeiwport")
Roact.mount(FPSMouse, Player.PlayerGui, "Mouse")

local VPS = RS:WaitForChild("ViewportFrame"):Clone()
VPS.Parent = Player.PlayerGui.SwordVeiwport
local Char = VPS.WorldModel.Hand
local Anim8or = Char.Humanoid:WaitForChild("Animator")

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.KeypadOne then
        if Values.SwordOut.Value == false then
            local Open = Anim8or:LoadAnimation(RS:WaitForChild("Sword_Open"))
            Open:Play()
            wait(4)
            Mouse.Icon = "http://www.roblox.com/asset/?id=7712992977"
            local Idle = Anim8or:LoadAnimation(RS:WaitForChild("Sword_Idle"))
            Idle:Play()
            
            Values.SwordOut.Value = true
        else
            return nil --uhh
        end

    end  
end)

Mouse.Button1Down:Connect(function()
    if Values.SwordOut.Value == true then
        local Slash = Anim8or:LoadAnimation(RS:WaitForChild("Sword_Slash"))
        Slash:Play()
        wait(1)
        game.SoundService.Sword_Slash:Play()
        if (Player.Character.LowerTorso.Position - Mouse.Target.Position).magnitude <= 10 or (Player.Character.LowerTorso.Position - Mouse.Target.Position).magnitude == 10 then
            print(Mouse.Target)
            local event = RS:WaitForChild("Destroy")
            local Tar = Mouse.Target
            event:FireServer(Tar)
        end

        wait(ReloadTime) 
    end

end)