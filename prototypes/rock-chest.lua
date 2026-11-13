local item_sounds = require("__base__.prototypes.item_sounds")

local ext_tbl = {
    {
        type = "container",
        name = "sbt-rock-chest",
        icon = "__seablock-tweaks__/graphics/icons/rock-chest.png",
        icon_size = 32,
        flags = { "placeable-neutral", "player-creation" },
        order = "b[decorative]-l[rock]-a[medium]",
        minable = {
            mining_particle = "stone-particle",
            mining_time = 0.2,
            result = "sbt-rock-chest",
            count = 1,
        },
        max_health = 100,
        corpse = "small-remnants",
        collision_box = { { 0.0, 0.0 }, { 0.35, 0.35 } },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        inventory_size = 40,
        open_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
        close_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
        vehicle_impact_sound = { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
        picture = {
            filename = "__base__/graphics/decorative/big-rock/big-rock-18.png",
            width = 141, --taken from the old hr version
            height = 128,
            scale = 0.5,
            shift = { 0.304688, 0.0390625 },
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
    },
    {
        type = "item",
        name = "sbt-rock-chest",
        icon = "__seablock-tweaks__/graphics/icons/rock-chest.png",
        subgroup = "storage",
        order = "a[items]-b[iron-chest]",
        inventory_move_sound = item_sounds.metal_chest_inventory_move,
        pick_sound = item_sounds.metal_chest_inventory_pickup,
        drop_sound = item_sounds.metal_chest_inventory_move,
        place_result = "sbt-rock-chest",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "sbt-rock-chest",
        enabled = true,
        ingredients = {{ type = "item", name = "stone", amount = 20 }},
        results = {{ type = "item", name = "sbt-rock-chest", amount = 1 }},
    }
}

if settings.startup["sbt-rock-chest-energy"].value then
    table.insert( ext_tbl,
        {
            type = "electric-energy-interface",
            name = "sbt-hidden-energy-interface",
            icon = "__seablock-tweaks__/graphics/icons/rock-chest.png",
            collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
            selection_box = {{0, 0}, {0, 0}},
            hidden = true,
            hidden_in_factoriopedia = true,
            flags = {"placeable-neutral", "not-blueprintable", "not-deconstructable", "not-on-map", "hide-alt-info", "not-selectable-in-game", "get-by-unit-number"},
            energy_source = {
                type = "electric",
                buffer_capacity = "1800kJ",
                usage_priority = "primary-output",
                input_flow_limit = "0kW",
                output_flow_limit = "3600kW",
                render_no_power_icon = false
            },
            energy_production = "1800kW",
            energy_usage = "0kW",
        }

    )
end

data:extend( ext_tbl )
