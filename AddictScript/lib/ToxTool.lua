slaxdom = require("slaxdom")
slaxml = require("slaxml")


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

screen_effects = {
    ["ArenaEMP"] = false,
    ["ArenaEMPOut"] = false,
    ["ArenaWheelPurple"] = false,
    ["BeastIntroScene"] = false,
    ["BeastLaunch"] = false,
    ["BeastTransition"] = false,
    ["BikerFormation"] = false,
    ["BikerFormationOut"] = false,
    ["BulletTime"] = false,
    ["BulletTimeOut"] = false,
    ["CamPushInFranklin"] = false,
    ["CamPushInMichael"] = false,
    ["CamPushInNeutral"] = false,
    ["CamPushInTrevor"] = false,
    ["CarDamageHit"] = false,
    ["CarPitstopHealth"] = false,
    ["ChopVision"] = false,
    ["CrossLine"] = false,
    ["CrossLineOut"] = false,
    ["DanceIntensity01"] = false,
    ["DanceIntensity02"] = false,
    ["DanceIntensity03"] = false,
    ["DeadlineNeon"] = false,
    ["DeathFailMPDark"] = false,
    ["DeathFailMPIn"] = false,
    ["DeathFailNeutralIn"] = false,
    ["DeathFailOut"] = false,
    ["DefaultBlinkOutro"] = false,
    ["DMT_flight"] = false,
    ["DMT_flight_intro"] = false,
    ["Dont_tazeme_bro"] = false,
    ["DrivingFocus"] = false,
    ["DrivingFocusOut"] = false,
    ["DrugsDrivingIn"] = false,
    ["DrugsDrivingOut"] = false,
    ["ExplosionJosh3"] = false,
    ["FocusIn"] = false,
    ["FocusOut"] = false,
    ["Heist4CameraFlash"] = false,
    ["Heist4CameraFlash2"] = false,
    ["HeistCelebEnd"] = false,
    ["HeistCelebFail"] = false,
    ["HeistCelebFailBW"] = false,
    ["HeistCelebPass"] = false,
    ["HeistCelebPassBW"] = false,
    ["HeistLocate"] = false,
    ["HeistTripSkipFade"] = false,
    ["InchOrange"] = false,
    ["InchOrangeOut"] = false,
    ["InchPickup"] = false,
    ["InchPickupOut"] = false,
    ["InchPurple"] = false,
    ["InchPurpleOut"] = false,
    ["LostTimeDay"] = false,
    ["LostTimeNight"] = false,
    ["MenuMGFranklinIn"] = false,
    ["MenuMGFranklinOut"] = false,
    ["MenuMGHeistIn"] = false,
    ["MenuMGHeistIntro"] = false,
    ["MenuMGHeistOut"] = false,
    ["MenuMGHeistTint"] = false,
    ["MenuMGIn"] = false,
    ["MenuMGIslandHeistIn"] = false,
    ["MenuMGMichaelIn"] = false,
    ["MenuMGMichaelOut"] = false,
    ["MenuMGRemixIn"] = false,
    ["MenuMGSelectionIn"] = false,
    ["MenuMGSelectionTint"] = false,
    ["MenuMGTournamentIn"] = false,
    ["MenuMGTournamentTint"] = false,
    ["MenuMGTrevorIn"] = false,
    ["MenuMGTrevorOut"] = false,
    ["MenuSurvivalAlienIn"] = false,
    ["MinigameEndFranklin"] = false,
    ["MinigameEndMichael"] = false,
    ["MinigameEndNeutral"] = false,
    ["MinigameEndTrevor"] = false,
    ["MinigameTransitionIn"] = false,
    ["MinigameTransitionOut"] = false,
    ["MP_Bull_tost"] = false,
    ["MP_Celeb_Lose"] = false,
    ["MP_Celeb_Lose_Out"] = false,
    ["MP_Celeb_Preload"] = false,
    ["MP_Celeb_Preload_Fade"] = false,
    ["MP_Celeb_Win"] = false,
    ["MP_Celeb_Win_Out"] = false,
    ["MP_corona_switch"] = false,
    ["MP_corona_switch_supermod"] = false,
    ["MP_intro_logo"] = false,
    ["MP_job_load"] = false,
    ["MP_OrbitalCannon"] = false,
    ["MP_race_crash"] = false,
    ["MP_SmugglerCheckpoint"] = false,
    ["MP_TransformRaceFlash"] = false,
    ["MP_WarpCheckpoint"] = false,
    ["pennedIn"] = false,
    ["PennedInOut"] = false,
    ["PeyoteEndIn"] = false,
    ["PeyoteEndOut"] = false,
    ["PeyoteIn"] = false,
    ["PeyoteOut"] = false,
    ["PokerCamTransition"] = false,
    ["PPFilter"] = false,
    ["PPFilterOut"] = false,
    ["PPGreen"] = false,
    ["PPGreenOut"] = false,
    ["PPOrange"] = false,
    ["PPOrangeOut"] = false,
    ["PPPink"] = false,
    ["PPPinkOut"] = false,
    ["PPPurple"] = false,
    ["PPPurpleOut"] = false,
    ["RaceTurbo"] = false,
    ["Rampage"] = false,
    ["RampageOut"] = false,
    ["REDMIST"] = false,
    ["REDMISTOut"] = false,
    ["RemixDrone"] = false,
    ["SniperOverlay"] = false,
    ["SuccessFranklin"] = false,
    ["SuccessMichael"] = false,
    ["SuccessNeutral"] = false,
    ["SuccessTrevor"] = false,
    ["SurvivalAlien"] = false,
    ["SwitchHUDFranklinIn"] = false,
    ["SwitchHUDFranklinOut"] = false,
    ["SwitchHUDIn"] = false,
    ["SwitchHUDMichaelIn"] = false,
    ["SwitchHUDMichaelOut"] = false,
    ["SwitchHUDOut"] = false,
    ["SwitchHUDTrevorIn"] = false,
    ["SwitchHUDTrevorOut"] = false,
    ["SwitchOpenFranklin"] = false,
    ["SwitchOpenMichaelIn"] = false,
    ["SwitchOpenMichaelMid"] = false,
    ["SwitchOpenNeutralFIB5"] = false,
    ["SwitchOpenNeutralOutHeist"] = false,
    ["SwitchSceneFranklin"] = false,
    ["SwitchSceneMichael"] = false,
    ["SwitchSceneNetural"] = false,
    ["SwitchSceneNeutral"] = false,
    ["SwitchSceneTrevor"] = false,
    ["SwitchShortFranklinIn"] = false,
    ["SwitchShortFranklinMid"] = false,
    ["SwitchShortMichaelIn"] = false,
    ["SwitchShortMichaelMid"] = false,
    ["SwitchShortNeutralIn"] = false,
    ["SwitchShortTrevorIn"] = false,
    ["SwitchShortTrevorMid"] = false,
    ["TinyRacerGreen"] = false,
    ["TinyRacerGreenOut"] = false,
    ["TinyRacerIntroCam"] = false,
    ["TinyRacerPink"] = false,
    ["TinyRacerPinkOut"] = false,
    ["WeaponUpgrade"] = false
}

