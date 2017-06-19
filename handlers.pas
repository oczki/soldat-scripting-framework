function getTriggerAction(inputText: string): eTriggerAction;
var text: string;
begin
    result := trigNone;
    text := lowercase(inputText);
    case (text) of
        '!something', '!some-alias', '!some-other-alias':
            result := trigSomeTrigger;
        '!some-other-thing':
            result := trigSomeOtherTrigger;
    end;
end;

function getCommandAction(callerId: byte; inputText: string): eCommandAction;
var text: string;
begin
    if (usedAdminCommandAlready(callerId)) then begin
        clearLastCommand(callerId);
        exit;
    end;

    result := cmdNone;
    text := lowercase(getpiece(text, ' ', 0));
    case (text) of
        '/my-cmd', '/alias-for-my-cmd':
            result := cmdSomeCommand;
        '/my-other-command':
            result := cmdSomeOtherCommand;
    end;

    player[callerId].lastCmd := result;
end;

function guessMapName(inputText: string): string;
var text: string;
begin
    result := '';
    text := lowercase(inputText);
    case (text) of
        'aero':
            result := 'Aero';
        'airpirates':
            result := 'Airpirates';
        'arena':
            result := 'Arena';
        'arena2':
            result := 'Arena2';
        'arena3':
            result := 'Arena3';
        'bigfalls':
            result := 'Bigfalls';
        'blox', 'blocks':
            result := 'Blox';
        'bridge':
            result := 'Bridge';
        'bunker':
            result := 'Bunker';
        'cambodia':
            result := 'Cambodia';
        'crackedboot':
            result := 'CrackedBoot';
        'daybreak':
            result := 'Daybreak';
        'desertwind':
            result := 'DesertWind';
        'factory':
            result := 'Factory';
        'flash', 'flashback':
            result := 'Flashback';
        'hh':
            result := 'HH';
        'island', 'island2005', 'island2k5':
            result := 'Island2k5';
        'jungle':
            result := 'Jungle';
        'krab', 'crab':
            result := 'Krab';
        'lagrange':
            result := 'Lagrange';
        'leaf':
            result := 'Leaf';
        'mrsnowman', 'snowman':
            result := 'MrSnowman';
        'ratcave':
            result := 'RatCave';
        'rok':
            result := 'Rok';
        'rr':
            result := 'RR';
        'shau':
            result := 'Shau';
        'tropiccave':
            result := 'Tropiccave';
        'unlim':
            result := 'Unlim';
        'veoto':
            result := 'Veoto';

        'ash', 'ctf_ash':
            result := 'ctf_Ash';
        'b2b', 'ctf_b2b':
            result := 'ctf_B2b';
        'blade', 'ctf_blade':
            result := 'ctf_Blade';
        'campeche', 'ctf_campeche':
            result := 'ctf_Campeche';
        'cobra', 'ctf_cobra':
            result := 'ctf_Cobra';
        'crucifix', 'ctf_crucifix':
            result := 'ctf_Crucifix';
        'death', 'ctf_death':
            result := 'ctf_Death';
        'div', 'division', 'ctf_division':
            result := 'ctf_Division';
        'drop', 'dropdown', 'parachute', 'parachutes', 'ctf_dropdown':
            result := 'ctf_Dropdown';
        'eq', 'equi', 'equinox', 'ctf_equinox':
            result := 'ctf_Equinox';
        'guard', 'guardian', 'ctf_guardian':
            result := 'ctf_Guardian';
        'hormone', 'ctf_hormone':
            result := 'ctf_Hormone';
        'icebeam', 'ctf_icebeam':
            result := 'ctf_IceBeam';
        'kampf', 'ctf_kampf':
            result := 'ctf_Kampf';
        'lanubya', 'ctf_lanubya':
            result := 'ctf_Lanubya';
        'laos', 'ctf_laos':
            result := 'ctf_Laos';
        'maya', 'ctf_maya':
            result := 'ctf_Maya';
        'mayapan', 'ctf_mayapan':
            result := 'ctf_Mayapan';
        'mfm', 'ctf_mfm':
            result := 'ctf_MFM';
        'nub', 'nuub', 'nuubia', 'ctf_nuubia':
            result := 'ctf_Nuubia';
        'rasp', 'raspberry', 'ctf_raspberry':
            result := 'ctf_Raspberry';
        'rot', 'rotten', 'ctf_rotten':
            result := 'ctf_Rotten';
        'ruins', 'ctf_ruins':
            result := 'ctf_Ruins';
        'run', 'ctf_run':
            result := 'ctf_Run';
        'scorpion', 'ctf_scorpion':
            result := 'ctf_Scorpion';
        'snek', 'snake', 'snakebite', 'ctf_snakebite':
            result := 'ctf_Snakebite';
        'steel', 'ctf_steel':
            result := 'ctf_Steel';
        'triumph', 'ctf_triumph':
            result := 'ctf_Triumph';
        'viet', 'vite', 'ctf_viet':
            result := 'ctf_Viet';
        'vol', 'voland', 'ctf_voland':
            result := 'ctf_Voland';
        'wrench', 'wretch', 'ctf_wretch':
            result := 'ctf_Wretch';
        'x', 'ctf_x':
            result := 'ctf_X';

        'arch', 'htf_arch':
            result := 'htf_Arch';
        'baire', 'htf_baire':
            result := 'htf_Baire';
        'boxed', 'htf_boxed':
            result := 'htf_Boxed';
        'desert', 'htf_desert':
            result := 'htf_Desert';
        'dorothy', 'htf_dorothy':
            result := 'htf_Dorothy';
        'dusk', 'htf_dusk':
            result := 'htf_Dusk';
        'erbium', 'htf_erbium':
            result := 'htf_Erbium';
        'feast', 'htf_feast':
            result := 'htf_Feast';
        'mossy', 'htf_mossy':
            result := 'htf_Mossy';
        'muygen', 'htf_muygen':
            result := 'htf_Muygen';
        'niall', 'htf_niall':
            result := 'htf_Niall';
        'nuclear', 'htf_nuclear':
            result := 'htf_Nuclear';
        'prison', 'htf_prison':
            result := 'htf_Prison';
        'rubik', 'htf_rubik':
            result := 'htf_Rubik';
        'star', 'htf_star':
            result := 'htf_Star';
        'tower', 'htf_tower':
            result := 'htf_Tower';
        'void', 'htf_void':
            result := 'htf_Void';
        'vortex', 'htf_vortex':
            result := 'htf_Vortex';
        'zajacz', 'htf_zajacz':
            result := 'htf_Zajacz';

        'abel', 'inf_abel':
            result := 'inf_Abel';
        'april', 'inf_april':
            result := 'inf_April';
        'argy', 'inf_argy':
            result := 'inf_Argy';
        'belltower', 'inf_belltower':
            result := 'inf_Belltower';
        'biologic', 'inf_biologic':
            result := 'inf_Biologic';
        'changeling', 'inf_changeling':
            result := 'inf_Changeling';
        'flute', 'inf_flute':
            result := 'inf_Flute';
        'fortress', 'inf_fortress':
            result := 'inf_Fortress';
        'industrial', 'inf_industrial':
            result := 'inf_Industrial';
        'messner', 'inf_messner':
            result := 'inf_Messner';
        'moonshine', 'inf_moonshine':
            result := 'inf_Moonshine';
        'motheaten', 'inf_motheaten':
            result := 'inf_Motheaten';
        'outpost', 'inf_outpost':
            result := 'inf_Outpost';
        'rescue', 'inf_rescue':
            result := 'inf_Rescue';
        'rise', 'inf_rise':
            result := 'inf_Rise';
        'warehouse', 'inf_warehouse':
            result := 'inf_Warehouse';
        'warlock', 'inf_warlock':
            result := 'inf_Warlock';
    end;
    
    if (result <> '') then exit;
    
    if (fileexists('./maps/' + inputText + '.pms')) then
        result := inputText;
end;