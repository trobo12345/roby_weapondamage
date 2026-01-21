if Roby == nil then Roby = {} end
local blockedHashes = {}

Roby.CacheHashes = function()
    blockedHashes = {} 
    if Roby.WeaponDamage and Roby.WeaponDamage.BlockedHeadshotWeapons then
        for weaponName, _ in pairs(Roby.WeaponDamage.BlockedHeadshotWeapons) do
            if type(weaponName) == "string" then
                blockedHashes[GetHashKey(weaponName)] = true
            else
                blockedHashes[weaponName] = true
            end
        end
    else
        print("~1[Roby Damage] Error: Roby.WeaponDamage or Roby.WeaponDamage.BlockedHeadshotWeapons is nil.~7")
    end
end

Roby.isWeaponBlockedForHeadshot = function(weaponHash)
    return blockedHashes[weaponHash] == true
end

Roby.isHeadBone = function(boneId)
    if Roby.WeaponDamage and Roby.WeaponDamage.HeadBones then
        return Roby.WeaponDamage.HeadBones[boneId] == true
    end
    return false
end

Roby.applyAllMultipliers = function()
    if Roby.WeaponDamage and Roby.WeaponDamage.Multipliers then
        for weaponName, mult in pairs(Roby.WeaponDamage.Multipliers) do
            local h = GetHashKey(weaponName)
            SetWeaponDamageModifier(h, mult)
        end
    end
end
