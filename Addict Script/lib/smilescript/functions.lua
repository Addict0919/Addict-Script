local alarm = false

function random_float(min, max)
	return min + math.random() * (max - min)
end

function start_alarm(alarm_time)
    alarm = false
    local time = 0

    util.create_tick_handler(function()
        local time_elapsed = MISC.GET_FRAME_TIME() * 1000

        if time >= alarm_time then
            alarm = true
            return false
        else
            time += time_elapsed
        end
    end)
end

function get_alarm()
    return alarm
end

function get_hud_colour()
    local red_command_ref <const> = menu.ref_by_path("Stand>Settings>Appearance>Colours>HUD Colour>Red")
    local green_command_ref <const> = menu.ref_by_path("Stand>Settings>Appearance>Colours>HUD Colour>Green")
    local blue_command_ref <const> = menu.ref_by_path("Stand>Settings>Appearance>Colours>HUD Colour>Blue")
    local alpha_command_ref <const> = menu.ref_by_path("Stand>Settings>Appearance>Colours>HUD Colour>Opacity")
    local red <const> = menu.get_value(red_command_ref)
    local green <const> = menu.get_value(green_command_ref)
    local blue <const> = menu.get_value(blue_command_ref)
    local alpha <const> = menu.get_value(alpha_command_ref)

    return red, green, blue, alpha
end

function request_model(model)
    STREAMING.REQUEST_MODEL(model)

    while not STREAMING.HAS_MODEL_LOADED(model) do
        util.yield()
    end
end

function request_ptfx_asset(asset)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)

    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
        util.yield()
    end
end

function wait_session_transition(yield_time)
    yield_time = yield_time or 1000

    while util.is_session_transition_active() do
        util.yield(yield_time)
    end
end

function wait_player_revive(player_id, yield_time)
    yield_time = yield_time or 250

    while PLAYER.IS_PLAYER_DEAD(player_id) do
        util.yield(yield_time)
    end
end

function kick_player_out_of_veh(player_id, yield_time, max_time)
    yield_time = yield_time or 50
    max_time = max_time or 1000

    local player_ped <const> = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
    local player_root_ref <const> = menu.player_root(player_id)
    local kick_vehicle_command_ref <const> = menu.ref_by_rel_path(player_root_ref, "Trolling>Kick From Vehicle")

    menu.trigger_command(kick_vehicle_command_ref)
    start_alarm(max_time)

    while PED.IS_PED_IN_ANY_VEHICLE(player_ped) do
        local is_alarm_finished <const> = get_alarm()

        if is_alarm_finished then
            break
        end

        util.yield(yield_time)
    end
end

function get_random_pos_on_radius(pos, radius)
    local angle <const> = random_float(0, 2 * math.pi)
    pos = v3.new(pos.x + math.cos(angle) * radius, pos.y + math.sin(angle) * radius, pos.z)

    return pos
end

function get_vehicles_in_range(pos, range, exclude_personal_vehicles)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000
    exclude_personal_vehicles = exclude_personal_vehicles or false

    local all_vehicles <const> = entities.get_all_vehicles_as_pointers()
    local vehicles = {}

    for i, vehicle in pairs(all_vehicles) do
        local vehicle_pos <const> = entities.get_position(vehicle)
        local is_vehicle_in_range <const> = v3.distance(pos, vehicle_pos) <= range
        local is_vehicle_personal <const> = entities.get_vehicle_has_been_owned_by_player(vehicle)

        if is_vehicle_in_range and not (exclude_personal_vehicles and is_vehicle_personal) then
            table.insert(vehicles, vehicle)
        end
    end
    return vehicles
end

function get_peds_in_range(pos, range, exclude_players)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000
    exclude_players = exclude_players or false

    local all_peds <const> = entities.get_all_peds_as_pointers()
    local peds = {}

    for i, ped in pairs(all_peds) do
        local ped_pos <const> = entities.get_position(ped)
        local is_ped_in_range <const> = v3.distance(pos, ped_pos) <= range
        local is_ped_a_player <const> = entities.get_player_info(ped) ~= 0

        if is_ped_in_range and not (exclude_players and is_ped_a_player) then
            table.insert(peds, ped)
        end
    end
    return peds
end

function get_objects_in_range(pos, range)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000

    local all_objects <const> = entities.get_all_objects_as_pointers()
    local objects = {}

    for i, object in pairs(all_objects) do
        local object_pos <const> = entities.get_position(object)
        local is_object_in_range <const> = v3.distance(pos, object_pos) <= range

        if is_object_in_range then
            table.insert(objects, object)
        end
    end
    return objects
end


function get_pickups_in_range(pos, range)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000

    local all_pickups <const> = entities.get_all_pickups_as_pointers()
    local pickups = {}

    for i, pickup in pairs(all_pickups) do
        local pickup_pos <const> = entities.get_position(pickup)
        local is_pickup_in_range <const> = v3.distance(pos, pickup_pos) <= range

        if is_pickup_in_range then
            table.insert(pickups, pickup)
        end
    end
    return pickups
end