data:extend( {
    {
        type = "electric-energy-interface",
        name = "sbt-hidden-energy-interface",
        icon = "__base__/graphics/icons/accumulator.png",
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
} )
