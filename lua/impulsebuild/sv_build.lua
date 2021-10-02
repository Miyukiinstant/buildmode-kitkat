function ImpulseBuildPlayerSpawn()-- This is stupid but I had to
end
hook.Add("PlayerSpawn", "ImpulseBuildPlayerSpawn", ImpulseBuildPlayerSpawn)

function ImpulseBuildEntityTakeDamage(ent, dmg)
    if(ply:InSafeZone())then
        return true
    end
    if(ent:GetNWBool("PVE"))then
        return
    end
    if(ent:GetNWBool("BuildMode") || dmg:GetAttacker():GetNWBool("BuildMode") || ply:InSafeZone())then --|| ply:InSafeZone()
        return true
    else
        return false
    end
end
hook.Add("EntityTakeDamage", "ImpulseBuildEntityTakeDamage", ImpulseBuildEntityTakeDamage)

function ImpulseBuildPlayerInitialSpawn(ply,transition)
    ply:SetNWBool("BuildMode", false)
end
hook.Add("PlayerInitialSpawn", "ImpulseBuildPlayerInitialSpawn", ImpulseBuildPlayerInitialSpawn)

function ImpulseBuildPlayerNoClip(ply, state)
    if(ply:GetNWBool("PVE"))then
        return false
    end
        return ply:GetNWBool("BuildMode")
end
hook.Add("PlayerNoClip", "ImpulseBuildPlayerNoClip", ImpulseBuildPlayerNoClip)
--[[
function ImpulseBuildPlayerSpawnedVehicle(ply, ent)
    ent:SetNWBool("BuildMode", ply:GetNWBool("BuildMode"))
end
hook.Add("PlayerSpawnedVehicle", "ImpulseBuildPlayerSpawnedVehicle", ImpulseBuildPlayerSpawnedVehicle)
]]
function ImpulseBuildPlayerShouldTakeDamage(ply, attacker)
    if(ply:InSafeZone())then
        return false
    end
    if(attacker:GetNWBool("PVE"))then
        return false
    end
    if(ply:GetNWBool("BuildMode") || ply:HasGodMode())then --|| ply:InSafeZone()
        return false
    else
        return true
    end
end
hook.Add("PlayerShouldTakeDamage", "ImpulseBuildPlayerShouldTakeDamage", ImpulseBuildPlayerShouldTakeDamage)