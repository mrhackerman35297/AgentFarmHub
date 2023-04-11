--// [Open Sourced] nothing important here so i do not mind.
local Games = {
	["DaHood.lua"] = 2788229376 or 7213786345,
	["HoodCustoms.lua"] = 9825515356,
	["HoodModded.lua"] = 5602055394,
	["FiveDuels.lua"] = 11883610532,
	["BuildaBoat.lua"] = 537413528,
}
local Directory = "https://raw.githubusercontent.com/mrhackerman35297/AgentFarmHub/main/Games"

local function FindGame(id,num)
	if num == 1 then
	for index, value in pairs(Games) do
		if value == id then
			return id
		end
	end
	elseif num == 2 then
		for index, value in pairs(Games) do
			if value == id then
				return index
			end
		end
	end
end
local function Kick(Code, Custom)
	local KickReasons = {"0x01","0x02","0x03","0x04"}
	local gbl = ""
	local Help = ". Join our discord for more help https://discord.gg/wPQHasG3nX"
	if Code == KickReasons[1] then
		gbl = KickReasons[1].." - Game Not Supported"..Help
	elseif Code == KickReasons[2] then
		gbl = KickReasons[2].." - Variables Not Found"..Help
	elseif Code == KickReasons[3] then
		gbl = KickReasons[3].." - Script Down"..Help
	elseif Code == KickReasons[4] then
		gbl = KickReasons[4].." - Blacklisted"..Help
	else
		gbl = "Script Internal Error - "..Custom.." REPORT THIS TO https://discord.gg/wPQHasG3nX IMMEDIATELY!!!"
	end
	game.Players.LocalPlayer:Kick(gbl)
end

if FindGame(game.PlaceId, 1) then
	local s,e = pcall(function()
		local GameName = FindGame(game.PlaceId, 2)
		print('Game Found - '..GameName)
		print(game:HttpGet(Directory.."/"..GameName))
		if GameName == "HoodCustoms.lua" then
			if (not AgentHCFarm) then
				Kick("0x02")
			end
		elseif GameName == "FiveDuels.lua" then
			if (not FiveDuelsFarm) then
				Kick("0x02")
			end
		end
	end)
	if e then Kick("Script Interanl Error", e) end
else
	Kick("0x01")
end

