#include "..\functions.h"

/*
	Author: [SA] Duda

	Description:
	Initializes Command Menu Actions

	Parameter(s):
	None
		
	Returns: 
	Nothing
*/

AIC_fnc_addWaypointsActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	AIC_fnc_setGroupControlAddingWaypoints(_groupControlId,true);
};

["GROUP","Add Waypoints",[],AIC_fnc_addWaypointsActionHandler] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Add Waypoints",[],AIC_fnc_addWaypointsActionHandler] call AIC_fnc_addCommandMenuAction;

AIC_fnc_joinGroupActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_selectedGroup"];
	_selectedGroup = [_groupControlId] call AIC_fnc_selectGroupControlGroup;
	if(!isNull _selectedGroup) then {
		(units _group) joinSilent _selectedGroup;
		hint ("Selected Group Merged");
	} else {
		hint ("No Group Selected");
	};
};

["GROUP","Merge Group",[],AIC_fnc_joinGroupActionHandler,[]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_splitGroupHalfActionHandler = {
    params ["_menuParams", "_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group", "_allUnits", "_halfCount", "_unitsToMove"];

    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    _allUnits = units _group;

    _halfCount = ceil((count _allUnits) / 2);

    _unitsToMove = _allUnits select [_halfCount, (count _allUnits) - _halfCount];

    if ((count _unitsToMove) == 0) exitWith {
        hint "Not enough units to seperate!";
    };

    private _group2 = createGroup (side _group);
    {
        [_x] joinSilent _group2;
    } forEach _unitsToMove;

	hint format ["Seperated %1 units. %2 units remain", _halfCount, count _unitsToMove];
};

AIC_fnc_splitGroupFirstNActionHandler = {
    params ["_menuParams", "_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group", "_numUnits", "_remainingUnits"];
    
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    _actionParams params ["_numUnits"];
    
    private _allUnits = units _group;

    if ((count _allUnits) <= _numUnits) exitWith {
        hint ("Not enough units to seperate into a new group!");
    };
    
    private _remainingUnits = _allUnits select [_numUnits, (count _allUnits) - _numUnits];
    private _group2 = createGroup (side _group);
    {
        [_x] joinSilent _group2;
    } forEach _remainingUnits;

    hint format ["Seperated %1 units. %2 units remain", count _remainingUnits, _numUnits];
};

["GROUP", "Leave Group", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [1], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 1;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate Units in Half", ["Seperate Group"], AIC_fnc_splitGroupHalfActionHandler, [], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 1;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 2 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [2], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 2;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 3 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [3], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 3;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 4 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [4], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 4;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 5 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [5], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 5;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 6 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [6], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 6;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 7 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [7], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 7;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 8 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [8], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 8;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 9 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [9], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 9;
}] call AIC_fnc_addCommandMenuAction;

