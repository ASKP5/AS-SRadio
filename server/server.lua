ASCore = nil

TriggerEvent("ASCore:GetObject", function(obj) ASCore = obj end)

ASCore.Functions.CreateCallback('AS-SRadio:Server:SyncRadios', function(source, cb)
	local src = source
  exports['ghmattimysql']:execute('SELECT * FROM radios', function(radiolist)
    local Radios = {}

    for i=1, #radiolist, 1 do
      table.insert(Radios, radiolist[i])
    end

    if radiolist ~= nil then
      cb(Radios)
    else
      cb(nil)
    end
  end)
end)

ASCore.Functions.CreateUseableItem("airpods", function(source)
  local Player = ASCore.Functions.GetPlayer(source)
  local src = source
  TriggerClientEvent("AS-SRadio:Client:OpenMenu", src)
end)