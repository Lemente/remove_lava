local min_height=0;
local max_height=0;
local remove_lava = false
local get_node = minetest.get_node


-- stop lava from flowing and duplicating (in case another mod made it renewable)
local override_def = {liquid_range = 0, liquid_renewable = false}
minetest.override_item("default:lava_source", override_def)
minetest.override_item("default:lava_flowing", override_def)



minetest.register_privilege("remove_lava", "player can use /remove_lava command")

minetest.register_chatcommand("remove_lava", {
    params = "<above height> <below height>",
    description = "[remove lava] enables auto lava removal between specific heights",
    privs = {remove_lava=true},
    func = function(name, param)
    	if param == "stop" or param == "disable" or param == "false" then
	    	remove_lava = false
	    	return true , "[remove lava] disabled (consider deactivating the whole mod if you don't need it anymore)"
    	end

    	param1 = tonumber(param:split(" ")[1])
    	minetest.chat_send_all(type(param1))
    	param2 = tonumber(param:split(" ")[2])
		minetest.chat_send_all(type(param2))

    	if type(param1) == "number" and type(param2) == "number" then
    		remove_lava = true
	        min_height = param1
        	max_height = param2
        	return true , "[remove lava] enabled between height " .. min_height .. " and " .. max_height .. " until \"/remove_lava stop\" is used"
	    end

	    if not min_height or not max_height then
            return false, "Missing or incorrect parameter?"
        end

        if min_height >= max_height then
            return false, "[remove lava] max_height is below or equal to min_height. Nothing to remove."
        end
    end,
})


--alternative commands
minetest.register_chatcommand("stop_remove_lava", {
    description = "[removelava] disable auto lava removal",
    privs = {remove_lava=true},
    func = function(name, param)
    	remove_lava = false
    	return true , "[remove lava] disabled"
    end
})

minetest.register_chatcommand("remove_lava_stop", {
    description = "[removelava] disable auto lava removal",
    privs = {remove_lava=true},
    func = function(name, param)
    	remove_lava = false
    	return true , "[remove lava] disabled"
    end
})

--remove lava sources
minetest.register_abm({
	name="remove_lava:source",
	nodenames = {"default:lava_source"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})

minetest.register_lbm({
	name="remove_lava:source",
	nodenames = {"default:lava_source"},
	run_at_every_load=true,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})


--remove flowing lava
minetest.register_abm({
	name="remove_lava:flowing",
	nodenames = {"default:lava_flowing"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})

minetest.register_lbm({
	name="remove_lava:flowing",
	nodenames = {"default:lava_flowing"},
	run_at_every_load=true,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})


--remove basic flames
minetest.register_abm({
	name="remove_lava:flowing",
	nodenames = {"fire:basic_flame"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})

minetest.register_lbm({
	name="remove_lava:flowing",
	nodenames = {"fire:basic_flame"},
	run_at_every_load=true,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})


--remove permanent flame
minetest.register_abm({
	name="remove_lava:flowing",
	nodenames = {"fire:permanent_flame"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})

minetest.register_lbm({
	name="remove_lava:flowing",
	nodenames = {"fire:permanent_flame"},
	run_at_every_load=true,
	action = function(pos,node)
		if remove_lava == true and pos.y>min_height and pos.y<max_height then
			minetest.set_node(pos,{name="air"})
		end
	end
})
