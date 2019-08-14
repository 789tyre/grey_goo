function clear_goo(pos)
	local is_grown = false
	
	for nx = -1,1,1 do
		for ny = -1,1,1 do
			for nz = -1,1,1 do
				local current_pos = {x=(pos.x+nx), y=(pos.y+ny), z=(pos.z+nz)}
				local current_node = minetest.get_node(current_pos)
				
				if string.sub(current_node.name,1,9) == "grey_goo:" and not (current_node.name == "grey_goo:red_goo") then
					local chance = math.random(2)
					if chance == 1 or chance == 2 then
						is_grown = true
						minetest.remove_node(current_pos)
						minetest.place_node(current_pos, {name = "grey_goo:red_goo"})
					end
				end
				
			end
		end
	end
	if not is_grown then
		minetest.remove_node(pos)
	end
end

minetest.register_node("grey_goo:red_goo",{
	description = "Red Goo",
	tiles = {"grey_goo_red_goo.png"},
	is_ground_content = false,
	groups = {dig_immediate = 3},
	light_source = 8,
	after_place_node = function (pos)
		start_fast(pos)
	end,
	on_timer = function (pos)
		clear_goo(pos)
		start_fast(pos)
	end,
	on_rightclick = function (pos)
		clear_goo(pos)
	end
})