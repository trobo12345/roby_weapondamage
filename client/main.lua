Wait(1000)
Roby.applyAllMultipliers()

AddEventHandler('playerSpawned', function()
    SetTimeout(1000, Roby.applyAllMultipliers)
end)

AddEventHandler('gameEventTriggered', function(eventName, data)
    if not Roby.WeaponDamage.HeadshotOneShot then return end
    if eventName ~= 'CEventNetworkEntityDamage' then return end

    local victim = data[1]
    local attacker = data[2]
    local weaponHash = data[3]
    
    if Roby.isWeaponBlockedForHeadshot(weaponHash) then return end

    if victim and DoesEntityExist(victim) then
        if IsEntityAPed(victim) then
            local success, bone = GetPedLastDamageBone(victim)
            if success and Roby.isHeadBone(bone) then
                if not IsPedFatallyInjured(victim) then
                    SetEntityHealth(victim, 0)
                end
            end
        end
    end
end)
