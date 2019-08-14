function eat_air(pos)
	local is_grown = false

	for nx = -1,1,1 do
		for ny = -1,1,1 do
			for nz = -1,1,1 do
				
				local currentpos = {x = (pos.x+nx), y = (pos.y+ny), z = (pos.z+nz)}
				local currentnode = minetest.get_node(currentpos).name
				local light = minetest.get_node_light(currentpos, nil)
				if light >=7 then
					if currentnode == "air" and currentnode ~= "grey_goo:green_goo" and currentnode ~= "grey_goo:white_goo"then
						local chance = math.random(4)
						
						if chance == 1 then
							is_grown = true
							minetest.remove_node(currentpos)
							minetest.place_node(currentpos, {name = "grey_goo:white_goo"})
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

minetest.register_node("grey_goo:white_goo",{
	description = "White Goo",
	tiles = {"grey_goo_white_goo.png"},
	groups = {dig_immediate = 3},
	is_ground_content = false,
	after_place_node = function(pos)
		start_med(pos)
	end,
	on_timer = function (pos)
		eat_air(pos)
		start_med(pos)
	end,
		on_right_click = function(pos, node)
		eat_air(pos)
	end
	
})
-- -301 -1.5 1.5