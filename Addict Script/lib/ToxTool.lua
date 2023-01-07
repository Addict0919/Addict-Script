slaxdom = require("slaxdom")
slaxml = require("slaxml")
util.require_natives(1651208000)
require("Arrya")

storedir = filesystem.store_dir()
ToxDirStore = storedir .. "ToxFiles\\"

speedmeterneedle = ToxDirStore.."Needledefault.dds"
speedmeterradiant = ToxDirStore.."Speedometerdefault.dds"
speedmeterrpmraddiant = ToxDirStore.."RPM.dds"
speedmeterneedlecherax = ToxDirStore.."Needlecherax.dds"
speedmeterradiantcherax = ToxDirStore.."Speedometercherax.dds"
speedmeterrrpmcherax = ToxDirStore.."RPMcherax.dds"
xscreensize, yscreensize = directx.get_client_size()

wait = util.yield
toast = util.toast
joaat = util.joaat
trigger_script_event = util.trigger_script_event
trigger_command = menu.trigger_commands
cTime = util.current_time_millis
getPlayerPed = PLAYER.GET_PLAYER_PED
getEntityCoords = ENTITY.GET_ENTITY_COORDS
menuroot = menu.my_root()

function BlockSyncs(pid, callback)
	for _, i in ipairs(players.list(false, true, true)) do
		if i ~= pid then
			local outSync = menu.ref_by_rel_path(menu.player_root(i), "Outgoing Syncs>Block")
			menu.trigger_command(outSync, "on")
		end
	end
	util.yield(10)
	callback()
	for _, i in ipairs(players.list(false, true, true)) do
		if i ~= pid then
			local outSync = menu.ref_by_rel_path(menu.player_root(i), "Outgoing Syncs>Block")
			menu.trigger_command(outSync, "off")
		end
	end
end

new = {
    colour = function(R, G, B, A)
        return {r = R, g = G, b = B, a = A}
    end,
    hudSettings = function(X, Y, ALIGNMENT)
        return {xOffset = X, yOffset = Y, scale = 0.5, alignment = ALIGNMENT, textColour = new.colour(1, 1, 1, 1)}
    end,
    delay = function(MS, S, MIN)
        return {ms = MS, s = S, min = MIN}
    end,
}

vehiclelib = {
    MAX_EXTRAS = 14,
    FORMAT_VERSION = "JSTAND 1.3.1",
    LIB_VERSION = "1.1.3",
    MOD_NAMES = {
        [1] = "Spoilers",
        [2] = "Front Bumper",
        [3] = "Rear Bumper",
        [4] = "Side Skirt",
        [5] = "Exhaust",
        [6] = "Frame",
        [7] = "Grille",
        [8] = "Hood",
        [9] = "Fender",
        [10] = "Right Fender",
        [11] = "Roof",
        [12] = "Engine",
        [13] = "Brakes",
        [14] = "Transmission",
        [15] = "Horns",
        [16] = "Suspension",
        [17] = "Armor",
        [24] = "Wheels Design",
        [25] = "Motorcycle Back Wheel Design",
        [26] = "Plate Holders",
        [28] = "Trim Design",
        [29] = "Ornaments",
        [31] = "Dial Design",
        [34] = "Steering Wheel",
        [35] = "Shifter Leavers",
        [36] = "Plaques",
        [39] = "Hydraulics",
        [49] = "Livery"
    },
    -- Subtract index by 1 to get modType (ty lua)
    TOGGLEABLE_MOD_NAMES = {
        [18] = "UNK17",
        [19] = "Turbo Turning",
        [20] = "UNK19",
        [21] = "Tire Smoke",
        [22] = "UNK21",
        [23] = "Xenon Headlights"
    },
    VEHICLE_TYPES = {
        "Compacts",
        "Sedans",
        "SUVs",
        "Coupes",
        "Muscle",
        "Sports Classics",
        "Sports",
        "Super",
        "Motorcycles",
        "Off-road",
        "Industrial",
        "Utility",
        "Vans",
        "Cycles",
        "Boats",
        "Helicopters",
        "Planes",
        "Service",
        "Emergency",
        "Military",
        "Commercial",
        "Trains"
    }
}
function vehiclelib.Serialize(vehicle)
    local model = ENTITY.GET_ENTITY_MODEL(vehicle)
    local Primary = {
        Custom = VEHICLE.GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM(vehicle),
    }
    local Secondary = {
        Custom = VEHICLE.GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM(vehicle),
    }
    -- Declare pointers
    local Color = {
        r = memory.alloc(4),
        g = memory.alloc(4),
        b = memory.alloc(4),
    }

    if Primary.Custom then
        VEHICLE.GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, Color.r, Color.g, Color.b)
        Primary["Custom Color"] = {
            r = memory.read_int(Color.r),
            b = memory.read_int(Color.g),
            g = memory.read_int(Color.b)
        }
    else
        VEHICLE.GET_VEHICLE_MOD_COLOR_1(vehicle, Color.r, Color.b, Color.g)
        Primary["Paint Type"] = memory.read_int(Color.r)
        Primary["Color"] = memory.read_int(Color.g)
        Primary["Pearlescent Color"] = memory.read_int(Color.b)
    end
    if Secondary.Custom then
        VEHICLE.GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, Color.r, Color.g, Color.b)
        Secondary["Custom Color"] = {
            r = memory.read_int(Color.r),
            b = memory.read_int(Color.g),
            g = memory.read_int(Color.b)
        }
    else
        VEHICLE.GET_VEHICLE_MOD_COLOR_2(vehicle, Color.r, Color.b)
        Secondary["Paint Type"] = memory.read_int(Color.r)
        Secondary["Color"] = memory.read_int(Color.g)
    end
    VEHICLE.GET_VEHICLE_EXTRA_COLOURS(vehicle, Color.r, Color.g)
    local ColorExtras = {
        pearlescent = memory.read_int(Color.r),
        wheel = memory.read_int(Color.g),
    }

    VEHICLE.GET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, Color.r, Color.g, Color.b)
    local TireSmoke = {
        r = memory.read_int(Color.r),
        g = memory.read_int(Color.g),
        b = memory.read_int(Color.b),
    }

    VEHICLE._GET_VEHICLE_NEON_LIGHTS_COLOUR(vehicle, Color.r, Color.g, Color.b)
    local Neon = {
        Color = {
            r = memory.read_int(Color.r),
            g = memory.read_int(Color.g),
            b = memory.read_int(Color.b),
        },
        Left = VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0),
        Right = VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1),
        Front = VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2),
        Back = VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3),
    }
    VEHICLE._GET_VEHICLE_DASHBOARD_COLOR(vehicle, Color.r)
    VEHICLE._GET_VEHICLE_INTERIOR_COLOR(vehicle, Color.b)
    local DashboardColor = memory.read_int(Color.r)
    local InteriorColor = memory.read_int(Color.b)
    VEHICLE.GET_VEHICLE_COLOR(vehicle, Color.r, Color.g, Color.b)
    local Vehicle = {
        r = memory.read_int(Color.r),
        g = memory.read_int(Color.g),
        b = memory.read_int(Color.b),
    }
    VEHICLE.GET_VEHICLE_COLOURS(vehicle, Color.r, Color.g)
    Vehicle["Primary"] = memory.read_int(Color.r)
    Vehicle["Secondary"] = memory.read_int(Color.g)
    memory.free(Color.r)
    memory.free(Color.g)
    memory.free(Color.b)
    local Extras = {}
    for x = 1, vehiclelib.MAX_EXTRAS do
        if VEHICLE.DOES_EXTRA_EXIST(vehicle, x) then
            Extras[tostring(x)] = VEHICLE.IS_VEHICLE_EXTRA_TURNED_ON(vehicle, x)
        end
    end
    local mods = { Toggles = {} }
    for i, modName in pairs(vehiclelib.MOD_NAMES) do
        mods[modName] = VEHICLE.GET_VEHICLE_MOD(vehicle, i - 1)
    end
    for i, mod in pairs(vehiclelib.TOGGLEABLE_MOD_NAMES) do
        mods.Toggles[mod] = VEHICLE.IS_TOGGLE_MOD_ON(vehicle, i - 1)
    end
    local saveData = {
        Format = vehiclelib.FORMAT_VERSION,
        Model = model,
        Name = VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(model),
        Manufacturer = VEHICLE._GET_MAKE_NAME_FROM_VEHICLE_MODEL(model),
        Type = vehiclelib.VEHICLE_TYPES[VEHICLE.GET_VEHICLE_CLASS(vehicle)],
        ["Tire Smoke"] = TireSmoke,
        Livery = {
            Style = VEHICLE.GET_VEHICLE_LIVERY(vehicle),
            Count = VEHICLE.GET_VEHICLE_LIVERY_COUNT(vehicle)
        },
        ["License Plate"] = {
            Text = VEHICLE.GET_VEHICLE_NUMBER_PLATE_TEXT(vehicle),
            Type = VEHICLE.GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle)
        },
        ["Window Tint"] = VEHICLE.GET_VEHICLE_WINDOW_TINT(vehicle),
        Colors = {
            Primary = Primary,
            Secondary = Secondary,
            ["Color Combo"] = VEHICLE.GET_VEHICLE_COLOUR_COMBINATION(vehicle),
            ["Paint Fade"] = VEHICLE.GET_VEHICLE_ENVEFF_SCALE(vehicle),
            Vehicle = Vehicle,
            Extras = ColorExtras
        },
        Lights = {
            ["Xenon Color"] = VEHICLE._GET_VEHICLE_XENON_LIGHTS_COLOR(vehicle),
            Neon = Neon
        },
        ["Engine Running"] = VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle),
        ["Dashboard Color"] = DashboardColor,
        ["Interior Color"] = InteriorColor,
        ["Dirt Level"] = VEHICLE.GET_VEHICLE_DIRT_LEVEL(vehicle),
        ["Bulletproof Tires"] = VEHICLE.GET_VEHICLE_TYRES_CAN_BURST(vehicle),
        Mods = mods,
        Extras = Extras
    }

    return saveData
end
function vehiclelib.ApplyToVehicle(vehicle, saveData)
    -- Vehicle Paint Colors. Not sure if all these are needed but well I store them
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    VEHICLE.SET_VEHICLE_COLOUR_COMBINATION(vehicle, saveData.Colors["Color Combo"] or -1)
    if saveData.Colors.Extra then
        VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, saveData.Colors.Extras.pearlescent, saveData.Colors.Extras.wheel)
    end
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, saveData.Colors.Vehicle.r, saveData.Colors.Vehicle.g, saveData.Colors.Vehicle.b)
    VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, saveData.Colors.Vehicle.r, saveData.Colors.Vehicle.g, saveData.Colors.Vehicle.b)
    VEHICLE.SET_VEHICLE_COLOURS(vehicle, saveData.Colors.Vehicle.Primary or 0, saveData.Colors.Vehicle.Secondary or 0)
    if saveData.Colors.Primary.Custom and saveData.Colors.Primary["Custom Color"] then
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, saveData.Colors.Primary["Custom Color"].r, saveData.Colors.Primary["Custom Color"].b, saveData.Colors.Primary["Custom Color"].g)
    else
        VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, saveData.Colors.Primary["Paint Type"], saveData.Colors.Primary.Color, saveData.Colors.Primary["Pearlescent Color"])
    end
    if saveData.Colors.Secondary.Custom and saveData.Colors.Secondary["Custom Color"] then
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, saveData.Colors.Secondary["Custom Color"].r,  saveData.Colors.Secondary["Custom Color"].b, saveData.Colors.Secondary["Custom Color"].g)
    else
        VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, saveData.Colors.Secondary["Paint Type"], saveData.Colors.Secondary.Color)
    end
    VEHICLE.SET_VEHICLE_ENVEFF_SCALE(vehicle, saveData["Colors"]["Paint Fade"] or 0)
    -- Misc Colors / Looks
    if saveData["Tire Smoke"] then
        VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, saveData["Tire Smoke"].r or 255, saveData["Tire Smoke"].g or 255, saveData["Tire Smoke"].b or 255)
    end
    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, saveData["Bulletproof Tires"] or false)
    VEHICLE._SET_VEHICLE_DASHBOARD_COLOR(vehicle, saveData["Dashboard Color"] or -1)
    VEHICLE._SET_VEHICLE_INTERIOR_COLOR(vehicle, saveData["Interior Color"] or -1)
    VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, saveData["Dirt Level"] or 0.0)

    -- Lights
    VEHICLE._SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, saveData["Lights"]["Xenon Color"] or 255)
    VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(vehicle, saveData.Lights.Neon.Color.r or 255, saveData.Lights.Neon.Color.g or 255, saveData.Lights.Neon.Color.b or 255)
    VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, saveData.Lights.Neon.Left or false)
    VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, saveData.Lights.Neon.Right or false)
    VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, saveData.Lights.Neon.Front or false)
    VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, saveData.Lights.Neon.Back or false)

    if saveData["Engine Running"] then
        VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, false)
    end
    for i, modName in pairs(vehiclelib.MOD_NAMES) do
        if saveData.Mods[modName] then
            VEHICLE.SET_VEHICLE_MOD(vehicle, i - 1, saveData.Mods[modName])
        end
    end
    if saveData.Mods.Toggles then
        for i, mod in pairs(vehiclelib.TOGGLEABLE_MOD_NAMES) do
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, i - 1, saveData.Mods.Toggles[mod])
        end
    end
    if saveData.Extras then
        for x = 1, vehiclelib.MAX_EXTRAS do
            if saveData.Extras[tostring(x)] or saveData.Extras[x] then -- If true, set to 0 (its flipped for some reason)
                VEHICLE.SET_VEHICLE_EXTRA(vehicle, x, false)
            end
        end
    end

    -- Misc
    VEHICLE.SET_VEHICLE_LIVERY(vehicle, saveData.Livery.style or -1)
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, saveData["Window Tint"] or 0)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, saveData["License Plate"].Text or saveData["License Plate"] or "")
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, saveData["License Plate"].Type or 0)

end

