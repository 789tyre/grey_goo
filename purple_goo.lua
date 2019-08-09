function eat_node(pos)
	local is_grown = false
	for nx = -1,1,1 do
		for ny = -1,1,1 do
			for nz = -1,1,1 do
				local currentPos = {x = (pos.x+nx), y = (pos.y+ny), z = (pos.z+nz)}
				local currentNode = minetest.get_node(currentPos).name
				
				if currentNode ~= "air" and minetest.get_item_group(currentNode, "water") == 0 and currentNode ~= "grey_goo:green_goo" and currentNode ~= "grey_goo:purple_goo"then
					local chance = math.random(4)
					
					if chance == 1 then
						is_grown = true
						minetest.remove_node(currentPos)
						minetest.place_node(currentPos, {name = "grey_goo:purple_goo"})
					end
				end
				
				
			end
		end
	end
	
	if not is_grown then
		minetest.remove_node(pos)
	end
	
end

minetest.register_node("grey_goo:purple_goo", {
	description = "Purple Goo",
	tiles = {"grey_goo_purple_goo.png"},
	groups = {dig_immediate = 3},
	is_ground_content = false,
	after_place_node = function(pos)
		start_med(pos)
	end,
	on_timer = function(pos)
		eat_node(pos)
		start_med(pos)
	end,
	on_rightclick = function (pos, node)
		eat_node(pos)
	end

})