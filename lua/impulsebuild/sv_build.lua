function ImpulseBuildPlayerSpawn()-- This is stupid but I had to
end
hook.Add("PlayerSpawn", "ImpulseBuildPlayerSpawn", ImpulseBuildPlayerSpawn)

function ImpulseBuildEntityTakeDamage(ent, dmg)
    if(!ent:IsPlayer() && ent:InSafeZone())then
        return true
    end
    if(dmg:GetAttacker():IsPlayer())then
        if(dmg:GetAttacker():GetNWBool("BuildMode"))then
            return true
        end
    end
    
end
hook.Add("EntityTakeDamage", "ImpulseBuildEntityTakeDamage", ImpulseBuildEntityTakeDamage)

function ImpulseBuildPlayerInitialSpawn(ply,transition)
    ply:SetNWBool("BuildMode", false)
    ply:SetNWBool("PVE", false)
end
hook.Add("PlayerInitialSpawn", "ImpulseBuildPlayerInitialSpawn", ImpulseBuildPlayerInitialSpawn)

function ImpulseBuildPlayerNoClip(ply, state)
    if(ply:GetNWBool("PVE") || !ply:GetNWBool("BuildMode"))then
        return false
    end
end
hook.Add("PlayerNoClip", "ImpulseBuildPlayerNoClip", ImpulseBuildPlayerNoClip)

function ImpulseBuildPlayerShouldTakeDamage(ply, attacker)
    if(ply:InSafeZone() || attacker:GetNWBool("BuildMode") || attacker:GetNWBool("PVE") || ply:GetNWBool("BuildMode"))then
        return false
    else
        return true
    end
end
hook.Add("PlayerShouldTakeDamage", "ImpulseBuildPlayerShouldTakeDamage", ImpulseBuildPlayerShouldTakeDamage)