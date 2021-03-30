if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

// ["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

["grad_grandPrix_plank_result", {
    [] call grad_grandPrix_fnc_plankGroupResult;
}] call CBA_fnc_addEventHandler;

["grad_grandPrix_race_triggerCountdown", {
    playSound "raceCountdown";
    ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\3.paa'/>",0,0,1,0] spawn BIS_fnc_dynamicText;

    [{

        ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\2.paa'/>",0,0,1,0] spawn BIS_fnc_dynamicText;

        [{

            ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\1.paa'/>",0,0,1,0] spawn BIS_fnc_dynamicText;

            [{
                ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\go.paa'/>",0,0,1,0] spawn BIS_fnc_dynamicText;
            }, [], 1] call CBA_fnc_waitAndExecute;
        }, [], 1] call CBA_fnc_waitAndExecute;
    }, [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["grad_grandPrix_race_result", {
    [] call grad_grandPrix_fnc_results;
}] call CBA_fnc_addEventHandler;

private _info = uiNamespace getVariable "grad_grandPrix_transferGroupInfo";
if !(isNil "_info") then {
    ["grad_grandPrix_setGroup", [player, _info]] call CBA_fnc_serverEvent;
};

player allowDamage false;

player addEventHandler ["GetIn", {
	params ["_vehicle"];

    player allowDamage false;
    if (local _vehicle) then {
        _vehicle allowDamage false;
    };
}];

player addEventHandler ["GetOut", {
	params ["_vehicle"];

    player allowDamage false;
}];