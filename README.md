# dfsAlerts

- This resource depends on DFS Base. https://github.com/DarkFeather-Studios/fivem_framework
- This resource depends on mythic_notify, but this dependency can be removed in under an hour.
- This resource depends on an unreleased DFS resource, but this dependency can be removed in under an hour.
- This resource depends on DFS db_perms, but this dependency can be removed in under an hour.

Events;

Client
- "alerts:AddByPerms", table txtcolor, table backgroundcolor, string sentBy, string Message, string permsLevel; Log a beautified chat message if the current user matches the required permssion level.

- "alerts:add", table txtcolor, table backgroundcolor, string sentBy, string Message [, string jobName]; Log a beautified chat message if jobName matches your current job or is nil.

- "alerts:addjobnotify", string jobName, string mythicType, string mythicText, int mythicDuration, object mythicStyle; Logs a mythic_notify if the player has the job jobName.

- "alerts:addblip", float x, float y, float blipz, int range, string jobName, int BlipId, [bool DisableRings, int LengthMs, bool NoIndicatorFlash, int IndicatorBlipColor, float IndicatorScale]; Adds a blip to the minimap if your job matches jobName that will fade to invisible over 60 seconds or LengthMs.

Server
- "alerts:AddByPerms", table txtcolor, table backgroundcolor, string sentBy, string Message, string permsLevel; Log a beautified chat message if the current user matches the required permssion level.

- "alerts:addbyjob", table txtcolor, table backgroundcolor, string sentBy, string Message, string jobName; Log a beautified chat message if jobName matches your current job.

- "alerts:addblipbyjob", float x, float y, float blipz, int range, string jobName, int BlipId, [bool DisableRings, int LengthMs, bool NoIndicatorFlash, int IndicatorBlipColor, float IndicatorScale]; Adds a blip to the minimap if your job matches jobName that will fade to invisible over 60 seconds or LengthMs.

- "alerts:sendto", int sendToPlayerID, table txtcolor, table backgroundcolor, string sentBy, string Message; Send a message to a player.

- "alerts:addnotifybyjob", string jobName, string mythicType, string mythicText, int mythicDuration, object mythicStyle; Triggers Client>AddJobNotify
