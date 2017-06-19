procedure logWrapper(id: byte; text: string; severity: eLogSeverity);
begin
    if (id = 255) then writeln(ScriptName + '>  ' + text)
    else case (severity) of
        sevInfo: writeconsole(id, text, ColorInfo);
        sevWarning: writeconsole(id, text, ColorWarning);
        sevError: writeconsole(id, text, ColorError);
    end;
end;

procedure logInfo(id: byte; text: string);
begin
    logWrapper(id, text, sevInfo);
end;

procedure logWarning(id: byte; text: string);
begin
    logWrapper(id, text, sevWarning);
end;

procedure logError(id: byte; text: string);
begin
    logWrapper(id, text, sevError);
end;

function floor(val: double): integer;
begin
    result := round(val - 0.5);
end;

function ceil(val: double): integer;
begin
    result := round(val + 0.5);
end;

function plural(value: integer; text: string): string;
begin
    result := iif(value = 1, text, text + 's');
end;

procedure setActive(playerId: byte);
begin
    if (getplayerstat(playerId, 'human') and getplayerstat(playerId, 'active')) then
        player[playerId].active := true;
end;

procedure setInactive(playerId: byte);
begin
    player[playerId].active := false;
end;

function isActive(playerId: byte): boolean;
begin
    result := player[playerId].active;
end;

function playerCount(): byte;
var playerId: byte;
begin
    result := 0;
    for playerId := 1 to 32 do
        if (isActive(playerId))
            then inc(result, 1);
end;

function usedAdminCommandAlready(callerId: byte): boolean;
begin
    result := player[callerId].lastCmd <> cmdNone;
end;

procedure clearLastCommand(callerId: byte);
begin
    player[callerId].lastCmd := cmdNone;
end;