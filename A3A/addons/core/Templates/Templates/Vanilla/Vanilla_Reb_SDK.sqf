private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Syndikat"] call _fnc_saveToTemplate;

["flag", "Flag_Syndikat_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_Exp\Flags\flag_SYND_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Syndicat"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["I_G_Offroad_01_F", "I_C_Offroad_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["I_C_Offroad_02_LMG_F", "I_G_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["I_C_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesAT", ["I_G_Offroad_01_AT_F", "I_C_Offroad_02_AT_F"]] call _fnc_saveToTemplate;
private _vehicleAA = [];

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_02_unarmed_F", "C_SUV_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Truck_02_transport_F", "C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F","vn_o_vc_static_dshkm_high_01","vn_o_vc_static_dshkm_low_02","vn_o_vc_static_dshkm_low_01","vn_o_vc_static_mg42_low","vn_o_vc_static_mg42_high"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F","vn_o_vc_static_d44","vn_o_nva_navy_static_type56rr","vn_b_army_static_m101_02"]] call _fnc_saveToTemplate;
private _staticAA = ["I_static_AA_F","vn_o_nva_navy_static_zpu4"];
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

if (_hasWs) then {
  _vehicleAA pushBack "I_Tura_Truck_02_aa_lxWS";
  _staticAA pushBack "I_Tura_ZU23_lxWS";
};
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

//classname, price, type, availability condition
private _shopWs = if (_hasWs) then {
    [
        ["I_UAV_02_lxWS", 3500, "UAV", {tierWar > 2}], 
        ["I_G_UAV_02_IED_lxWS", 4500, "UAV", {tierWar > 3}],
        ["I_G_Offroad_01_armor_base_lxWS", 4500, "UNARMEDCAR", {true}],
        ["I_G_Offroad_01_armor_armed_lxWS", 4500, "ARMEDCAR", {true}],
        ["I_G_Offroad_01_armor_AT_lxWS", 4500, "ARMEDCAR", {true}],
        ["vn_b_armor_m67_01_01", 6000, "Medium Tank", {tierWar > 3}],
        ["vn_b_armor_m48_01_01", 6000, "Medium Flame Tank", {tierWar > 3}],
        ["vn_i_armor_type63_01", 6000, "Light Tank", {tierWar > 3}],
        ["B_ION_Pickup_aat_rf", 15000, "Pickup AA", {tierWar > 5}],
        ["B_MBT_01_mlrs_F", 100000, "Artillery", {tierWar > 8}],
        ["O_G_Pickup_mrl_rf", 20000, "Pickup Artillery", {tierWar > 6}]
    ]
} else {
    []
};

private _vehiclesBlackMarket = _shopWs + [
    ["I_UAV_01_F", 2000, "UAV", {true}],
    ["I_LT_01_AA_F", 7500, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],
    ["I_APC_Wheeled_03_cannon_F", 15000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
    ["B_Heli_Light_01_dynamicLoadout_F", 25000, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}]
];
["blackMarketStock", _vehiclesBlackMarket] call _fnc_saveToTemplate;

["variants", [
    ["I_APC_Wheeled_03_cannon_F", ["Guerilla_01",1]],
    ["I_LT_01_AA_F", ["Indep_Olive",1]]
]] call _fnc_saveToTemplate;

