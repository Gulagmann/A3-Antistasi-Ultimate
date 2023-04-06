private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "CISEF"] call _fnc_saveToTemplate;

["flag", "Flag_CISEF_F"] call _fnc_saveToTemplate;
["flagTexture", "\cisef_core\data\Flag_CISEF.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "CISEF_Marker_CISEF"] call _fnc_saveToTemplate;

["vehicleBasic", "I_G_Quadbike_01_F"] call _fnc_saveToTemplate;
["vehicleLightUnarmed", "CISEF_Car_Offroad_Pacific"] call _fnc_saveToTemplate;
["vehicleLightArmed", "CISEF_Car_Dagor_M2_Pacific"] call _fnc_saveToTemplate;
["vehicleTruck", "I_G_Van_01_transport_F"] call _fnc_saveToTemplate;
["vehicleAT", "CISEF_Car_Dagor_Metis_Pacific"] call _fnc_saveToTemplate;
private _vehicleAA = "";

["vehicleBoat", "I_C_Boat_Transport_02_F"] call _fnc_saveToTemplate;
["vehicleRepair", "CISEF_Car_Offroad_Rep_Pacific"] call _fnc_saveToTemplate;
["vehicleFuel", "CISEF_Car_Typhoon_Fuel_Pacific"] call _fnc_saveToTemplate;

["vehiclePlane", "I_C_Plane_Civil_01_F"] call _fnc_saveToTemplate;
["vehiclePayloadPlane", "I_C_Plane_Civil_01_F"] call _fnc_saveToTemplate;

["vehicleCivCar", "C_Offroad_01_F"] call _fnc_saveToTemplate;
["vehicleCivTruck", "C_Van_01_transport_F"] call _fnc_saveToTemplate;
["vehicleCivHeli", "C_Heli_Light_01_civil_F"] call _fnc_saveToTemplate;
["vehicleCivBoat", "C_Rubberboat"] call _fnc_saveToTemplate;
["vehicleCivSupply", "C_Van_01_box_F"] call _fnc_saveToTemplate;

["staticMG", "CISEF_Trt_M2_high_Pacific"] call _fnc_saveToTemplate;
["staticAT", "I_static_AT_F"] call _fnc_saveToTemplate;
private _staticAA = "I_static_AA_F";
["staticMortar", "I_G_Mortar_01_F"] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

//Static weapon definitions
["baggedMGs", [["CISEF_B_M2_high_weapon_Pacific","CISEF_B_M2_high_support_Pacific"]]] call _fnc_saveToTemplate;
["baggedAT", [["I_AT_01_weapon_F","I_G_HMG_02_support_F"]]] call _fnc_saveToTemplate;
["baggedAA", [["I_AA_01_weapon_F","I_G_HMG_02_support_F"]]] call _fnc_saveToTemplate;
["baggedMortars", [["I_Mortar_01_weapon_F","I_Mortar_01_support_F"]]] call _fnc_saveToTemplate;

["mineAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["mineAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

if (_hasWs) then {
  _vehicleAA = "I_Tura_Truck_02_aa_lxWS";
  _staticAA = "I_Tura_ZU23_lxWS";
};
["vehicleAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

//classname, price, type, availability condition
private _shopCISEF =
    [
        ["CISEF_Heli_AP5_Pacific", 3000, "UAV", {tierWar > 2}],
        ["CISEF_Heli_AP5_IED_Pacific", 4500, "UAV", {tierWar > 3}],
        ["CISEF_Tank_ED1D_Pacific", 1000, "UAV", {true}],
        ["CISEF_Car_Dagor_M134_Pacific", 1500, "ARMEDCAR", {true}],
        ["CISEF_Car_Fennek_AA_Pacific", 6000, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Car_Fennek_Recon_Pacific", 2000, "UNARMEDCAR", {true}],
        ["CISEF_Car_Fennek_M2_Pacific", 3000, "ARMEDCAR", {true}],
        ["CISEF_Car_Arma_Pacific", 3500, "APC", {true}],
        ["CISEF_Car_Arma_M2_Pacific", 5000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Car_Badger_MCT30M_Pacific", 15000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Car_Badger_MCT127_Pacific", 12500, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Car_Badger_MCTMortar_Pacific", 10000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Car_Badger_MCTGAU_Pacific", 13750, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
        ["CISEF_Heli_Littlebird_Pacific", 5000, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}],
        ["CISEF_Heli_Littlebird_Armed_Pacific", 12500, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}],
        ["CISEF_Heli_Kasatka_Pacific", 17500, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}],
        ["CISEF_Heli_Merlin_Pacific", 20000, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}]
    ];

["blackMarketStock", _shopCISEF] call _fnc_saveToTemplate;

["lootCrate", "A3AP_CISEF_Box_Rugged_Loot_Olive"] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "hgun_ACPC2_F", "hgun_PDW2000_F",
    "30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag", "9Rnd_45ACP_Mag",
    "MiniGrenade", "SmokeShell",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CISEF_B_Assaultbag_Pacific","CISEF_B_Assaultbag_Pacific_S", "B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk","B_AssaultPack_sgg",
    "CISEF_B_Legstrap_Pacific",
    "CISEF_B_Messengerbag_Pacific","CISEF_B_Messengerbag_Pacific_S",
    "CISEF_V_Belt_Pacific","CISEF_V_Belt_H_Pacific", "V_Rangemaster_belt",
    "CISEF_V_Chestrig_Var1_Pacific","CISEF_V_Chestrig_Var1_H_Pacific",
    "CISEF_V_Chestrig_Var2_Pacific","CISEF_V_Chestrig_Var2_H_Pacific",
    "CISEF_V_Chestrig_Var3_Pacific","CISEF_V_Chestrig_Var3_H_Pacific",
    "Binocular","acc_flashlight", "Laserbatteries","acc_flashlight_smg_01","acc_flashlight_pistol"];

