
// AppOnIdle runs once every second by default.
// Usually 60 ticks equals one second, but this can be changed, so this can be called more or less often.
procedure AppOnIdle(ticks: integer);
begin
    if (ticks mod AppOnIdleTimer <> 0) then exit;
end;

procedure ActivateServer();
var playerId: byte;
begin
    for playerId := 1 to 32 do
        setActive(playerId);
end;

procedure OnLeaveGame(playerId, teamId: byte; kicked: boolean);
begin
    setInactive(playerId);
end;

procedure OnJoinTeam(playerId, teamId: byte);
begin
    setActive(playerId);
end;

// OnMapChange runs AFTER the map changes to a new one.
procedure OnMapChange(newMap: string);
begin
end;

// OnGameEnd runs when time runs out, or some player/team hits the score limit.
// This is NOT run when the game ends any other way (/restart, /map, etc.).
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
// This one is triggered first, then OnPlayerCommand catches the same command, but this framework prevents it.
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