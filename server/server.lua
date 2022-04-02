-- EVENTI LATO SERVER --

-- CHECK LOGIN --
RegisterServerEvent('ft_login:CheckServer')
AddEventHandler('ft_login:CheckServer', function(email, password)
--local result = MySQL.Sync.fetchAll("SELECT * FROM accounts WHERE email = @email OR username = @username AND password = @password", { ['@email'] = email, ['@username'] = username, ['@password'] = password } )
local result = MySQL.Sync.fetchAll("SELECT * FROM accounts WHERE email = @email AND password = @password", {['@email'] = email, ['@password'] = password })
local Player = result[1]
if Player == nil then
local ErrorMessage = "Player not exists or wrong password"		
TriggerClientEvent('ft_login:ErrorMessageClientInChat', -1, ErrorMessage) -- go to client event
else
local ValidMessage = "Login successFul"		
TriggerClientEvent('ft_login:ValidMessageClientInChat', -1, ValidMessage) -- go to client event
end	
end)


-- CHECK REGISTRAZIONE --
RegisterServerEvent('ft_login:CheckRegisterServer')
AddEventHandler('ft_login:CheckRegisterServer', function(email, password)
--local result = MySQL.Sync.fetchAll("SELECT * FROM accounts WHERE email = @email OR username = @username AND password = @password", { ['@email'] = email, ['@username'] = username, ['@password'] = password } )	
local result = MySQL.Sync.fetchAll("SELECT * FROM accounts WHERE email = @email AND password = @password", { ['@email'] = email, ['@password'] = password } )
local Player = result[1]
if Player == nil then
print("REGISTRATO CON SUCCESSO!")
local ValidMessage = "Registrato con successo"		
TriggerClientEvent('ft_login:ValidMessageClientInChat', -1, ValidMessage) -- go to client event
else
local ErrorMessage = "Player not exists or wrong password"		
TriggerClientEvent('ft_login:ErrorMessageClientInChat', -1, ErrorMessage) -- go to client event
end
end)

-- DISCONNETTI --
RegisterServerEvent('ft_login:QuitServer')
AddEventHandler('ft_login:QuitServer', function()
DropPlayer(source, 'You have logged out successfully, see you next time !')
CancelEvent()
end)