function vehiclelib.ConvertXML(xmlStr)
    if not json then
        _G['json'] = require('json')
    end

    local loading = true
    local result = {
        data = nil,
        error = nil
    }
    async_http.init("jackz.me", "/stand/convert-api", function(body)
        local status, json = pcall(json.decode, body)
        if status then
            result.data = json.data
            result.error = json.error
        else
            result.error = "Invalid Server Response"
        end
        loading = false
    end, function() end)
    async_http.set_post("text/plain", xmlStr)
    async_http.add_header("vehiclelib-version",vehiclelib.LIB_VERSION)
    async_http.add_header("vehiclelib-format",vehiclelib.FORMAT_VERSION)
    async_http.dispatch()
    while loading do
        util.yield()
    end
    return result
end

        function SET_INT_GLOBAL(Global, Value)
            memory.write_int(memory.script_global(Global), Value)
        end
        function SET_FLOAT_GLOBAL(Global, Value)
            memory.write_float(memory.script_global(Global), Value)
        end

        function GET_INT_GLOBAL(Global)
            return memory.read_int(memory.script_global(Global))
        end


function trans(txt)
    if txt == nil or #txt < 1 then return '' end

    local label = lang.find(txt, 'en')
    if label == 0 then
        label = lang.register(txt)
    end
    return label
end

function str_trans(string)
    return lang.get_string(trans(string), lang.get_current())
end

function getDelayDisplayValue(delayTable)
    if delayTable.min > 0 then
        return delayTable.min .. str_trans('min')
    elseif delayTable.s > 0 then
        return delayTable.s + delayTable.ms / 1000 .. str_trans('s')
    else
        return delayTable.ms .. str_trans('ms')
    end
end

function setDelayDisplay(root, name, delayTable)
    menu.set_menu_name(root, name..': '..getDelayDisplayValue(delayTable))
end

function generateDelaySettings(root, name, delayTable)
    menu.slider(root, 'Ms', {'JS'..name..'DelayMs'}, 'The delay is the added total of ms, sec and min values.', 1, 999, delayTable.ms, 1, function(value)
        delayTable.ms = value
        setDelayDisplay(root, name, delayTable)
    end)
    menu.slider(root, 'Seconds', {'JS'..name..'DelaySec'}, 'The delay is the added total of ms, sec and min values.', 0, 59, delayTable.s, 1, function(value)
        delayTable.s = value
        setDelayDisplay(root, name, delayTable)
    end)
    menu.slider(root, 'Minutes', {'JS'..name..'DelayMin'}, 'The delay is the added total of ms, sec and min values.', 0, 60, delayTable.min, 1, function(value)
        delayTable.min = value
        setDelayDisplay(root, name, delayTable)
    end)
end

yeetMultiplier = 5
yeetRange = 100
stormDelay = new.delay(250, 0, 0)
function yeetEntities(pid)
    local targetPos = players.get_position(pid)
    local pointerTables = {
        entities.get_all_peds_as_pointers(),
        entities.get_all_vehicles_as_pointers(),
        entities.get_all_objects_as_pointers()
    }
    local range = yeetRange * yeetRange --squaring it, for VDIST2
    for _, pointerTable in pairs(pointerTables) do
        for _, entityPointer in pairs(pointerTable) do
            local entityPos = entities.get_position(entityPointer)
            local distance = v3.distance(targetPos, entityPos)
            if distance < range then
                local entityHandle = entities.pointer_to_handle(entityPointer)
                --check the entity is a ped in a car
                if (ENTITY.IS_ENTITY_A_PED(entityHandle) and (not PED.IS_PED_IN_ANY_VEHICLE(entityHandle, true) and (not PED.IS_PED_A_PLAYER(entityHandle)))) or (not ENTITY.IS_ENTITY_A_PED(entityHandle))--[[for the vehicles]] then
                    local playerList = players.list(true, true, true)
                    if not ENTITY.IS_ENTITY_A_PED(entityHandle) then
                        for _, pid in pairs(playerList) do
                            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                            if PED.GET_VEHICLE_PED_IS_IN(ped, false) == entityHandle then goto continue end --if the entity is a players car ignore it
                        end
                    end
                    local localTargetPos = players.get_position(pid)
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entityHandle)
                    v3.sub(localTargetPos, entityPos) --subtract here, for launch.
                    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(entityHandle, 1, v3.getX(localTargetPos) * yeetMultiplier, v3.getY(localTargetPos) * yeetMultiplier, v3.getZ(localTargetPos) * yeetMultiplier, true, false, true, true)
                    ::continue::
                end
            end
        end
    end
end

function getTotalDelay(delayTable)
    return (delayTable.ms + (delayTable.s * 1000) + (delayTable.min * 1000 * 60))
end

function newTimer()
	local self = {start = util.current_time_millis()}
	local function reset()
		self.start = util.current_time_millis()
	end
	local function elapsed()
		return util.current_time_millis() - self.start
	end
	return
	{
		reset = reset,
		elapsed = elapsed
	}
end

function get_vehicle_player_is_in(pid)
	local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local vehicle = PED.GET_VEHICLE_PED_IS_IN(p, false)
	return vehicle
end

function request_control_once(entity)
	if not NETWORK.NETWORK_IS_IN_SESSION() then
		return true
	end
	local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
end

function request_control(entity, timeOut)
	if not ENTITY.DOES_ENTITY_EXIST(entity) then
		return false
	end
	timeOut = timeOut or 500
	local start = newTimer()
	while not request_control_once(entity) and start.elapsed() < timeOut do
		util.yield()
	end
	return start.elapsed() < timeOut
end

function round(num, places)
	return tonumber(string.format('%.' .. (places or 0) .. 'f', num))
end

function interpolate(y0, y1, perc)
	return (1 - perc) * y0 + perc * y1
end

function getBlendedColour(perc)
	local color = {a = 1.0}
	if perc <= 0.5 then
		color.r = 1.0
		color.g = interpolate(0.0, 1.0, (perc / 0.5))
		color.b = 0.0
	else
		color.r = interpolate(1.0, 0, ((perc - 0.5) / 0.5))
		color.g = 1.0
		color.b = 0.0
	end
	return Colour.toInt(color)
end

function getGroundZ(pos)
	local ptr = memory.alloc()
	MISC.GET_GROUND_Z_FOR_3D_COORD(pos.x, pos.y, pos.z, ptr, false)
	local groundz = memory.read_float(ptr); memory.free(ptr)
	return groundz
end

function toDirection(rotation) 
	local adjusted_rotation = { 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = {
		x = - math.sin(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)), 
		y =   math.cos(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)), 
		z =   math.sin(adjusted_rotation.x)
	}
	return direction
end

set_cannon_cam_zoom = function ()
    if not PAD._IS_USING_KEYBOARD(2) then
        return
    end
    if PAD.IS_CONTROL_JUST_PRESSED(2, 241) then
        if zoom < 1.0 then
            zoom = zoom + 0.25
        end
    end
    if PAD.IS_CONTROL_JUST_PRESSED(2, 242) then
        if zoom > 0.0 then
            zoom = zoom - 0.25
        end
    end

    local fovLimit = minFov + (maxFov - minFov) * (1 - zoom)
    fov = increment(fov, 1.0, fovLimit)		
    if zoom ~= lastZoom then
        gSound.zoomOut:play()
    
        GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_ZOOM_LEVEL")
        GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(zoom)
        GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
        lastZoom = zoom
    end

    if fov ~= fovLimit then
        CAM.SET_CAM_FOV(cam, fov)
    else
        gSound.zoomOut:stop()
    end
end

write_global = {
	byte = function(global, value)
		memory.write_byte(memory.script_global(global), value)
	end,
	int = function(global, value)
		memory.write_int(memory.script_global(global), value)
	end,
	float = function(global)
		return memory.write_float(memory.script_global(global), value)
	end
}

disablePhone = function ()
    write_global.int(19937, 1)
end

Sound = {Id = nil, name = "", reference = ""}
Sound.__index = Sound

function Sound.new(name, reference)
	local inst = setmetatable({}, Sound)
	inst.Id = -1
	inst.name = name
	inst.reference = reference
	return inst
end

function Sound:play()
	if self.Id == -1 then
        self.Id = AUDIO.GET_SOUND_ID()
        AUDIO.PLAY_SOUND_FRONTEND(self.Id, self.name, self.reference, true)
    end
end

function Sound:stop()
	if self.Id ~= -1 then
        AUDIO.STOP_SOUND(self.Id)
        AUDIO.RELEASE_SOUND_ID(self.Id)
        self.Id = -1
    end
end

function getHudColour(hudColour)
	local colourR = memory.alloc(8)
	local colourG = memory.alloc(8)
	local colourB = memory.alloc(8)
	local colourA = memory.alloc(8)
	HUD.GET_HUD_COLOUR(hudColour, colourR, colourG, colourB, colourA);
	local colour = Colour.new(
		memory.read_int(colourR),
		memory.read_int(colourG),
		memory.read_int(colourB),
		memory.read_int(colourA)
	)
	memory.free(colourR); memory.free(colourG)
	memory.free(colourB); memory.free(colourA)
	return colour
end

function drawLockonSprite(entity, hudColour)
	if GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED("helicopterhud") then
		GRAPHICS.SET_SCRIPT_GFX_DRAW_ORDER(1)
		local entCoord = ENTITY.GET_ENTITY_COORDS(entity)
		GRAPHICS.SET_DRAW_ORIGIN(entCoord.x, entCoord.y, entCoord.z, 0);
		local camCoord = CAM.GET_FINAL_RENDERED_CAM_COORD()
		local distance = vect.dist(entCoord, camCoord)
		local width =  (0.5 / distance)
		if width < 0.015 then
			width = 0.015
		end
		local height = width * GRAPHICS._GET_ASPECT_RATIO(false)
		local colour = getHudColour(hudColour)
		GRAPHICS.DRAW_SPRITE("helicopterhud", "hud_outline", 0.0, 0.0, width, height, 0.0, colour.r, colour.g, colour.b, colour.a, false);	
		GRAPHICS.CLEAR_DRAW_ORIGIN();
	else
		GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT("helicopterhud", 0)
	end
end

function increment(current, delta, limit)
	if current == limit then return current end
	if limit then
		if limit < current and delta > 0 then
			delta = - delta
		end
		current = current + delta
		if math.abs(limit - current) < delta then
			current = limit
		end
	else current = current + delta end
	return current
end


instructional = {} -- namespace
function instructional:begin ()
	if not self.scaleform then
		self.scaleform = GRAPHICS.REQUEST_SCALEFORM_MOVIE("instructional_buttons")
	end	
	if not GRAPHICS.HAS_SCALEFORM_MOVIE_LOADED(self.scaleform) then
        return false
    end
	
	GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(self.scaleform, "CLEAR_ALL")
	GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(self.scaleform, "TOGGLE_MOUSE_BUTTONS")
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(true)
	GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
	self.position = 0
	return true
end

-- name can be a label or any other string
function instructional:add_data_slot (index, name, button)
	GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(self.scaleform, "SET_DATA_SLOT")
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(self.position)

    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME_STRING(button)
    if HUD.DOES_TEXT_LABEL_EXIST(name) then
		GRAPHICS.BEGIN_TEXT_COMMAND_SCALEFORM_STRING(name)
		GRAPHICS.END_TEXT_COMMAND_SCALEFORM_STRING()
	else
		GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_TEXTURE_NAME_STRING(name)
	end
    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(false)
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(index)
    GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

	self.position = self.position + 1
end

function instructional.add_control (index, name)
	local button = PAD.GET_CONTROL_INSTRUCTIONAL_BUTTON(2, index, true)
    instructional:add_data_slot(index, name, button)
end

function instructional.add_control_group (index, name)
	local button = PAD.GET_CONTROL_GROUP_INSTRUCTIONAL_BUTTON(2, index, true)
    instructional:add_data_slot(index, name, button)
end

function instructional:set_background_colour (r, g, b, a)
	GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(self.scaleform, "SET_BACKGROUND_COLOUR")
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(r)
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(g)
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(b)
	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(a)
	GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
end

function instructional:draw ()
	GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(self.scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
	GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
	
    GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(self.scaleform, 255, 255, 255, 255, 0)
	self.position = 0
end

function getOffsetFromCam(dist)
	local rot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
	local pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
	local dir = toDirection(rot)
	local offset = {
		x = pos.x + dir.x * dist,
		y = pos.y + dir.y * dist,
		z = pos.z + dir.z * dist 
	}
	return offset
end

ATTACH_CAM_TO_ENTITY_WITH_FIXED_DIRECTION = function (--[[Cam (int)]] cam, --[[Entity (int)]] entity, --[[float]] xRot, --[[float]] yRot, --[[float]] zRot, --[[float]] xOffset, --[[float]] yOffset, --[[float]] zOffset, --[[BOOL (bool)]] isRelative)
    native_invoker.begin_call()
    native_invoker.push_arg_int(cam)
    native_invoker.push_arg_int(entity)
    native_invoker.push_arg_float(xRot); native_invoker.push_arg_float(yRot); native_invoker.push_arg_float(zRot)
    native_invoker.push_arg_float(xOffset); native_invoker.push_arg_float(yOffset); native_invoker.push_arg_float(zOffset)
    native_invoker.push_arg_bool(isRelative)
    native_invoker.end_call("202A5ED9CE01D6E7")
end
-------------

Colour = {}
Colour.new = function(R, G, B, A)
    return {r = R or 0, g = G or 0, b = B or 0, a = A or 0}
end

Colour.mult = function(colour, n)
	local new = {a = colour.a}
	new.r = colour.r * n		
	new.g = colour.g * n
	new.b = colour.b * n
    return new
end

-- needs to be called on tick
-- colour in a  0-255 basis
Colour.rainbow = function(colour)
	if colour.r > 0 and colour.b == 0 then
		colour.r = colour.r - 1
		colour.g = colour.g + 1
	end

	if colour.g > 0 and colour.r == 0 then
		colour.g = colour.g - 1
		colour.b = colour.b + 1
	end
	
	if colour.b > 0 and colour.g == 0 then
		colour.r = colour.r + 1
		colour.b = colour.b - 1
	end
	return colour
end

Colour.normalize = function(colour)
	local new = colour
    return Colour.mult(new, 1/255)
end

Colour.toInt = function(colour)
	local new = {}
	new.r = math.floor(colour.r * 255)
	new.g = math.floor(colour.g * 255)
	new.b = math.floor(colour.b * 255)
	new.a = math.floor(colour.a * 255)
    return new
end

Colour.random = function()
    local new = {}
    new.r = math.random(0,255)
    new.g = math.random(0,255)
    new.b = math.random(0,255)
    new.a = 255
    return new
end

function to_rgb(r, g, b, a)
    local color = {}
    color.r = r
    color.g = g
    color.b = b
    color.a = a
    return color
end

black = to_rgb(0.0,0.0,0.0,1.0)
white = to_rgb(1.0,1.0,1.0,1.0)
red = to_rgb(1,0,0,1)
green = to_rgb(0,1,0,1)
blue = to_rgb(0.0,0.0,1.0,1.0)

vehicles_dir = filesystem.scripts_dir() .. '\\menyoo vehicles\\'
if not filesystem.is_dir(vehicles_dir) then
    filesystem.mkdir(vehicles_dir)
end

maps_dir = filesystem.scripts_dir() .. '\\menyoo maps\\'
if not filesystem.is_dir(maps_dir) then
    filesystem.mkdir(maps_dir)
end

function getmenuvalue(path)
	return menu.get_value(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">"..path))