["GROUP", "Seperate 10 Units", ["Seperate Group"], AIC_fnc_splitGroupFirstNActionHandler, [10], {
    params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    count units _group > 10;
}] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setGroupStayInPlaceActionHandler = {
    params ["_menuParams", "_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    _actionParams params ["_mode"];
    
    if (_mode == "On") then {
        { _x disableAI "MOVE"; } forEach (units _group);
        hint "Group is holding position";
    } else {
        { _x enableAI "MOVE"; } forEach (units _group);
        hint "Group is on the move";
    };
};

["GROUP", "Set to Hold Position", ["Adjust Group"], AIC_fnc_setGroupStayInPlaceActionHandler, ["On"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Set to Start Moving", ["Adjust Group"], AIC_fnc_setGroupStayInPlaceActionHandler, ["Off"]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setGroupFormationActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_mode"];
	[_group,_mode] remoteExec ["setFormation", leader _group]; 
	hint ("Formation set to " + toLower _mode);
};

["GROUP","Column",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["COLUMN"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Stag. Column",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["STAG COLUMN"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Wedge",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["WEDGE"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Echelon Left",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["ECH LEFT"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Echelon Right",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["ECH RIGHT"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Vee",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["VEE"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Line",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["LINE"]] call AIC_fnc_addCommandMenuAction;
["GROUP","File",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["FILE"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Diamond",["Adjust Group", "Set Group Formation"],AIC_fnc_setGroupFormationActionHandler,["DIAMOND"]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setWaypointFormationActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
	private ["_group","_waypoint"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_waypoint = [_group, _waypointId] call AIC_fnc_getWaypoint;
	_actionParams params ["_mode"];
	_waypoint set [7,_mode];
	[_group, _waypoint] call AIC_fnc_setWaypoint;
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
	hint ("Formation set to " + toLower _mode);
};

["WAYPOINT","Column",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["COLUMN"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Stag. Column",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["STAG COLUMN"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Wedge",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["WEDGE"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Echelon Left",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["ECH LEFT"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Echelon Right",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["ECH RIGHT"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Vee",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["VEE"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Line",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["LINE"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","File",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["FILE"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Diamond",["Adjust Group", "Set Group Formation"],AIC_fnc_setWaypointFormationActionHandler,["DIAMOND"]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setGroupBehaviourActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_mode"];
	[_group,_mode] remoteExec ["setBehaviour", leader _group]; 
	hint ("Behaviour set to " + toLower _mode);
};

AIC_fnc_setGroupSitActionHandler = {
    params ["_menuParams", "_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    _actionParams params ["_mode"];
    
    if (_mode == "Sit") then {
        {
            _x disableAI "MOVE";
            _x disableAI "ANIM";
            _x action ["SitDown", _x];
        } forEach (units _group);
        hint "Group is sitting down";
    } else {
        {
            _x enableAI "MOVE";
            _x enableAI "ANIM";
            _x playActionNow "STAND";
        } forEach (units _group);
        hint "Group is standing up";
    };
};

AIC_fnc_setGroupSaluteActionHandler = {
    params ["_menuParams", "_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    _actionParams params ["_mode"];
    
    if (_mode == "Salute") then {
        { _x playAction "SALUTE"; } forEach (units _group);
    } else {
        { _x playActionNow "STAND"; } forEach (units _group);
    };
};

["GROUP", "Sit Down", ["Adjust Group", "Set Group Behaviour"], AIC_fnc_setGroupSitActionHandler, ["Sit"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Stand Up", ["Adjust Group", "Set Group Behaviour"], AIC_fnc_setGroupSitActionHandler, ["Stand"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Salute", ["Adjust Group", "Set Group Behaviour"], AIC_fnc_setGroupSaluteActionHandler, ["Salute"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Careless",["Adjust Group", "Set Group Behaviour"],AIC_fnc_setGroupBehaviourActionHandler,["CARELESS"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Safe",["Adjust Group", "Set Group Behaviour"],AIC_fnc_setGroupBehaviourActionHandler,["SAFE"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Aware",["Adjust Group", "Set Group Behaviour"],AIC_fnc_setGroupBehaviourActionHandler,["AWARE"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Combat",["Adjust Group", "Set Group Behaviour"],AIC_fnc_setGroupBehaviourActionHandler,["COMBAT"]] call AIC_fnc_addCommandMenuAction;
["GROUP", "Stealth",["Adjust Group", "Set Group Behaviour"],AIC_fnc_setGroupBehaviourActionHandler,["STEALTH"]] call AIC_fnc_addCommandMenuAction;
	
AIC_fnc_setGroupColorActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_color"];
	[_group,_color] call AIC_fnc_setGroupColor;
	AIC_fnc_setGroupControlColor(_groupControlId,_color);
	[_groupControlId,"REFRESH_GROUP_ICON",[]] call AIC_fnc_groupControlEventHandler;
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
	[_groupControlId,"REFRESH_ACTIONS",[]] call AIC_fnc_groupControlEventHandler;
	hint ("Color set to " + toLower (_color select 0));
};

["GROUP","Red",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_RED]] call AIC_fnc_addCommandMenuAction;
["GROUP","Blue",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_BLUE]] call AIC_fnc_addCommandMenuAction;
["GROUP","Green",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_GREEN]] call AIC_fnc_addCommandMenuAction;
["GROUP","Black",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_BLACK]] call AIC_fnc_addCommandMenuAction;
["GROUP","White",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_WHITE]] call AIC_fnc_addCommandMenuAction;
["GROUP","Yellow",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_YELLOW]] call AIC_fnc_addCommandMenuAction;
["GROUP","Cyan",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_CYAN]] call AIC_fnc_addCommandMenuAction;
["GROUP","Magenta",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_MAGENTA]] call AIC_fnc_addCommandMenuAction;
["GROUP","Orange",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_ORANGE]] call AIC_fnc_addCommandMenuAction;
["GROUP","Purple",["Adjust Group", "Set Group Color"],AIC_fnc_setGroupColorActionHandler,[AIC_COLOR_PURPLE]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setGroupSpeedActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_speed","_label"];
	[_group,_speed] remoteExec ["setSpeedMode", leader _group]; 
	hint ("Speed set to " + _label);
};	

["GROUP","Half Speed",["Adjust Group", "Set Group Speed"],AIC_fnc_setGroupSpeedActionHandler,["LIMITED", "Half Speed"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Full Speed (In Formation)",["Adjust Group", "Set Group Speed"],AIC_fnc_setGroupSpeedActionHandler,["NORMAL", "Full Speed (In Formation)"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Full (No Formation)",["Adjust Group", "Set Group Speed"],AIC_fnc_setGroupSpeedActionHandler,["FULL", "Full (No Formation)"]] call AIC_fnc_addCommandMenuAction;	

AIC_fnc_commandMenuIsAir = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_hasAir = false;
	{
		if(_x isKindOf "Air") then {
			_hasAir = true;
		};
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	_hasAir;
};

AIC_fnc_setFlyInHeightActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_height"];
	{
		if(_x isKindOf "Air") then {
			[_x,_height] remoteExec ["flyInHeight", _x]; 
		};
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	hint ("Fly in height set to " + (str _height) + " meters");
};

["GROUP","10 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[10],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","20 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[20],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","40 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[40],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","100 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[100],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","250 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[250],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","500 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[500],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","1000 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[1000],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["GROUP","2000 meters",["Adjust Group", "Set Fly in Height"],AIC_fnc_setFlyInHeightActionHandler,[2000],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setGroupCombatModeActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_mode","_modeLabel"];
	[_group,_mode] remoteExec ["setCombatMode", leader _group]; 
	hint ("Combat mode set to " + toLower _modeLabel);
};

["GROUP","Never fire",["Adjust Group", "Set Group Combat Mode"],AIC_fnc_setGroupCombatModeActionHandler,["BLUE","Never fire"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Hold fire, Defend only",["Adjust Group", "Set Group Combat Mode"],AIC_fnc_setGroupCombatModeActionHandler,["GREEN","Hold fire - defend only"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Hold fire, Engage at will",["Adjust Group", "Set Group Combat Mode"],AIC_fnc_setGroupCombatModeActionHandler,["WHITE","Hold fire, engage at will"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Fire at will",["Adjust Group", "Set Group Combat Mode"],AIC_fnc_setGroupCombatModeActionHandler,["YELLOW","Fire at will"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Fire at will, Engage at will",["Adjust Group", "Set Group Combat Mode"],AIC_fnc_setGroupCombatModeActionHandler,["RED","Fire at will, engage at will"]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_killGroupActionHandler = {
    params ["_menuParams","_actionParams"];
    _menuParams params ["_groupControlId"];
    private ["_group"];
    _group = AIC_fnc_getGroupControlGroup(_groupControlId);
    {
        _x setDamage 1;
    } forEach units _group;
    
    hint "Group Terminated";
};

["GROUP","Terminate Group",["Adjust Group"],AIC_fnc_killGroupActionHandler,[]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_clearAllWaypointsActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	[_group] call AIC_fnc_disableAllWaypoints;	
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
	hint ("All waypoints cleared");
};

["GROUP","Confirm Cancel All",["Clear All Waypoints"],AIC_fnc_clearAllWaypointsActionHandler] call AIC_fnc_addCommandMenuAction;		

AIC_fnc_remoteViewActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_fromUnit","_rcUnit","_exitingRcUnit"];

	private _remoteControlActive = !isNull (missionNamespace getVariable ["AIC_Remote_Control_From_Unit",objNull]);
	if(_remoteControlActive) then {
		[] call AIC_fnc_terminateRemoteControl;
	};
	
	_fromUnit = missionNamespace getVariable ["AIC_Remote_View_From_Unit",objNull];
	if(isNull _fromUnit || !alive _fromUnit) then {
		_fromUnit = player;
		missionNamespace setVariable ["AIC_Remote_View_From_Unit",_fromUnit];
	};
	
	_rcUnit = leader _group;
	_exitingRcUnit = missionNamespace getVariable ["AIC_Remote_View_To_Unit",objNull];
	if(!isNull _exitingRcUnit) then {
		["MAIN_DISPLAY","KeyDown",(missionNamespace getVariable ["AIC_Remote_View_Delete_Handler",-1])] call AIC_fnc_removeEventHandler;
	};
	missionNamespace setVariable ["AIC_Remote_View_To_Unit",_rcUnit];

	AIC_Remote_View_From_Unit_Event_Handler = _fromUnit addEventHandler ["HandleDamage", "[] call AIC_fnc_terminateRemoteView; _this select 2;"];
	AIC_Remote_View_Delete_Handler = ["MAIN_DISPLAY","KeyDown", "if(_this select 1 == 211) then { [] call AIC_fnc_terminateRemoteView; }"] call AIC_fnc_addEventHandler;

	openMap false;
	
	[_rcUnit] call AIC_fnc_enable3rdPersonCamera;
	
	["RemoteControl",["","Press DELETE to Exit Remote View"]] call BIS_fnc_showNotification;
	
};

AIC_fnc_terminateRemoteView = {
	["MAIN_DISPLAY","KeyDown",(missionNamespace getVariable ["AIC_Remote_View_Delete_Handler",-1])] call AIC_fnc_removeEventHandler;
	(missionNamespace getVariable ["AIC_Remote_View_From_Unit",objNull]) removeEventHandler ["HandleDamage", (missionNamespace getVariable ["AIC_Remote_View_From_Unit_Event_Handler",-1])];
	missionNamespace setVariable ["AIC_Remote_View_To_Unit",nil];
	missionNamespace setVariable ["AIC_Remote_View_From_Unit",nil];
	[] call AIC_fnc_disable3rdPersonCamera;
	["RemoteControl",["","Remote View Terminated"]] call BIS_fnc_showNotification;
};

["GROUP","Remote View",["Remote"],AIC_fnc_remoteViewActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_canControl"];
	_canControl = false;
	if(player != leader _group) then {
		_canControl = true;
	};
	_canControl;
}] call AIC_fnc_addCommandMenuAction;

AIC_fnc_remoteControlActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_fromUnit","_rcUnit","_exitingRcUnit"];

	private _remoteViewActive = !isNull (missionNamespace getVariable ["AIC_Remote_View_From_Unit",objNull]);
	if(_remoteViewActive) then {
		[] call AIC_fnc_terminateRemoteView;
	};

	_fromUnit = missionNamespace getVariable ["AIC_Remote_Control_From_Unit",objNull];
	if(isNull _fromUnit || !alive _fromUnit) then {
		_fromUnit = player;
		missionNamespace setVariable ["AIC_Remote_Control_From_Unit",_fromUnit];
	};
	
	_rcUnit = leader _group;
	if(!alive _rcUnit) exitWith {
		["RemoteControl",["","Remote Control Failed: Not Alive"]] call BIS_fnc_showNotification;
	};
	_exitingRcUnit = missionNamespace getVariable ["AIC_Remote_Control_To_Unit",objNull];
	if(!isNull _exitingRcUnit) then {
		_exitingRcUnit removeEventHandler ["Killed", (missionNamespace getVariable ["AIC_Remote_Control_To_Unit_Event_Handler",-1])];
		["MAIN_DISPLAY","KeyDown",(missionNamespace getVariable ["AIC_Remote_Control_Delete_Handler",-1])] call AIC_fnc_removeEventHandler;
	};
	missionNamespace setVariable ["AIC_Remote_Control_To_Unit",_rcUnit];

	// Terminate Remote Control after taking damage
	AIC_Remote_Control_From_Unit_Event_Handler = _fromUnit addEventHandler ["HandleDamage", "[] call AIC_fnc_terminateRemoteControl; _this select 2;"];
	AIC_Remote_Control_To_Unit_Event_Handler = _rcUnit addEventHandler ["Killed", "[] call AIC_fnc_terminateRemoteControl; _this select 2;"];
	
	AIC_Remote_Control_Delete_Handler = ["MAIN_DISPLAY","KeyDown", "if(_this select 1 == 211) then { [] call AIC_fnc_terminateRemoteControl; }"] call AIC_fnc_addEventHandler;
	
	BIS_fnc_feedback_allowPP = false;
	selectPlayer _rcUnit;
	(vehicle _rcUnit) switchCamera "External";
	openMap false;
	
	["RemoteControl",["","Press DELETE to Exit Remote Control"]] call BIS_fnc_showNotification;
};

AIC_fnc_terminateRemoteControl = {
	["MAIN_DISPLAY","KeyDown",(missionNamespace getVariable ["AIC_Remote_Control_Delete_Handler",-1])] call AIC_fnc_removeEventHandler;
	(missionNamespace getVariable ["AIC_Remote_Control_From_Unit",objNull]) removeEventHandler ["HandleDamage", (missionNamespace getVariable ["AIC_Remote_Control_From_Unit_Event_Handler",-1])];
	(missionNamespace getVariable ["AIC_Remote_Control_To_Unit",objNull]) removeEventHandler ["Killed", (missionNamespace getVariable ["AIC_Remote_Control_To_Unit_Event_Handler",-1])];
	missionNamespace setVariable ["AIC_Remote_Control_To_Unit",nil];
	selectPlayer (missionNamespace getVariable ["AIC_Remote_Control_From_Unit",player]);
	missionNamespace setVariable ["AIC_Remote_Control_From_Unit",nil];
	(vehicle player) switchCamera cameraView;
	BIS_fnc_feedback_allowPP = true;
	["RemoteControl",["","Remote Control Terminated"]] call BIS_fnc_showNotification;
};

["GROUP","Remote Control",["Remote"],AIC_fnc_remoteControlActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_canControl"];
	_canControl = true;
	if(!alive leader _group) then {
		_canControl = false;
	};
	if(isPlayer leader _group) then {
		_canControl = false;
	};
	_canControl;
}] call AIC_fnc_addCommandMenuAction;

AIC_fnc_assignVehicleActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_selectedVehicle"];
	_selectedVehicle = [_groupControlId] call AIC_fnc_selectGroupControlVehicle;
	if(!isNull _selectedVehicle) then {
		private ["_vehicleName","_assignedVehicles","_vehicleSlotsToAssign","_maxSlots","_vehicleRoles"];
		private ["_unitIndex","_countOfSlots","_vehicleToAssign"];
		[_group,_selectedVehicle] remoteExec ["addVehicle", leader _group];
		_assignedVehicles = [_group] call AIC_fnc_getGroupAssignedVehicles;
		_assignedVehicles pushBack _selectedVehicle;
		[_group,_assignedVehicles] call AIC_fnc_setGroupAssignedVehicles;
		_vehicleSlotsToAssign = [];
		_maxSlots = 0;
		{
			_vehicleRoles = [_x] call BIS_fnc_vehicleRoles;
			if(count _vehicleRoles > _maxSlots) then {
				_maxSlots = count _vehicleRoles;
			};
		} forEach _assignedVehicles;
		if(_maxSlots > 0) then {
			for "_i" from 0 to (_maxSlots-1) do {
				{
					_vehicleRoles = [_x] call BIS_fnc_vehicleRoles;
					if(count _vehicleRoles > _i) then {
						_vehicleSlotsToAssign pushBack [_x,_vehicleRoles select _i];
					};
				} forEach _assignedVehicles;
			};
		};
		_unitIndex = 0;
		_countOfSlots = count _vehicleSlotsToAssign;
		{
			if(_countOfSlots > _unitIndex) then {
				_vehicleToAssign = (_vehicleSlotsToAssign select _unitIndex) select 0;
				_role = (_vehicleSlotsToAssign select _unitIndex) select 1;
				[_x,_vehicleToAssign,_role] remoteExec ["AIC_fnc_getInVehicle", _x];
			};
			_unitIndex = _unitIndex + 1;
		} forEach (units _group);
		if(_selectedVehicle isKindOf "Air") then {
			[_selectedVehicle,100] remoteExec ["flyInHeight", _selectedVehicle]; 
		};
		_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _selectedVehicle >> "displayName");
		hint ("Vehicle assigned: " + _vehicleName);
	} else {
		hint ("No vehicle assigned");
	};
};

["GROUP","Assign Vehicle",[],AIC_fnc_assignVehicleActionHandler,[]] call AIC_fnc_addCommandMenuAction;		

AIC_fnc_unassignVehicleActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	{
		[_group,_x] remoteExec ["leaveVehicle", leader _group];
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	[_group,nil] call AIC_fnc_setGroupAssignedVehicles;
	hint ("All vehicles unassigned");
};

["GROUP","Unassign Vehicle",[],AIC_fnc_unassignVehicleActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_canUnassign"];
	_canUnassign = false;
	_canUnassign = (count ([_group] call AIC_fnc_getGroupAssignedVehicles) > 0);
	{
		if( _x != vehicle _x ) then {
			_canUnassign = true;
		};
	} forEach (units _group);
	_canUnassign;
}] call AIC_fnc_addCommandMenuAction;	

AIC_fnc_unloadOtherGroupsActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_vehicle","_unloadedGroups","_assignedVehicles"];
	_unloadedGroups = [];
	{
		_vehicle = _x;
		{
			if(group _x != _group) then {
				if!(group _x in _unloadedGroups) then {
					[group _x, _vehicle] remoteExec ["leaveVehicle", leader group _x];
					_unloadedGroups pushBack (group _x);
					_assignedVehicles = [group _x] call AIC_fnc_getGroupAssignedVehicles;
					_assignedVehicles = _assignedVehicles - [_vehicle];
					[group _x,_assignedVehicles] call AIC_fnc_setGroupAssignedVehicles;
				};
			};
		} forEach (crew _vehicle);
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	hint ((str count _unloadedGroups) + " other group(s) unloaded");
};

["GROUP","Unload Other Group",[],AIC_fnc_unloadOtherGroupsActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_group getVariable ["AIC_Has_Group_Cargo",false];
}] call AIC_fnc_addCommandMenuAction;	

