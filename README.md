# Scripting framework for Soldat server

Split into:

* configuration - for stuff modified by the end-user
* variables - data banks for the tiny bits of data, accessed globally
* utils - logger and some tiny functions
* handlers - for interpreting players' blabber
* functions - main logic of the script, your special place
* events - nicely commented with all of script engine's quirks

Gives you a base for your scripts, so that you don't have to define good/bad colors from scratch for the fifteenth time, try to work around handling the same command twice, nor search for that one working implementation of `guessPlayerId`.

Events have some comments that explain the order of triggers. You no longer need to remember which event doesn't get triggered by bots (spoiler: it's `OnJoinGame`).

Handling user input is done via enumerators, moving the boring logic away from events. Events just get the enumerator and call a fitting function. Clean and effective. Cool.

Logger functions (`logInfo`, `logWarning`, `logError`) use green, yellow, and red color, respectively. The colors have been picked to be actually readable, unlike some messages in the game itself. Giving the logger an ID of 255 makes it use `writeLn` instead of `writeConsole`, so you can log to admins' console as well.

`utils.pas` hides some functions for deciding whether a player is active or not, and counting the active ones. The server decides to call the leaving player "active", so this workaround was necessary to keep your sanity.

I guess that's it. If you have some ideas, go ahead and post an issue.

The license is WTFPL. See [LICENSE](https://github.com/tehoko/soldat-scripting-framework/blob/master/LICENSE).