end


local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local function split_str(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function nil_handler(val, default)
    if val == nil then
        val = default
    end
    return val
end

function request_anim_dict(dict)
    request_time = os.time()
    if not STREAMING.DOES_ANIM_DICT_EXIST(dict) then
        return
    end
    STREAMING.REQUEST_ANIM_DICT(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        if os.time() - request_time >= 10 then
            break
        end
        wait()
    end
end

local function to_boolean(text)
    if text == 'true' or text == "1" then
        return true
    end
    return false
end

local function parse_xml(path)
    -- does this path even exist?
    if not file_exists(path) then
        util.toast("yeah mate that file doesn\'t exist, pretty cringe")
        return
    end
    -- break file into string
    local xml = io.open(path):read('*all')
    -- dom that shit ;)
    local dom = slaxdom:dom(xml, {stripWhitespace=true})
    -- return our dominant superior ;)
    return dom
end

local function get_element_text(el)
    local pieces = {}
    for _,n in ipairs(el.kids) do
      if n.type=='element' then pieces[#pieces+1] = get_element_text(n)
      elseif n.type=='text' then pieces[#pieces+1] = n.value
      end
    end
    return table.concat(pieces)
end

function request_model_load(hash)
    request_time = os.time()
    if not STREAMING.IS_MODEL_VALID(hash) then
        return
    end
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        if os.time() - request_time >= 10 then
            break
        end
        wait()
    end
end

function menyoo_preprocess_ped(ped, att_data, entity_initial_handles)
    local ped_data = {}
    isped = true
    entity = ped
    menyoo_preprocess_entity(ped, att_data)
    if #entity_initial_handles > 0 then
        entity_initial_handles[att_data['InitialHandle']] = ped
    end
    for a,b in pairs(att_data['PedProperties'].kids) do
        local name = b.name
        local val = get_element_text(b)
        if name == 'PedProps' or name == 'PedComps' or name == 'TaskSequence' then
            ped_data[name] = b 
        else
            ped_data[name] = val
        end
    end
    local task_data = {}
    if att_data['TaskSequence'] ~= nil then
        for a,b in pairs(att_data['TaskSequence'].kids) do
            for c,d in pairs(b.kids) do
                task_data[d.name] = get_element_text(d)
            end
        end
    end
    local props = menyoo_build_properties_table(ped_data['PedProps'].kids)
    for k,v in pairs(props) do
        k = k:gsub('_', '')
        v = split_str(v, ',')
        PED.SET_PED_PROP_INDEX(ped, k, tonumber(v[1]), tonumber(v[2]), true)
    end
    local comps = menyoo_build_properties_table(ped_data['PedComps'].kids)
    for k,v in pairs(comps) do
        k = k:gsub('_', '')
        v = split_str(v, ',')
        PED.SET_PED_COMPONENT_VARIATION(ped, k, tonumber(v[1]), tonumber(v[2]), tonumber(v[2]))
    end
    PED.SET_PED_CAN_RAGDOLL(ped, to_boolean(ped_data['CanRagdoll']))
    PED.SET_PED_ARMOUR(ped, ped_data['Armour'])
    WEAPON.GIVE_WEAPON_TO_PED(ped, ped_data['CurrentWeapon'], 999, false, true)
    if task_data['AnimDict'] ~= nil then
        request_anim_dict(task_data['AnimDict'])
        local duration = tonumber(task_data['Duration'])
        local flag = tonumber(task_data['Flag'])
        local speed = tonumber(task_data['Speed'])
        TASK.TASK_PLAY_ANIM(ped, task_data['AnimDict'], task_data['AnimName'], 8.0, 8.0, duration, flag, speed, false, false, false)
    elseif ped_data['AnimDict'] ~= nil then
        request_anim_dict(ped_data['AnimDict'])
        TASK.TASK_PLAY_ANIM(ped, ped_data['AnimDict'], ped_data['AnimName'], 8.0, 8.0, -1, 1, 1.0, false, false, false)
    end
end

function menyoo_preprocess_entity(entity, data)
    data['Dynamic'] = nil_handler(data['Dynamic'], true)
    data['FrozenPos'] = nil_handler(data['FrozenPos'], true)
    data['OpacityLevel'] = nil_handler(data['OpacityLevel'], 255)
    data['IsInvincible'] = nil_handler(data['IsInvincible'], false)
    data['IsVisible'] = nil_handler(data['IsVisible'], true)
    data['HasGravity'] = nil_handler(data['HasGravity'], false)
    data['IsBulletProof'] = nil_handler(data['IsBulletProof'], false)
    data['IsFireProof'] = nil_handler(data['IsFireProof'], false)
    data['IsExplosionProof'] = nil_handler(data['IsExplosionProof'], false)
    data['IsMeleeProof'] = nil_handler(data['IsMeleeProof'], false)
    ENTITY.FREEZE_ENTITY_POSITION(entity, to_boolean(data['FrozenPos']))
    ENTITY.SET_ENTITY_ALPHA(entity, tonumber(data['OpacityLevel']), false)
    ENTITY.SET_ENTITY_INVINCIBLE(entity, to_boolean(data['IsInvincible']))
    ENTITY.SET_ENTITY_VISIBLE(entity, to_boolean(data['IsVisible']), 0)
    ENTITY.SET_ENTITY_HAS_GRAVITY(entity, to_boolean(data['HasGravity']))
    ENTITY.SET_ENTITY_PROOFS(entity, to_boolean(data['IsBulletProof']), to_boolean(data['IsFireProof']), to_boolean(data['IsExplosionProof']), false, to_boolean(data['IsMeleeProof']), false, true, false)
end

function menyoo_preprocess_car(vehicle, data)
    print("Preprocessing vehicle " .. vehicle)
    local colors = menyoo_build_properties_table(data['Colours'].kids)
    local neons = menyoo_build_properties_table(data['Neons'].kids)
    local doorsopen = menyoo_build_properties_table(data['DoorsOpen'].kids)
    local doorsbroken = menyoo_build_properties_table(data['DoorsBroken'].kids)
    if data['TyresBursted'] ~= nil then
        local tyresbursted = menyoo_build_properties_table(data['TyresBursted'].kids)
        for k,v in pairs(tyresbursted) do
            k = k:gsub('_', '')
            local cure_menyoo_aids = {['FrontLeft'] = 0, ['FrontRight'] = 1, [2] = 2, [3] = 3, ['BackLeft'] = 4, ['BackRight'] = 5, [6]=6, [7]=7, [8]=8}
            VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, cure_menyoo_aids[k], false, 0.0)
        end
    end
    local mods = menyoo_build_properties_table(data['Mods'].kids)
    
    for k,v in pairs(neons) do
        local comp = {['Left']=0, ['Right']=1, ['Front']=2, ['Back']=3}
        VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, comp[k], to_boolean(v))
    end

    VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, tonumber(data['WheelType']))
    for k,v in pairs(mods) do
        k = k:gsub('_', '')
        v = split_str(v, ',')
        VEHICLE.SET_VEHICLE_MOD(vehicle, tonumber(k), tonumber(v[1]), to_boolean(v[2]))
    end

    for k,v in pairs(colors) do
        colors[k] = tonumber(v)
    end

    VEHICLE.SET_VEHICLE_COLOURS(vehicle, colors['Primary'], colors['Secondary'])
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, colors['Pearl'], colors['Rim'])
    VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, colors['tyreSmoke_R'], colors['tyreSmoke_G'], colors['tyreSmoke_B'])
    VEHICLE._SET_VEHICLE_INTERIOR_COLOR(vehicle, colors['LrInterior'])
    VEHICLE._SET_VEHICLE_DASHBOARD_COLOR(vehicle, colors['LrDashboard'])
    local livery = tonumber(data['Livery'])
    if livery == -1 then
        livery = 0
    end
    VEHICLE.SET_VEHICLE_LIVERY(vehicle, livery)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, data['NumberPlateText'])
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, tonumber(data['NumberPlateTextIndex']))
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, tonumber(data['WindowTint']))
    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, to_boolean(data['BulletProofTyres']))
    VEHICLE. SET_VEHICLE_DIRT_LEVEL(vehicle, tonumber(data['DirtLevel']))
    VEHICLE.SET_VEHICLE_ENVEFF_SCALE(vehicle, tonumber(data['PaintFade']))
    VEHICLE.SET_CONVERTIBLE_ROOF_LATCH_STATE(vehicle, tonumber(data['RoofState']))
    VEHICLE.SET_VEHICLE_SIREN(vehicle, to_boolean(data['SirenActive']))
    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, to_boolean(data['EngineOn']), true, false)
    AUDIO.SET_VEHICLE_RADIO_LOUD(vehicle, to_boolean(data['IsRadioLoud']))
    VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, tonumber(data['LockStatus']))
    if data['EngineHealth'] ~= nil then
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, tonumber(data['EngineHealth']))
    end
    print("Preprocessing complete for vehicle " .. vehicle)
end

function menyoo_build_properties_table(kids)
    print("Building a menyoo properties table...")
    if kids ~= nil then
        local table = {}
        for k,v in pairs(kids) do
            local name = v.name
            local val = get_element_text(v)
            table[name] = val
        end
        return table
    end
    return nil
end

function menyoo_load_map(path)
    local all_entities = {}
    util.toast("Your map is loading. This can take some time.")
    print("Loading a map from " .. path)
    local entity_initial_handles = {}
    local xml_tbl = parse_xml(path).root
    local data = {}
    for a,b in pairs(xml_tbl.kids) do
        local vproperties = {}
        local pproperties = {}
        local name = b.name
        local isvehicle = false
        local isped = false
        if name == 'ReferenceCoords' then
            for k,v in pairs(b.kids) do
                if v.name == 'X' then
                    mmblip_x = tonumber(get_element_text(v))
                elseif v.name == 'Y' then
                    mmblip_y = tonumber(get_element_text(v))
                elseif v.name == 'Z' then
                    mmblip_z = tonumber(get_element_text(v))
                end
            end
            mmblip = HUD.ADD_BLIP_FOR_COORD(mmblip_x, mmblip_y, mmblip_z)
            HUD.SET_BLIP_SPRITE(mmblip, 77)
            HUD.SET_BLIP_COLOUR(mmblip, 48)
        end
        if name == 'Placement' then
            for c,d in pairs(b.kids) do
                print(d.name)
                if d.name == 'PositionRotation' then
                    for e, f in pairs(d.kids) do
                        data[f.name] = get_element_text(f)
                    end
                elseif d.name == 'VehicleProperties' then
                    print("vprope")
                    isvehicle = true
                    for n, p in pairs(d.kids) do
                        local prop_name = p.name
                        if prop_name == 'Colours' or prop_name == 'Neons' or prop_name == 'Mods' or prop_name == 'DoorsOpen' or prop_name == 'DoorsBroken' or prop_name == 'TyresBursted' then
                            vproperties[prop_name] = p
                        else
                            vproperties[prop_name]  = get_element_text(p)
                        end
                    end
                elseif d.name == 'PedProperties' then
                    isped = true
                    pproperties[d.name] = d
                else
                    data[d.name] = get_element_text(d)
                end
                print("done")
            end
            mmpos = {}
            mmpos.x = tonumber(data['X'])
            mmpos.y = tonumber(data['Y'])
            mmpos.z = tonumber(data['Z'])
            mmrot = {}
            mmrot.pi = tonumber(data['Pitch'])
            mmrot.ro = tonumber(data['Roll'])
            mmrot.ya = tonumber(data['Yaw'])
            if STREAMING.IS_MODEL_VALID(data['ModelHash']) then
                local mment = 0
                if isvehicle then
                    request_model_load(data['ModelHash'])
                    mment = entities.create_vehicle(data['ModelHash'], mmpos, mmrot.ya)
                    menyoo_preprocess_entity(mment, data)
                    menyoo_preprocess_car(mment, vproperties)
                elseif isped then
                    request_model_load(data['ModelHash'])
                    mment = entities.create_ped(0, data['ModelHash'], mmpos, mmrot.ya)
                    menyoo_preprocess_ped(mment, pproperties, {})
                    menyoo_preprocess_entity(mment, data)
                else
                    request_model_load(data['ModelHash'])
                    mment = entities.create_object(data['ModelHash'], mmpos)
                    menyoo_preprocess_entity(mment, data)
                end
                table.insert(all_entities, mment)
                ENTITY.SET_ENTITY_ROTATION(mment, mmrot.pi, mmrot.ro, mmrot.ya, 2, true)
            else
                util.toast("Some invalid models were found. Make sure you aren\'t using XML\'s that require mods.")
            end
        end
    end
    mm_maproot = menu.list(menyoomloaded_root, path:gsub(maps_dir, "") .. ' [' .. mmblip .. ']', {"menyooloadedmaps" .. mmblip}, "Maps you have loaded")
    menu.action(mm_maproot, "Teleport to map", {"menyoomteleportto" .. mmblip}, "Teleport to this map.", function()
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), mmpos.x, mmpos.y, mmpos.z, false, false, false)
    end)

    menu.action(mm_maproot, "Delete map", {"menyoomdelete" .. mmblip}, "cease it to exist.", function()
        for k,v in pairs(all_entities) do
            entities.delete_by_handle(v)
        end
        menu.delete(mm_maproot)
        HUD.SET_BLIP_ALPHA(mmblip, 0)
    end)
    util.toast("Map load complete. Look for a magenta-colored L on your map.")
