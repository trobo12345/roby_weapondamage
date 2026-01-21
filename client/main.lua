CreateThread(function()
    Roby.CacheHashes()
    Roby.applyAllMultipliers()
end)

AddEventHandler('playerSpawned', function()
    SetTimeout(1000, function()
        Roby.applyAllMultipliers()
    end)
end)

AddEventHandler('gameEventTriggered', function(eventName, data)
    if eventName ~= 'CEventNetworkEntityDamage' then return end
    
    local victim = data[1]
    local attacker = data[2]
    local weaponHash = data[3]
    local isMelee = data[12] 

    if not Roby.WeaponDamage.HeadshotOneShot then return end
    
    if isMelee == 1 or isMelee == true then 
        return 
    end

    if Roby.isWeaponBlockedForHeadshot(weaponHash) then 
        return 
    end

    if victim and DoesEntityExist(victim) and IsEntityAPed(victim) then
        local success, bone = GetPedLastDamageBone(victim)
        
        if success and Roby.isHeadBone(bone) then
            if not IsPedFatallyInjured(victim) then
                if victim == PlayerPedId() then
                    SetEntityHealth(victim, 0)
                else
                    ApplyDamageToPed(victim, 1000, true)
                    SetEntityHealth(victim, 0)
                end
            end
        end
    end
end)
