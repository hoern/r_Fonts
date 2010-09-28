rFonts = CreateFrame("Frame", "r_Fonts");
rFonts:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)

function rFonts:ApplySystemFonts()
  DAMAGE_TEXT_FONT = [[Interface/AddOns/r_Fonts/fonts/animeace.ttf]]
end

function rFonts:ADDON_LOADED(addon)
	if addon ~= "r_Fonts" then return end
	rFonts:ApplySystemFonts()
	rFonts:UnregisterEvent("ADDON_LOADED")
end