end

function menyoo_load_vehicle(path, ped, doteleport, ours)
    print("Loading vehicle for ped " .. ped)
    local all_entities = {}
    if ours then
        print("This is ours")
        mvped = PLAYER.PLAYER_PED_ID()
    else
        print("This is theirs")
        mvped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(ped)
    end
    print("Loading a vehicle from " .. path)
    local entity_initial_handles = {}
    local data = {}
    local vproperties = {}
    local xml_tbl = parse_xml(path).root
    for k,v in pairs(xml_tbl.kids) do
        local name = v.name
        if name == 'VehicleProperties' then
            for n, p in pairs(v.kids) do
                local prop_name = p.name
                if prop_name == 'Colours' or prop_name == 'Neons' or prop_name == 'Mods' or prop_name == 'DoorsOpen' or prop_name == 'DoorsBroken' or prop_name == 'TyresBursted' then
                    vproperties[prop_name] = p
                else
                    vproperties[prop_name]  = get_element_text(p)
                end
            end
        else
            if name == 'SpoonerAttachments' then
                data[name] = v
            else
                local el_text = get_element_text(v)
                data[name] = el_text
            end
        end
    end
    request_model_load(data['ModelHash'])
    local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mvped, 0.0, 5.0, 0.0)
    local vehicle = entities.create_vehicle(data['ModelHash'], coords, ENTITY.GET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID()))
    table.insert(all_entities, vehicle)
    ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
    if doteleport then
        PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), vehicle, -1)
    end
    if data['InitialHandle'] == nil then
        data['InitialHandle'] = math.random(10000, 30000)
    end
    entity_initial_handles[data['InitialHandle']] = vehicle
    menyoo_preprocess_entity(vehicle, data)
    menyoo_preprocess_car(vehicle, vproperties)
    local attachments = data['SpoonerAttachments']
    all_attachments = {}
    if attachments ~= nil then
        for a,b in pairs(attachments.kids) do
            local vproperties = {}
            local att_data = {}
            for c,d in pairs(b.kids) do
                local name = d.name
                local val = get_element_text(d)
                if name == 'PedProperties' or name == 'Attachment' or name == 'TaskSequence' then
                    att_data[name] = d
                elseif name == 'VehicleProperties' then
                    for n, p in pairs(d.kids) do
                        local prop_name = p.name
                        if prop_name == 'Colours' or prop_name == 'Neons' or prop_name == 'Mods' or prop_name == 'DoorsOpen' or prop_name == 'DoorsBroken' or prop_name == 'TyresBursted' then
                            vproperties[prop_name] = p
                        else
                            vproperties[prop_name]  = get_element_text(p)
                        end
                    end
                else
                    att_data[name] = val
                end
            end
            request_model_load(att_data['ModelHash'])
            local attachment_info = menyoo_build_properties_table(att_data['Attachment'].kids)
            local entity = nil
            local isped = false
            if att_data['Type'] == '1' then
                local ped = entities.create_ped(0, att_data['ModelHash'], coords, ENTITY.GET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID()))
                menyoo_preprocess_ped(ped, att_data, entity_initial_handles)
                entity = ped
            elseif att_data['Type'] == '2' then
                local veh = entities.create_vehicle(att_data['ModelHash'], coords, ENTITY.GET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID()))
                entity = veh
                menyoo_preprocess_entity(veh, att_data)
                menyoo_preprocess_car(veh, vproperties)
            elseif att_data['Type'] == '3' then
                local obj = entities.create_object(att_data['ModelHash'], coords)
                NETWORK.NETWORK_REGISTER_ENTITY_AS_NETWORKED(obj)
                local objID = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(obj)
                NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objID, true)
                entity = obj
                menyoo_preprocess_entity(obj, att_data)
            end
            table.insert(all_entities, entity)
            ENTITY.SET_ENTITY_INVINCIBLE(entity, true)
            local bone = tonumber(attachment_info['BoneIndex'])
            local x = tonumber(attachment_info['X'])
            local y = tonumber(attachment_info['Y'])
            local z = tonumber(attachment_info['Z'])
            local pitch = tonumber(attachment_info['Pitch'])
            local yaw = tonumber(attachment_info['Yaw'])
            local roll = tonumber(attachment_info['Roll'])
            all_attachments[entity] = {}
            all_attachments[entity]['attachedto'] = attachment_info['AttachedTo']
            all_attachments[entity]['bone'] = bone
            all_attachments[entity]['x'] = x
            all_attachments[entity]['y'] = y
            all_attachments[entity]['z'] = z
            all_attachments[entity]['pitch'] = pitch
            all_attachments[entity]['yaw'] = yaw
            all_attachments[entity]['roll'] = roll
            all_attachments[entity]['isped'] = isped
        end
        for k, v in pairs(all_attachments) do
            ENTITY.ATTACH_ENTITY_TO_ENTITY(k, entity_initial_handles[v['attachedto']], v['bone'], v['x'], v['y'], v['z'], v['pitch'], v['roll'], v['yaw'], true, false, true, v['isped'], 2, true)
        end
    end
    print("Vehicle has been loaded.")
    local this_blip = HUD.ADD_BLIP_FOR_ENTITY(vehicle)
    HUD.SET_BLIP_SPRITE(this_blip, 77)
    HUD.SET_BLIP_COLOUR(this_blip, 47)
    local this_veh_root = menu.list(menyoovloaded_root, vehicle .. " [" .. VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(ENTITY.GET_ENTITY_MODEL(vehicle)) .. "]", {"menyoov" .. vehicle}, "")
    menu.action(this_veh_root, "Delete", {"deletemenyoov" .. vehicle}, "Delete this vehicle. Make it cease to exist.", function()
        for k,v in pairs(all_entities) do
            entities.delete_by_handle(v)
        end
        menu.delete(this_veh_root)
        HUD.SET_BLIP_ALPHA(this_blip, 0)
    end)
    menu.action(this_veh_root, "Teleport inside", {"teleportemenyoov" .. vehicle}, "oh fuck yeah ride it", function()
        PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), vehicle, -1)
    end)
    return vehicle
end

function draw_box(x, y, width, height, opacity)
    color = {}
    color["r"] = 0.07
    color["g"] = 0.07
    color["b"] = 0.07
    color["a"] = opacity - 0.02
    directx.draw_rect(x, y - 0.0015, width, height + 0.0015, color)
end

default = {
	["r"] = 255/255,
	["g"] = 255/255,
	["b"] = 255/255,
	["a"] = 255/255
} 
god = { -- need to find memory address
	["r"] = 255/255,
	["g"] = 175/255,
	["b"] = 0/255,
	["a"] = 255/255
} 
interior = { -- done
	["r"] = 150/255,
	["g"] = 150/255,
	["b"] = 150/255,
	["a"] = 255/255
} 
otr = { -- done
	["r"] = 0/255,
	["g"] = 255/255,
	["b"] = 255/255,
	["a"] = 255/255
}
host = {
	["r"] = 255/255,
	["g"] = 200/255,
	["b"] = 0/255,
	["a"] = 255/255
} 
dead = {
	["r"] = 175/255,
	["g"] = 100/255,
	["b"] = 100/255,
	["a"] = 255/255
} 
modder = {
	["r"] = 255/255,
	["g"] = 0/255,
	["b"] = 0/255,
	["a"] = 255/255
}  
friend = {
	["r"] = 0/255,
	["g"] = 255/255,
	["b"] = 0/255,
	["a"] = 255/255
}
spectating = {
	["r"] = 255/255,
	["g"] = 0/255,
	["b"] = 255/255,
	["a"] = 255/255
}

drift = false
function drift(toggle)
	if drift then
		while true do
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
			wait()
		end
	end
end

function setExplosionProof(toggle)
	ENTITY.SET_ENTITY_PROOFS(PLAYER.PLAYER_PED_ID(), false, false, toggle, false, false, 0, 0, false)
end

function request_model(h,i)
    if i==nil then 
        timetotry=10 
    else 
        timetotry=i 
    end
    STREAMING.REQUEST_MODEL(h)
    local j=os.time()
    while not STREAMING.HAS_MODEL_LOADED(h) and j+timetotry>=os.time() do
        util.yield()
    end
    return STREAMING.HAS_MODEL_LOADED(h)
end

function RequestControlOfEnt(entity)
	local tick = 0
	local tries = 0
	NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 1000 do
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
		tries = tries + 1
		if tries == 50 then 
			wait()
			tries = 0
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

function for_table_do(n,o,p)
    for q,r in ipairs(n)do 
        if o then 
            if not RequestControlOfEnt(r)then 
                goto s 
            end 
        end
        p(r)::s::
    end 
end

local t=memory.scan('48 8B 05 ? ? ? ? 45 ? ? ? ? 48 8B 48 08 48 85 C9 74 07')
t=t+memory.read_int(t+3)+7
if t==0 then 
    util.toast('Pattern scan failed')
    return 
end

function address_from_pointer_chain(u,v)
    local w=memory.read_long(u)
    for x=1,#v-1 do 
        w=memory.read_long(w+v[x])
        if w==0 then 
            return 0 
        end 
    end
    w=w+v[#v]
    return w 
end

function setparachutemodel(h)
    local y=PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local z=PED.GET_VEHICLE_PED_IS_IN(y,false)
    if z then 
        VEHICLE._SET_VEHICLE_PARACHUTE_MODEL(z,h)
    end 
end

function set_parachute_model(h)
    local A=PLAYER.PLAYER_PED_ID()
    local B=PED.GET_VEHICLE_PED_IS_IN(A,false)
    if B==0 then 
        util.toast("Vehicle not found")
        return 
    end
    if request_model(h) then 
        VEHICLE._SET_VEHICLE_PARACHUTE_MODEL(B,h)
        return true 
    else 
        return false 
    end 
end

function set_parachute_active(C)
    local A=PLAYER.PLAYER_PED_ID()
    if PED.IS_PED_IN_ANY_VEHICLE(A,false) then 
        local D=address_from_pointer_chain(t,{0x8,0xD30,0x20,0x58C})
        local E=0x0;
        if C then
            E=0x1 
        end
        memory.write_byte(D,E)
    end 
end

getPlayerPed = PLAYER.GET_PLAYER_PED
getEntityCoords = ENTITY.GET_ENTITY_COORDS
menuroot = menu.my_root()

function AudioAnnoyance(Ker_SND, Ker_AUD)
    for i=0, 31, 1 do
        Ker_pped = getPlayerPed(i)
        Ker_pos = getEntityCoords(Ker_pped)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, Ker_SND, Ker_pos.x, Ker_pos.y, Ker_pos.z, Ker_AUD, true, 999999999, true)
    end
end

--------------------------------------

  --Nearby entities

--------------------------------------

vehicle_uses = 0
ped_uses = 0
pickup_uses = 0
player_uses = 0
object_uses = 0
robustmode = false
reap = false
function mod_uses(type, incr)
    if incr < 0 and is_loading then
        print("Not incrementing use var of type " .. type .. " by " .. incr .. "- script is loading")
        return
    end
    print("Incrementing use var of type " .. type .. " by " .. incr)
    if type == "vehicle" then
        if vehicle_uses <= 0 and incr < 0 then
            return
        end
        vehicle_uses = vehicle_uses + incr
    elseif type == "pickup" then
        if pickup_uses <= 0 and incr < 0 then
            return
        end
        pickup_uses = pickup_uses + incr
    elseif type == "ped" then
        if ped_uses <= 0 and incr < 0 then
            return
        end
        ped_uses = ped_uses + incr
    elseif type == "player" then
        if player_uses <= 0 and incr < 0 then
            return
        end
        player_uses = player_uses + incr
    elseif type == "object" then
        if object_uses <= 0 and incr < 0 then
            return
        end
        object_uses = object_uses + incr
    end
end

all_vehicles = {}
all_objects = {}
all_players = {}
all_peds = {}
all_pickups = {}
player_cur_car = 0

function is_ped_player(ped)
    if PED.GET_PED_TYPE(ped) >= 4 then
        return false
    else
        return true
    end
end