AIC_fnc_landActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_selectedPosition"];
	_selectedPosition = [_groupControlId] call AIC_fnc_selectGroupControlPosition;
	if(count _selectedPosition > 0) then {
		_hasAir = false;
		{
			if(_x isKindOf "Air") then {
				_hasAir = true;
			};
		} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
		if(_hasAir) then {
			[_group] call AIC_fnc_disableAllWaypoints;	
			[_group, [_selectedPosition,false,"MOVE","{ if((vehicle _x) isKindOf 'Air') then { (vehicle this) land 'LAND'; }; } forEach (units (group this))"]] call AIC_fnc_addWaypoint;
			[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
		};
	};
};

["GROUP","Land",[],AIC_fnc_landActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_hasAir = false;
	{
		if(_x isKindOf "Air") then {
			if(((position _x) select 2) > 1) then {
				_hasAir = true;
			};
		};
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	_hasAir;	
}] call AIC_fnc_addCommandMenuAction;


AIC_fnc_rappelActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	private ["_selectedPosition"];
	_selectedPosition = [_groupControlId] call AIC_fnc_selectGroupControlPosition;
	if(count _selectedPosition > 0) then {
		{
			if(_x isKindOf "Helicopter") then {
				[_x,25,AGLtoASL [_selectedPosition select 0, _selectedPosition select 1, 0]] call AR_Rappel_All_Cargo;
			};
		} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
		[_group] spawn {
			params ["_groupRappelling"];
			_unitsInVehicle = true;
			while {_unitsInVehicle} do {
				_unitsInVehicle = false;
				{
					if(vehicle _x != _x) then {
						_unitsInVehicle = true;
					};
				} forEach (units _groupRappelling);
				sleep 1;
			};
			[_groupRappelling] call AIC_fnc_unassignVehicleActionHandler;
		};
	};
};

