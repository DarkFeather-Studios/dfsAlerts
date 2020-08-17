function table.Contains(set, item)
    for key, value in pairs(set) do
        if value == item then return true end
    end
    return false
end

RegisterNetEvent("alerts:AddByPerms")
AddEventHandler("alerts:AddByPerms", function(txtclr, bgclr, sentby, message, permsLevel)
    if exports.db_perms:HasPermission("recieveReport", permsLevel) then
        TriggerEvent("alerts:add", txtclr, bgclr, sentby, message)
    end
end)

RegisterNetEvent("alerts:add")
AddEventHandler("alerts:add", function (txtclr, bgclr, sentby, message, jobname) --BUG: Text alwyas white. Sentby alters tho?
    if jobname then jobname = string.lower(jobname) end--Hotfix job caps issues issues
    if #txtclr ~= 3 and #bgclr ~= 3 then
        TriggerEvent("alerts:add", {255, 255, 255}, {255, 0, 0}, "alerts", sentby.." Failed to send 3 color args twice to alerts:add!")
        return
    end

    if not jobname or (jobname == "police" and exports.dfs_PoliceJob:IsCop()) or jobname == string.lower(exports.dfs:GetMyIdentity().JobName) then
        TriggerEvent('chat:addMessage', {
            color = txtclr,
            bgcolor = bgclr,
            multiline = false,
            template = '<b>' .. sentby .. ':</b> ' .. message
        })
    end
end)

RegisterNetEvent("alerts:addjobnotify")
AddEventHandler("alerts:addjobnotify", function(jobName, mythicType, mythicText, mythicDuration, mythicStyle)
    -- Styling { ['background-color'] = '#FF00E5', ['color'] = '#FFFFFF' }
    if jobName == "police" and exports.dfs_PoliceJob:IsCop() then
        exports.mythic_notify:SendUniqueAlert(math.random(1000,9999), mythicType, mythicText, mythicDuration, mythicStyle)
    end

    if jobName == "ems" then
        exports.mythic_notify:SendUniqueAlert(math.random(1000,9999), mythicType, mythicText, mythicDuration, mythicStyle)
    end

end)

RegisterNetEvent("alerts:addblip")
AddEventHandler("alerts:addblip", function (blipx, blipy, blipz, range, job, CrimeBlipId, DisableRings, OptionalLength, StopIndicatorFlash, IndicatorBlipColor, IndicatorScale)
    if not job or ((job == "police" and exports.dfs_PoliceJob:IsCop()) or job == exports.dfs:GetMyIdentity().JobName) then
        Citizen.CreateThread(function()
            local HideRings = DisableRings or false
            local RemoveDelayMS = OptionalLength or 60000
            local RemoveOn = GetGameTimer() + RemoveDelayMS
            local StartTime = GetGameTimer()
            local MaxAlpha = 255
            local Alpha = 255
            local CrimeArea
            local CrimeArea2
            local CrimeArea3
            local Elapsed = 0
            local Scale = IndicatorScale or 1.0
            local ShouldFlash = not (StopIndicatorFlash or false)
            local Color = IndicatorBlipColor or 0
            local CrimeAreaStar
            CrimeAreaStar = AddBlipForCoord(blipx, blipy, blipz)
            SetBlipSprite(CrimeAreaStar, CrimeBlipId)
            SetBlipAsShortRange(CrimeAreaStar, true)
            SetBlipDisplay(CrimeAreaStar, 8)
            if ShouldFlash then
                SetBlipFlashes(CrimeAreaStar, true)
                SetBlipFlashInterval(CrimeAreaStar, 750)
            end
            SetBlipColour(CrimeAreaStar, Color)
            SetBlipScale(CrimeAreaStar, Scale)

            if not HideRings then
                CrimeArea = AddBlipForRadius(blipx, blipy, blipz, range)
                CrimeArea2 = AddBlipForRadius(blipx, blipy, blipz, range-3)
                CrimeArea3 = AddBlipForRadius(blipx, blipy, blipz, range+3)
                SetBlipSprite(CrimeArea, 10)
                SetBlipColour(CrimeArea, 1)
                SetBlipAsShortRange(CrimeArea, true)
                SetBlipDisplay(CrimeArea, 8)
                SetBlipSprite(CrimeArea2, 10)
                SetBlipColour(CrimeArea2, 1)
                SetBlipAsShortRange(CrimeArea2, true)
                SetBlipDisplay(CrimeArea2, 8)
                SetBlipSprite(CrimeArea3, 10)
                SetBlipColour(CrimeArea3, 1)
                SetBlipAsShortRange(CrimeArea3, true)
                SetBlipDisplay(CrimeArea3, 8)
            end

            while RemoveOn > GetGameTimer() do
                
                Elapsed = GetGameTimer() - StartTime

                Alpha = MaxAlpha-(MaxAlpha*(Elapsed / RemoveDelayMS))
                Alpha = math.floor(Alpha)


                SetBlipAlpha(CrimeAreaStar, Alpha)

                if not HideRings then
                    SetBlipAlpha(CrimeArea2, Alpha)                    
                    SetBlipAlpha(CrimeArea3, Alpha)
                    SetBlipAlpha(CrimeArea, Alpha)

                end
                Wait(0)
            end
            
            RemoveBlip(CrimeAreaStar)
            if not HideRings then
                RemoveBlip(CrimeArea)
                RemoveBlip(CrimeArea2)
                RemoveBlip(CrimeArea3)
            end
        end)
    end
end)