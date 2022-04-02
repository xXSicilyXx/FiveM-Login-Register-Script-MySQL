local ft_login = true

function EnableGuiLogin(StatusGui)    
ft_login = StatusGui
SetNuiFocus(StatusGui, StatusGui)
DisplayRadar(false)
SendNUIMessage({type = "EnableGuiLogin", StatusJs = StatusGui})
end

-- EVENTO CLICK BOTTONE LOGIN --
RegisterNUICallback('ft_login:LoginServer', function(data)
local email = data.email
--local username = data.username
local password = data.password
TriggerServerEvent('ft_login:CheckServer', email, password) -- sent to server the local string from data. json
end)

-- ERRORE LOGIN --
RegisterNetEvent('ft_login:ErrorMessageClientInChat') -- register event for use from server side
AddEventHandler('ft_login:ErrorMessageClientInChat', function( ErrorMessage )
local text = '<b>~r~ERRORE!~s~</b> ' .. ErrorMessage	
DisplayNotification(text)
end)

-- SUCCESSO LOGIN --
RegisterNetEvent('ft_login:ValidMessageClientInChat') -- register event for use from server side
AddEventHandler('ft_login:ValidMessageClientInChat', function( ValidMessage )
local text = '<b>~g~WELCOME!~s~</b> ' .. ValidMessage	
DisplayNotification(text)	
EnableGuiLogin(false) -- Disable	
DisplayRadar(true) -- Display mini map		
end)

-- EVENTO CLICK BOTTONE REGISTRATI --
RegisterNUICallback('ft_login:RegisterServer', function(data)
local email = data.email
--local username = data.username
local password = data.password
TriggerServerEvent('ft_login:CheckRegisterServer', email, password)
end)




RegisterNUICallback('ft_login:LoginErrorServer', function()
local text = '<b>~r~ERRORE!~s~</b>'	
DisplayNotification(text)		
end)


RegisterNUICallback('ft_login:LeaveServer', function()
TriggerServerEvent('ft_login:QuitServer')		
end)


Citizen.CreateThread(function()
while true do
if ft_login then
EnableGuiLogin(true)	
end		
Citizen.Wait(0)
end
end)

function DisplayNotification(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(true, false)
end