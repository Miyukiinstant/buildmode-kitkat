function UlxPvp(calling_ply,num)
    ulx.fancyLogAdmin( calling_ply,"#A entered pvp mode")
    calling_ply:SetMoveType(MOVETYPE_WALK)
    calling_ply:ExitVehicle()    
    calling_ply:SetNoTarget(false)
    calling_ply:SetNWBool("BuildMode",num)
end
function ulx.pvp( calling_ply)
    local isPvp = calling_ply:GetNWBool("BuildMode")
    local isPve = calling_ply:GetNWBool("PVE")
    if(isPvp || isPve)then
        ulx.fancyLogAdmin( calling_ply,"#A entering pvp mode in 3 seconds")
        calling_ply:SetNWBool("PVE",false)
        timer.Simple(3, function()UlxPvp(calling_ply,false)end) 
    end
end
local pvp = ulx.command( "Fun", "ulx pvp", ulx.pvp, "!pvp" )
pvp:defaultAccess( ULib.ACCESS_ALL )