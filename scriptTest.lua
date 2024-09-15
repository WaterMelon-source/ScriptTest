local UserInputService = game:GetService("UserInputService")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Options = Fluent.Options

local UserName = game.Players.LocalPlayer.Name
local DisplayName = game.Players.LocalPlayer.DisplayName
local UserId = game.Players.LocalPlayer.UserId
local Country = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer)
local Device = 'Device'

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	Device = "Mobile"
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	Device = "Computer"
elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	Device = "Computer With TouchScreen"
end

--------Main---------
getgenv().working = true
getgenv().spawn = 2
getgenv().pizzas = 0
-------Sauce---------
getgenv().sauceDelay = 0.3
getgenv().sauceColorNum = 1
getgenv().sauceSkip = false
------Toppings--------
getgenv().toppingsDelay = 0.25
getgenv().topping1Skip = false
getgenv().topping2Skip = false
getgenv().topping3Skip = false
getgenv().topping4Skip = false
getgenv().topping5Skip = false
getgenv().toppingsSkip = false
-------Oven----------
getgenv().ovenDelay = 5
------Slicer---------
getgenv().slicerDelay = 1
------Selling--------
getgenv().selling = false
------Time-----------
getgenv().summToppings = 0
if getgenv().topping1Skip == false then
    getgenv().summToppings += 1
elseif getgenv().topping2Skip == false then
    getgenv().summToppings += 1
elseif getgenv().topping3Skip == false then
    getgenv().summToppings += 1
elseif getgenv().topping4Skip == false then
    getgenv().summToppings += 1
elseif getgenv().topping5Skip == false then
    getgenv().summToppings += 1
end

local Window = Fluent:CreateWindow({
    Title = "🔓  Dash " .. "0.0.5",
    SubTitle = " •  Club Roblox 🧸",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 445),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.Home-- Used when theres no MinimizeKeybind
})

