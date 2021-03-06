local mod	= DBM:NewMod("EdwinVanCleef", "DBM-Party-Classic", 3)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(639)
--mod:SetEncounterID(1144)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 3391"
)

local warningThrash					= mod:NewSpellAnnounce(3391, 3)

local timerTrashD					= mod:NewAITimer(180, 3391, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)

function mod:OnCombatStart(delay)
	timerTrashD:Start(1-delay)
end


function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 3391 then
		warningThrash:Show()
		timerTrashD:Start()
	end
end
