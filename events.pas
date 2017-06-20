// AppOnIdle runs once every second (60 ticks) by default.
procedure AppOnIdle(ticks: integer);
begin
    if (ticks mod AppOnIdleTimer <> 0) then exit;
end;

// ActivateServer runs on startup and after the script gets (re)compiled.
procedure ActivateServer();
var playerId: byte;
begin
    for playerId := 1 to 32 do begin
        setActive(playerId);
        clearLastCommand(playerId);
    end;
end;

// OnRequestGame runs when someone tries to join. You can override the state.
// After this, the server calls OnPlayerRespawn, then OnJoinGame, then OnJoinTeam.
function OnRequestGame(ip: string; state: integer): integer;
begin
    result := state;
end;

// OnLeaveGame runs after someone leaves the server.
// Before this, OnWeaponChange gets called for some reason... Unless they were kicked.
procedure OnLeaveGame(playerId, teamId: byte; kicked: boolean);
begin
    setInactive(playerId);
end;

// OnJoinGame runs after someone joins the game. Then OnJoinTeam gets called.
// Bots don't trigger this event!
procedure OnJoinGame(playerId, teamId: byte);
begin
end;

// OnJoinTeam runs after someone joins a team. Also applies to deathmatch (team 0).
procedure OnJoinTeam(playerId, teamId: byte);
begin
    setActive(playerId);
end;

// OnMapChange runs AFTER the map changes to a new one.
procedure OnMapChange(newMap: string);
begin
end;

// OnGameEnd runs when time runs out, or some player/team hits the score limit.
// This is NOT ran when the game ends any other way (/restart, /map, etc.).
procedure OnGameEnd();
begin
end;

// OnPlayerSpeak runs any time someone speaks.
procedure OnPlayerSpeak(callerId: byte; text: string);
var action: eTriggerAction;
begin
    action := getTriggerAction(text);
    if (action = trigNone) then exit;

    case (action) of
        trigSomeTrigger:
            doSomething(callerId);
        trigSomeOtherTrigger:
            doSomething(callerId);
    end;
end;

// OnPlayerCommand runs when any player enters a command, e.g. /kill.
function OnPlayerCommand(callerId: byte; text: string): boolean;
var action: eCommandAction;
begin
    result := false;
    action := getCommandAction(callerId, text);
    if (action = cmdNone) then exit;

    case (action) of
        cmdSomeCommand:
            doSomething(callerId);
        cmdSomeOtherCommand:
            doSomething(callerId);
    end;

    clearLastCommand(callerId);
end;

// OnCommand runs when an admin enters a command, e.g. /map.
// This one is triggered first, then OnPlayerCommand catches the same command if getCommandAction returns cmdNone.
function OnCommand(callerId: byte; text: string): boolean;
var action: eCommandAction;
begin
    result := false;
    action := getCommandAction(callerId, text);
    if (action = cmdNone) then exit;

    case (action) of
        cmdSomeCommand:
            doSomething(callerId);
        cmdSomeOtherCommand:
            doSomething(callerId);
    end;
end;

// OnAdminConnect runs after a TCP admin logs in to the server.
procedure OnAdminConnect(ip: string);
begin
end;

// OnAdminDisconnect runs once a TCP admin disconnects.
procedure OnAdminDisconnect(ip: string);
begin
end;

// OnException runs when the server crashes due to an unhandled exception.
procedure OnException(errorMessage: string);
begin
end;

// OnFlagGrab runs just before someone grabs a non-friendly flag.
procedure OnFlagGrab(playerId, flagTeamId: byte; grabbedInBase: boolean);
begin
end;

// OnFlagReturn runs when someone grabs a friendly flag, returning it.
// Doesn't get called when a flag returns by itself due to timeout!
procedure OnFlagReturn(playerId, flagTeamId: byte);
begin
end;

// OnFlagScore runs after someone touches non-friendly flag with a friendly one near its spawn.
procedure OnFlagScore(playerId, flagTeamId: byte);
begin
end;

// OnPlayerDamage runs when someone deals damage. Also when they're hurting themselves.
function OnPlayerDamage(victimId, shooterId: byte; damage: integer): integer;
begin
    result := damage;
end;

// OnPlayerKill runs when someone performs a kill. Also when they're doing that to themselves.
procedure OnPlayerKill(killerId, victimId: byte; weapon: string);
begin
end;

// OnPlayerRespawn runs when someone respawns. Note that it also runs when joining a team.
procedure OnPlayerRespawn(playerId: byte);
begin
end;

// OnWeaponChange runs when someone's weapon changes. Runs twice when joining the game.
// Also gets called once upon dying, then again after respawning.
// Doesn't get called when someone has two identical weapons and switches between them!
procedure OnWeaponChange(playerId, primaryNum, secondaryNum: byte);
begin
end;