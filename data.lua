require "util"

local GRAPHICS = "__linked-6-chests__/graphics"
local ICONS = GRAPHICS .. "/icons"
local BASE_LINKED_CHEST = GRAPHICS .. "/entity/linked-chests"

local LINKED_CHEST_BASED = "iron-chest"
local function new_linked_chest(name)
	local id = "linked-chest-" .. name
	local icon = ICONS .. "/linked-chest-" .. name .. "-icon.png"

	local item = util.table.deepcopy(data.raw["item"][LINKED_CHEST_BASED])
	item.name = id
	item.icon = icon
	item.place_result = id

	local entity = util.table.deepcopy(data.raw["container"][LINKED_CHEST_BASED])
	entity.type = "linked-container"
	entity.name = id
	entity.minable.result = id
	entity.circuit_wire_connection_point = nil
	entity.circuit_connector_sprites = nil
	entity.circuit_wire_max_distance = nil
	entity.icon = icon
	entity.picture = {
		layers = {
			{
				filename = BASE_LINKED_CHEST .. "/linked-chest-" .. name .. ".png",
				priority = "extra-high",
				width = 34,
				height = 38,
				frame_count = 7,
				shift = util.by_pixel(0, -2),
				hr_version = {
					filename = BASE_LINKED_CHEST .. "/hr-linked-chest-" .. name .. ".png",
					priority = "extra-high",
					width = 66,
					height = 74,
					frame_count = 7,
					shift = util.by_pixel(0, -2),
					scale = 0.5
				}
			},
			{
				filename = BASE_LINKED_CHEST .. "/linked-chest-shadow.png",
				priority = "extra-high",
				width = 56,
				height = 24,
				repeat_count = 7,
				shift = util.by_pixel(12, 5),
				draw_as_shadow = true,
				hr_version = {
					filename = BASE_LINKED_CHEST .. "/hr-linked-chest-shadow.png",
					priority = "extra-high",
					width = 112,
					height = 46,
					repeat_count = 7,
					shift = util.by_pixel(12, 4.5),
					draw_as_shadow = true,
					scale = 0.5
				}
			}
		},
	}

	local recipe = {
		type = "recipe",
		name = id,
		result = id,
		icon = icon,
		icon_size = 64,
		enabled = true,
		ingredients = { {LINKED_CHEST_BASED, 1} },
	}

	return item, entity, recipe
end

data:extend{ new_linked_chest('a') }
data:extend{ new_linked_chest('b') }
data:extend{ new_linked_chest('c') }
data:extend{ new_linked_chest('d') }
data:extend{ new_linked_chest('e') }
data:extend{ new_linked_chest('f') }
