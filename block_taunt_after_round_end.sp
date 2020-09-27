#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo = 
{
	name = "Block Taunt on Round Panel",
	author = "Pily",
	description = "Block Taunt on Round Panel",
	version = PLUGIN_VERSION
};

public OnPluginStart()
{
	HookEvent("teamplay_round_start", Event_TeamPlayWaitingBegins);
	HookEvent("teamplay_waiting_begins", Event_TeamPlayWaitingBegins);
	
	HookEvent("teamplay_game_over", Event_TeamPlayGameover);
}

public Event_TeamPlayWaitingBegins(Handle:event, const String:name[], bool:dontBroadcast)
{
	
	RemoveCommandListener(CantTaunt, "taunt");
	RemoveCommandListener(CantTaunt, "+taunt");
}

public Event_TeamPlayGameover(Handle:event, const String:name[], bool:dontBroadcast)
{
	AddCommandListener(CantTaunt, "taunt");
    AddCommandListener(CantTaunt, "+taunt");
}

public Action:CantTaunt(client, const String:command[], argc)
{
    return Plugin_Handled;
} 