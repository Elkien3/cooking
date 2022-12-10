minetest.register_craftitem("cooking:sugar", {
	description = "Sugar",
	inventory_image = "cooking_sugar.png",
})
cooking.register_craft({
	type = "press",
	recipe = "default:papyrus",
	output = "cooking:sugar"
})

if not foodspoil_register then foodspoil_register = function() end end

--breads
minetest.register_craftitem("cooking:bun_uncooked", {
	description = "Uncooked Bun",
	inventory_image = "cooking_bun_uncooked.png",
})
foodspoil_register("cooking:bun_uncooked", 7)

minetest.register_craftitem("cooking:bun", {
	description = "Bun",
	on_use = minetest.item_eat(4),
	inventory_image = "cooking_bun.png",
})
foodspoil_register("cooking:bun", 7)

minetest.register_craftitem("cooking:bread_sliced", {
	description = "Sliced Bread",
	on_use = minetest.item_eat(3),
	inventory_image = "cooking_bread_sliced.png",
})
foodspoil_register("cooking:bread_sliced", 7)

minetest.register_craftitem("cooking:toast", {
	description = "Toast",
	on_use = minetest.item_eat(4),
	inventory_image = "cooking_toast.png",
})
foodspoil_register("cooking:toast", 14)

minetest.register_craftitem("cooking:bread_blueberry_jam", {
	description = "Bread with Blueberry Jam",
	inventory_image = "cooking_bread_blueberry_jam.png",
	on_use = minetest.item_eat(5),
})
foodspoil_register("cooking:bread_blueberry_jam", 14)

minetest.register_craftitem("cooking:toast_blueberry_jam", {
	description = "Toast with Blueberry Jam",
	inventory_image = "cooking_toast_blueberry_jam.png",
	on_use = minetest.item_eat(6),
})
foodspoil_register("cooking:toast_blueberry_jam", 14)

minetest.register_craftitem("cooking:blueberry_jam", {
	description = "Blueberry Jam",
	inventory_image = "cooking_blueberry_jam.png",
})
foodspoil_register("cooking:blueberry_jam", 14)

minetest.clear_craft({output = "farming:bread"})
minetest.clear_craft({output = "farming:flour"})
cooking.register_craft({
	type = "mix",
	recipe = {"farming:wheat", "farming:wheat", "farming:wheat", "bucket:bucket_water", "cooking:sugar"},
	output = "farming:flour,bucket:bucket_empty"
})
cooking.register_craft({
	type = "oven",
	cooktime = 20,
	recipe = "farming:flour",
	output = "farming:bread"
})
cooking.register_craft({
	type = "stove",
	cooktime = 5,
	recipe = "cooking:bread_sliced",
	output = "cooking:toast"
})
cooking.register_craft({
	type = "cut",
	recipe = "farming:bread",
	output = "cooking:bread_sliced 6"
})
cooking.register_craft({
	type = "press",
	recipe = "default:blueberries",
	output = "cooking:blueberry_jam 4"
})
cooking.register_craft({
	type = "stack",
	recipe = {"cooking:bread_sliced", "cooking:blueberry_jam"},
	output = "cooking:bread_blueberry_jam",
	_cookingsimple = true
})
cooking.register_craft({
	type = "stack",
	recipe = {"cooking:toast", "cooking:blueberry_jam"},
	output = "cooking:toast_blueberry_jam",
	_cookingsimple = true
})
cooking.register_craft({
	type = "cut",
	recipe = "farming:flour",
	output = "cooking:bun_uncooked 4"
})
cooking.register_craft({
	type = "oven",
	cooktime = 10,
	recipe = "cooking:bun_uncooked",
	output = "cooking:bun"
})

--apple pie
minetest.register_craftitem("cooking:chopped_apple", {
	description = "Chopped Apple",
	inventory_image = "cooking_chopped_apple.png",
})
foodspoil_register("cooking:chopped_apple", 7)

minetest.register_craftitem("cooking:apple_pie_uncooked", {
	description = "Uncooked Apple Pie",
	inventory_image = "cooking_apple_pie_uncooked.png",
})
foodspoil_register("cooking:apple_pie_uncooked", 14)

