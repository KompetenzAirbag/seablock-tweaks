script.on_init( function( e )
    if not remote.interfaces["SeaBlock"] then return end

    remote.call( "SeaBlock", "set_starting_item", "wind-turbine-2", nil )
    remote.call( "SeaBlock", "set_starting_item", "solar-panel", nil )
    remote.call( "SeaBlock", "set_starting_item", "accumulator", nil )

    storage.obj_id = 0
    storage.hidden_unit_number = 0
    storage.ticks_since_last_mined = 0
end)

---@param event Events.script_raised_built
local function on_script_built( event )
    local chest = event.entity
    if chest.name ~= "sb-rock-chest" then return end

    storage.obj_id = script.register_on_object_destroyed( chest )

    local bb = chest.bounding_box
    local size = { bb.left_top.x - bb.right_bottom.x, bb.left_top.y - bb.right_bottom.y }
    print( helpers.table_to_json(size) )

    local pos = { chest.position.x + (size[1]/2), chest.position.y + (size[2]/2) }
    print( helpers.table_to_json(pos) )

    local hidden_electric_interface = chest.surface.create_entity{
        name = "sbt-hidden-energy-interface",
        position = chest.position,
        force = chest.force
    }

    if not hidden_electric_interface then return end
    storage.hidden_unit_number = hidden_electric_interface.unit_number
end

-- TODO this could softlock a player with no way of creating power
local function on_object_destroyed()
    local entity = game.get_entity_by_unit_number( storage.hidden_unit_number )
    if not entity then return end

    entity.destroy() --TODO handle if this was unsucessful
end

script.on_event( defines.events.on_object_destroyed, on_object_destroyed )

script.on_event( defines.events.script_raised_built, on_script_built )
