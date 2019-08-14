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

minetest.register_craft({ --World Eater
	type = "shaped",
	output = "grey_goo:purple_goo",
	recipe = {
				{"", "grey_goo:green_goo"},
				{"grey_goo:green_goo", ""}
			 }
})

minetest.register_craft({ --The Cleaner
	type = "shaped",
	output = "grey_goo:red_goo",
	recipe = {
		{"grey_goo:purple_goo", "grey_goo:purple_goo"},
		{"grey_goo:purple_goo", "grey_goo:purple_goo"}
	}

})

minetest.register_craft({ --Bubbles
	type = "shaped",
	output = "grey_goo:white_goo",
	recipe = {
		{"grey_goo:green_goo", "grey_goo:green_goo"},
		{"grey_goo:green_goo", "grey_goo:green_goo"}
	}
})

minetest.register_craft({ --The Wall
	type = "shaped",
	output = "grey_goo:orange_goo",
	recipe = {
		{"grey_goo:green_goo","grey_goo:green_goo"},
		{"grey_goo:green_goo","grey_goo:green_goo"},
		{"grey_goo:green_goo","grey_goo:green_goo"}
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

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:red_goo 4",
	recipe = {"grey_goo:red_goo"}
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:white_goo 4",
	recipe = {"grey_goo:white_goo"}
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:orange_goo 4",
	recipe = {"grey_goo:orange_goo"}
})