if (_hasLawsOfWar) then {
    _initialRebelEquipment append [
        "V_Pocketed_olive_F",
        "V_Pocketed_coyote_F",
        "V_Pocketed_black_F"
    ];
};

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
        ["launch_RPG7_Woodland_F", 3],
        ["RPG7_F", 9]
    ];

} else {
    _initialRebelEquipment append [["launch_RPG7_Woodland_F", 3], ["RPG7_F", 9]];
};

private _civilianBackpacks =  ["B_FieldPack_blk", "B_AssaultPack_blk"];
if (_hasLawsOfWar) then {
    _civilianBackpacks append [
        "B_Messenger_Black_F",
        "B_Messenger_Coyote_F",
        "B_Messenger_Gray_F",
        "B_Messenger_Olive_F",
        "B_LegStrapBag_black_F",
        "B_LegStrapBag_coyote_F",
        "B_LegStrapBag_olive_F"
    ];
};

["civilianBackpacks", _civilianBackpacks createHashMapFromArray []] call _fnc_saveToTemplate;

_initialRebelEquipment append _civilianBackpacks;

    ["uniforms", [
        "CISEF_U_Casual_BlackWhite_Pacific",
        "CISEF_U_Casual_RedBlack_Pacific",
        "CISEF_U_Casual_Skyblue_Pacific",
        "CISEF_U_Casual_GreenRed_Pacific",
        "CISEF_U_Casual_BlackBrown_Pacific",
        "CISEF_U_Casual_RedOrange_Pacific",
        "CISEF_U_Casual_BlueYellow_Pacific",
        "CISEF_U_Casual_YellowFlower_Pacific",
        "CISEF_U_C1_Pacific",
        "CISEF_U_C1_H_Pacific",
        "CISEF_U_C1_SS_H_Pacific",
        "CISEF_U_C1_2_Pacific",
        "CISEF_U_C1_2_H_Pacific",
        "CISEF_U_C1_2_SS_H_Pacific",
        "CISEF_U_C2_Pacific",
        "CISEF_U_C2_O_Pacific",
        "CISEF_U_B1_Pacific",
        "CISEF_U_B1_H_Pacific",
        "CISEF_U_B1_SS_H_Pacific",
        "CISEF_U_B1_2_Pacific",
        "CISEF_U_B1_2_H_Pacific",
        "CISEF_U_B1_2_SS_H_Pacific",
        "CISEF_U_B1_COAT_Pacific",
        "CISEF_U_B1_COAT_H_Pacific",
        "CISEF_U_A1_Pacific",
        "CISEF_U_A1_H_Pacific",
        "CISEF_U_A1_SS_H_Pacific",
        "CISEF_U_A1_TEE_Pacific",
        "CISEF_U_A1_SHRT_Pacific",
        "CISEF_U_A1_COAT_Pacific",
        "CISEF_U_A1_COAT_H_Pacific"
    ]] call _fnc_saveToTemplate;

    ["headgear", [
        "CISEF_H_Woolhat_Pacific",
        "CISEF_H_Woolhat_M_Pacific",
        "CISEF_H_Milcap_Pacific",
        "CISEF_H_Milcap_M_Pacific",
        "CISEF_H_Cap_Pacific",
        "CISEF_H_Cap_B_Pacific",
        "CISEF_H_Cap_M_Pacific",
        "CISEF_H_Boonie_Pacific",
        "CISEF_H_Boonie_M_Pacific",
        "CISEF_H_Boonie_N_Pacific",
        "CISEF_H_Beret_Peasant",
        "CISEF_H_Beret_Com",
        "CISEF_H_Bandana_Pacific",
        "CISEF_H_Bandana_M_Pacific"
    ]] call _fnc_saveToTemplate;

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "tf_anprc155_coyote"};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "TFAR_anprc155_coyote"};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

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
