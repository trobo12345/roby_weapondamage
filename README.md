# roby_weapondamage

This script allows for the customization of weapon damage multipliers and includes a "Headshot One-Shot" feature for FiveM servers.

## Features

- **Damage Multipliers:** Increase or decrease damage for specific weapons.
- **Headshot System:** Instant kill on headshot (can be toggled).
- **Exceptions:** Exclude specific weapons (e.g., fists) from the headshot system.
- **Configuration:** Easy-to-edit settings in the `shared/main.lua` file.


https://github.com/user-attachments/assets/1df3a1fc-15e3-4ed7-940a-8ca427aab397


## Installation

1. Download the script and place it into your `resources` folder.
2. Rename the folder to `roby_weapondamage` (if it isn't already).
3. Add the following line to your `server.cfg` file:
   ```cfg
   ensure roby_weapondamage
   ```

## Configuration

You can find the settings in the `shared/main.lua` file.

### Example Configuration:

```lua
Roby.WeaponDamage = {
    Multipliers = {
        WEAPON_PISTOL = 1.0, -- Pistol damage multiplier
        WEAPON_MICROSMG = 1.4, -- Micro SMG damage multiplier
        -- ...
    },
    HeadshotOneShot = true, -- Headshot instant kill on/off
    BlockedHeadshotWeapons = {
        [`WEAPON_UNARMED`] = true -- Weapons that won't cause instant death on headshot
    }
}
```
