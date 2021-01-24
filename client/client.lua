QBCore = nil

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

local vol = 5 --This is the base volume the music starts playing on, set a value between 0 and 10
local MenuSubTitle = "Voor al uw JAMZ" -- This is the sub-title, change it if you want.
local SRadio = MenuV:CreateMenu('S-RADIO', MenuSubTitle, 'centerright', 209, 159, 8, 'size-100', 'default', 'menuv', 'radio_menu', 'native') -- THIS IS THE MENU, DONT TOUCH IT UNLESS YOU KNOW WHAT YOU'RE DOING
local NowPlaying = "Made by ASKP#3522" -- DONT EDIT, IT WILL FUCK UP THE SCRIPT

RegisterNetEvent("AS-SRadio:Client:TriggerMenu")
AddEventHandler("AS-SRadio:Client:TriggerMenu", function()
	SRadio:ClearItems()
	local volumee = SRadio:AddRange({label = '🔊 Volume', min = 0, max = 10, value = vol, saveOnUpdate = true, description = "Made by ASKP#3522"  }) -- DONT EDIT, IT WILL FUCK UP THE SCRIPT
	volumee:On('change', function(item, newValue, oldValue)
		TriggerEvent("AS-SRadio:Client:ChangeAirpodsVolume", newValue)
	end)
	QBCore.Functions.TriggerCallback('AS-SRadio:Server:SyncRadios', function(radios)
		if radios ~= nil then
			for k, v in pairs(radios) do
				local station = k
				station = SRadio:AddButton({ icon = v.id, label = '📻 '..v.name, value = v.id, description = NowPlaying}) -- DONT EDIT, IT WILL FUCK UP THE SCRIPT
				station:On('select', function(item)
					if v.url == nil then
						TriggerEvent("AS-SRadio:Client:StopAirpods")
						TriggerEvent("AS-SRadio:Client:ToggleAirpods", false)
						QBCore.Functions.Notify(Config.RadioOffMSG)
						NowPlaying = "Made by ASKP#3522"
					else
						TriggerEvent("AS-SRadio:Client:PlayAirpods", v.url)
						TriggerEvent("AS-SRadio:Client:ToggleAirpods", true)
						QBCore.Functions.Notify(Config.RadioOnMSG ..v.name)						
						NowPlaying = "Nu aan het afspelen: "..v.name
					end
					SRadio:Close()
					TriggerEvent("AS-SRadio:Client:OpenMenu")
				end)
			end
		end
	end)
end)

RegisterNetEvent("AS-SRadio:Client:PlayAirpods")
AddEventHandler("AS-SRadio:Client:PlayAirpods", function(url)
	SendNUIMessage({
		playradio = true,
		sound = url,
	})
	SendNUIMessage({
		changevolume = true,
		volume = vol/100 -- DONT EDIT, IT WILL FUCK UP THE SCRIPT
	})
end)

RegisterNetEvent("AS-SRadio:Client:ChangeAirpodsVolume")
AddEventHandler("AS-SRadio:Client:ChangeAirpodsVolume", function(newValue)
	local volum = newValue/100 -- DONT EDIT, IT WILL FUCK UP THE SCRIPT
	SendNUIMessage({
		changevolume = true,
		volume = tonumber(volum)
	})
	vol = volum*100 -- DONT EDIT, IT WILL FUCK UP THE SCRIPT
end)

RegisterNetEvent("AS-SRadio:Client:StopAirpods")
AddEventHandler("AS-SRadio:Client:StopAirpods", function()
	SendNUIMessage({
		stopradio = true
	})
end)

RegisterNetEvent("AS-SRadio:Client:ToggleAirpods")
AddEventHandler("AS-SRadio:Client:ToggleAirpods", function(airpods)
	if Config.UseAirpodMod == true then
		local ped = GetPlayerPed(-1)
		if airpods == false then
			ClearPedProp(ped, 2)
		elseif airpods == true then
			SetPedPropIndex(ped, 2, 3, 0, true)
		end
	end
end)

RegisterNetEvent("AS-SRadio:Client:OpenMenu")
AddEventHandler("AS-SRadio:Client:OpenMenu", function()
	TriggerEvent("AS-SRadio:Client:TriggerMenu")
	MenuV:OpenMenu(SRadio)
end)