vehicles_thread = util.create_thread(function (thr)
    while true do
        if vehicle_uses > 0 then
            if show_updates then
                util.toast("Vehicle pool is being updated")
            end
            all_vehicles = entities.get_all_vehicles_as_handles()
        end
        for k,veh in pairs(all_vehicles) do
            if reap then
                RequestControlOfEnt(veh)
            end
            if spoonerautovehs then
                create_entity_listing(veh, "v")
            end
            if vhp_bars then
                local d_coord = ENTITY.GET_ENTITY_COORDS(veh, true)
                d_coord['z'] = d_coord['z'] + 1.0
                local hp = ENTITY.GET_ENTITY_HEALTH(veh)
                local perc = hp/ENTITY.GET_ENTITY_MAX_HEALTH(veh)*100
                if perc ~= 0 then
                    local r = 0
                    local g = 0
                    local b = 0
                    if perc == 100 then
                        r = 0
                        g = 255
                        b = 0
                    elseif perc < 100 and perc > 50 then
                        r = 255
                        g = 255
                        b = 0
                    else
                        r = 255
                        g = 0
                        b = 0
                    end
                    GRAPHICS.DRAW_MARKER(43, d_coord['x'], d_coord['y'], d_coord['z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.50, 0, perc/150, r, g, b, 100, false, true, 2, false, 0, 0, false)
                end
            end
            if player_cur_car ~= veh then
                local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)
                if not is_ped_player(driver) or driver == 0 then
                    if reap then
                        RequestControlOfEnt(veh)
                    end
                    if noattachments then
                        if IS_ENTITY_ATTACHED_TO_ANY_PED(veh) then
                            ENTITY.DETACH_ENTITY(veh, false, false)
                        end
                    end
                    ap_target = PLAYER.PLAYER_PED_ID()
                    if beep_cars then
                        if not AUDIO.IS_HORN_ACTIVE(veh) then
                            VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
                        end
                    end
                    if inferno then
                        local coords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 7, 100.0, true, false, 1.0)
                    end
                    if blackhole then
                        if bh_target ~= -1 then
                            holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        end
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
                    end
                    if vehicle_chaos then
                        VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(veh, false, true)
                        VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, vc_speed)
                        VEHICLE.SET_VEHICLE_GRAVITY(veh, vc_gravity)
                    end
                    if halt_traffic then
                        VEHICLE.BRING_VEHICLE_TO_HALT(veh, 0.0, -1, true)
                        coords = ENTITY.GET_ENTITY_COORDS(veh, false)
                    end
                    if ascend_vehicles then
                        VEHICLE.SET_VEHICLE_UNDRIVEABLE(veh, true)
                        VEHICLE.SET_VEHICLE_GRAVITY(veh, false)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 4, 5.0, 0.0, 0.0, true, true, true, true)
                    end
                    if vehicle_fuckup then
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
                    end
                    if godmode_vehicles then
                        ENTITY.SET_ENTITY_CAN_BE_DAMAGED(veh, false)
                    end
                    if disable_veh_colls then
                        VEHICLE._DISABLE_VEHICLE_WORLD_COLLISION(veh)
                    end
                    if colorize_cars then
                        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                        for i=0, 3 do
                            VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(veh, i, true)
                        end
                        VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                        VEHICLE.SET_VEHICLE_LIGHTS(veh, 2)
                    end
                    if no_radio then
                        AUDIO.SET_VEHICLE_RADIO_ENABLED(veh, false)
                    end
                    if loud_radio then
                        AUDIO.SET_VEHICLE_RADIO_LOUD(veh, true)
                    end
                    if reverse_traffic then
                        ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)
                        TASK.TASK_VEHICLE_TEMP_ACTION(ped, veh, 3, -1)
                    end
                end
            end
        end
        util.yield()
    end
end)

function start_vehdance_thread()
    vehdance_thread = util.create_thread(function (thr)
        local state = 2
        while true do
            if not veh_dance then
                util.stop_thread()
            end
            for k,veh in pairs(all_vehicles) do
                local vhash = ENTITY.GET_ENTITY_MODEL(veh)
                VEHICLE.SET_VEHICLE_MOD(veh, 38, VEHICLE.GET_NUM_VEHICLE_MODS(veh, 38)-1, false)
                if player_cur_car ~= veh and not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)) then
                    RequestControlOfEnt(veh)
                    if vhash % 2 == 0 then
                        if state == 2 then
                            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0.0, 1.0, state*2, 0.0, 0.0, 0, false, false, true, false, true)
                        else
                            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0.0, 1.0, state*2, 0.0, 0.0, 0, false, false, true, false, true)
                        end
                    else
                        if state == 2 then
                            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0.0, 1.0, state*2, 0.0, 0.0, 0, false, false, true, false, true)
                        else
                            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0.0, 1.0, state*2, 0.0, 0.0, 0, false, false, true, false, true)
                        end
                    end
                end
            end
            if state == 2 then
                state = -2
            else
                state = 2
            end
            util.yield(500)
        end
    end)
end

infibounty = false
function start_infibounty_thread()
    infibounty_thread = util.create_thread(function (thr)
        while true do
            if not infibounty then
                util.stop_thread()
            else
                menu.trigger_commands("bountyall 10000")
            end
            wait(60000)
        end
    end)
end

function requestModels(...)
	local arg = {...}
	for _, model in ipairs(arg) do
		if not STREAMING.IS_MODEL_VALID(model) then
			error("tried to request an invalid model")
		end
		STREAMING.REQUEST_MODEL(model)
		while not STREAMING.HAS_MODEL_LOADED(model) do
			wait()
		end
	end
end

function requestPtfxAsset(asset)
	STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
	while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
		wait()
	end
end

function requestWeaponAsset(hash)
	WEAPON.REQUEST_WEAPON_ASSET(hash, 31, 0)
	while not WEAPON.HAS_WEAPON_ASSET_LOADED(hash) do
		wait()
	end
	WEAPON.GIVE_WEAPON_TO_PED(PLAYER.PLAYER_PED_ID(), hash, 120, 1, 1)
	WEAPON.SET_CURRENT_PED_WEAPON(PLAYER.PLAYER_PED_ID(), hash, 1)
end

function isModelAnAircraft(model)
	return VEHICLE.IS_THIS_MODEL_A_HELI(model) or VEHICLE.IS_THIS_MODEL_A_PLANE(model)
end

function isPedInAnyAircraft(ped)
	return PED.IS_PED_IN_ANY_PLANE(ped) or PED.IS_PED_IN_ANY_HELI(ped)
end

function getOffsetFromEntityGivenDistance(entity, distance)
	local pos = ENTITY.GET_ENTITY_COORDS(entity, 0)
	local theta = (math.random() + math.random(0, 1)) * math.pi
	local coords = vect.new(
		pos.x + distance * math.cos(theta),
		pos.y + distance * math.sin(theta),
		pos.z
	)
	return coords
end

function setEntityFaceEntity(ent1, ent2, usePitch)
	local a = ENTITY.GET_ENTITY_COORDS(ent1, false)
	local b = ENTITY.GET_ENTITY_COORDS(ent2, false)
	local s = vect.subtract(b,a)
	local r = toRotation(s)
	if not usePitch then
		ENTITY.SET_ENTITY_HEADING(ent1, r.z)
	else
		ENTITY.SET_ENTITY_ROTATION(ent1, r.x, r.y, r.z)
	end
end

function tp_veh_to(pid,x,y,z)
	local tries = 0
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = get_player_veh(pid,false)	
		while tries <= 1000 do
			if RequestControlOfEnt(vehicle) then			
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehicle, x, y, z, 0, 0, 1);
				tries = tries + 1
			end
		end
	end
end

function get_player_veh(pid)
	local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local vehicle = PED.GET_VEHICLE_PED_IS_IN(p, false)
	return vehicle
end

function get_player_coords(pid)
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local coords = PLAYER.GET_ENTITY_COORDS(p)
    return coords
end

function requestControlLoop(entity)
	local tick = 0
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick < 25 do
		wait()
		RequestControlOfEnt(entity)
		tick = tick + 1
	end
	if NETWORK.NETWORK_IS_SESSION_STARTED() then
		local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
		RequestControlOfEnt(entity)
		NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	end
end

function teleport_player_vehicle(player, pos)
	local vehicle = getVehiclePlayerIsIn(player)
	if vehicle == NULL then return end
	requestControlLoop(vehicle)
	ENTITY.SET_ENTITY_COORDS(vehicle, pos.x, pos.y, pos.z, false, false, false)
end

function request_model_load(hash)
    request_time = os.time()
    if not STREAMING.IS_MODEL_VALID(hash) then
        return
    end
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        if os.time() - request_time >= 10 then
            break
        end
        wait()
    end
end

function set_ent_face_ent(ent1, ent2) --All credits to Ren for suggesting me this function
	local pos1 = ENTITY.GET_ENTITY_COORDS(ent1)
	local pos2 = ENTITY.GET_ENTITY_COORDS(ent2)
	local dx = pos2.x - pos1.x
	local dy = pos2.y - pos1.y
	local heading = MISC.GET_HEADING_FROM_VECTOR_2D(dx, dy)
	return ENTITY.SET_ENTITY_HEADING(ent1, heading)
end

function set_ped_can_be_knocked_off_veh(ped, state)
	native_invoker.begin_call()
	native_invoker.push_arg_int(ped)
	native_invoker.push_arg_int(state)
	native_invoker.end_call("7A6535691B477C48")
end

function add_blip_for_entity(entity, blipSprite, colour)
	local blip_ptr = memory.alloc()
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	memory.write_int(blip_ptr, blip)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
	HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
	util.create_thread(function()
		local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
		while NETWORK.NETWORK_DOES_ENTITY_EXIST_WITH_NETWORK_ID(netId) do
			HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
			if ENTITY.IS_ENTITY_DEAD(NETWORK.NET_TO_ENT(netId)) then
				break	
			end
			wait()
		end
		HUD.SET_BLIP_DISPLAY(blip, 0)
		HUD.REMOVE_BLIP(memory.read_int(blip_ptr))
		memory.free(blip_ptr)
	end)
	return blip
end

local config_list = {
    ['controls'] = {
        ['Vehicle Weapons'] = 86,
        ['Airstrike Aircraft'] = 86
    },
    ['driving style'] = {
        ['Bandito Driving Style'] = 786988
    }
}

function delete_entities_by_model(model)
    local hash = joaat(model)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        for k, vehicle in pairs(entities.get_all_vehicles_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
                for k, ped in pairs(entities.get_all_peds_as_handles()) do
                    if PED.GET_VEHICLE_PED_IS_IN(ped, true) == vehicle then
                        if not PED.IS_PED_A_PLAYER(ped) then
                            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
                        else
                            goto continue
                        end
                    end
                end
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, false, false); entities.delete_by_handle(vehicle)
                ::continue::
            end
        end
        return
    end
    if STREAMING.IS_MODEL_A_PED(hash) then
        for k, ped in pairs(entities.get_all_peds_as_handles()) do
            if ENTITY.GET_ENTITY_MODEL(ped) == hash then
                if not PED.IS_PED_A_PLAYER(ped) then
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
                end
            end
        end
        return
    end
    for k, object in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.GET_ENTITY_MODEL(object) == hash then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false); entities.delete_by_handle(object)
        end
    end
end

function spawn_trolly_vehicle(pid, vehicleHash, pedHash)
    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
    local coords_ptr, nodeId = memory.alloc(), memory.alloc()
    local coords
    if not PATHFIND.GET_RANDOM_VEHICLE_NODE(pos.x, pos.y, pos.z, 100, 0, 0, 0, coords_ptr, nodeId) then
        pos.x = pos.x + math.random(-20,20)
        pos.y = pos.y + math.random(-20,20)
        PATHFIND.GET_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, coords_ptr, 1, 100, 2.5)
        coords = memory.read_vector3(coords_ptr)
    else
        coords = memory.read_vector3(coords_ptr)
    end
    memory.free(coords_ptr); memory.free(nodeId)

    local vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
        local tick = 0
        while not ENTITY.DOES_ENTITY_EXIST(vehicle) and tick <= 10 do
            vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            tick = tick + 1
            wait()
        end
    end
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    for i = 0, 50 do
        VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 1, false)
    end
    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
    VEHICLE.SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, false)
    set_ent_face_ent(vehicle, player_ped)

    local driver = entities.create_ped(5, pedHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    PED.SET_PED_COMBAT_ATTRIBUTES(driver, 1, true)
    PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
    TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 500.0, config_list['driving style']['Bandito Driving Style'], 0.0, 0.0, true)
    set_ped_can_be_knocked_off_veh(driver, 1)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash); STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
    return vehicle, driver
end

function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0
	local iter = function()
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end

cages = {}

function cage_player(pos)
    local object_hash = joaat("prop_gold_cont_01b")
    pos.z = pos.z-0.9

    STREAMING.REQUEST_MODEL(object_hash)
    while not STREAMING.HAS_MODEL_LOADED(object_hash) do
        wait()
    end
    local object1 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
    cages[#cages + 1] = object1																			

    local object2 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
    cages[#cages + 1] = object2

    if object1 == 0 or object2 ==0 then --if 'CREATE_OBJECT' fails to create one of those 
        toast("Something Went Wrong Creating Cages", red)
    end
    ENTITY.FREEZE_ENTITY_POSITION(object1, true)
    ENTITY.FREEZE_ENTITY_POSITION(object2, true)
    local rot  = ENTITY.GET_ENTITY_ROTATION(object2)
    rot.x = -180
    rot.y = -180
    ENTITY.SET_ENTITY_ROTATION(object2, rot.x,rot.y,rot.z,1,true)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
end

function get_vehicle_player_is_in(pId)
	local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId)
	local vehicle = PED.GET_VEHICLE_PED_IS_IN(p, false)
	return vehicle
end

function getWaypointCoords()
    local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
    if blip == NULL then return nil end
    local coords = HUD.GET_BLIP_COORDS(blip)
    local tick = 0
    local success, groundz = util.get_ground_z(coords.x, coords.y)
    while not success and tick < 10 do
        wait()
        success, groundz = util.get_ground_z(coords.x, coords.y)
        tick = tick + 1
    end
    if success then coords.z = groundz end
    return coords
end

function rain_rockets(pid, owned)
    local localPed = PLAYER.PLAYER_PED_ID()
    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
    local hash = util.joaat("weapon_airstrike_rocket")
    if not WEAPON.HAS_WEAPON_ASSET_LOADED(hash) then
        WEAPON.REQUEST_WEAPON_ASSET(hash, 31, 0)
    end
    pos.x = pos.x + math.random(-6, 6)
    pos.y = pos.y + math.random(-6, 6)
    pos.z = pos.z - 10.0
    
    local owner = owned and localPed or 0
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 50, pos.x, pos.y, pos.z, 200, true, hash, owner, true, false, 2500.0)
end

gConfig = {
controls = {
    vehicleweapons 		= 86,
    airstrikeaircraft 	= 86
},
general = {
    standnotifications 	= false,
    displayhealth 		= true,
    language 			= "english",
    bustedfeatures 		= false,	
    developer			= false, 	-- developer flag (enables/disables some debug features)
    showintro			= true
},
ufo = {
    disableboxes 		= false, 	-- determines if boxes are drawn on players to show their position
    targetplayer		= false 	-- wether tractor beam only targets players or not
},
vehiclegun = {
    disablepreview 		= false,
},
onfocuscolour = {
    r = 164,
    g = 84,
    b = 244,
    a = 255
},
highlightcolour = {
    r = 0,
    g = 255,
    b = 255,
    a = 255
},
buttonscolour = {
    r = 127,
    g = 0,
    b = 204,
    a = 255
},
healthtxtpos = {
    x = 0.03, 
    y = 0.05
},
}

vect = {}
vect.new = function(X, Y, Z)
    return {x = X or 0, y = Y or 0, z = Z or 0}
end

vect.subtract = function(a,b)
    return vect.new(a.x - b.x, a.y - b.y, a.z - b.z)
end

