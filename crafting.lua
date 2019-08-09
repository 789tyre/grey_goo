minetest.register_craft({ --Lazy Blocker
	type = "shapeless",
	output = "grey_goo:green_goo",
	recipe = {"default:dirt"},
})

minetest.register_craft({ --Water Eater
	type = "shaped",
	output = "grey_goo:blue_goo_off",
	recipe = {
				{"grey_goo:green_goo", ""},
				{"", "grey_goo:green_goo"}
			 }
})

minetest.register_craft({ --Slow Eater
	type = "shaped",
	output = "grey_goo:purple_goo",
	recipe = {
				{"", "grey_goo:green_goo"},
				{"grey_goo:green_goo", ""}
			 }
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:green_goo 4",
	recipe = {"grey_goo:green_goo"}
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:blue_goo_off 4",
	recipe = {"grey_goo:blue_goo_off"}
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:purple_goo 4",
	recipe = {"grey_goo:purple_goo"}
})