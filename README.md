# Secret Lands

## Changelog
### Release
not reached yet!
### Beta
not reached yet!
### Alpha
#### v1.5.0
##### Dynamic Map Changes:
- Ice will now thaw all across the map.
- Forests will now regrow after they've been chopped down, but only if they are cut down sustainably.
##### World Manipulation:
- Apples can now be grown by placing down Osmium blocks in Forests.
- Cacti can be destroyed by placing Uranium blocks next to them.
##### Gold:
- Added Gold Ore, which can spawn on every layer.
- Added Gold Item and Gold Blocks
- Gold currently does not have any uses except causing Siegers to despawn when they steal a Gold block
##### Other Additions:
- Added the /fill command, with the syntax `/fill <x1> <y1> <x2> <y2> <z> <value>`.
##### Tweaking:
- Gave armor-hearts invinicibility frames.
- Made mobs move and attack twice as fast on the Lunatic difficulty.
##### Internal Improvements:
- Improved the framerate massively by...
- ...converting mobs and objects into a more efficient object-oriented programming based format.
- Removed the laggy and complicated screenshot function in favor of a simple one
- Update the entire save system to make it more compact and less complex.
- File sizes of all save files are reduced by over 25%. #9 isn't *quite* fixed, but we're getting there.
##### Fixes:
- Fixed a crash caused by inputting invalid commands.
#### v1.4.1
- Fixed a tuning bug that prevented mobs from spawning on Easy, Normal, and Hard difficulties.
#### v1.4.0
##### Difficulty:
- Add the difficulty system with four difficulties (Easy, Normal, Hard, Lunatic)
- Difficulty now scales invincibility frames, mob health, and mob spawning
##### Mobs:
- Add the Sieger mob, which is a mob that only shows up on the surface when you're stronger and can break structures.
##### Slash Commands:
- Add the commands system
- Add /summonmob, /summonobject, /settile, /heal, /give, /setweapon, /teleport, /difficulty, and /setarmor, which are all fairly self-explanatory
- Add /renameworld, which **finally** fixes #4
##### Tweaks:
- Make Backspace key work in text entry for world saves
#### v1.3.0
##### Music:
- Retuned the music downloading system.
- Added "Ice Water's Refrain" as a placeholder song
##### Tuning:
- Yoctobyte-ify (make more compact with less spacing) some of my code
- the loading screen was tweaked and now actually has a loading bar!
- Dedicate 0.5 more GB of RAM.
##### Crafting, Weapons, Armor:
- You can now craft all of the powerups! Gel is finally useful!
- Added Greensteel Sword (add uranium to steel)
- Fixed text leaving box in armor/weapon crafting displays by extending the box so the text fits in it
##### Bugfixing:
- Fixed bug where placing Osmium would still display as "Placing: Tin"
- Fixed bug where placing Tin or Osmium would not display the half-tangible block properly.
- Fixed ArrayOutOfBoundsException when loading saves in some instances
- Super Form now actually has a description.
##### World Generation:
- A third layer of cave generation.
##### Controls:
- Selecting what to place is now not frustrating (i.e. you can now place Tin if you have no Stone, or Osmium if you have no wood)
##### Structures:
- Lowering Dungeon 2 (to go down to the third cave layer)
- Castle and Ruined Castle overworld structures!
##### Uranium:
- Added Uranium Ore, Uranium Item, and Uranium Blocks
- Uranium Ore works like catci but even deadlier, you better mine it quickly!
- Uranium Blocks have the same interaction with the player as Lava (i.e. deals damage to you if you walk into it)
- Uranium Blocks, unlike Lava, also damage mobs, so they work as an efficient trap if you can predict mob movement.
#### v1.2.1
##### Tuning:
- fix RAM dedication to allow the game to actually start up
##### Music:
- rename Wandering A, B, and C to Wandering, Flutter, and Insane Slimes respectively
##### Tweaking:
- fix combat so you can't just get knocked into a wall and immediately die
#### v1.2.0
##### Internal:
- Perform a massive optimization to de-spaghettify the code.
##### Tuning:
- mixing on "Temple" fixed so it isn't AS loud
- schematics no longer download EVERY SINGLE time you start the game.
- fixed #6 - movement is now less stiff
- the colors of Osmium and Tin have been changed so they pop out more against the caves
##### Bugfixes:
- fixed bug where you can't heal half-hearts
- fixed issue #7 - worlds that were never saved will no longer appear in the saves list.
#### v1.1.0
##### Miscellaneous / Fundamentals
- Add cave layer 2.
- Dedicate more RAM, so hopefully soon we can have maps bigger than 1k by 1k.
- Add Armor!!!
##### Blocks / Items
- Add Tin and Osmium Ore.
- Add Tin and Osmium Blocks.
##### Weapons & Armor
- Add Thistle Armor, Bronze Armor, Steel Armor, Iridosule Armor
- Add Bronze Sword, Steel Sword
##### Structures
- Add schematics.
- Add Lowering Dungeons.
- Removed the Omega House structure.
- Add the Grotto and Ocean Ruin structures.
##### Music
- Add Yet Darker
- Add sound volume settings.
#### v1.0.0
- Add the Temple dungeon.
- Add the Mummy boss fight and music for it.
- Add the Sandstone Temple Walls.
- Optimize mob despawning and world generation.
- Add the Super form.
- Rebalance form timers.
### Omega
#### v1.8.0
- Add the Mob system.
- Add Slimes
- Add cave demons.
- Add attack, weapons, and weapon upgrades.
#### v1.7.0
- Add multi-layer support.
- Add more music.
- Add Cave layer 1.
- Add Copper and Iron ore.
- Add the gates.
- Add Copper and Iron blocks.
- Add world listings.
#### v1.6.0
- Add update checker.
- Fix pseudo-freeze on world generation.
- Add Customized presets and menu for them.
- Fix lag spike when loading music during gameplay.
- Add coal ore and coal item.
#### v1.5.1
- Fix #5
- Music now plays.
#### v1.5.0
- Add Apples, an item that can heal you.
- Increase max health from 10 to 16.
- Fix health bar in general.
- Add Cacti, an object that hurts you.
- Add house structure.
- Hopefully fix #2
#### v1.4.1
- Fix #3
- Changed object spawn rates
#### v1.4.0
- Add FPS counter.
- Improve FPS, massively. ~20 to ~50.
- Add health and damage.
- Add respawning.
- Lava, drowning, and mountains deal damage.
- You can now remove a block.
- Save and Load system added.
- Powerups no longer spawn in impassible Deep Ocean or Volcano.
#### v1.3.0
- You can now use WASD.
- Add the inventory and inventory screen
- Add Wood and Stone items
- Can now chop forests for wood. (Normal / Sprinter forms)
- Can now mine mountains for stone. (Climber form)
- Powerups now are moved to your inventory instead of activating immediately, so you don't die from pickup up a powerup anymore
- Model flashes while cooldown is close to over
- Controls on title screen
- You can now place stone or wood blocks now.
- Add Screenshots!!!!!!!
#### v1.2.0
- Add Frozen Ocean biome
- Add Iceman powerup and Iceman form. (think Super Mario Galaxy Ice Flower)
- Make Sprinter form actually *faster* instead of just slippery.
- Add ice and ice physics.
- Add form cooldowns.
- Add Europa preset
- Remove looping, add world borders.
#### v1.1.0
- [ now restarts the game.
- Added Objects
- Added four new objects (powerups)
- Added three new forms, Sprinter, Mountain Climber and Water forms
- Added a game-over condition (being on a mountain or ocean without the proper form to survive there)
- Added a bunch of optimization and code-retools
- Fixed a bunch of bugs related to map looping (of course it still sucks, give me a break.)
#### v1.0.0
- initial release
