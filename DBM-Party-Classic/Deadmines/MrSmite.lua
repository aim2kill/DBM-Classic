local mod	= DBM:NewMod("MrSmite", "DBM-Party-Classic", 3)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(646)
--mod:SetEncounterID(1144)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 6432",
	"SPELL_AURA_APPLIED 6435"
)

local warningSmiteSlam	= mod:NewTargetNoFilterAnnounce(6435, 2)

local timerSmiteStomp	= mod:NewBuffFadesTimer(10, 6432, nil, nil, nil, 2)

function mod:OnCombatStart(delay)

end


function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 6432 then
		timerSmiteStomp:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 6435 then
		warningSmiteSlam:Show(args.destName)
	end
end
