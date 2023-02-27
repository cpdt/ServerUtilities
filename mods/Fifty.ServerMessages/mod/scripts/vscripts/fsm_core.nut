global function FSM_Init


/**
 * Gets called after the map is loaded
*/
void function FSM_Init() {
	AddCallback_OnClientConnected ( FSM_OnClientConnected )

	FSCC_CommandStruct command
	command.m_UsageUser = "info"
	command.m_Description = "Display server information page."
	command.m_Group = "MESSAGE"
	command.Callback = FSV_CommandCallback_Info
	if( GetConVarBool( "FSM_ENABLE_INFO_COMMAND" ) )
		FSCC_RegisterCommand( "info", command )
}

void function FSV_CommandCallback_Info(entity player, array <string> args ) {
	FSM_PrintWelcomeMessage(player)
}

/**
 * Gets called when a player joins
 * @param player the player who joined
*/
void function FSM_OnClientConnected( entity player ) {
	FSM_PrintWelcomeMessage( player )
}

/**
 * Creates the welcome message
 * @param player The player to send the message to
*/
void function FSM_PrintWelcomeMessage( entity player ) {
	string server_name = GetConVarString("ns_server_name")
	FSU_PrivateChatMessage(player, "Welcome to %H" + server_name + "%T, where lowest prices are just the beginning.")
	FSU_PrivateChatMessage(player, "%FRules: Keep chat chill, do not cheat or work around the game's controls.")
	FSU_PrivateChatMessage(player, "Report rule breakers on the Northstar Discord - %Hdiscord.gg/northstar")
	FSU_PrivateChatMessage(player, "View available chat commands with %H!help%T. Questions? Contact %Hcpdt#5830%T on Discord.")
}