#include "Vanilla_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "hgun_Pistol_heavy_02_F",
    "hgun_PDW2000_F",
    "30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag",
    "6Rnd_45ACP_Cylinder","MiniGrenade","SmokeShell",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_khk",
    "V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacChestrig_cbr_F",
    "Binocular",
    "acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol",
    "vn_m9130",
    "vn_m9130_mag",
    "vn_izh54_shorty",
    "vn_izh54_so_mag",
    "vn_izh54",
    "vn_izh54_mag",
    "vn_sten",
    "vn_sten_mag",
    "vn_vz54",
    "vn_m38_mag",
    "vn_ppsh41",
    "vn_ppsh41_35_mag",
    "vn_mp40",
    "vn_mp40_mag",
    "vn_molotov_grenade_mag",
    "vn_satchelcharge_02_throw_mag",
    "IxWS_H_turban_01_black","IxWS_H_turban_02_black","IxWS_H_turban_03_black","IxWS_H_turban_04_black",
    "IxWS_H_turban_01_blue","IxWS_H_turban_02_blue","IxWS_H_turban_03_blue","IxWS_H_turban_04_blue",
    "IxWS_H_turban_01_blue_una","IxWS_H_turban_02_blue_una","IxWS_H_turban_03_blue_una","IxWS_H_turban_04_blue_una",
    "IxWS_H_turban_01_green","IxWS_H_turban_02_green","IxWS_H_turban_03_green","IxWS_H_turban_04_green",
    "IxWS_H_turban_01_green_pattern","IxWS_H_turban_02_green_pattern","IxWS_H_turban_03_green_pattern","IxWS_H_turban_04_green_pattern",
    "IxWS_H_turban_01_orange","IxWS_H_turban_02_orange","IxWS_H_turban_03_orange","IxWS_H_turban_04_orange",
    "IxWS_H_turban_01_red","IxWS_H_turban_02_red","IxWS_H_turban_03_red","IxWS_H_turban_04_red",
    "IxWS_H_turban_01_sand","IxWS_H_turban_02_sand","IxWS_H_turban_03_sand","IxWS_H_turban_04_sand",
    "IxWS_H_turban_01_white","IxWS_H_turban_02_white","IxWS_H_turban_03_white","IxWS_H_turban_04_white",
    "IxWS_H_turban_01_yellow","IxWS_H_turban_02_yellow","IxWS_H_turban_03_yellow","IxWS_H_turban_04_yellow",
    "U_IxWS_C_Djella_03",
    "U_IxWS_C_Djella_06",
    "U_IxWS_C_Djella_02",
    "U_IxWS_C_Djella_02a",
    "U_IxWS_C_Djella_07",
    "U_IxWS_C_Djella_05",
    "U_IxWS_C_Djella_04",
    "U_IxWS_C_Djella_01",
    "U_IxWS_Tak_02_B",
    "U_IxWS_Tak_02_C",
    "U_IxWS_Tak_02_A",
    "U_IxWS_Tak_03_B",
    "U_IxWS_Tak_03_A",
    "U_IxWS_Tak_03_C",
    "U_IxWS_Tak_01_C",
    "U_IxWS_Tak_01_B",
    "U_IxWS_Tak_01_A
];

if (_hasLawsOfWar) then {
    _initialRebelEquipment append [
        "V_Pocketed_olive_F", 
        "V_Pocketed_coyote_F", 
        "V_Pocketed_black_F"
    ];
};

private _backpacks =  [];
if (_hasLawsOfWar) then {
    _backpacks append [
        "B_Messenger_Black_F", 
        "B_Messenger_Coyote_F", 
        "B_Messenger_Gray_F",
        "B_Messenger_Olive_F", 
        "B_LegStrapBag_black_F", 
        "B_LegStrapBag_coyote_F", 
        "B_LegStrapBag_olive_F"
    ];
} else {
    _backpacks append ["B_FieldPack_blk","B_AssaultPack_blk"];
};

_initialRebelEquipment append _backpacks;

if (_hasContact) then {
    _initialRebelEquipment append [
        "sgun_HunterShotgun_01_F",
        "sgun_HunterShotgun_01_sawedoff_F",
        "2Rnd_12Gauge_Pellets",
        "2Rnd_12Gauge_Slug"
    ];
};

if (_hasApex) then {
    _initialRebelEquipment append [
        "hgun_Pistol_01_F",
        "10Rnd_9x21_Mag",
        ["launch_RPG7_F", 3], 
        ["RPG7_F", 9]
    ];
} else {
    _initialRebelEquipment append [["launch_RPG32_F", 2], ["RPG32_F", 6]];
};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Camo_F",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3"
];

private _dlcUniforms = [];

if (_hasWs) then {
    _dlcUniforms append [
        "U_lxWS_ION_Casual1",
        "U_lxWS_ION_Casual2",
        "U_lxWS_ION_Casual3",
        "U_lxWS_ION_Casual4",
        "U_lxWS_ION_Casual5",
        "U_lxWS_SFIA_deserter"
    ];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Cap_oli",
    "H_Cap_grn",
    "H_Booniehat_oli",
    "H_Bandanna_sgg",
    "H_Bandanna_khk"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
