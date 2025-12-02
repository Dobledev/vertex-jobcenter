Config = {}

Config.Framework = 'ESX' -- 'ESX' | 'QBCore'

Config.NPCModel = 'cs_bankman' -- NPC Model
Config.JobCenterCoords = vector4(-260.8707, -965.1926, 31.2242, 118.1896) -- NPC Coords

Config.PromptText = '[E] Abrir Job Center'

Config.Jobs = {
    ['police'] = {label='Policia', description='Unete al cuerpo de LSPD'},
    ['ambulance'] = {label='EMS', description='Ofrece tus servicios a la EMS'},
    ['taxi'] = {label='Taxi', description='Cobra por llevar a otros ciudadanos a sus destinos'}
}
