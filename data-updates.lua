local sounds = require("__base__/prototypes/entity/sounds")

if settings.startup["sbt-minable-tiles"].value then
    local item_tile_map = {
        ["landfill-dry-dirt"] = "dry-dirt",
        ["landfill-dirt"] = "dirt-4",
        ["landfill-grass"] = "grass-1",
        ["landfill-red-desert"] = "red-desert-1",
        ["landfill-sand"] = "sand-3",
        ["landfill"] = "landfill",
    }

    for item_name, tile_name in pairs(item_tile_map) do
        local tile = data.raw.tile[tile_name]

        if tile then
            tile.minable = {mining_time = 0.5, result = item_name}
            tile.mined_sound = sounds.deconstruct_bricks(0.8)
        end
    end
end