vect.add = function(a,b)
    return vect.new(a.x + b.x, a.y + b.y, a.z + b.z)
end

vect.mag = function(a)
    return math.sqrt(a.x^2 + a.y^2 + a.z^2)
end

vect.mag2 = function(a)
    return (a.x^2 + a.y^2 + a.z^2)
end

vect.norm = function(a)
    local mag = vect.mag(a)
    return vect.mult(a, 1/mag)
end

vect.mult = function(a,b)
    return vect.new(a.x*b, a.y*b, a.z*b)
end

-- returns the distance between two coords
vect.dist = function(a,b)
    return vect.mag(vect.subtract(a, b))
end

vect.dist2 = function(a,b)
    return vect.mag2(vect.subtract(a, b))
end

vect.tostring = function(a)
    return  string.format("{x: %.3f, y: %.3f, z: %.3f}", a.x, a.y, a.z)
end

function toRotation(v)
    local mag = vect.mag(v)
    local rotation = {
        x =   math.asin(v.z / mag) * (180 / math.pi),
        y =   0.0,
        z = - math.atan(v.x, v.y) * (180 / math.pi)
    }
    return rotation
end

features = {}
menunames = {}
function menuname(section, name)
    features[ section ] = features[ section ] or {}
    features[ section ][ name ] = features[ section ][ name ] or ""
    if gConfig.general.language ~= "english" then
        menunames[ section ] = menunames[ section ] or {}
        menunames[ section ][ name ] = menunames[ section ][ name ] or ""
        if menunames[ section ][ name ] == "" then return name end
        return menunames[ section ][ name ]
    end
    return name
end

function getNearbyPeds(pid, radius) 
    local peds = {}
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(playerPed)
    for k, ped in pairs(entities.get_all_peds_as_handles()) do
        if ped ~= playerPed and not PED.IS_PED_FATALLY_INJURED(ped) then
            local ped_pos = ENTITY.GET_ENTITY_COORDS(ped)
            if vect.dist(pos, ped_pos) <= radius then table.insert(peds, ped) end
        end
    end
    return peds
end

-- returns a list of nearby vehicles given player Id
function getNearbyVehicles(pid, radius) 
    local vehicles = {}
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(p)
    local v = PED.GET_VEHICLE_PED_IS_IN(p, false)
    for _, vehicle in ipairs(entities.get_all_vehicles_as_handles()) do 
        local veh_pos = ENTITY.GET_ENTITY_COORDS(vehicle)
        if vehicle ~= v and vect.dist(pos, veh_pos) <= radius then table.insert(vehicles, vehicle) end
    end
    return vehicles
end

-- returns a list of nearby peds and vehicles given player Id
function getNearbyEntities(pid, radius) 
    local peds = getNearbyPeds(pid, radius)
    local vehicles = getNearbyVehicles(pid, radius)
    local entities = peds
    for i = 1, #vehicles do table.insert(entities, vehicles[i]) end
    return entities
end

function deleteNearbyVehicles(pos, model, radius)
    local hash = joaat(model)
    local vehicles = entities.get_all_vehicles_as_handles()
    for _, vehicle in ipairs(vehicles) do
        if ENTITY.DOES_ENTITY_EXIST(vehicle) and ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
            local vpos = ENTITY.GET_ENTITY_COORDS(vehicle, false)
            local ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
            if not PED.IS_PED_A_PLAYER(ped) and vect.dist(pos, vpos) < radius then
                requestControlLoop(vehicle)
                requestControlLoop(ped)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, true)
                entities.delete_by_handle(vehicle)
                entities.delete_by_handle(ped)
            end
        end
    end
end

function addBlipForEntity(entity, blipSprite, colour)
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
	HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(entity, false)
	util.create_thread(function()
		while not ENTITY.IS_ENTITY_DEAD(entity) do
			local heading = ENTITY.GET_ENTITY_HEADING(entity)
			HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(heading))
			wait()
		end
		util.remove_blip(blip)
	end)
	return blip
end

-------------------------------------

 -- ESP

-------------------------------------

function getLocalPed()
    return PLAYER.PLAYER_PED_ID()
end

function GetPlayerName_ped(ped)
    local playerID = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(ped)
    local playerName = NETWORK.NETWORK_PLAYER_GET_NAME(playerID)
    return playerName
end

function GetPlayerName_pid(pid)
    local playerName = NETWORK.NETWORK_PLAYER_GET_NAME(pid)
    return playerName
end

function drawLine(c1, c2, r, g, b, a)
    GRAPHICS.DRAW_LINE(c1.x, c1.y, c1.z, c2.x, c2.y, c2.z, r, g, b, a)
end

function worldToScreen(coords)
    local sx = memory.alloc()
    local sy = memory.alloc()
    local success = GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(coords.x, coords.y, coords.z, sx, sy)
    local screenx = memory.read_float(sx) local screeny = memory.read_float(sy) memory.free(sx) memory.free(sy)
    return {x = screenx, y = screeny, success = success}
end

whiteColor = {r = 1.0, g = 1.0, b = 1.0, a = 1.0}

colors = {
    red = {255, 0, 0},
    orange = {255, 127, 0},
    yellow = {255, 255, 0},
    green = {0, 255, 0},
    blue = {0, 0, 255},
    purple = {148, 0, 211}
}

colorProximities = {
    {"Red", 200*200, 255, 0, 0},
    {"Orange", 400*400, 255, 127, 0},
    {"Yellow", 600*600, 255, 255, 0},
    {"Green", 800*800, 0, 255, 0},
    {"Blue", 1000*1000, 0, 0, 255},
    {"Purple", 1200*1200, 148, 0, 211},
}

esp_settings = {
    line_esp = true,
    stand_lines = false,
    box_esp = false,
    txtscale = 0.5,
    disablecolorlines = false,
    intcheck = true,
    name = false,
    text_sync = true,
    health = false
}

function drawESPText(coord, Yoffset, text, scale, color)
    directx.draw_text(coord.x, coord.y + Yoffset, text, ALIGN_CENTRE, scale, color.r, color.g, color.b, 1)
end

function tableFin(colortbl, distance, standCompatible)
    if not standCompatible then
        for i = 1, #colortbl do if distance <= colortbl[i][2] then return {r = colortbl[i][3], g = colortbl[i][4], b = colortbl[i][5], a = 255} end end
        return {r = 255, g = 255, b = 255, a = 255} --if out of range, return white ;)
    else
        for i = 1, #colortbl do if distance <= colortbl[i][2] then return {r = colortbl[i][3]/255, g = colortbl[i][4]/255, b = colortbl[i][5]/255, a = 1.0} end end
        return {r = 1.0, g = 1.0, b = 1.0, a = 1.0} --if out of range, return white ;)
    end
end

function nativeDrawLine(x1, y1, z1, x2, y2, z2, r, g, b, a)
    GRAPHICS.DRAW_LINE(x1, y1, z1, x2, y2, z2, r, g, b, a)
end

function boxESPOnPlayer(pid, horizontalOffset, color)
    local targetped = getPlayerPed(pid)
    local topOfHead = PED.GET_PED_BONE_COORDS(targetped, 31086, 0, 0, 0); topOfHead.z = topOfHead.z + 0.30 --[[SKEL_Head || 31086]] --[[0.30 vertical offset for head]]
    local bottomOfFeet = {z = topOfHead.z - 1.94}
    local rightCorner = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targetped, horizontalOffset, 0, 0); rightCorner.z = topOfHead.z
    local leftCorner = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targetped, -horizontalOffset, 0, 0); leftCorner.z = topOfHead.z
    local bRightCorner = rightCorner; bRightCorner.z = topOfHead.z - 1.94
    local bLeftCorner = leftCorner; bLeftCorner.z = topOfHead.z - 1.94

    nativeDrawLine(rightCorner.x, rightCorner.y, topOfHead.z, leftCorner.x, leftCorner.y, topOfHead.z, color.r, color.g, color.g, color.a) --top line
    nativeDrawLine(rightCorner.x, rightCorner.y, topOfHead.z, bRightCorner.x, bRightCorner.y, bottomOfFeet.z, color.r, color.g, color.g, color.a) --right line
    nativeDrawLine(leftCorner.x, leftCorner.y, topOfHead.z, bLeftCorner.x, bLeftCorner.y, bottomOfFeet.z, color.r, color.g, color.g, color.a) --left line
    nativeDrawLine(bRightCorner.x, bRightCorner.y, bottomOfFeet.z, bLeftCorner.x, bLeftCorner.y, bottomOfFeet.z, color.r, color.g, color.g, color.a) --bottom line
end

function espOnPlayer(pid, intcheck, disablecolorlines, namesync, lineesp, boxesp, nameesp, healthesp, txtscale, standESP)
    local targetped = getPlayerPed(pid)
    local ppos = getEntityCoords(targetped)
    if (((not players.is_in_interior(pid)) or (ppos.z < -10)) and intcheck) or (not intcheck)then --checking for interior, underground

        --coordinate stuff
        local mypos = getEntityCoords(getLocalPed())
        local playerHeadOffset = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targetped, 0, 0, 1.0)
        local centerPlayer = getEntityCoords(targetped)
        local vdist = SYSTEM.VDIST2(mypos.x, mypos.y, mypos.z, ppos.x, ppos.y, ppos.z)

        --color settings
        local colLineNative
        local colText
        if not disablecolorlines then colLineNative = tableFin(colorProximities, vdist, false) else colLineNative = {r = 255, g = 255, b = 255, a = 255} end --setting for if lines are colored
        if namesync then colText = tableFin(colorProximities, vdist, true) else colText = {r = 1.0, g = 1.0, b = 1.0, a = 1.0} end --setting for if text should be colored

        --head offset for all texts
        local screenName = worldToScreen(playerHeadOffset)

        --line ESP
        if lineesp then
            local cent = worldToScreen(centerPlayer)
            if cent.success and standESP then --if they're on the screen, we use the directX function, since it's faster and goes thru buildings.
                if CAM.GET_CAM_VIEW_MODE_FOR_CONTEXT(CAM._GET_CAM_ACTIVE_VIEW_MODE_CONTEXT()) ~= 4 then --check if in first person
                    --thank you aaron!
                    local localcent = worldToScreen(mypos)
                    local colLineStand
                    if not disablecolorlines then colLineStand = tableFin(colorProximities, vdist, true) else colLineStand = {r = 1.0, g = 1.0, b = 1.0, a = 1.0} end
                    directx.draw_line(localcent.x, localcent.y, cent.x, cent.y, colLineStand)
                else
                    local colLineStand
                    if not disablecolorlines then colLineStand = tableFin(colorProximities, vdist, true) else colLineStand = {r = 1.0, g = 1.0, b = 1.0, a = 1.0} end
                    directx.draw_line(0.5, 1.0, cent.x, cent.y, colLineStand)
                end
            else
                drawLine(mypos, ppos, colLineNative.r, colLineNative.g, colLineNative.b, colLineNative.a) --else we use the native func (behnid us)
            end
        end
        --box ESP
        if boxesp then
            boxESPOnPlayer(pid, 0.5, colLineNative)
        end
        --text ESP
        if screenName.success then --check if it should be drawn, since we don't want to draw things that are out of the screen.
            --name ESP
            if nameesp then
                drawESPText(screenName, -0.02, GetPlayerName_pid(pid), txtscale, colText)
            end

            --health ESP
            if healthesp then
                local health = ENTITY.GET_ENTITY_HEALTH(targetped)-100 local maxhealth = ENTITY.GET_ENTITY_MAX_HEALTH(targetped)-100
                drawESPText(screenName, -0.02*2, "(" .. health .. " / " .. maxhealth .. ")", txtscale, colText)
            end
        end
    end
end

function playerActionsSetup(pid)
    local playerMain = menu.list(menu.player_root(pid), "Sounds")
    local playerPos = getEntityCoords(getPlayerPed(pid))
    for i = 1, #SoundAnnoy do
        menu.action(playerMain, SoundAnnoy[i][1], {"kSounds_" .. SoundAnnoy[i][1]}, "", function()
            local snd, aud
            snd = tostring(SoundAnnoy[i][1])
            aud = tostring(SoundAnnoy[i][2])
            AudioAnnoyance(snd, aud)
        end)
    end
end

function playerFunctionsESP(pid)
    local playerRoot = menu.player_root(pid)
    menu.toggle_loop(playerRoot, "ESP On Player", {"catesp"}, "Enables ESP on this specific player. Uses color settings found in main script menu.", function ()
        espOnPlayer(pid, false, esp_settings.disablecolorlines,
        esp_settings.text_sync, esp_settings.line_esp, esp_settings.box_esp, esp_settings.name, esp_settings.health,
        esp_settings.txtscale, esp_settings.stand_lines)
    end)
end

-------------------------------------

 -- ACTIONS

-------------------------------------

AnimationDuration = -1
ChosenAnimation = ""
ChosenDict = ""
IsInAnimation = false
IsInScenarios = false
ename = ""
MovementType = 0
PlayerHasProp = false
PlayerProps = {}
SecondPropEmote = false
PtfxNotif = false
PtfxPrompt = false

function DestroyAllProps()
    for i=1, #PlayerProps do
        local ent = PlayerProps[i]
        if ENTITY.IS_AN_ENTITY(ent) then
            if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
                entities.delete_by_handle(ent)
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
            end
        end
    end
    PlayerHasProp = false
end

function CheckGender()
    local hash = ENTITY.GET_ENTITY_MODEL(players.user_ped())
    if hash == MISC.GET_HASH_KEY("mp_m_freemode_01") then
        return "male"
    elseif hash == MISC.GET_HASH_KEY("mp_f_freemode_01") then
        return "female"
    end
end

