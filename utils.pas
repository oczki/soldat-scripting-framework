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
    if (getplayerstat(playerId, 'active')) then
        player[playerId].active := true;
end;

procedure setInactive(playerId: byte);
begin
    player[playerId].active := false;
end;

function isActive(playerId: byte): boolean;
begin
    result := false;
    if ((playerId < 1) or (playerId > 32)) then exit;
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
    if (callerId = 255) then begin
        result := true;
        exit;
    end;
    result := player[callerId].lastCmd <> cmdNone;
end;

procedure clearLastCommand(callerId: byte);
begin
    if (callerId = 255) then exit;
    player[callerId].lastCmd := cmdNone;
end;



function getParams(text: string): string;
var pos: integer;
begin
    pos := length(getpiece(text, ' ', 0)) + 1;
    result := copy(text, pos + 1, length(text) - pos);
end;