hook.Add("HUDDrawTargetID", "draw_buildmode", function()

    local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if ( !trace.Hit ) then return end
	if ( !trace.HitNonWorld ) then return end

    if ( trace.Entity:IsPlayer() ) then
		if(trace.Entity:GetNWBool("BuildMode"))then
            build = "Build"
        else
            build = "PvP"
        end
        if(trace.Entity:GetNWBool("PVE"))then
            build = "PVE"
        end
        local x, y = surface.GetTextSize(build)
        local offset = 3
        --draw.DrawText(build, "DermaDefault", ScrW()*0.5 + offset, ScrH()*0.5 + y + 5 + offset, Color(0,0,0,255), TEXT_ALIGN_CENTER)
        draw.DrawText(build, "TargetIDSmall", ScrW()*0.5, ScrH()*0.5 + y + 5, Color(255,255,255,255), TEXT_ALIGN_CENTER)
        
	end

end)