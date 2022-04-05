-- // Converted this for fun, was bored(not finished)

local Yaris = {}
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
    
    return Player.TeamColor.r
end 

function Yaris.GetCharacter(Player)
    assert(Player.ClassName == "Player", string.format("Argument 1 expected Player got %s", tostring(Player.ClassName)))
    
    return Player.Character 
end 

function Yaris.GetImageLabelPosition(Image)
    assert(Image ~= nil, "Argument 1 missing or nil")
    assert(typeof(Image) == "Instance", string.format("Argument 1 expected ImageLabel got %s", typeof(Image)))
    assert(Image.ClassName == "ImageLabel", string.format("Argument 1 expected ImageLabel got %s", typeof(Image)))
    
    local ImagePosition = Image.Position 
    local ImageSize = Image.Size
    
    return Vector2.new(ImagePosition.X.Offset + ImageSize.X.Offset/2, ImagePosition.Y.Offset + ImageSize.Y.Offset/2)
end

print(Yaris.GetTeamColour(game.Players.LocalPlayer))
