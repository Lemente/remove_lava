# remove_lava
Minetest Mod : once loaded, will remove all lava nodes in loaded mapblocks every seconds above sea level


it adds an ABM and LBM to lava source and lava flow, so they constantly erase themselves between the two given heights when the variable remove_lava is enabled

to start, use :
/remove_lava <min_height> <max_height>
if you don't specify the parameters, the previous ones will be used


to stop, use :
/remove_lava stop