minetest.register_craftitem("cooking:apple_pie", {
	description = "Apple Pie",
	inventory_image = "cooking_apple_pie.png",
	on_use = minetest.item_eat(10),
})
foodspoil_register("cooking:apple_pie", 14)

minetest.register_craftitem("cooking:pie_crust", {
	description = "Pie Crust",
	inventory_image = "cooking_pie_crust.png",
})
foodspoil_register("cooking:pie_crust", 14)

cooking.register_craft({
	type = "roll",
	recipe = "cooking:bun_uncooked",
	output = "cooking:pie_crust"
})
cooking.register_craft({
	type = "cut",
	recipe = "default:apple",
	output = "cooking:chopped_apple"
})
cooking.register_craft({
	type = "stack",
	recipe = {"cooking:pie_crust", "cooking:chopped_apple", "cooking:chopped_apple", "cooking:sugar", "cooking:pie_crust"},
	output = "cooking:apple_pie_uncooked"
})
cooking.register_craft({
	type = "oven",
	cooktime = 30,
	recipe = "cooking:apple_pie_uncooked",
	output = "cooking:apple_pie"
})

--mushroom soup
minetest.register_craftitem("cooking:mushroom_soup_uncooked", {
	description = "Uncooked Mushroom Soup",
	--stack_max = 1,
	inventory_image = "cooking_mushroom_soup_uncooked.png",
	param2 = 224,
	on_use = minetest.item_eat(4, "cooking:bowl"),
	_cookingsimple = true
})
foodspoil_register("cooking:mushroom_soup_uncooked", 14)

minetest.register_craftitem("cooking:mushroom_soup", {
	description = "Mushroom Soup",
	--stack_max = 1,
	inventory_image = "cooking_mushroom_soup.png",
	param2 = 222,
	on_use = minetest.item_eat(6, "cooking:bowl")
})
foodspoil_register("cooking:mushroom_soup", 14)

cooking.register_craft({
	type = "soup",
	param2 = 6,
	recipe = {"flowers:mushroom_brown", "flowers:mushroom_brown", "flowers:mushroom_brown"},
	output = "cooking:mushroom_soup_uncooked"
})
cooking.register_craft({
	type = "stove",
	cooktime = 10,
	recipe = "cooking:mushroom_soup_uncooked",
	output = "cooking:mushroom_soup",
	burned = "cooking:burnt_soup"
})

--tools
minetest.register_craft({
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	},
	output = "cooking:bowl 4"
})
minetest.register_craft({
	recipe = {
		{"group:wood", "", "group:wood"},
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	},
	output = "cooking:mixing_bowl 2"
})
minetest.register_craft({
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
	},
	output = "cooking:pot_0 2"
})
minetest.register_craft({
	recipe = {
		{"default:glass", "group:sand", "default:glass"},
		{"", "default:glass", ""}
	},
	output = "cooking:plate 4"
})
minetest.register_craft({
	recipe = {
		{"default:stick", "group:wood", "default:stick"},
	},
	output = "cooking:rolling_pin"
})
minetest.register_craft({
	recipe = {
		{"default:stick", "group:wood", "default:stick"},
	},
	output = "cooking:rolling_pin"
})
minetest.register_craft({
	recipe = {
		{"", "group:wood"},
		{"default:stick", ""},
	},
	output = "cooking:spoon"
})
minetest.register_on_mods_loaded(function()
	local slablist = {}
	for name, def in pairs(minetest.registered_nodes) do
		if string.find(name, "slab") and string.find(name, "wood") then
			table.insert(slablist, name)
		end
	end
	for i, slabname in pairs(slablist) do
		minetest.register_craft({
			recipe = {
				{slabname},
			},
			output = "cooking:cutting_board"
		})
	end
end)
minetest.register_craft({
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "stairs:slab_cobble", "default:cobble"},
		{"default:cobble", "stairs:slab_cobble", "default:cobble"}
	},
	output = "cooking:oven"
})
minetest.register_craft({
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "stairs:slab_cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"}
	},
	output = "cooking:stove"
})
minetest.register_craft({
	recipe = {
		{"", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:sword_steel", "default:steel_ingot"},
	},
	output = "cooking:hand_press 2"
})