function UlxBuild(calling_ply,num)
    ulx.fancyLogAdmin( calling_ply,"#A entered build mode")
    calling_ply:SetNWBool("BuildMode",num)
    calling_ply:SetNoTarget(true)
end
function ulx.build( calling_ply)
    local isBuild = calling_ply:GetNWBool("BuildMode")
    if(!isBuild)then
        ulx.fancyLogAdmin( calling_ply,"#A entering build mode in 3 seconds")
        timer.Simple(3, function()UlxBuild(calling_ply,true)end)    
    end
end
local build = ulx.command( "Fun", "ulx build", ulx.build, "!build" )
build:defaultAccess( ULib.ACCESS_ALL )