local Tabs = {
    Home = Window:AddTab({Title = "Home", Icon = "rbxassetid://10723407389"}),
	News = Window:AddTab({Title = "News", Icon = "rbxassetid://10734907168"}),
	Player = Window:AddTab({Title = "Player", Icon = "rbxassetid://10734920149"}),
	Farm = Window:AddTab({Title = "Farming", Icon = "rbxassetid://10709762879"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

function Notify(content, time)
	Fluent:Notify({
		Title = "💨  Dash",
		Content = content,
		--SubContent = "SubContent", -- Optional
		Duration = time -- Set to nil to make the notification not disappear
	})
end

Tabs.Home:AddParagraph({
    Title = "💨  Dash  💨"
})

local function addUserParagraph(UserName, DisplayName, UserId, Country, Device)
	local deviceIcon = Device == "Mobile" and "📱" or Device == "Computer" and "🖥️" or Device == "Computer With TouchScreen" and "💻"
	local countryFlag = Country == "RU" and "🇷🇺" or Country == "US" and "🇺🇸"
	
	Tabs.Home:AddParagraph({
		Title = "👤  User  👤",
		Content = "\n\n 🏡  UserName : "..UserName.."\n\n 💬  Display Name : "..DisplayName.."\n\n 💳  UserId : "..UserId.."\n\n "..countryFlag.."  Country : "..Country.."\n\n 💉  Executor : "..identifyexecutor().."\n\n "..deviceIcon.."  Device : "..Device.."\n"
	})
end

if Country == "RU" or Country == "US" then
	addUserParagraph(UserName, DisplayName, UserId, Country, Device)
end

function TeleportPizza(location, Oven)
	for i,v in pairs(game.workspace.Items:GetChildren()) do
		if v:FindFirstChild("C") then
			if location == "Sauce" and getgenv().sauceSkip == false and getgenv().working == true then
				if not v.C:FindFirstChild("Sauce") and not v.C:FindFirstChild("CookedState") then
					if not v.C:FindFirstChild("T1") and not v.C:FindFirstChild("T2") and not v.C:FindFirstChild("T3") and not v.C:FindFirstChild("T4") and not v.C:FindFirstChild("T5") then
						for i,f in pairs(game.workspace.ServerInteractables:GetChildren()) do
							if f:FindFirstChild("Num") then
								if getgenv().sauceColorNum == 1 and f.Num.Value == 1 then
									v.Root.Anchored = true
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(5.298999786376953, 254.65623474121094, 9.534388542175293) * CFrame.Angles(-0, 0, -0))
									wait(getgenv().sauceDelay)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddSauce:FireServer(f)
									wait(getgenv().sauceDelay)
									v.Root.Anchored = false
								end
								if getgenv().sauceColorNum == 2 and f.Num.Value == 2 then
									v.Root.Anchored = true
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(5.1721978187561035, 254.41131591796875, 16.220552444458008) * CFrame.Angles(-0, 0, -0))
									wait(getgenv().sauceDelay)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddSauce:FireServer(f)
									wait(getgenv().sauceDelay)
									v.Root.Anchored = false
								end
								if getgenv().sauceColorNum == 3 and f.Num.Value == 3 then
									v.Root.Anchored = true
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(5.2990007400512695, 254.86138916015625, 17.798870086669922) * CFrame.Angles(-0, 0, -0))
									wait(getgenv().sauceDelay)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddSauce:FireServer(f)
									wait(getgenv().sauceDelay)
									v.Root.Anchored = false
								end
								if getgenv().sauceColorNum == 4 and f.Num.Value == 4 then
									v.Root.Anchored = true
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(5.299001693725586, 254.35910034179688, 33.74543380737305) * CFrame.Angles(-0, 0, -0))
									wait(getgenv().sauceDelay)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddSauce:FireServer(f)
									wait(getgenv().sauceDelay)
									v.Root.Anchored = false
								end
							end
						end
					end
				end
			end
			if location == "Toppings" and getgenv().toppingsSkip == false and getgenv().working == true then
				if not v.C:FindFirstChild("CookedState") and v.C:FindFirstChild("Sauce") then
					if not v.C:FindFirstChild("T1") and not v.C:FindFirstChild("T2") and not v.C:FindFirstChild("T3") and not v.C:FindFirstChild("T4") and not v.C:FindFirstChild("T5") then
						getgenv().pizzas += 1
                        for i,f in pairs(game.workspace.ServerInteractables:GetChildren()) do
							if f:FindFirstChild("ToppingName") then
								v.Root.Anchored = true
								if f.ToppingName.Value == "T1" and getgenv().topping1Skip == false then
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(19, 254, 50) * CFrame.Angles(-0, 0, -0))
									wait(0.1)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddTopping:FireServer(f)
									wait(getgenv().toppingsDelay)
                                    v.Root.Anchored = false
								elseif f.ToppingName.Value == "T2" and getgenv().topping2Skip == false then
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(28, 254, 50) * CFrame.Angles(-0, 0, -0))
									wait(0.1)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddTopping:FireServer(f)
									wait(getgenv().toppingsDelay)
									v.Root.Anchored = false
                                elseif f.ToppingName.Value == "T3" and getgenv().topping3Skip == false then
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(36, 254, 50) * CFrame.Angles(-0, 0, -0))
									wait(0.1)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddTopping:FireServer(f)
									wait(getgenv().toppingsDelay)
									v.Root.Anchored = false
                                elseif f.ToppingName.Value == "T4" and getgenv().topping4Skip == false then
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(44, 254, 50) * CFrame.Angles(-0, 0, -0))
									wait(0.1)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddTopping:FireServer(f)
									wait(getgenv().toppingsDelay)
									v.Root.Anchored = false
                                elseif f.ToppingName.Value == "T5" and getgenv().topping5Skip == false then
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(52, 254, 50) * CFrame.Angles(-0, 0, -0))
									wait(0.1)
									game:GetService("ReplicatedStorage").PizzaEvents.remoteAddTopping:FireServer(f)
									wait(getgenv().toppingsDelay)
									v.Root.Anchored = false
								end
							end
						end
					end
				end
			end 
			if location == "Oven" and getgenv().working == true then
				if not v.C:FindFirstChild("CookedState") and v.C:FindFirstChild("Sauce") then
					if v.C:FindFirstChild("T1") or v.C:FindFirstChild("T2") or v.C:FindFirstChild("T3") or v.C:FindFirstChild("T4") or v.C:FindFirstChild("T5") then
						--print("teleportedOvn")
						game:GetService("ReplicatedStorage").PizzaEvents.remoteResetOven:FireServer(workspace.ServerInteractables.Oven)
						game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(79.99996948242188, 254.96519470214844, 50.4114875793457) * CFrame.Angles(-0, 0, -0))
						game:GetService("ReplicatedStorage").PizzaEvents.remoteResetOven:FireServer(workspace.ServerInteractables.Oven)
						wait(0.01)
					end
				end
			end
			if location == "Slicer" and getgenv().working == true then
				if v.C:FindFirstChild("CookedState") and v.C:FindFirstChild("Sauce") and not v:FindFirstChild("Cut") then
					if v.C:FindFirstChild("T1") or v.C:FindFirstChild("T2") or v.C:FindFirstChild("T3") or v.C:FindFirstChild("T4") or v.C:FindFirstChild("T5") then
						for i,f in pairs(game.workspace.ServerInteractables:GetChildren()) do
							if f:FindFirstChild("Body") and f:FindFirstChild("Body").CFrame == CFrame.new(55.4714584, 257.630737, 4.98270702) then
								--print("teleportedSlc")
								v.Root.Anchored = true
								game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(55.363868713378906, 254.60670471191406, 6.826766014099121) * CFrame.Angles(-0, 0, -0))
								wait(0.001)
								game:GetService("ReplicatedStorage").PizzaEvents.remotePizzaStamper:FireServer(f)
								v.Root.Anchored = false
								wait(getgenv().slicerDelay)
							end
						end
					end
				end
			end
			if location == "Boxes" and getgenv().working == true then
				for i = 1,getgenv().spawn do
					wait(1.73)
					game:GetService("ReplicatedStorage").PizzaEvents.remoteGetBox:FireServer(workspace.ServerInteractables.DropPizzaBox)
				end
				if v:FindFirstChild("C") then
					if v.C:FindFirstChild("CookedState") and v.C:FindFirstChild("Sauce") and not v:FindFirstChild("Cut") then
						if v.C:FindFirstChild("T1") or v.C:FindFirstChild("T2") or v.C:FindFirstChild("T3") or v.C:FindFirstChild("T4") or v.C:FindFirstChild("T5") then
							for i,d in pairs(game.workspace.Items:GetChildren()) do
								if d:FindFirstChild("Touch") and d.Touch:FindFirstChild("BoxController") and getgenv().selling == true and getgenv().working == true then
									d.Touch:FindFirstChild("BoxController").Disabled = true
									wait(0.01)
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(d, CFrame.new(43.936702728271484, 251.79925537109375, -51.33980178833008) * CFrame.Angles(-0, 0, -0))
									wait(0.01)
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(v, CFrame.new(43.936702728271484, 251.79925537109375, -51.33980178833008) * CFrame.Angles(-0, 0, -0))
									wait(0.01)
									game:GetService("ReplicatedStorage").RemoteEvents.MoveEvents.remoteMoveObject:FireServer(d, CFrame.new(40.176944732666016, 254.3000030517578, -64.86914825439453) * CFrame.Angles(-0, 0, -0))
									--print("sold")
								end
							end
						end
					end
				end
			end
		end
	end
