local function UlxPve(calling_ply,num)
    if(num)then
    ulx.fancyLogAdmin( calling_ply,"#A entered pve mode")
    calling_ply:SetMoveType(MOVETYPE_WALK)
    calling_ply:SetNWBool("PVE",num)
    calling_ply:SetNoTarget(false)
    else
        local text
        if(calling_ply:GetNWBool("BuildMode"))then
        text = "Buildmode"
        calling_ply:SetNoTarget(true)
        else
        text = "PVP"
        calling_ply:SetNoTarget(false)
        end
        ulx.fancyLogAdmin( calling_ply,"#A left pve mode and returned "..text)
        calling_ply:SetNWBool("PVE",num)    
    end
end
function ulx.pve( calling_ply)
    local isPve = calling_ply:GetNWBool("PVE")
    if(!isPve)then
        --ulx.fancyLogAdmin( calling_ply,"#A entering pvp mode in 3 seconds")
        --timer.Simple(3, function()UlxPvp(calling_ply,false)end) 
        UlxPve(calling_ply,true)
    else 
        UlxPve(calling_ply,false)
    end
end
local pve = ulx.command( "Fun", "ulx pve", ulx.pve, "!pve" )
pve:defaultAccess( ULib.ACCESS_ALL )