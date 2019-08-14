--All the external files go at the top
dofile(minetest.get_modpath("grey_goo").."/crafting.lua")
dofile(minetest.get_modpath("grey_goo").."/blue_goo.lua")
dofile(minetest.get_modpath("grey_goo").."/purple_goo.lua")
dofile(minetest.get_modpath("grey_goo").."/red_goo.lua")
dofile(minetest.get_modpath("grey_goo").."/white_goo.lua")
dofile(minetest.get_modpath("grey_goo").."/orange_goo.lua")


function start_slow(pos)
	minetest.get_node_timer(pos):start(math.random(10, 20))
end
function start_med(pos)
	minetest.get_node_timer(pos):start(math.random(5, 10))
end
function start_fast(pos)
	minetest.get_node_timer(pos):start(math.random(3))
end




minetest.register_node("grey_goo:green_goo", {
		description = "Green Goo",
		tiles = {"grey_goo_green_goo.png"},
		paramtype = "light",
		light_source = 14,
		groups = {dig_immediate = 3},
		is_ground_content = false,
})