function LoadAnim(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        STREAMING.REQUEST_ANIM_DICT(dict)
        wait()
    end
end

function AddPropToPlayer(propmodel, bone, off1, off2, off3, rot1, rot2, rot3)
    local pped = players.user_ped()
    local pcoords = ENTITY.GET_ENTITY_COORDS(pped)
    pcoords.z = pcoords.z + 0.2
    propmodel = tonumber(propmodel) or MISC.GET_HASH_KEY(propmodel)

    if not STREAMING.HAS_MODEL_LOADED(propmodel) then
        STREAMING.REQUEST_MODEL(propmodel)
        while not STREAMING.HAS_MODEL_LOADED(propmodel) do 
            wait()
        end
    end

    local prop = entities.create_object(propmodel, pcoords)
    local boneIndex = PED.GET_PED_BONE_INDEX(pped, bone)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(prop, pped, boneIndex, off1, off2, off3, rot1, rot2, rot3 or 0.0, false, false, false, false, 1, true)
    table.insert(PlayerProps, prop)
    PlayerHasProp = true
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(propmodel)
end

function EmoteCancel()
    local pped = players.user_ped()
    if ChosenDict == "MaleScenario" and IsInAnimation then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
        IsInAnimation = false
        toast("Forced scenario exit")
    elseif ChosenDict == "Scenario" and IsInAnimation then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
        IsInAnimation = false
        toast("Forced scenario exit")
    end
  
    PtfxNotif = false
    PtfxPrompt = false
  
    if IsInAnimation then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
        DestroyAllProps()
        IsInAnimation = false
    elseif IsInScenarios == true then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
        IsInScenarios = false
    end
end

function playDance(n)
    local dance_ceil = #e_dances

    if not n or type(n) ~= "number" then
        n = math.random(dance_ceil)
        while e_dances[n] and e_dances[n].disabled do 
            n = math.random(dance_ceil)
            wait()
        end
        toast("You randomly selected dance #"..n.."\nYou can play this dance again using /dance "..n)
    end

    if n > dance_ceil or n <= 0 then
        toast("There are only "..dance_ceil.." dances, select a number inbetween or random (no input)")
        return
    end 

    if e_dances[n] and e_dances[n].disabled then
        toast("Dance "..n.." is disabled")
        return
    end

    LoadAnim(e_dances[n].dict)
    TASK.TASK_PLAY_ANIM(players.user_ped(), e_dances[n].dict, e_dances[n].anim, 3.0, 3.0, -1, 1, 0, false, false, false)
    IsInAnimation = true
    STREAMING.REMOVE_ANIM_DICT(e_dances[n].dict)
end

function OnEmotePlay(name)
    local InVehicle = PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true)
    if not ENTITY.IS_AN_ENTITY(players.user_ped()) then
        return false
    end

    ChosenDict,ChosenAnimation,ename = table.unpack(name)
    AnimationDuration = -1

    if PlayerHasProp then
        DestroyAllProps()
    end
    if IsInAnimation == true then
        EmoteCancel()
    end

    if ChosenDict == "MaleScenario" or "Scenario" then 
        local PlayerGender = CheckGender()
        local pped = players.user_ped()
        if ChosenDict == "MaleScenario" then 
            if InVehicle then return end
            if PlayerGender == "male" then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
                TASK.TASK_START_SCENARIO_IN_PLACE(pped, ChosenAnimation, 0, true)
                toast("Playing scenario = ("..ChosenAnimation..")")
                IsInAnimation = true
            else
                toast("This emote is for male only")
            end 
            return
        elseif ChosenDict == "ScenarioObject" then if InVehicle then return end
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
            local poss = ENTITY.GET_ENTITY_COORDS(pped)
            TASK.TASK_START_SCENARIO_AT_POSITION(pped, ChosenAnimation, poss.x, poss.y, poss.z - 0.5, ENTITY.GET_ENTITY_HEADING(pped), 0, true, false)
            toast("Playing scenario = ("..ChosenAnimation..")")
            IsInAnimation = true
            return
        elseif ChosenDict == "Scenario" then if InVehicle then return end
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(pped)
            TASK.TASK_START_SCENARIO_IN_PLACE(pped, ChosenAnimation, 0, true)
            toast("Playing scenario = ("..ChosenAnimation..")")
            IsInAnimation = true
            return 
        end 
    end

    LoadAnim(ChosenDict)

    if name.AnimationOptions then
        if name.AnimationOptions.EmoteLoop then
            MovementType = 1
            if name.AnimationOptions.EmoteMoving then
                MovementType = 51
            end
        elseif name.AnimationOptions.EmoteMoving then
            MovementType = 51
        elseif name.AnimationOptions.EmoteMoving == false then
            MovementType = 0
        elseif name.AnimationOptions.EmoteStuck then
            MovementType = 50
        end
    else
        MovementType = 0
    end
    if InVehicle == 1 then
        MovementType = 51
    end

    local AttachWait = 0
    if name.AnimationOptions then
        if name.AnimationOptions.EmoteDuration == nil then 
            name.AnimationOptions.EmoteDuration = -1
            AttachWait = 0
        else
            AnimationDuration = name.AnimationOptions.EmoteDuration
            AttachWait = name.AnimationOptions.EmoteDuration
        end
    end

    TASK.TASK_PLAY_ANIM(players.user_ped(), ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
    STREAMING.REMOVE_ANIM_DICT(ChosenDict)
    IsInAnimation = true

    if name.AnimationOptions then
        if name.AnimationOptions.Prop then
            PropName = name.AnimationOptions.Prop
            PropBone = name.AnimationOptions.PropBone
            PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(name.AnimationOptions.PropPlacement)
            if name.AnimationOptions.SecondProp then
                SecondPropName = name.AnimationOptions.SecondProp
                SecondPropBone = name.AnimationOptions.SecondPropBone
                SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(name.AnimationOptions.SecondPropPlacement)
                SecondPropEmote = true
            else
                SecondPropEmote = false
            end
            wait(AttachWait)
            AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
            if SecondPropEmote then
                AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
            end
        end
    end
    return true
end

function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

-------------------------------------

 -- VEHICLE FLY

-------------------------------------

veh = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false);
function do_vehicle_fly() 
    veh = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false);
    cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0);
    ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, TRUE);
    ENTITY.SET_ENTITY_COLLISION(veh, not no_collision, TRUE);
    
    local locspeed = speed*10
    local locspeed2 = speed
    if PAD.IS_CONTROL_PRESSED(0, 61) then 
        locspeed = locspeed*2
        locspeed2 = locspeed2*2
    end
    if PAD.IS_CONTROL_PRESSED(2, 71) then
        if dont_stop then
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, speed, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
        else 
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, locspeed)
        end
	end
    if PAD.IS_CONTROL_PRESSED(2, 72) then
		local lsp = speed
        if not PAD.IS_CONTROL_PRESSED(0, 61) then 
            lsp = speed * 2
        end
        if dont_stop then
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0 - (lsp), 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
        else 
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0 - (locspeed));
        end
   end
    if PAD.IS_CONTROL_PRESSED(2, 63) then
        local lsp = (0 - speed)*2
        if not PAD.IS_CONTROL_PRESSED(0, 61) then 
            lsp = 0 - speed
        end
        if dont_stop then
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, (lsp), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
        else 
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0 - (locspeed), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1);
        end
	end
    if PAD.IS_CONTROL_PRESSED(2, 64) then
        local lsp = speed
        if not PAD.IS_CONTROL_PRESSED(0, 61) then 
            lsp = speed*2
        end
        if dont_stop then
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, lsp, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
        else 
            ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, locspeed, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
        end
    end
	if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
    end
end

util.create_tick_handler(function() 
    VEHICLE.SET_VEHICLE_GRAVITY(veh, not is_vehicle_flying)
    if is_vehicle_flying then do_vehicle_fly() else ENTITY.SET_ENTITY_COLLISION(veh, true, TRUE); end
    return true
end)

util.on_stop(function() 
    VEHICLE.SET_VEHICLE_GRAVITY(veh, true)
	ENTITY.SET_ENTITY_COLLISION(veh, true, TRUE);
end)

-------------------------------------

 -- DRIFT MOD

-------------------------------------

gs_driftMinSpeed = 8.0
gs_driftMaxAngle = 50.0
ControlVehicleAccelerate = 71
ControlVehicleBrake = 72
ControlVehicleDuck = 73
ControlVehicleSelectNextWeapon = 99
ControlVehicleMoveUpOnly = 61
INPUT_FRONTEND_LS = 209
DriftActivateKeyboard = INPUT_FRONTEND_LS

CurrentGearOffset = memory.scan("A8 02 0F 84 ? ? ? ? 0F B7 86")+11
NextGearOffset = memory.scan("A8 02 0F 84 ? ? ? ? 0F B7 86")+18

util.require_no_lag("natives-1640181023")

textDrawCol = {
    r = 255,
    g = 255,
    b = 255,
    a = 255
}

function asDegrees(angle)
    return angle * (180.0 / 3.14159265357); 
end

function wrap360(val) 
    while (val < 0.0) do
        val = val + 360.0
    end
    while (val > 360.0) do
        val = val - 360.0
    end
    return val
end

function getCurrentVehicle() 
	local player_ped = players.user_ped()
    local player_vehicle = 0
    if (PED.IS_PED_IN_ANY_VEHICLE(player_ped)) then
        veh = PED.GET_VEHICLE_PED_IS_USING(player_ped)
        if (NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(veh)) then
            player_vehicle = veh
        end 
    end
    return player_vehicle
end

function getHeadingOfTravel(veh) 
    local velocity = ENTITY.GET_ENTITY_VELOCITY(veh)

    local x = velocity.x
    local y = velocity.y
    local at2 = math.atan(y, x)
    return math.fmod(270.0 + math.deg(at2), 360.0)
end

function slamDatBitch(veh, height) 
    if (VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(veh) and not ENTITY.IS_ENTITY_IN_AIR(veh)) then
        ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1,    0, 0, height,    0, 0, 0,   true, true)
    end
end

function getCurGear()
    return memory.read_byte(entities.get_user_vehicle_as_pointer() +memory.read_int(CurrentGearOffset))
end

function getNextGear()
    return memory.read_byte(entities.get_user_vehicle_as_pointer() +memory.read_int(NextGearOffset))
end

function setCurGear(gear)
    memory.write_byte(entities.get_user_vehicle_as_pointer() +memory.read_int(CurrentGearOffset), gear)
end

function setNextGear(gear)
    memory.write_byte(entities.get_user_vehicle_as_pointer() +memory.read_int(NextGearOffset), gear)
end

local isDrifting      = 0
local wasDrifting     = 0
local isDriftFinished = 1
local prevGripState   = 0
local lastDriftAngle  = 0.0
local oldGripState    = 0
local debug_notification = 0

function driftmod_ontick() 
    local player = players.user()
    local veh = getCurrentVehicle()
    local inVehicle   = veh ~= 0
    local isDriving   = true
    local mps = ENTITY.GET_ENTITY_SPEED(veh)
    local mph       = mps * 2.23694
    local kmh       = mps * 3.6

    if inVehicle and isDriving and not isDrifting and not isDriftFinished then
        isDriftFinished = true
    end
    if not inVehicle or not isDriving then
        return
    end
    local driftKeyPressed = PAD.IS_CONTROL_PRESSED(2, ControlVehicleDuck) or PAD.IS_DISABLED_CONTROL_PRESSED(2, ControlVehicleDuck) or PAD.IS_CONTROL_PRESSED(0, DriftActivateKeyboard) or PAD.IS_DISABLED_CONTROL_PRESSED(0, DriftActivateKeyboard)
    if (driftKeyPressed and getCurGear(veh) > 2) then
        setCurGear(2)
        setNextGear(2)
    end
    if driftKeyPressed then
         
        if (PAD.GET_CONTROL_NORMAL(2, ControlVehicleBrake) > 0.1) then
            PAD._SET_CONTROL_NORMAL(0, ControlVehicleBrake, 0)
            local neg = -0.3
            if (PAD.IS_CONTROL_PRESSED(2, ControlVehicleSelectNextWeapon)) then
                neg = 10
            end
            slamDatBitch(veh, neg * 1 * PAD.GET_CONTROL_NORMAL(2, ControlVehicleBrake))
        end 
        local angleOfTravel  = getHeadingOfTravel(veh)
        local angleOfHeading = ENTITY._GET_ENTITY_PHYSICS_HEADING(veh)
        local driftAngle = angleOfHeading - angleOfTravel
        if driftAngle and lastDriftAngle then
            local diff = driftAngle - lastDriftAngle
            if diff > 180.0 then
                driftAngle = driftAngle - 360.0
            end
            if diff < 180.0 then
                driftAngle = driftAngle - 360.0
            end
        end
        driftAngle     = wrap360(driftAngle)
        lastDriftAngle = driftAngle
        local zeroBasedDriftAngle = 360 - driftAngle
        if zeroBasedDriftAngle > 180 then
            zeroBasedDriftAngle = 0 - (360 - zeroBasedDriftAngle)
        end
        directx.draw_text(0,0,"Drift Angle: " .. math.floor(zeroBasedDriftAngle) .. "°", ALIGN_TOP_CENTRE,1,textDrawCol)
        local done = false
        if ((isDrifting or kmh > gs_driftMinSpeed) and (math.abs(driftAngle - 360.0) < gs_driftMaxAngle) or (driftAngle < gs_driftMaxAngle)) then
            isDrifting = 1
            isDriftFinished = 1
            if driftKeyPressed then
                if driftKeyPressed ~= oldGripState then
                    VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, driftKeyPressed)
                    oldGripState = driftKeyPressed
                end
            end
            done = true
        end
        if not done and kmh < gs_driftMinSpeed then
            if driftKeyPressed then
                if driftKeyPressed ~= oldGripState then
                    VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, driftKeyPressed)
                    oldGripState = driftKeyPressed
                end
            end
            done = true
        end
        if not done then
            if driftKeyPressed == oldGripState then
                VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
                oldGripState = 0
            end
            if math.abs(zeroBasedDriftAngle) > gs_driftMaxAngle then
                if zeroBasedDriftAngle > 0 then
                    VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 0, true)
                    VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 1, false)
                    toast("Counter-steering left ")
                    VEHICLE.SET_VEHICLE_STEER_BIAS(veh, math.rad(zeroBasedDriftAngle * 0.69))
                else
                    VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 1, true)
                    VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 0, false)
                    toast("Counter-steering right")
                    VEHICLE.SET_VEHICLE_STEER_BIAS(veh, math.rad(zeroBasedDriftAngle * 0.69))
                end
            end
		else 
			VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 0, false)
			VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(veh, 1, false)
        end
    end
    if not driftKeyPressed and prevGripState then
        isDrifting      = 0
        isDriftFinished = 0
        lastDriftAngle = 0
        if driftKeyPressed ~= oldGripState then
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, driftKeyPressed)
            oldGripState = driftKeyPressed
        end
    end
    prevGripState = driftKeyPressed
    if isDrifting ~= wasDrifting then
        wasDrifting     = isDrifting
        changedDrifting = true
    end
