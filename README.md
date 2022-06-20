# remove_lava
Minetest Mod : once loaded, will remove all lava and fire nodes in loaded mapblocks every seconds above sea level

[WARNING] this mods can be very resource intensive, even when disabled. It is not meant to stay installed while playing, only to temporarily fix a world.
It is also given with no garuantee. You should probably make a backup of your world before using.



once installed it will stop the lava from flowing (deleting any existing "default:lava_flowing" node)

it also adds the command /remove_lava <min_height> <max_height>
once enabled, it will start deleting the following nodes in loaded mapblocks between the set heights :
- default:lava_source
- default:lava_flowing
- fire:permanent_flame
- fire:basic_flame


to stop node deletion, use "/remove_lava stop", restart world or deactivate the mod