HudColour = {
	pureWhite = 0,
	white = 1,
	black = 2,
	grey = 3,
	greyLight = 4,
	greyDrak = 5,
	red = 6,
	redLight = 7,
	redDark = 8,
	blue = 9,
	blueLight = 10,
	blueDark = 11,
	yellow = 12,
	yellowLight = 13,
	yellowDark = 14,
	orange = 15,
	orangeLight = 16,
	orangeDark = 17,
	green = 18,
	greenLight = 19,
	greenDark = 20,
	purple = 21,
	purpleLight = 22,
	purpleDark = 23,
	radarHealth = 25,
	radarArmour = 26,
	friendly = 118,
}

Players = {
    {
        name = {}, 
        isFriend = {}, 
        orbnotify = {}, 
        orbnotify2 = {}, 
        isHost = {}, 
        isScHost = {}, 
        isTyping = {}, 
        isPaused = {}, 
        JoinTime = {}, 
        ActiveMissile = {}, 
        isRC = {}, 
        isOTR = {},
		Spectatable = {},
		isNotifSpec = {},
		OTRTNotify = {},
		OTR_Start = {},
        OTRBlipID = {}, 
        BlipPID = {}, 
        pulse = {}, 
        PedSpawned = {}, 
        bounty = {}, 
        bountyvalue = {}, 
        isUnDead = {}, 
        isPassive = {}, 
        isTalking = {}, 
        flag = {}, 
        flags = {}, 
        ismod = {}, 
        isgod = {}, 
        isKicked = {}, 
        KickedCount = {}, 
        isvgod = {}, 
        PlayerGodMode = {}, 
        PlayerVehGodMode = {}, 
        isint = {}, 
        Interiorname = {}, 
        isDead = {}, 
        isDamagedbY = {}, 
        isvis = {}, 
        speedK = {}, 
        speedM = {}, 
        InteriorThread = {}, 
        IsGodThread = {}, 
        IsGodThread1 = {},
        IsFlagRemNotif = {},
		Zone = {},
		intID = {},
		onlinecheck = {},
		online_interior = {},
		onlineintID = {},
    }
}