["GROUP","Rappel Other Group",[],AIC_fnc_rappelActionHandler,[],{
	params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_hasAir = false;
	{
		if(_x isKindOf "Helicopter") then {
			if(((position _x) select 2) > 1) then {
				_hasAir = true;
			};
		};
	} forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
	_hasAir && (_group getVariable ["AIC_Has_Group_Cargo",false]) && !isNil "AR_RAPPELLING_INIT";	
}] call AIC_fnc_addCommandMenuAction;


AIC_fnc_setGroupAutoCombatActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_actionParams params ["_mode"];
	if (_mode == "On") then {
		{_x enableAI "AUTOCOMBAT"} foreach (units _group);
	} else {
		{_x disableAI "AUTOCOMBAT"} foreach (units _group);
	};
	hint ("AutoCombat " + toLower _mode);
};

["GROUP","On",["Adjust Group","Set Group Behaviour","Auto Combat"],AIC_fnc_setGroupAutoCombatActionHandler,["On"]] call AIC_fnc_addCommandMenuAction;
["GROUP","Off",["Adjust Group","Set Group Behaviour","Auto Combat"],AIC_fnc_setGroupAutoCombatActionHandler,["Off"]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_deleteWaypointHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
	private ["_group"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	[_group,_waypointId] call AIC_fnc_disableWaypoint;
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
};

["WAYPOINT","Delete Waypoint",[],AIC_fnc_deleteWaypointHandler] call AIC_fnc_addCommandMenuAction;
							
AIC_fnc_setWaypointTypeActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
	private ["_group","_waypoint"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_waypoint = [_group, _waypointId] call AIC_fnc_getWaypoint;
	_actionParams params ["_mode","_label"];
	_waypoint set [3,_mode];
	[_group, _waypoint] call AIC_fnc_setWaypoint;
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
	hint ("Type set to " + toLower _label);
};

AIC_fnc_setLoiterTypeActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
	_actionParams params ["_radius","_clockwise"];
	private ["_group","_waypoint"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_waypoint = [_group, _waypointId] call AIC_fnc_getWaypoint;
	_waypoint set [3,"LOITER"];
	_waypoint set [10,_radius];
	if(_clockwise) then {
		_waypoint set [11,"CIRCLE"];
	} else {
		_waypoint set [11,"CIRCLE_L"];
	};
	[_group, _waypoint] call AIC_fnc_setWaypoint;
	[_groupControlId,"REFRESH_WAYPOINTS",[]] call AIC_fnc_groupControlEventHandler;
	_loiterTypeLabel = "loiter clockwise";
	if(!_clockwise) then {
		_loiterTypeLabel = "loiter counter clockwise";
	};
	hint ("Type set to " + _loiterTypeLabel + " at " + str _radius + " meter radius");
};

["WAYPOINT","Move (default)",["Set Waypoint Type"],AIC_fnc_setWaypointTypeActionHandler,["MOVE","Move"]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","Seek & Destroy",["Set Waypoint Type"],AIC_fnc_setWaypointTypeActionHandler,["SAD","Seek & Destroy"]] call AIC_fnc_addCommandMenuAction;

["WAYPOINT","10M Radius",["Set Waypoint Type","Loiter (Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[10,true]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","100M Radius",["Set Waypoint Type","Loiter (Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[100,true]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","250M Radius",["Set Waypoint Type","Loiter (Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[250,true]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","500M Radius",["Set Waypoint Type","Loiter (Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[500,true]] call AIC_fnc_addCommandMenuAction;

["WAYPOINT","10M Radius",["Set Waypoint Type","Loiter (C-Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[10,false]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","100M Radius",["Set Waypoint Type","Loiter (C-Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[100,false]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","250M Radius",["Set Waypoint Type","Loiter (C-Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[250,false]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","500M Radius",["Set Waypoint Type","Loiter (C-Clockwise)"],AIC_fnc_setLoiterTypeActionHandler,[500,false]] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setWaypointFlyInHeightActionHandlerScript = {
	params ["_group","_height"]; 
  { 
  	if(_x isKindOf "Air") then { 
    	[_x,_height] remoteExec ["flyInHeight", _x];
    };
  } forEach ([_group] call AIC_fnc_getGroupAssignedVehicles);
};

AIC_fnc_setWaypointFlyInHeightActionHandler = {
	private ["_script"];
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
  _actionParams params ["_height"];
	private ["_group","_waypoint"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_waypoint = [_group, _waypointId] call AIC_fnc_getWaypoint;
  _script = format ["[group this, %1] call AIC_fnc_setWaypointFlyInHeightActionHandlerScript",_height];
	_waypoint set [4,_script];
	_waypoint set [12,_height];
	[_group, _waypoint] call AIC_fnc_setWaypoint;
	hint ("Waypoint fly in height set to " + (str _height) + " meters");
};

["WAYPOINT","10 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[10],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","20 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[20],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","40 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[40],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","100 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[100],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","250 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[250],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","500 meters",["Set Fly in Height"],AIC_fnc_setWaypointFlyInHeightActionHandler,[500],AIC_fnc_commandMenuIsAir] call AIC_fnc_addCommandMenuAction;

AIC_fnc_setWaypointDurationActionHandler = {
	params ["_menuParams","_actionParams"];
	_menuParams params ["_groupControlId","_waypointId"];
  _actionParams params ["_duration"];
	private ["_group","_waypoint"];
	_group = AIC_fnc_getGroupControlGroup(_groupControlId);
	_waypoint = [_group, _waypointId] call AIC_fnc_getWaypoint;
	_waypoint set [9,_duration * 60];
	[_group, _waypoint] call AIC_fnc_setWaypoint;
	hint ("Waypoint duration set to " + (str _duration) + " mins");
};

["WAYPOINT","None",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[0]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","1 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[1]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","2 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[2]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","3 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[3]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","4 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[4]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","5 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[5]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","10 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[10]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","20 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[20]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","30 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[30]] call AIC_fnc_addCommandMenuAction;
["WAYPOINT","60 Min",["Set Duration"],AIC_fnc_setWaypointDurationActionHandler,[60]] call AIC_fnc_addCommandMenuAction;
