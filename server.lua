RegisterNetEvent("alerts:AddByPerms")
AddEventHandler("alerts:AddByPerms", function(txtclr, bgclr, sentby, message, permsLevel)
    TriggerClientEvent("alerts:AddByPerms", -1, txtclr, bgclr, sentby, message, permsLevel)
end)

RegisterNetEvent("alerts:addbyjob")
AddEventHandler("alerts:addbyjob", function (txtclr, bgclr, sentby, message, job)
    --TriggerClientEvent("alerts:addjobnotify", -1, jobName, mythicType, mythicText, mythicDuration, mythicStyle)
    --TriggerClientEvent("alerts:addjobnotify", -1, job, "error", sentby .. ": " .. message, 15000, {})
    TriggerClientEvent("alerts:add", -1, txtclr, bgclr, sentby, message, job)
end)

RegisterNetEvent("alerts:addblipbyjob")
AddEventHandler("alerts:addblipbyjob", function (blipx, blipy, blipz, range, job, CrimeBlipId, DisableRings, OptionalLength, StopIndicatorFlash, IndicatorBlipColor, IndicatorScale)
        --job = job.lower() end --Hotfix job caps issues issues
    TriggerClientEvent("alerts:addblip", -1, blipx, blipy, blipz, range, job, CrimeBlipId, DisableRings, OptionalLength, StopIndicatorFlash, IndicatorBlipColor, IndicatorScale)
end)

RegisterNetEvent("alerts:sendto")
AddEventHandler("alerts:sendto", function (sendtoid, txtclr, bgclr, sentby, message)
    TriggerClientEvent("alerts:add", sendtoid, txtclr, bgclr, sentby, message)
end)

RegisterNetEvent("alerts:addnotifybyjob")
AddEventHandler("alerts:addnotifybyjob", function(jobName, mythicType, mythicText, mythicDuration, mythicStyle)
    TriggerClientEvent("alerts:addjobnotify", -1, jobName, mythicType, mythicText, mythicDuration, mythicStyle)
end)

--AddEventHandler("alerts:addbyjob", function (txtclr, bgclr, sentby, message, job)
--AddEventHandler("alerts:addblipbyjob", function (x, y, z, radius, job, BlipID)