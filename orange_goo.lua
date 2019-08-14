function create_barrier(pos)
	
end

minetest.register_node("grey_goo:orange_goo",{
	description = "Orange Goo",
	tiles = {"grey_goo_orange_goo.png"},
	groups = {dig_immediate = 3},
	is_ground_content = false,
	after_place_node = function (pos)
		start_fast(pos)
	end,
	on_timer = function (pos)
		create_barrier(pos)
		start_fast(pos)
	end,
	on_right_click = function(pos)
		create_barrier(pos)
	end
})