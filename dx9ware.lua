-- // Converted this for fun, was bored(not finished)

local game = game 
local GetService = game.GetService 
local Players = GetService(game, "Players")
local LocalPlayer = Players.LocalPlayer 

local Yaris = {}
function Yaris.ExpandTable(t, spacing, func)
    func = func or function() end 
	spacing = spacing or ""

	for i, v in pairs(t) do 
		func(string.format("%s%s %s", spacing, i, tostring(v)))
		if type(v) == "table" then 
			Yaris.ExpandTable(v, spacing.." ", func)
		end 
	end 
end

function Yaris.FindFirstChild(Inst, Child)
    return Inst:FindFirstChild(Child)
end

function Yaris.FindFirstChildOfClass(Inst, Child)
    return Inst:FindFirstChildOfClass(Child)
end 

function Yaris.FindFirstDescendant(Inst, Child)
    return Inst:FindFirstDescendant(Child)
end 

function Yaris.GetDatamodel()
    return game 
end 

function Yaris.GetCFrame(BasePart)
    return BasePart.CFrame 
end 

function Yaris.GetName(Inst)
    return Inst.Name 
end 

function Yaris.GetChildren(Inst)
    return Inst:GetChildren()
end 

function Yaris.GetPosition(Inst)
    return Inst.Position 
end 

function Yaris.GetParent(Inst)
    return Inst.Parent 
end

function Yaris.GetTeam(Player)
    assert(Player.ClassName == "Player", string.format("Argument 1 expected Player got %s", tostring(Player.ClassName)))
    
    return Player.Team
end 

function Yaris.GetTeamColour(Player)
    assert(Player.ClassName == "Player", string.format("Argument 1 expected Player got %s", tostring(Player.ClassName)))
    
    local TeamColor = Player.TeamColor 
    return {
        r = TeamColor.r,
        g = TeamColor.g, 
        b = TeamColor.b
    }
end 

function Yaris.GetCharacter(Player)
    assert(Player.ClassName == "Player", string.format("Argument 1 expected Player got %s", tostring(Player.ClassName)))
    
    return Player.Character 
end 

function Yaris.GetType(Inst) 
    return typeof(Inst)
end 

function Yaris.GetTarget()
    local Mouse = LocalPlayer:GetMouse()
    return Mouse.Target
end 

function Yaris.GetImageLabelPosition(Image)
    assert(Image ~= nil, "Argument 1 missing or nil")
    assert(typeof(Image) == "Instance", string.format("Argument 1 expected ImageLabel got %s", typeof(Image)))
    assert(Image.ClassName == "ImageLabel", string.format("Argument 1 expected ImageLabel got %s", typeof(Image)))
    
    local ImagePosition = Image.Position 
    local ImageSize = Image.Size
    
    return Vector2.new(ImagePosition.X.Offset + ImageSize.X.Offset/2, ImagePosition.Y.Offset + ImageSize.Y.Offset/2)
end

function Yaris.GetMouse()
    return LocalPlayer:GetMouse()
end 

function Yaris.GetNumValue(NumValue)
    assert(NumValue.ClassName == "IntValue", string.format("Argument 1 expected IntValue got %s", NumValue.ClassName))
    
    return NumValue.Value
end 

function Yaris.GetKey()
    -- what is this 
end 

function Yaris.GetLocked()
    return false -- // Can't be made cause we're not dx9ware
end 

function Yaris.GetStringValue(stringValueInstance)
    assert(stringValueInstance.ClassName == "StringValue", string.format("Argument 1 expected StringValue got %s", stringValueInstance.ClassName))
    
    return stringValueInstance.Value
end 

function Yaris.GetBoolValue(boolValueInstance)
    assert(boolValueInstance.ClassName == "BoolValue", string.format("Argument 1 expected StringValue got %s", boolValueInstance.ClassName))
    
    return boolValueInstance.Value
end 

function Yaris.get_info(PlayerName, BodyPart, SearchDescendants)
    SearchDescendants = SearchDescendants and typeof(SearchDescendants) == "boolean" or false 
    
    assert(typeof(PlayerName) == "string" or PlayerName.ClassName == "Player" or typeof(PlayerName) == "Instance", string.format("Argument 1 expected string or Player got %s", typeof(PlayerName)))
    assert(typeof(BodyPart) == "string", string.format("Argument 1 expected string  got %s", typeof(BodyPart)))
    
    assert(typeof(PlayerName) == "string" and Players:FindFirstChild(PlayerName) ~= nil or PlayerName.ClassName == "Player" or typeof(PlayerName) == "Instance" and Players:FindFirstChild(PlayerName.Name) ~= nil, string.format("Argument 1 got invalid player name."))
    local InfoPlayer = typeof(PlayerName) == "string" and Players:FindFirstChild(PlayerName) or PlayerName.ClassName == "Player" and Player or typeof(PlayerName) == "Instance" and Players:FindFirstChild(PlayerName.Name)
    InfoPlayer = InfoPlayer.Character
    
    local SearchFunction = InfoPlayer[SearchDescendants and "FindFirstDescendant" or "FindFirstChild"]
    
    BodyPart = SearchFunction(InfoPlayer, BodyPart)
    assert(BodyPart ~= nil, "BodyPart does not exist")
    
    return {
        Position = BodyPart.Position,
        Info = {
            Name = BodyPart.Name,
            Distance = workspace.Camera.CFrame.p - BodyPart.CFrame.p
        }
    }
end 

function Yaris.get_player(PlayerName)
    return Players:FindFirstChild(PlayerName)
end 

function Yaris.get_players()
    return Players:GetPlayers()
end 

function Yaris.get_localplayer()
    return LocalPlayer
end 

function Yaris.isLeftClick() -- soon
    return false 
end 

function Yaris.isRightClick() -- soon 
    return false 
end 

function Yaris.isLeftClickHeld() -- soon 
    return false 
end 

function Yaris.isRightClickHeld() -- soon 
    return false 
end 

function Yaris.MatrixToEulers(Matrix) -- CFrame to Vector3
    local Matrix = typeof(Matrix) == "CFrame" and {
        [1] = Matrix.x,
        [2] = Matrix.y,
        [3] = Matrix.z
    } or Matrix
    
    assert(Matrix[1] ~= nil, "expected table[1] got nil")
    assert(Matrix[2] ~= nil, "expected table[2] got nil")
    assert(Matrix[3] ~= nil, "expected table[3] got nil")
    
    return {
        x = Matrix[1],
        y = Matrix[2],
        z = Matrix[3]
    }
end 

function Yaris.size()
    assert(workspace.CurrentCamera.ViewportSize ~= nil, "workspace.CurrentCamera.ViewportSize is nil")

    return workspace.CurrentCamera.ViewportSize
end 

function Yaris.ShowConsole(State)
    local Console = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster") and game:GetService("CoreGui").DevConsoleMaster:FindFirstChild("DevConsoleWindow")
    assert(Console ~= nil, "DevConsoleMaster.DevConsoleWindow is nil")

    Console.Visible = State
end 

function Yaris.ClearConsole()
    return false -- // Not making this lol, roblox is gay 
end

function Yaris.Teleport(Character, Position)
    return true -- // soon 
end 

function Yaris.FirstPersonAim(Aim, Smoothness, Sensitivity)
    return false -- // soon 
end 

function Yaris.ThirdPersonAim(Aim, HSmoothness, VSmoothness)
    return false -- // soon
end 

function Yaris.SetAimbotValue(Setting, Value)
    return false -- // soon 
end 

return Yaris