SoundAnnoy = {
    {"5s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
    {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET"},
    {"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset"},
    {"Checkpoint_Hit", "GTAO_FM_Events_Soundset"},
    {"Checkpoint_Teammate", "GTAO_Shepherd_Sounds"},
    {"Event_Message_Purple", "GTAO_FM_Events_Soundset"},
    {"CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Air_Defenses_Disabled", "DLC_sum20_Business_Battle_AC_Sounds"},
    {"Air_Defences_Activated", "DLC_sum20_Business_Battle_AC_Sounds"},
    {"TIME_LAPSE_MASTER", "0"},
    {"Fire", "DLC_BTL_Terrobyte_Turret_Sounds"},
    {"TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"Timer_10s", "DLC_HALLOWEEN_FVJ_Sounds"},
    {"TIMER_STOP", "HUD_MINI_GAME_SOUNDSET"},
    {"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset"},
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
    {"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET"},
    {"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET"},
    {"CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET"},
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
    {"Object_Dropped_Remote", "GTAO_FM_Events_Soundset"},
    {"Off_High", "MP_RADIO_SFX"},
    {"OK", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
    {"ON", "NOIR_FILTER_SOUNDS"},
    {"On_Call_Player_Join", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS"},
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
    {"ROUND_ENDING_STINGER_CUSTOM", "CELEBRATION_SOUNDSET"},
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
    {"Checkpoint", "DLC_Tuner_Car_Meet_Test_Area_Events_Sounds"}
}

Scenarios = {
    { "WORLD_HUMAN_AA_COFFEE", "AA Coffee" },
    { "WORLD_HUMAN_AA_SMOKE", "AA Smoking" },
    { "WORLD_HUMAN_BINOCULARS", "Binoculars" },
    { "WORLD_HUMAN_BUM_FREEWAY", "Bum Freeway" },
    { "WORLD_HUMAN_BUM_SLUMPED", "Bum Slumped" },
    { "WORLD_HUMAN_BUM_STANDING", "Bum Standing" },
    { "WORLD_HUMAN_BUM_WASH", "Bum Wash" },
    { "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Car Park Attendant" },
    { "WORLD_HUMAN_CHEERING", "Cheering" },
    { "WORLD_HUMAN_CLIPBOARD", "Clipboard" },
    { "WORLD_HUMAN_CONST_DRILL", "Drill" },
    { "WORLD_HUMAN_COP_IDLES", "Cop Idle" },
    { "WORLD_HUMAN_DRINKING", "Drinking" },
    { "WORLD_HUMAN_DRUG_DEALER", "Drug Dealer" },
    { "WORLD_HUMAN_DRUG_DEALER_HARD", "Drug Dealer Hard" },
    { "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Phone Filming" },
    { "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leaf Blower" },
    { "WORLD_HUMAN_GARDENER_PLANT", "Gardener" },
    { "WORLD_HUMAN_GOLF_PLAYER", "Golfing" },
    { "WORLD_HUMAN_GUARD_PATROL", "Guard Patrol" },
    { "WORLD_HUMAN_GUARD_STAND", "Guard Stand" },
    { "WORLD_HUMAN_GUARD_STAND_ARMY", "Guard Stand (Army)" },
    { "WORLD_HUMAN_HAMMERING", "Hammering" },
    { "WORLD_HUMAN_HANG_OUT_STREET", "Hanging Out" },
    { "WORLD_HUMAN_HIKER_STANDING", "Hiker Standing" },
    { "WORLD_HUMAN_HUMAN_STATUE", "Human Statue" },
    { "WORLD_HUMAN_JANITOR", "Janitor" },
    { "WORLD_HUMAN_JOG_STANDING", "Jog in place" },
    { "WORLD_HUMAN_LEANING", "Leaning" },
    { "WORLD_HUMAN_MAID_CLEAN", "Cleaning" },
    { "WORLD_HUMAN_MUSCLE_FLEX", "Muscle Flex" },
    { "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", "Weights" },
    { "WORLD_HUMAN_MUSICIAN", "Musician" },
    { "WORLD_HUMAN_PAPARAZZI", "Paparazzi" },
    { "WORLD_HUMAN_PARTYING", "Partying" },
    { "WORLD_HUMAN_PICNIC", "Picnic" },
    { "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prositute (High Class)" },
    { "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitute (Low Class)" },
    { "WORLD_HUMAN_PUSH_UPS", "Push Ups" },
    { "WORLD_HUMAN_SEAT_LEDGE", "Ledge Sit" },
    { "WORLD_HUMAN_SEAT_LEDGE_EATING", "Ledge Eating" },
    { "WORLD_HUMAN_SEAT_STEPS", "Sit on Steps" },
    { "WORLD_HUMAN_SEAT_WALL", "Sit on Wall" },
    { "WORLD_HUMAN_SEAT_WALL_EATING", "Eat on Wall" },
    { "WORLD_HUMAN_SEAT_WALL_TABLET", "Tablet on Wall" },
    { "WORLD_HUMAN_SECURITY_SHINE_TORCH", "Shine Torch" },
    { "WORLD_HUMAN_SIT_UPS", "Situps" },
    { "WORLD_HUMAN_SMOKING", "Smoking" },
    { "WORLD_HUMAN_SMOKING_POT", "Smoking Pot" },
    { "WORLD_HUMAN_STAND_FIRE", "Campfire" },
    { "WORLD_HUMAN_STAND_FISHING", "Fishing" },
    { "WORLD_HUMAN_STAND_IMPATIENT", "Impatient" },
    { "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", "Impatient Upright" },
    { "WORLD_HUMAN_STAND_MOBILE", "Phone" },
    { "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", "Phone Upright" },
    { "WORLD_HUMAN_STRIP_WATCH_STAND", "Watch Stand" },
    { "WORLD_HUMAN_STUPOR", "Stupor" },
    { "WORLD_HUMAN_SUNBATHE", "Sunbathe" },
    { "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back" },
    { "WORLD_HUMAN_SUPERHERO", "Superhero" },
    { "WORLD_HUMAN_SWIMMING", "Swimming" },
    { "WORLD_HUMAN_TENNIS_PLAYER", "Tennis Player" },
    { "WORLD_HUMAN_TOURIST_MAP", "Tourist Map" },
    { "WORLD_HUMAN_TOURIST_MOBILE", "Tourist Phone" },
    { "WORLD_HUMAN_VEHICLE_MECHANIC", "Mechanic" },
    { "WORLD_HUMAN_WELDING", "Welding" },
    { "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Browsing" },
    { "WORLD_HUMAN_YOGA", "Yoga" },
    { "PROP_HUMAN_ATM", "ATM" },
    { "PROP_HUMAN_BBQ", "BBQ" },
    { "PROP_HUMAN_BUM_BIN", "Bum Bin" },
    { "PROP_HUMAN_BUM_SHOPPING_CART", "BUM Shopping Cart" },
    { "PROP_HUMAN_MUSCLE_CHIN_UPS", "Muscle Chinups" },
    { "PROP_HUMAN_MUSCLE_CHIN_UPS_ARMY", "Muscle Chinups (Army)" },
    { "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON", "Muscle Chinups (Prison)" },
    { "PROP_HUMAN_PARKING_METER", "Parking Meter" },
    { "PROP_HUMAN_SEAT_ARMCHAIR", "Sit (Armchair)" },
    { "PROP_HUMAN_SEAT_BAR", "Sit (Bar)" },
    { "PROP_HUMAN_SEAT_BENCH", "Sit (Bench)" },
    { "PROP_HUMAN_SEAT_BENCH_DRINK", "Sit & Drink (Bench)" },
    { "PROP_HUMAN_SEAT_BENCH_DRINK_BEER", "Sit & Drink Beer (Bench)" },
    { "PROP_HUMAN_SEAT_BENCH_FOOD", "Sit & Eat (Bench)" },
    { "PROP_HUMAN_SEAT_BUS_STOP_WAIT", "Bus Stop Wait" },
    { "PROP_HUMAN_SEAT_CHAIR", "Sit (Chair)" },
    { "PROP_HUMAN_SEAT_CHAIR_DRINK", "Sit & Drink (Chair)" },
    { "PROP_HUMAN_SEAT_CHAIR_DRINK_BEER", "Sit & Drink Beer (Chair)" },
    { "PROP_HUMAN_SEAT_CHAIR_FOOD", "Sit & Eat (Chair)" },
    { "PROP_HUMAN_SEAT_CHAIR_UPRIGHT", "Sit Upright (Chair)" },
    { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit MP Player" },
    { "PROP_HUMAN_SEAT_COMPUTER", "Sit (Computer)" },
    { "PROP_HUMAN_SEAT_DECKCHAIR", "Sit (Deckchair)" },
    { "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", "Sit & Drink (Deckchair)" },
    { "PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS", "Bench Press" },
    { "PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON", "Bench Press (Prison)" },
    { "PROP_HUMAN_SEAT_SEWING", "Sit (Sewing)" },
    { "PROP_HUMAN_SEAT_STRIP_WATCH", "Sit (Stripclub)" },
    { "PROP_HUMAN_SEAT_SUNLOUNGER", "Sit (Sunlounger)" },
    { "PROP_HUMAN_STAND_IMPATIENT", "Impatient" },
    { "CODE_HUMAN_COWER", "Cower" },
    { "CODE_HUMAN_CROSS_ROAD_WAIT", "Cross road wait" },
    { "CODE_HUMAN_PARK_CAR", "Park Car" },
    { "PROP_HUMAN_MOVIE_BULB", "Movie Bulb" },
    { "PROP_HUMAN_MOVIE_STUDIO_LIGHT", "Movie Studio Light" },
    { "CODE_HUMAN_MEDIC_KNEEL", "Medic Kneel" },
    { "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic Tend" },
    { "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Medic Time of Death" },
    { "CODE_HUMAN_POLICE_CROWD_CONTROL", "Police Crowd Control" },
    { "CODE_HUMAN_POLICE_INVESTIGATE", "Police Investigate" },
    { "CODE_HUMAN_STAND_COWER", "Cower (Standing)" },
    { "EAR_TO_TEXT", "Ear to Text" },
    { "EAR_TO_TEXT_FAT", "Ear to Text (Fat)" }
}

DP = {}

DP.Dances = {
    ["Private dance"] = {"mini@strip_club@private_dance@part1", "priv_dance_p1", "Private dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Private dance 2"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Private dance2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Private dance 3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Private dance3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Girl dance"] = {"mp_am_stripper", "lap_dance_girl", "Girl dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Lapdance"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Funny dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_female^2", "Funny dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance F2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance F4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance F5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance Slow 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance Slow 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance Slow 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Upper", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Upper 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance Shy", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance Shy 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance Slow", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dance Silly 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dance 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Dance 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance Silly", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance Silly 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance Silly 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance Silly 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance Silly 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance Silly 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance Silly 8", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Silly 7", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 5", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dance Glowsticks", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dance Glowsticks 2", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
    }},
    ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dance Glowsticks 3", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
    }},
    ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dance Horse", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dance Horse 2", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dance Horse 3", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
}

DP.Naughty = {
   ["B"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "B", AnimationOptions =
   {
	   EmoteDuration = 1,
   }},
   ["BJ in car"] = {"mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", "BJ in car", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Sex in car"] = {"anim@mini@prostitutes@sex@veh_vstr@", "sex_loop_prostitute", "Sex in car", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Getting head"] = {"anim@mini@prostitutes@sex@veh_vstr@", "bj_loop_male", "Getting head", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Shag Male"] = {"rcmpaparazzo_2", "shag_loop_a", "Shag Male", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Shag Female"] = {"rcmpaparazzo_2", "shag_loop_poppy", "Shag Female", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Trevor sex"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Trevor sex", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Bend over"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Bend over", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Backseat_right sex_m"] = {"random@drunk_driver_2", "cardrunksex_loop_m", "Backseat_right sex_m", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["Backseat_left sex_f"] = {"random@drunk_driver_2", "cardrunksex_loop_f", "Backseat_left sex_f", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
}
 
DP.Emotes = {
    ["Cry baby"] = {"anim@mp_player_intcelebrationfemale@cry_baby", "cry_baby", "Cry baby", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Yoga male"] = {"amb@world_human_yoga@male@base", "base_b", "Yoga male", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["drink"] = {"mp_player_inteat@pnq", "loop", "Drink", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2500,
    }},
    ["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Beast", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 5000,
    }},
    ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Cloudgaze", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Cloudgaze 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["prone"] = {"missfbi3_sniping", "prone_dave", "Prone", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Pullover", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1300,
    }},
    ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 8"},
    ["idle9"] = {"friends@fra@ig_1", "base_idle", "Idle 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle10"] = {"mp_move@prostitute@m@french", "idle", "Idle 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["idle11"] = {"random@countrysiderobbery", "idle_a", "Idle 11", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Idle 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Wait 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Idle Drunk", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Idle Drunk 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Idle Drunk 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
    ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},
    ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Argue", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Argue 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Bartender", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss"},
    ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Blow Kiss 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
 
    }},
    ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy"},
    ["bringiton"] = {"misscommon@response", "bring_it_on", "Bring It On", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Come at me bro", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
    }},
    ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cop 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Cop 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Crossarms", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Crossarms 2", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Crossarms 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Crossarms 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Crossarms 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Fold Arms 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms6"] = {"random@shop_gunstore", "_idle", "Crossarms 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Fold Arms", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Crossarms Side", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Point Down", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["surrender"] = {"random@arrests@busted", "idle_a", "Surrender", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 3", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 4", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over"},
    ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 2"},
    ["fallover3"] = {"mp_suicide", "pill", "Fall Over 3"},
    ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 4"},
    ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 5"},
    ["fallasleep"] = {"mp_sleep", "sleep_loop", "Fall Asleep", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me"},
    ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 2"},
    ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Finger", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Finger 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["wait5"] = {"missclothing", "idle_storeclerk", "Wait 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Wait 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait8"] = {"rcmjosh1", "idle", "Wait 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["hiking"] = {"move_m@hiking", "idle", "Hiking", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug"},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2"},
    ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3"},
    ["inspect"] = {"random@train_tracks", "idle_e", "Inspect"},
    ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 6000,
    }},
    ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jog 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jog 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jog 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog5"] = {"move_m@joy@a", "walk", "Jog 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["kneel2"] = {"rcmextreme3", "idle", "Kneel 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Kneel 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Knock", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Knock 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Knuckle Crunch", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
    ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Lean Flirt", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean High", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean High 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside"] = {"timetable@mime@01_gc", "idle_a", "Leanside", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Leanside 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Me", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["mechanic"] = {"mini@repair", "fixing_a_ped", "Mechanic", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mechanic 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medic 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditiate", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditiate 2", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["meditate3"] = {"rcmepsilonism3", "base_loop", "Meditiate 3", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "No", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "No 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Nose Pick", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "No Way", AnimationOptions =
    {
        EmoteDuration = 1500,
        EmoteMoving = true,
    }},
    ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["outofbreath"] = {"re@construction", "out_of_breath", "Out of Breath", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pickup"] = {"random@domestic", "pickup_low", "Pickup"},
    ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["point"] = {"gestures@f@standing@casual", "gesture_point", "Point", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pushup", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["countdown"] = {"random@street_race", "grid_girl_race_start", "Countdown", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salute", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salute 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salute 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["scared"] = {"random@domestic", "f_distressed_loop", "Scared", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Scared 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["screwyou"] = {"misscommon@response", "screw_you", "Screw You", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Shake Off", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3500,
    }},
    ["shot"] = {"random@dealgonewrong", "idle_a", "Shot", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Sleep", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Shrug", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Shrug 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit Lean", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Sad", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit Scared", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit Scared 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit Scared 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Sit Drunk", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair6"] = {"timetable@maid@couch@", "base", "Sit Chair 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Sit Chair Side", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Sit Up", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Clap Angry", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Slow Clap 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clap"] = {"amb@world_human_cheering@male_a", "base", "Clap", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Slow Clap", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Slow Clap 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stumble"] = {"misscarsteal4@actor", "stumble", "Stumble", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stunned"] = {"stungun@standing", "damage", "Stunned", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["t"] = {"missfam5_yoga", "a2_pose", "T", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["t2"] = {"mp_sleep", "bind_pose_180", "T 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Think 5", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["think3"] = {"timetable@tracy@ig_8@base", "base", "Think 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
 
    ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Thumbs Up 3", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Thumbs Up 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Thumbs Up", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Type", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Type 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type3"] = {"mp_prison_break", "hack_loop", "Type 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type4"] = {"mp_fbi_heist", "loop", "Type 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warmth", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave 4", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Wave 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Wave 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave"] = {"friends@frj@ig_1", "wave_a", "Wave", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave5"] = {"friends@frj@ig_1", "wave_b", "Wave 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave6"] = {"friends@frj@ig_1", "wave_c", "Wave 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave7"] = {"friends@frj@ig_1", "wave_d", "Wave 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave8"] = {"friends@frj@ig_1", "wave_e", "Wave 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Wave 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["whistle"] = {"taxi_hail", "hail_taxi", "Whistle", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1300,
    }},
    ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Whistle 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lift"] = {"random@hitch_lift", "idle_f", "Lift", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Gang Sign", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Gang Sign 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["passout"] = {"missarmenian2", "drunk_loop", "Passout", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Passout 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Passout 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Passout 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Passout 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Petting", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["crawl"] = {"move_injured_ground", "front_loop", "Crawl", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2"},
    ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip"},
    ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide"},
    ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2"},
    ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3"},
    ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger"},
    ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Flip Off", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Flip Off 2", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Key Fob", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Golf Swing"},
    ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Reaching", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait"] = {"random@shop_tattoo", "_idle_a", "Wait", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait12"] = {"rcmjosh1", "idle", "Wait 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait13"] = {"rcmnigel1a", "base", "Wait 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt"},
    ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["ledge"] = {"missfbi1", "ledge_loop", "Ledge", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["airplane"] = {"missfbi1", "ledge_loop", "Air Plane", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Peek", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stretch"] = {"mini@triathlon", "idle_e", "Stretch", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch2"] = {"mini@triathlon", "idle_f", "Stretch 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch3"] = {"mini@triathlon", "idle_d", "Stretch 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Stretch 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Celebrate", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["punching"] = {"rcmextreme2", "loop_punching", "Punching", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["superhero"] = {"rcmbarry", "base", "Superhero", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["superhero2"] = {"rcmbarry", "base", "Superhero 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Mind Control", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Mind Control 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Try Clothes", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Try Clothes 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Try Clothes 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nervous 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nervous", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nervous 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["uncuff"] = {"mp_arresting", "a_uncuff", "Uncuff", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Threaten", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Pull", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bird"] = {"random@peyote@bird", "wakeup", "Bird"},
    ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bark"] = {"random@peyote@dog", "wakeup", "Bark"},
    ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit"},
    ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 3000,
    }},
    ["adjust"] = {"missmic4", "michael_tux_fidget", "Adjust", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 4000,
    }},
    ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},
    ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee", AnimationOptions =
    {
        EmoteStuck = true,
        PtfxAsset = "scr_amb_chop",
        PtfxName = "ent_anim_dog_peeing",
        PtfxNoProp = true,
        PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
        PtfxWait = 3000,
    }},
 
 -----------------------------------------------------------------------------------------------------------
 ------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
 -----------------------------------------------------------------------------------------------------------
 
    ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
    ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
    ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin"},
    ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
    ["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Cheer"},
    ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"},
    ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},
    ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop"},
    ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Cop Beacon"},
    ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
    ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
    ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard"},
    ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
    ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
    ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
    ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
    ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog"},
    ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
    ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leafblower"},
    ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
    ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar"},
    ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout"},
    ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
    ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
    ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
    ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
    ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
    ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
    ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Texting"},
    ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
    ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
    ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
    ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
    ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair"},
    ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
    ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke Weed"},
    ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
    ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 3"},
    ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back"},
    ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
    ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},
    ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
    ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
    ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
    ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Cut Throat"},
    ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Cut Throat 2"},
    ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind Blown", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind Blown 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Stink", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 5000
    }},
}
 
