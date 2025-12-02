if Config.Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
    print("[vertex-jobcenter] ESX Framework")
end

if Config.Framework == 'QBCore' then
    QBCore = exports['qb-core']:GetCoreObject()
    print("[vertex-jobcenter] QBCore Framework")
end

local function setJob(src, job)
    if not Config.Jobs[job] then
        TriggerClientEvent('ox_lib:notify', src, {type='error', description='Error: El trabajo seleccionado no existe.'})
        return
    end

    if Config.Framework == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then xPlayer.setJob(job,0) end
    elseif Config.Framework == 'QBCore' then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then Player.Functions.SetJob(job,0) end
    end

    TriggerClientEvent('ox_lib:notify', src, {type='success', description='Ahora trabajas como '..Config.Jobs[job].label})
end

RegisterNetEvent('vertex-jobcenter:setJob', function(job)
    setJob(source, job)
end)
