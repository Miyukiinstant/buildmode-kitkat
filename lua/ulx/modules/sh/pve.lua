local function UlxPve(calling_ply,num)
    
    calling_ply:SetMoveType(MOVETYPE_WALK)
    calling_ply:SetNWBool("PVE",num)
    calling_ply:SetNoTarget(false)
    calling_ply:SetNWBool("BuildMode",false)
    
end
function ulx.pve( calling_ply)
    local isPve = calling_ply:GetNWBool("PVE")
    if(!isPve)then
        ulx.fancyLogAdmin( calling_ply,"#A entered pve mode")
        UlxPve(calling_ply,true)
    end
end
local pve = ulx.command( "Fun", "ulx pve", ulx.pve, "!pve" )
pve:defaultAccess( ULib.ACCESS_ALL )