end

util.create_thread(function (thr)
    while true do
        if player_uses > 0 then
            if show_updates then
                toast("Player pool is being updated")
            end
            all_players = players.list(true, true, true)
        end
        for k,pid in pairs(all_players) do
            if antioppressor then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, true)
                if vehicle ~= 0 then
                  local hash = joaat("oppressor2")
                  if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
                    if meanantioppressor then
                        menu.trigger_commands("kick".. PLAYER.GET_PLAYER_NAME(pid))
                    else
                        entities.delete(vehicle)
                    end
                  end
                end
            end
            if noarmedvehs then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, true)
                if vehicle ~= 0 then
                    if VEHICLE.DOES_VEHICLE_HAVE_WEAPONS(vehicle) then 
                        entities.delete(vehicle)
                    end
                end
            end
            if christianity then
                local pc = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                local scc = {}
                scc['x'] = 122.84036
                scc['y'] = -1291.338
                scc['z'] = 29.283897
                local dist = MISC.GET_DISTANCE_BETWEEN_COORDS(scc['x'], scc['y'], scc['z'], pc['x'], pc['y'], pc['z'], true)
                if dist <= 10 then
                    FIRE.ADD_EXPLOSION(pc['x'], pc['y'], pc['z'], 12, 100.0, true, false, 0.0)
                end
            end

            if show_voicechatters then
                if NETWORK.NETWORK_IS_PLAYER_TALKING(pid) then
                    toast(PLAYER.GET_PLAYER_NAME(pid) .. " is talking")
                end
            end
        end    
        wait()
    end
end)

function Get_Distance2D(pid, v3pos)
	local pos = v3pos
	v3.setZ(pos, 0.0)
	local playerCoord = players.get_position(pid)
	playerCoord.z = 0.0
	return(math.sqrt((v3.getX(pos) - playerCoord.x)^2 + (v3.getY(pos) - playerCoord.y)^2))
end

function CheakOrbRoom(pid)
	local orbroom
    orbroom = Get_Distance2D(pid, v3.new(328.72317, 4829.09716,-58.55287))
    if orbroom < 10 and not Players[pid].orbnotify2 and players.get_name(pid) ~= "UndiscoveredPlayer" then
        toast(players.get_name(pid).." Went into the orbital room!")
        print("[ToxTool] [Orbital Room] "..players.get_name(pid).." Went into the orbital room!")
        Players[pid].orbnotify2 = true
    elseif orbroom > 10 and Players[pid].orbnotify2 and players.get_name(pid) ~= "UndiscoveredPlayer" then
        Players[pid].orbnotify2 = false
        toast(players.get_name(pid).." left the orbital room!")
        print("[ToxTool] [Orbital Room] "..players.get_name(pid).." left the orbital room!")
    end
    wait(10)
end


local is_player_dead = {}
function log_kills()
		for i = 0, 31 do
        if PLAYER.IS_PLAYER_DEAD(i) == true and players.exists(i) then
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(i)
            local killer_ent = PED.GET_PED_SOURCE_OF_DEATH(ped)
            if PED.IS_PED_A_PLAYER(killer_ent) == true and not is_player_dead[i] then
                is_player_dead[i] = true
                local killer = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(killer_ent)
                if players.get_name(killer) == players.get_name(i) then
                    print(players.get_name(i) .. " committed suicide")
                else
                    print(players.get_name(killer) .. " killed " .. players.get_name(i))
                end
            elseif players.exists(i)==1 and is_player_dead[i] then
                print(players.get_name(i) .. " died")
                is_player_dead[i] = true
            end
        else
            is_player_dead[i] = false
        end
    end
end

b_colour = {}
b_colour.new = function ()
    local self = {}
    self.new = function (r, g, b, a)
        return {
            r = r,
            g = g,
            b = b,
            a = a
        }
    end
    self.white =    {r = 255,g = 255,b = 255,a = 255}

    self.black =    {r = 0,g = 0,b = 0,a = 255}

    self.magenta =  {r = 255,g = 0,b = 255,a = 255}

    self.red =      {r = 255,g = 0,b = 0,a = 255}

    self.green =    {r = 0,g = 255,b = 0,a = 255}

    self.blue =     {r = 0,g = 0,b = 255,a = 255}

    self.to_rage = function (colour)
        return {
            r = math.floor(colour.r * 255),
            g = math.floor(colour.g * 255),
            b = math.floor(colour.b * 255),
            a = math.floor(colour.a * 255)
        }
    end
    self.to_stand = function (colour)
        return {
            r = colour.r / 255,
            g = colour.g / 255,
            b = colour.b / 255,
            a = colour.a / 255
        }
    end
    return self
end

local self = {}
    self.draw_arrow = function(pos, angle, size, colour_a, colour_b)
        local angle_cos = math.cos(angle)
        local angle_sin = math.sin(angle)
    
        local width = 0.5 * size
        local length = 1 * size
        local height = 0.25 * size
    
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * -width - angle_sin * -length),
            pos.y + (angle_sin * -width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + -height,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + height,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + -height,
            pos.x + (angle_cos * width - angle_sin * -length),
            pos.y + (angle_sin * width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + height,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * width - angle_sin * -length),
            pos.y + (angle_sin * width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * width),
            pos.y + (angle_sin * 0 + angle_cos * width),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + height,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * width),
            pos.y + (angle_sin * 0 + angle_cos * width),
            pos.z + 0,
            pos.x + (angle_cos * width - angle_sin * -length),
            pos.y + (angle_sin * width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + -height,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * -width - angle_sin * -length),
            pos.y + (angle_sin * -width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * width),
            pos.y + (angle_sin * 0 + angle_cos * width),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + -height,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * width),
            pos.y + (angle_sin * 0 + angle_cos * width),
            pos.z + 0,
            pos.x + (angle_cos * -width - angle_sin * -length),
            pos.y + (angle_sin * -width + angle_cos * -length),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -width),
            pos.y + (angle_sin * 0 + angle_cos * -width),
            pos.z + height,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
    end
    self.draw_arrow_down = function(pos, angle, size, colour_a, colour_b)
        local angle_cos = math.cos(angle)
        local angle_sin = math.sin(angle)
    
        local width = 0.5 * size
        local length = 1 * size
        local height = 0.25 * size
        
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * 0),
            pos.y + (angle_sin * 0 + angle_cos * 0),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * height),
            pos.y + (angle_sin * 0 + angle_cos * height),
            pos.z + length + height,
            pos.x + (angle_cos * width - angle_sin * 0),
            pos.y + (angle_sin * width + angle_cos * 0),
            pos.z + length,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * -height),
            pos.y + (angle_sin * 0 + angle_cos * -height),
            pos.z + length + height,
            pos.x + (angle_cos * 0 - angle_sin * 0),
            pos.y + (angle_sin * 0 + angle_cos * 0),
            pos.z + 0,
            pos.x + (angle_cos * width - angle_sin * 0),
            pos.y + (angle_sin * width + angle_cos * 0),
            pos.z + length,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * 0),
            pos.y + (angle_sin * 0 + angle_cos * 0),
            pos.z + 0,
            pos.x + (angle_cos * 0 - angle_sin * -height),
            pos.y + (angle_sin * 0 + angle_cos * -height),
            pos.z + length + height,
            pos.x + (angle_cos * -width - angle_sin * 0),
            pos.y + (angle_sin * -width + angle_cos * 0),
            pos.z + length,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * height),
            pos.y + (angle_sin * 0 + angle_cos * height),
            pos.z + length + height,
            pos.x + (angle_cos * 0 - angle_sin * 0),
            pos.y + (angle_sin * 0 + angle_cos * 0),
            pos.z + 0,
            pos.x + (angle_cos * -width - angle_sin * 0),
            pos.y + (angle_sin * -width + angle_cos * 0),
            pos.z + length,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * height),
            pos.y + (angle_sin * 0 + angle_cos * height),
            pos.z + length + height,
            pos.x + (angle_cos * 0 - angle_sin * -height),
            pos.y + (angle_sin * 0 + angle_cos * -height),
            pos.z + length + height,
            pos.x + (angle_cos * width - angle_sin * 0),
            pos.y + (angle_sin * width + angle_cos * 0),
            pos.z + length,
            colour_b.r,
            colour_b.g,
            colour_b.b,
            colour_b.a
        )
        GRAPHICS.DRAW_POLY(
            pos.x + (angle_cos * 0 - angle_sin * -height),
            pos.y + (angle_sin * 0 + angle_cos * -height),
            pos.z + length + height,
            pos.x + (angle_cos * 0 - angle_sin * height),
            pos.y + (angle_sin * 0 + angle_cos * height),
            pos.z + length + height,
            pos.x + (angle_cos * -width - angle_sin * 0),
            pos.y + (angle_sin * -width + angle_cos * 0),
            pos.z + length,
            colour_a.r,
            colour_a.g,
            colour_a.b,
            colour_a.a
        )
    end
    self.draw_quad = function (pos1_org, pos2_org, size, colour_a, colour_b, dict, texture)
        GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(dict, false)
        if GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(dict) then
            pos1 =  {x = pos1_org.x, y = pos1_org.y, z = pos1_org.z}
            pos2 =  {x = pos2_org.x, y = pos2_org.y, z = pos2_org.z}
            pos2.z = pos2.z - size * 0.5
            pos1.z = pos1.z - size * 0.5
            GRAPHICS.SET_BACKFACECULLING(false)
            GRAPHICS._DRAW_SPRITE_POLY_2(
                pos1.x,     pos1.y,             pos1.z,
                pos2.x,     pos2.y,             pos2.z,
                pos2.x,     pos2.y,             pos2.z + size,
                colour_b.r, colour_b.g, colour_b.b, colour_b.a,
                colour_b.r, colour_b.g, colour_b.b, colour_b.a,
                colour_b.r, colour_b.g, colour_b.b, colour_b.a,
                dict,
                texture,
                0, 1, 0, 
                1, 1, 0,
                0, 0, 0
            )
              GRAPHICS._DRAW_SPRITE_POLY_2(
                pos1.x,     pos1.y,             pos1.z + size,
                pos1.x,     pos1.y,             pos1.z,
                pos2.x,     pos2.y,             pos2.z + size,
                colour_a.r, colour_a.g, colour_a.b, colour_a.a,
                colour_a.r, colour_a.g, colour_a.b, colour_a.a,
                colour_a.r, colour_a.g, colour_a.b, colour_a.a,
                dict,
                texture,
                0, 0, 0,
                1, 1, 0,
                1, 0, 0
            )
        else
            util.toast("not loaded")
        end 
    end
    self.arc_line = {}
    self.arc_line.new = function ()
        arc = {}
        arc.instability = 0.75
        arc.draw = function (pos1, pos2)
            local dif = {x = pos2.x - pos1.x, y = pos2.y - pos1.y, z = pos2.z - pos1.z}
            local distance_to_cover = math.sqrt(
                (dif.x * dif.x) +
                (dif.y * dif.y) +
                (dif.z * dif.z)
            )
            local nor_dir = {x = dif.x / distance_to_cover, y = dif.y / distance_to_cover,z = dif.z / distance_to_cover}

            for _ = 0, 3, 1 do
                local distance_covered = math.random() * 1.5
                local previous_pos = pos1
                repeat
                    local current_pos = {
                        x = pos1.x + nor_dir.x * distance_covered + (math.random() - 0.5) * arc.instability,
                        y = pos1.y + nor_dir.y * distance_covered + (math.random() - 0.5) * arc.instability,
                        z = pos1.z + nor_dir.z * distance_covered + (math.random() - 0.5) * arc.instability
                    }
                    GRAPHICS.DRAW_LINE(
                        previous_pos.x, previous_pos.y, previous_pos.z,
                        current_pos.x , current_pos.y , current_pos.z,
                        0, 255, 255, 255
                    )
                    previous_pos = current_pos
                    distance_covered = distance_covered + math.random() * 1.5
                until distance_covered > distance_to_cover
                GRAPHICS.DRAW_LINE(
                    previous_pos.x, previous_pos.y, previous_pos.z,
                    pos2.x , pos2.y , pos2.z,
                    0, 255, 255, 255
                )
            end

            arc.instability = arc.instability + (0.15 - arc.instability) *  MISC.GET_FRAME_TIME() * 7
        end
        return arc
    end

 local numbers = {}
    local x_coord_ptr = memory.alloc(4)
    local y_coord_ptr = memory.alloc(4)
    local draw_numbers = function ()
        util.create_tick_handler(function() 
            local delta_time = MISC.GET_FRAME_TIME()
            for i, number in ipairs(numbers) do
                if GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(number.pos.x, number.pos.y, number.pos.z, x_coord_ptr, y_coord_ptr) then
                    local x = memory.read_float(x_coord_ptr)
                    local y = memory.read_float(y_coord_ptr)
                    local alpha = math.min(1, number.time)
                    directx.draw_text(x, y, number.num, ALIGN_CENTRE, number.size, {r = number.colour.r * alpha,g = number.colour.g * alpha,b = number.colour.b * alpha,a = number.colour.a * alpha}, false)
                    number.pos.z = number.pos.z + 0.2 * delta_time
                end
                number.time = number.time - delta_time
                if number.time < 0 then
                    table.remove(numbers, i)
                end
            end
            return #numbers ~= 0
        end)
    end
    local random_offset = 1
    self.draw_damage_number = function(entity, num, colour, size)
        pos = ENTITY.GET_ENTITY_COORDS(entity)
        random_offset_pos = {x = pos.x + (math.random() * random_offset - random_offset * 0.5),y = pos.y + (math.random() * random_offset - random_offset * 0.5),z = pos.z}
        numbers[#numbers+1] = {
            pos = random_offset_pos,
            colour = colour,
            num = num,
            size = size,
            time = 3
        }
        if #numbers == 1 then
            draw_numbers()
        end
    end


