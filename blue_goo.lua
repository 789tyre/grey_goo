function eat_water(pos)
	local is_grown = false
	--cycles through all the nodes around the center node
	for nx = -1, 1, 1 do 
		for nz = -1, 1, 1 do
			for ny = -1, 1,1 do
				if nx == 0 and ny == 0 and nz == 0 then
					
				else
					local current_pos = {x=(pos.x+nx), y=(pos.y+ny), z=(pos.z+nz)}
					local current_node = minetest.get_node(current_pos)
					if minetest.get_item_group(current_node.name, "water") ~= 0 then
						local chance = math.random(4)
						is_grown = true
						if chance == 1 then --1 in 4 chance (?) of the Blue Goo growing
							minetest.remove_node(current_pos)
							minetest.place_node(current_pos, {name = "grey_goo:blue_goo_off"})
						end
					end
				end
			end
		end
	end
	if not is_grown then 
		minetest.remove_node(pos) 
	end
end


minetest.register_node("grey_goo:blue_goo_off", {
	description = "Blue Goo",
	tiles = {"grey_goo_blue_goo.png"},
	paramtype = "light",
	light_source = 0,
	groups = {dig_immediate = 3},
	is_ground_content = false,
	after_place_node = function(pos)
		start_slow(pos) --Kickstarts the goo growth
	end,
	on_timer = function (pos)
		eat_water(pos) --Keeps growth going
		start_slow(pos)
	end,
	on_rightclick = function (pos, node)
		--minetest.swap_node(pos, {name = "grey_goo:blue_goo_on", param2 = node.param2})
		--minetest.get_node_timer(pos):start(1)
		eat_water(pos)
	end,
})

minetest.register_node("grey_goo:blue_goo_on", { --Might remove later
	tiles = {"grey_goo_blue_goo.png"},
	groups = {not_in_creative_inventory = 1, dig_immediate = 3},
	drop = "grey_goo:blue_goo_off",
	light_source = 14,
	on_timer = function (pos)
		minetest.swap_node(pos, {name = "grey_goo:blue_goo_off", 0, 0})
	end
})



