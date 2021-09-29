function UlxPvp(calling_ply,num)
    local pos = calling_ply:GetPos()
    ulx.fancyLogAdmin( calling_ply,"#A entered pvp mode")
    calling_ply:ExitVehicle()
    calling_ply:Spawn()
    calling_ply:SetPos(pos)
    calling_ply:SetNWBool("BuildMode",num)
    calling_ply:SetNoTarget(false)
end
function ulx.pvp( calling_ply)
    local isPvp = calling_ply:GetNWBool("BuildMode")
    if(isPvp)then
        ulx.fancyLogAdmin( calling_ply,"#A entering pvp mode in 3 seconds")
        timer.Simple(3, function()UlxPvp(calling_ply,false)end) 
    end
end
local pvp = ulx.command( "Fun", "ulx pvp", ulx.pvp, "!pvp" )
pvp:defaultAccess( ULib.ACCESS_ALL )