type eLogSeverity = (sevInfo,
                     sevWarning,
                     sevError);

type eTriggerAction = (trigNone,
                       trigSomeTrigger,
                       trigSomeOtherTrigger);

type eCommandAction = (cmdNone,
                       cmdSomeCommand,
                       cmdSomeOtherCommand);

type tPlayer = record
    active: boolean;
    lastCmd: eCommandAction;
end;

var player: array [1..32] of tPlayer;