DP.PropEmotes = {
    ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Umbrella", AnimationOptions =
    {
        Prop = "p_amb_brolly_01",
        PropBone = 57005,
        PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
 
 -----------------------------------------------------------------------------------------------------
 ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
 -----------------------------------------------------------------------------------------------------
 
    ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad", AnimationOptions =
    {
        Prop = 'prop_notepad_01',
        PropBone = 18905,
        PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
        SecondProp = 'prop_pencil_01',
        SecondPropBone = 58866,
        SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
    {
        Prop = "hei_prop_heist_box",
        PropBone = 60309,
        PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
    {
        Prop = "prop_single_rose",
        PropBone = 18905,
        PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 2", AnimationOptions =
    {
        Prop = 'prop_cs_ciggy_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions =
    {
        Prop = 'prop_cs_ciggy_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke 4", AnimationOptions =
    {
        Prop = 'prop_cs_ciggy_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
    {
        Prop = 'hei_heist_sh_bong_01',
        PropBone = 18905,
        PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
    }},
    ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase", AnimationOptions =
    {
        Prop = "prop_ld_suitcase_01",
        PropBone = 57005,
        PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase 2", AnimationOptions =
    {
        Prop = "prop_security_case_01",
        PropBone = 57005,
        PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot", AnimationOptions =
    {
        Prop = 'prop_police_id_board',
        PropBone = 58868,
        PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
    {
        Prop = 'p_amb_coffeecup_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
    {
        Prop = 'prop_drink_whisky',
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer", AnimationOptions =
    {
        Prop = 'prop_amb_beer_bottle',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
    {
        Prop = 'prop_plastic_cup_02',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
    {
        Prop = 'prop_amb_donut',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
    {
        Prop = 'prop_cs_burger_01',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
    {
        Prop = 'prop_sandwich_01',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
    {
        Prop = 'prop_ecola_can',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Ego Bar", AnimationOptions =
    {
        Prop = 'prop_choc_ego',
        PropBone = 60309,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true,
    }},
    ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine", AnimationOptions =
    {
        Prop = 'prop_drink_redwine',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
    {
        Prop = 'prop_champ_flute',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
    {
        Prop = 'prop_drink_champ',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar", AnimationOptions =
    {
        Prop = 'prop_cigar_02',
        PropBone = 47419,
        PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
        EmoteMoving = true,
        EmoteDuration = 2600
    }},
    ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2", AnimationOptions =
    {
        Prop = 'prop_cigar_01',
        PropBone = 47419,
        PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
        EmoteMoving = true,
        EmoteDuration = 2600
    }},
    ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar", AnimationOptions =
    {
        Prop = 'prop_acc_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitar 2", AnimationOptions =
    {
        Prop = 'prop_acc_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric", AnimationOptions =
    {
        Prop = 'prop_el_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 2", AnimationOptions =
    {
        Prop = 'prop_el_guitar_03',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["book"] = {"cellphone@", "cellphone_text_read_base", "Book", AnimationOptions =
    {
        Prop = 'prop_novel_01',
        PropBone = 6286,
        PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
    {
        Prop = 'prop_snow_flower_02',
        PropBone = 24817,
        PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Teddy", AnimationOptions =
    {
        Prop = 'v_ilev_mr_rasberryclean',
        PropBone = 24817,
        PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Backpack", AnimationOptions =
    {
        Prop = 'p_michael_backpack_s',
        PropBone = 24818,
        PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["clipboard"] = {"missfam4", "base", "Clipboard", AnimationOptions =
    {
        Prop = 'p_amb_clipboard_01',
        PropBone = 36029,
        PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Map", AnimationOptions =
    {
        Prop = 'prop_tourist_map_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Beg", AnimationOptions =
    {
        Prop = 'prop_beggers_sign_03',
        PropBone = 58868,
        PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Make It Rain", AnimationOptions =
    {
        Prop = 'prop_anim_cash_pile_01',
        PropBone = 60309,
        PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
        EmoteMoving = true,
        EmoteLoop = true,
        PtfxAsset = "scr_xs_celebration",
        PtfxName = "scr_xs_money_rain",
        PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
        PtfxWait = 500,
    }},
    ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Camera", AnimationOptions =
    {
        Prop = 'prop_pap_camera_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
        PtfxAsset = "scr_bike_business",
        PtfxName = "scr_bike_cfid_camera_flash",
        PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
        PtfxWait = 200,
    }},
    ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Champagne Spray", AnimationOptions =
    {
        Prop = 'ba_prop_battle_champ_open',
        PropBone = 28422,
        PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
        EmoteMoving = true,
        EmoteLoop = true,
        PtfxAsset = "scr_ba_club",
        PtfxName = "scr_ba_club_champagne_spray",
        PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        PtfxWait = 500,
    }},
    ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
    {
        Prop = 'p_cs_joint_02',
        PropBone = 47419,
        PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
        EmoteMoving = true,
        EmoteDuration = 2600
    }},
    ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cig", AnimationOptions =
    {
        Prop = 'prop_amb_ciggy_01',
        PropBone = 47419,
        PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
        EmoteMoving = true,
        EmoteDuration = 2600
    }},
    ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Brief 3", AnimationOptions =
    {
        Prop = "prop_ld_case_01",
        PropBone = 57005,
        PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet", AnimationOptions =
    {
        Prop = "prop_cs_tablet",
        PropBone = 28422,
        PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet 2", AnimationOptions =
    {
        Prop = "prop_cs_tablet",
        PropBone = 28422,
        PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Phone Call", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["phone"] = {"cellphone@", "cellphone_text_read_base", "Phone", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean", AnimationOptions =
    {
        Prop = "prop_sponge_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clean2"] = {"amb@world_human_maid_clean@", "base", "Clean 2", AnimationOptions =
    {
        Prop = "prop_sponge_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
}

e_dances = {
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^5", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^6", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_phone^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_phone^2", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_vape_01^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_phone^1", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_flats_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_phone", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^4", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^3", disabled = true},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_flats_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_10_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups@med_intensity", anim = "mi_dance_crowd_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_12_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^5_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^6_face"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_crowd_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@low_intensity", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props@med_intensity", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "vehicleweapons_tula"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_hi_intensity", anim = "trans_crowd_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_low_intensity", anim = "trans_crowd_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "outro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@jumper@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@shuffle@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left_down", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "intro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "intro", disabled = true},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_center_down"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_right_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "outro"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left_up"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "med_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "high_left"},
    { dict = "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", anim = "low_center_down"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_d_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m05"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdance@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_f_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_mi_f1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_drop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_e_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_idle_c_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_f1"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_mi_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_a_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_to_ti_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_to_mi_drop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_idle_b_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "li_idle_c_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "ti_loop_m04"},
    { dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", anim = "mi_to_li_m04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_d_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_b_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_d_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_mi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_d_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_to_mi_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_si_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_ti_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_c_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_idle_f_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_idle_b_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_to_li_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_c_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_to_ti_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "li_to_hi_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f04"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "mi_loop_f01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_e_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "hi_idle_a_m01"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f03"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f02"},
    { dict = "anim@amb@nightclub_island@dancers@club@", anim = "ti_idle_a_f01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_17_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_09_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_11_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_hu_13_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_hu_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_d_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_11_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_15_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", anim = "mi_dance_facedj_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_mi_to_hi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_hi_08_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_mi_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "li_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_13_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_ba_prop_battle_vape_01"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_prop_npc_phone"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_13_v1_prop_npc_phone", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_11_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "li_dance_crowd_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_li_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1ba_prop_battle_vape_01^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_mi_09_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_15_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^flat^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_13_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_17_v1ba_prop_battle_vape_01^heel^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "li_dance_crowd_11_v1_male_^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^1", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_prop_npc_phone^flat", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_li_11_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_mi_to_hi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_15_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_11_v2_prop_npc_phone^heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_11_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_17_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "hi_dance_crowd_11_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "mi_dance_crowd_17_v1_prop_npc_phone^flat"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "li_dance_crowd_17_v1_prop_npc_phone^heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_mobile_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_gropub_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vap_heel", disabled = true},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_15_v1_vape_heel"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_17_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_13_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "mi_dance_prop_17_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_15_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "hi_dance_prop_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", anim = "li_dance_prop_13_v2_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_09_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^3"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_male^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_li_09_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_female^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_female^5"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_li_11_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_hi_07_v1_male^2"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^6"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_mi_to_hi_11_v1_female^1"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_hi_to_mi_11_v1_female^4"},
    { dict = "anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", anim = "trans_dance_prop_li_to_mi_11_v1_male^1"},
}

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

local function nil_handler(val, defaults)
    if val == nil then
        val = defaults
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
        VEHICLE.SET_AMBIENT_VEHICLE_NEON_ENABLED(vehicle, comp[k], to_boolean(v))
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

defaults = {
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

--util.require_no_lag("natives-1640181023")

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






    local self = {}
    local MissileState = 
    {
        nonExistent = -1,
        beingCreated = 0,
        onFlight = 1,
        exploting = 2,
        disconnecting = 3,
        beingDestroyed = 4
    }
    local BoundsState =
    {
        inBounds = 0,
        gettingOut = 1,
        outOfBounds = 2,
    }
    local state = MissileState.nonExistent
    local object
    local camera
    local blip
    local scaleform
    local startPos
    local sTime
    local flash_rate = 0.0
    local ptfx_asset = "scr_xs_props"
    local m_object_hash = util.joaat("xs_prop_arena_airmissile_01a")
    local scaleform = GRAPHICS.REQUEST_SCALEFORM_MOVIE("SUBMARINE_MISSILES")
    local effects = {
        missile_trail = -1
    }
    local sound =
    {
        startUp     = Sound.new("HUD_Startup", "DLC_Arena_Piloted_Missile_Sounds"),
        outOfBounds = Sound.new("Out_Of_Bounds_Alarm_Loop", "DLC_Arena_Piloted_Missile_Sounds"),
        staticLoop  = Sound.new("HUD_Static_Loop", "DLC_Arena_Piloted_Missile_Sounds"),
        disconnect  = Sound.new("HUD_Disconnect", "DLC_Arena_Piloted_Missile_Sounds")
    }
    
    
    self.exists = function ()
        return state ~= MissileState.nonExistent
    end
    
    self.create = function ()
        if not self.exists() then
            state = MissileState.beingCreated
        end
    end
    
    self.destroy_missile = function ()
        if self.exists() then
            state = MissileState.exploting
        end
    end
    
    
    local function currect_heading(heading)
        if heading > 180.0 then
            return (heading - 180.0)
        end
        return (heading + 180.0)
    end
    
    
    local function currect_rot(value)
        if value > 180 then
            value = value - 360
        end
        if value < -180 then
            value = value + 360
        end
        return value
    end
    
    
    local function draw_intructional_buttons()
        if instructional:begin() then
            instructional.add_control_group(20, "DRONE_SPACE")
            instructional.add_control_group(21, "DRONE_POSITION")
    
            if not PAD._IS_USING_KEYBOARD(0) then
                instructional.add_control(208, "DRONE_SPEEDU")
                instructional.add_control(207, "DRONE_SLOWD")
            else
                instructional.add_control(209, "DRONE_SPEEDU")
                instructional.add_control(210, "DRONE_SLOWD")
            end
            
            instructional.add_control(75, "MOVE_DRONE_RE")
            instructional:set_background_colour(0, 0, 0, 80)
            instructional:draw()
        end
    end
    
    
    local function get_script_axes()
        local left_x  = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 218)
        local left_y  = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 219)
        local right_x = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 220)
        local right_y = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 221)
        return left_x, left_y, right_x, right_y
    end
    
    
    local function set_missile_rotation()
        local max = 40.0
        local mult = 1.0
        local axis_x = 0.0
        local axis_y = 0.0
        local pitch
        local roll
        local heading
        local frame_time = 30 * MISC.GET_FRAME_TIME()
        local ent_roll = ENTITY.GET_ENTITY_ROLL(object)
        local ent_pitch = ENTITY.GET_ENTITY_PITCH(object)
        local left_x, left_y, right_x, right_y = get_script_axes()
    
        if PAD._IS_USING_KEYBOARD(0) then
            mult = 3.0
            right_x = right_x * mult
            right_y = right_y * mult
        end
        
        if PAD.IS_LOOK_INVERTED() then
            right_y = - right_y
            left_y  = - left_y
        end
    
        if (right_x ~= 0 or right_y ~= 0) or (left_x ~= 0 or left_y ~= 0) then 
            if right_x ~= 0 then
                axis_x = right_x
            elseif left_x ~= 0 then
                axis_x = left_x
            else 
                axis_x = 0 
            end
    
            if right_y ~= 0 then
                axis_y = right_y
            elseif left_y ~= 0 then
                axis_y = left_y
            else 
                axis_y = 0 
            end
    
            local ent_rot = ENTITY.GET_ENTITY_ROTATION(object, 2)
            heading = -(axis_x * 0.05) * frame_time * 20
            pitch = (axis_y * 0.05) * frame_time * 20
    
            if (ent_roll ~= 0 or right_x ~= 0) or left_x ~= 0 then
                if right_x ~= 0 then
                    axis_x = right_x
                    roll = -(axis_x * 0.05) * frame_time * (max - 25.0)
                elseif left_x ~= 0 then
                    axis_x = left_x
                    roll = -(axis_x * 0.05) * frame_time * (max - 25.0)
                else
                    if ent_rot.y ~= 0 then
                        if ent_rot.y < 0 then
                            axis_x = -1.0
                        else
                            axis_x = 1.0
                        end
                    else 
                        axis_x = 0.0 
                    end
    
                    if ent_rot.y ~= 0 then
                        if ent_rot.y < 2.0 and ent_rot.y > 0.0 then
                            axis_x = 0.0001
                        elseif ent_rot.y > -2.0 and ent_rot.y < 0.0 then
                            axis_x = -0.0001
                        end
                    else 
                        axis_x = 0.0 
                    end
                    
                    roll = -(axis_x * 0.05) * frame_time * (max - 25)
                end
            else roll = 0.0 end
    
            local rot = vect.add(vect.new(pitch, roll, heading), ent_rot) 
            if rot.y > max then
                rot.y = max
            elseif rot.y < -max then
                rot.y = -max
            end
            
            if rot.x > 80 then
                rot.x = 80
            elseif rot.x < -max then
                rot.x = -max
            end
            ENTITY.SET_ENTITY_ROTATION(object, rot.x, rot.y, rot.z, 2, true)
        else
            local ent_rot = ENTITY.GET_ENTITY_ROTATION(object, 2)
            if ent_roll ~= 0 or ent_pitch ~= 0 then
                if ent_rot.y ~= 0 then
                    if ent_rot.y < 0 then
                        axis_x = -1.0
                    else
                        axis_x = 1.0
                    end
                else 
                    axis_x = 0.0 
                end
    
                if ent_rot.y ~= 0 then
                    if ent_rot.y < 2.0 and ent_rot.y > 0.0 then
                        axis_x = 0.0001
                    elseif ent_rot.y > -2.0 and ent_rot.y < 0.0 then
                        axis_x = -0.0001
                    end
                else 
                    axis_x = 0.0 
                end
    
                if ent_rot.x ~= 0.0 then
                    if ent_rot.x < 2.0 and ent_rot.x > 0.0 then
                        axis_y = 0.0001
                    elseif ent_rot.x > -2.0 and ent_rot.x < 0.0 then
                        axis_y = -0.0001
                    end
                else 
                    axis_y = 0.0 
                end
    
                heading = currect_rot(-(( (axis_y * 0.05) * frame_time) * (max - 25)))
                roll = currect_rot(-(( (axis_x * 0.05) * frame_time) * (max - 25)))
                local rot = vect.add(vect.new(0, roll, heading), ent_rot)
                ENTITY.SET_ENTITY_ROTATION(object, rot.x, rot.y, rot.z, 2, true)
            end
        end
    end
    
    
    local lowerLimit = 2500.0^2
    local upperLimit = 3000.0^2
    
    local get_bounds_state = function (pos)
        local pos = ENTITY.GET_ENTITY_COORDS(object)
        local distance = vect.dist2(pos, startPos)
        if distance > upperLimit then
            return BoundsState.outOfBounds
        elseif distance >= lowerLimit and distance < upperLimit then
            return BoundsState.gettingOut
        end
        return BoundsState.inBounds
    end
    
    -------------------------
    -- MAIN LOOP FUNCTION
    -------------------------
    
    self.main_loop = function ()
        if state == MissileState.beingCreated then
            if PED.IS_PED_IN_ANY_VEHICLE(PLAYER.PLAYER_PED_ID(), false) then
                TASK.TASK_LEAVE_ANY_VEHICLE(PLAYER.PLAYER_PED_ID(), 0, 0)
            end
    
            ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
    
            requestModels(m_object_hash)
            NETWORK._RESERVE_NETWORK_LOCAL_OBJECTS(NETWORK.GET_NUM_RESERVED_MISSION_OBJECTS(false, 1) + 1)
            object = OBJECT.CREATE_OBJECT_NO_OFFSET(m_object_hash, coords.x, coords.y, coords.z, true, false, true)
            ENTITY.SET_ENTITY_HEADING(object, currect_heading(CAM.GET_GAMEPLAY_CAM_ROT(0).z))
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, true)
            ENTITY.SET_ENTITY_INVINCIBLE(object, true)
            ENTITY._SET_ENTITY_CLEANUP_BY_ENGINE(object, true)
            NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.OBJ_TO_NET(object), PLAYER.PLAYER_ID(), true)
            ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(object, true, 1)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.OBJ_TO_NET(object), true);
            ENTITY.SET_ENTITY_LOD_DIST(object, 700)
            NETWORK.SET_NETWORK_ID_CAN_MIGRATE(NETWORK.OBJ_TO_NET(object), false)
            ENTITY.SET_ENTITY_RECORDS_COLLISIONS(object, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(object, coords.x, coords.y, coords.z + 5, false, false, true)
            ENTITY.SET_ENTITY_HAS_GRAVITY(object, false)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(m_object_hash)
    
            camera = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", true)
            CAM.SET_CAM_FOV(camera, 80)
            CAM.SET_CAM_NEAR_CLIP(camera, 0.01)
            CAM.SET_CAM_NEAR_DOF(camera, 0.01)
            GRAPHICS.CLEAR_TIMECYCLE_MODIFIER()
            GRAPHICS.SET_TIMECYCLE_MODIFIER("eyeinthesky")
            ATTACH_CAM_TO_ENTITY_WITH_FIXED_DIRECTION(camera, object, 0.0, 0.0, 180.0, 0.0, -0.9, 0.0, 1)
            CAM.RENDER_SCRIPT_CAMS(true, false, 0, true, true, 0)
    
            GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_WARNING_IS_VISIBLE")
            GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(false)
            GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
    
            GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_ZOOM_VISIBLE")
            GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(false)
            GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
    
            if not AUDIO.IS_AUDIO_SCENE_ACTIVE("dlc_aw_arena_piloted_missile_scene") then
                AUDIO.START_AUDIO_SCENE("dlc_aw_arena_piloted_missile_scene")
            end
    
            sound.startUp:play()
            requestPtfxAsset(ptfx_asset)
            GRAPHICS.USE_PARTICLE_FX_ASSET(ptfx_asset)
            effects.missile_trail = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY(
                "scr_xs_guided_missile_trail", 
                object, 
                0.0, 0.0, 0.0, 
                0.0, 0.0, 0.0, 
                1.0,
                false, false, false
            )
    
            blip = HUD.ADD_BLIP_FOR_COORD(coords.x, coords.y, coords.z)
            HUD.SET_BLIP_SCALE(blip, 1.0)
            HUD.SET_BLIP_ROUTE(blip, 0)
            HUD.SET_BLIP_SPRITE(blip, 548)
    
            startPos = coords
            state = MissileState.onFlight
        elseif state == MissileState.onFlight then
            local force_mag
            local accelerating
            local decelerating
            local coords    = ENTITY.GET_ENTITY_COORDS(object, true)
            local velocity  = ENTITY.GET_ENTITY_VELOCITY(object)
            local rotation  = CAM.GET_CAM_ROT(camera, 2)
            local heading   = currect_heading( ENTITY.GET_ENTITY_HEADING(object) )
            local direction = toDirection(rotation)
    
            disablePhone()
            HUD.SET_BLIP_DISPLAY(blip, 2)
            HUD.SET_BLIP_COORDS(blip, coords.x, coords.y, coords.z)
            HUD.LOCK_MINIMAP_POSITION(coords.x, coords.y)
            HUD.SET_BLIP_ROTATION(blip, round(heading))
            HUD.SET_BLIP_PRIORITY(blip, 9)
            HUD.LOCK_MINIMAP_ANGLE(round(heading))
    
            if NETWORK.NETWORK_HAS_CONTROL_OF_NETWORK_ID(NETWORK.OBJ_TO_NET(object))  then
                if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(object) or ENTITY.GET_LAST_MATERIAL_HIT_BY_ENTITY(object) ~= 0 or
                ENTITY.IS_ENTITY_IN_WATER(object) or PAD.IS_CONTROL_JUST_PRESSED(2, 75) then
                    self.destroy_missile()
                end
    
                if not PAD._IS_USING_KEYBOARD(0) then
                    if PAD.GET_CONTROL_UNBOUND_NORMAL(2, 208) ~= 0 then
                        accelerating = true
                    end
                    if PAD.GET_CONTROL_UNBOUND_NORMAL(2, 207) ~= 0 then
                        decelerating = true
                    end
                else
                    if PAD.GET_CONTROL_UNBOUND_NORMAL(2, 209) ~= 0 then
                        accelerating = true
                    end
                    if PAD.GET_CONTROL_UNBOUND_NORMAL(2, 210) ~= 0 then
                        decelerating = true
                    end
                end
                
                if accelerating then
                    force_mag = 150.0
                elseif decelerating then
                    force_mag = 50.0
                else
                    force_mag = 100.0
                end
        
                local force = vect.mult(direction, force_mag)
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, force.x, force.y, force.z, false, false, false, false)
                set_missile_rotation()
                STREAMING.SET_FOCUS_POS_AND_VEL(coords.x, coords.y, coords.z, velocity.x, velocity.y, velocity.z)
                if MISC.GET_FRAME_COUNT() % 120 == 0 then
                    PED.SET_SCENARIO_PEDS_SPAWN_IN_SPHERE_AREA(coords.x, coords.y, coords.z, 60.0, 30);
                end
                
                GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_ALT_FOV_HEADING")
                GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(0)
                GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(0)
                GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(rotation.z)
                GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
    
                local bounds_state = get_bounds_state()
                if bounds_state == BoundsState.gettingOut then
                    sound.outOfBounds:play()
    
                    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_WARNING_IS_VISIBLE")
                    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(true)
                    GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
                
                    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_WARNING_FLASH_RATE")
                    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(0.5)
                    GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
                elseif bounds_state == BoundsState.inBounds then
                    sound.outOfBounds:stop()
                    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_WARNING_IS_VISIBLE")
                    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL(false)
                    GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
                elseif bounds_state == BoundsState.outOfBounds then
                    self.destroy_missile()
                end
    
                GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(scaleform, 255, 255, 255, 0, 1)
                draw_intructional_buttons()
            else
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object) 
            end
        elseif state == MissileState.exploting then
            local coord = CAM.GET_CAM_COORD(camera)
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), coord.x, coord.y, coord.z, 59, 15.0, true, false, 1.0, false)
            PAD.SET_PAD_SHAKE(0, 300, 200)
            NETWORK.NETWORK_FADE_OUT_ENTITY(object, false, true)
            sound.startUp:stop()
            sound.outOfBounds:stop()
    
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(effects.missile_trail) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(effects.missile_trail, false)
                STREAMING.REMOVE_NAMED_PTFX_ASSET(ptfx_asset)
            end
    
            if HUD.DOES_BLIP_EXIST(blip) then
                util.remove_blip(blip)
            end
    
            state = MissileState.disconnecting
        elseif state == MissileState.disconnecting then
            if not sTime then
                sound.staticLoop:play()
                GRAPHICS.SET_TIMECYCLE_MODIFIER("MissileOutOfRange")
                sTime = cTime()
            elseif ( cTime() - sTime ) >= 1000 then
                sound.staticLoop:stop()
                CAM.DESTROY_ALL_CAMS(true)
                CAM.DESTROY_CAM(camera, false)
                CAM.RENDER_SCRIPT_CAMS(false, false, 0, true, false, 0)
                STREAMING.CLEAR_FOCUS()
    
                sTime = nil
                state = MissileState.beingDestroyed
            end
        elseif state == MissileState.beingDestroyed then
            if not sTime then
                sound.disconnect:play()
                sTime = cTime()
            elseif ( cTime() - sTime ) >= 500 then
                sound.disconnect:stop()
                if AUDIO.IS_AUDIO_SCENE_ACTIVE("dlc_aw_arena_piloted_missile_scene") then
                    AUDIO.STOP_AUDIO_SCENE("dlc_aw_arena_piloted_missile_scene")
                end
                GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
                entities.delete_by_handle(object)
                HUD.UNLOCK_MINIMAP_ANGLE()
                HUD.UNLOCK_MINIMAP_POSITION()
                ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
                
                sTime = nil
                state = MissileState.nonExistent
            end
        end
    end
    
    
    self.on_stop = function ()
        if self.exists() then
            for _, s in pairs(sound) do
                s:stop()
            end
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(effects.missile_trail) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(effects.missile_trail, false)
                STREAMING.REMOVE_NAMED_PTFX_ASSET(ptfx_asset)
            end
            if AUDIO.IS_AUDIO_SCENE_ACTIVE("dlc_aw_arena_piloted_missile_scene") then
                AUDIO.STOP_AUDIO_SCENE("dlc_aw_arena_piloted_missile_scene")
            end
            if HUD.DOES_BLIP_EXIST(blip) then
                util.remove_blip(blip)
            end
            CAM.DESTROY_ALL_CAMS(true)
            CAM.DESTROY_CAM(camera, false)
            CAM.RENDER_SCRIPT_CAMS(false, false, 0, true, false, 0)
            STREAMING.CLEAR_FOCUS()
            
            GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
            entities.delete_by_handle(object)
            HUD.UNLOCK_MINIMAP_ANGLE()
            HUD.UNLOCK_MINIMAP_POSITION()
            ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false) 
        end
    end
    
    return self
    