local RS = game:GetService("ReplicatedStorage")
local event = RS:WaitForChild("Destroy")

event.OnServerEvent:Connect(function(player, Tar)
Tar:Destroy()
end)