end

function CalculateCoins(unit)
    local allTime = (getgenv().spawn * 1.78) + (getgenv().pizzas * getgenv().sauceDelay) + getgenv().ovenDelay + (getgenv().pizzas * getgenv().slicerDelay) + ((getgenv().pizzas * getgenv().toppingsDelay) * getgenv().summToppings)
    local sellingTime = getgenv().pizzas * 2.5
    local combinedTime = allTime + sellingTime

    local intervalHour = 3600 / combinedTime
    local totalCoinsHour = intervalHour * (getgenv().pizzas * 20)
    return (tostring(math.floor(totalCoinsHour + 0.5))..' coins/hour')
end

Tabs.Home:AddParagraph({
    Title = "🤖  Discord  🤖",
    Content = "🔗  Link : --------------  🔗"
})

Tabs.News:AddParagraph({
    Title = "								 ✨ New Features ✨",
    Content = "\n\n 💊  Auto Heal  💊\n\n 🔋  Auto Energy 🔋\n\n 🧁  Auto Hunger 🧁\n\n\n Date: ___"
})

local SpeedSlider = Tabs.Player:AddSlider("Slider", {
    Title = "👟   Speed",
    Description = "\nChange Player's Speed",
    Default = 16,
    Min = 0,
    Max = 999,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Tabs.Player:AddButton({
    Title = "🔄  Set to default",
    --Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		SpeedSlider:SetValue(16)
    end
})

local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
    Title = "🦵  JumpPower",
    Description = "\nChange Player's JumpPower",
    Default = 50,
    Min = 0,
    Max = 999,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

Tabs.Player:AddButton({
    Title = "🔄  Set to default",
    --Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		JumpPowerSlider:SetValue(50)
    end
})

local SauceDropdown = Tabs.Farm:AddDropdown("SauceDropdown", {
    Title = "🔁  AutoFarm",
    Values = {"Pizza AutoFarm 🍕", "lolas"},
    Multi = false,
    Default = 2,
})

SauceDropdown:OnChanged(function(Value)
    if Value == "Pizza AutoFarm 🍕" then
        getgenv().CoinsShow = Tabs.Farm:AddParagraph({
            Title = "💰  Coins Predictions",
            Content = "0 coins/hour"
        })
        
        getgenv().AutoFarmPizzaToggle = Tabs.Farm:AddToggle("AutoFarmPizza", {Title = "🍕  Auto Farm Pizza", Default = getgenv().AutoFarmPizza})
        
        getgenv().AutoFarmPizzaToggle:OnChanged(function(Value)
            getgenv().AutoFarmPizza = Value
        
            while getgenv().AutoFarmPizza == true do
                print("Started!")
                getgenv().pizzas = 0
                for i = 1,getgenv().spawn do
                    --print("spawned")
                    game.ReplicatedStorage.PizzaEvents.remoteDropDough:FireServer(workspace.ServerInteractables.DoughDropper)
                    wait(1.78)
                end
                TeleportPizza("Sauce")
                TeleportPizza("Toppings")
                getgenv().CoinsShow:SetDesc(CalculateCoins())
                TeleportPizza("Oven")
                wait(getgenv().ovenDelay)
                TeleportPizza("Slicer")
                if getgenv().selling == true and getgenv().working == true then
                    TeleportPizza("Boxes")
                end
            end
            getgenv().CoinsShow:SetDesc("0 coins/hour")
        end)
        
        getgenv().ConfigTab = Tabs.Farm:AddParagraph({
            Title = "⚙️  Configs  ⚙️"
            --Content = ""
        })
        
        getgenv().SpawnSlider = Tabs.Farm:AddSlider("SpawnSlider", {
            Title = "🍞  Spawn Count",
            Description = "",
            Default = 1,
            Min = 1,
            Max = 15,
            Rounding = 0.1,
            Callback = function(Value)
                getgenv().spawn = Value
            end
        })
        
        getgenv().SauceSlider = Tabs.Farm:AddSlider("SauceSlider", {
            Title = "🌶️  Sauce Delay",
            Description = "",
            Default = 0.3,
            Min = 0.1,
            Max = 2,
            Rounding = 1,
            Callback = function(Value)
                getgenv().sauceDelay = Value
            end
        })
        
        getgenv().SauceDropdown = Tabs.Farm:AddDropdown("SauceDropdown", {
            Title = "🎨  Sauce Color",
            Values = {"Red 🔴", "Green 🟢", "Purple 🟣", "Orange 🟠"},
            Multi = false,
            Default = 1,
        })
        
        getgenv().SauceDropdown:OnChanged(function(Value)
            if Value == "Red 🔴" then
                getgenv().sauceColorNum = 1
            elseif Value == "Green 🟢" then
                getgenv().sauceColorNum = 2
            elseif Value == "Purple 🟣" then
                getgenv().sauceColorNum = 3
            elseif Value == "Orange 🟠" then
                getgenv().sauceColorNum = 4
            end
        end)
    elseif Value == "lolas" then
        if getgenv().CoinsShow then
            getgenv().CoinsShow:Destroy()
            getgenv().AutoFarmPizzaToggle:Destroy()
            getgenv().ConfigTab:Destroy()
            getgenv().SpawnSlider:Destroy()
            getgenv().SauceSlider:Destroy()
            getgenv().SauceDropdown:Destroy()
        end
    end
end)

Window:SelectTab(1)

Notify("✅  Successfully Loaded!", 5)
