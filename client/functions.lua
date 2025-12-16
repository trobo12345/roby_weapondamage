Roby.isHeadBone = function(boneId)
    return Roby.WeaponDamage.HeadBones[boneId] == true
end

Roby.isWeaponBlockedForHeadshot = function(weaponHash)
    return Roby.WeaponDamage.BlockedHeadshotWeapons[weaponHash] == true
end

Roby.applyAllMultipliers = function()
    for weaponName, mult in pairs(Roby.WeaponDamage.Multipliers) do
        local h = GetHashKey(weaponName)
        SetWeaponDamageModifier(h, mult)
    end
end