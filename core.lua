rFonts = CreateFrame("Frame", "r_Fonts");
rFonts:RegisterEvent("ADDON_LOADED")
rFonts:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)

local disabledmsg = "|cFFFF0000disabled|r"
local enabledmsg = "|cFF00FF00enabled|r"

function rfSay(str)
	DEFAULT_CHAT_FRAME:AddMessage("|cFF006699Fonts|r: " .. str)
end

if rFontConfig == nil then
	rFontConfig = {
		damagefont = true,
	}
end

function rFonts:ApplySystemFonts()
	if rFontConfig.damagefont then
		DAMAGE_TEXT_FONT = [[Interface\AddOns\r_Fonts\fonts\animeace.ttf]]
	end
end

function rFonts:ADDON_LOADED(addon)
	if addon ~= "r_Fonts" then return end
	rFonts:ApplySystemFonts()
	rFonts:UnregisterEvent("ADDON_LOADED")
end

SLASH_RFONT1 = "/rfont"

SlashCmdList["RFONT"] = function(str)
	local switch, message = str:match("^(%S*)%s*(.-)$");
	local cmd = string.lower(switch)
	local msg = string.lower(message)

	if cmd == "damagefont" then
		if rFontConfig.damagefont then
				rFontConfig.damagefont = false
				rfSay("Damage Font now "..disabledmsg..". You must relog to activate this setting.")
			else
				rFontConfig.damagefont = true
				rfSay("Damage Font now "..enabledmsg..". You must relog to activate this setting.")
		end
	end

end