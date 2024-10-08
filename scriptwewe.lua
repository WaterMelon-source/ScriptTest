local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local PathfindingService = game:GetService("PathfindingService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local plot = game.Players.LocalPlayer.Plot.Value
function getCar()
    for i, car in pairs(game.workspace.CARS:GetChildren()) do
        local name = player.Name.."'s Vehicle:"
        if car.CarCapacity.Frame.OwnerText and car.CarCapacity.Frame.OwnerText.Text == name then
            return car
        end
    end
end
function smoothTeleportCar(car, targetPosition, duration)
    local startPosition = car.PrimaryPart.Position -- Starting position
    local startTime = tick() -- Record the start time
    while tick() - startTime < duration do
        local elapsedTime = tick() - startTime
        local alpha = elapsedTime / duration -- Normalized time (0 to 1)
        local newPosition = startPosition:Lerp(targetPosition, alpha)
        car:SetPrimaryPartCFrame(CFrame.new(newPosition))
        wait() -- Yield to allow other processes to run
    end
    car:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end
local car = getCar()
character.HumanoidRootPart.CFrame = car.Seats.VehicleSeat.CFrame
wait(0.4)
fireproximityprompt(car.Seats.VehicleSeat.ProximityPrompt)
wait(0.4)
smoothTeleportCar(car, Vector3.new(-4382,25,-270), 30)
wait(0.4)
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
local maxPathRetries = 5 -- Maximum retries if path fails
local moveSpeed = 16 -- Movement speed of the player
function findPathToTarget(targetPosition)
    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentMaxSlope = 45
    })
    path:ComputeAsync(character.PrimaryPart.Position, targetPosition)
    return path
end
function movePlayer(path)
    for _, waypoint in pairs(path:GetWaypoints()) do
        humanoid:MoveTo(waypoint.Position)
        humanoid.MoveToFinished:Wait()
        if waypoint.Action == Enum.PathWaypointAction.Jump then
            humanoid.Jump = true
        end
    end
end
function moveToTarget(targetPosition)
    local retries = 0
    local success = false
    while retries < maxPathRetries and not success do
        local path = findPathToTarget(targetPosition)
        if path then
            movePlayer(path)
            success = true
        else
            retries = retries + 1
            print("Path failed. Retrying... (" .. retries .. "/" .. maxPathRetries .. ")")
            wait(1) -- Give some delay before retrying
        end
    end
    if not success then
        warn("Failed to find a valid path after " .. maxPathRetries .. " attempts.")
    end
end
for i = 1,10 do
    for _, npc in ipairs(workspace.NPCs:GetChildren()) do
        if npc:FindFirstChild("ProximityPrompt") and not npc.NameTag:FindFirstChild("Tag") then
            _G.npca = npc
            local targetPosition = npc.HumanoidRootPart.Position
            moveToTarget(targetPosition)
            wait(0.5)
            if not workspace.NPCs:FindFirstChild(_G.npca.Name) then
                break
            end
            fireproximityprompt(npc.ProximityPrompt)
            break
        end
    end
    if not workspace.NPCs:FindFirstChild(_G.npca.Name) then
        break
    end
end
character.HumanoidRootPart.CFrame = car.Seats.VehicleSeat.CFrame
wait(0.4)
fireproximityprompt(car.NpcsAdd.ProximityPrompt)
wait(1.5)
character.HumanoidRootPart.CFrame = car.Seats.VehicleSeat.CFrame
wait(0.4)
fireproximityprompt(car.Seats.VehicleSeat.ProximityPrompt)
wait(0.4)
for i, car_spawn in pairs(plot.Floors["1"].Furnitures:GetChildren()) do
    if car_spawn:FindFirstChild("Part") and car_spawn.Part:FindFirstChild("ProximityPrompt") then
        smoothTeleportCar(car, Vector3.new(car_spawn.Part.Position.X, car_spawn.Part.Position.Y+10, car_spawn.Part.Position.Z), 30)
        break
    end
end
wait(0.4)
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.4)
fireproximityprompt(car.NpcsAdd.ProximityPrompt)
wait(0.4)
character.HumanoidRootPart.CFrame = plot.Floors["1"].Floors.Concrete.Concrete.CFrame
wait(0.2)
game:GetService("ReplicatedStorage").Remote.NpcHold:FireServer("Release")
