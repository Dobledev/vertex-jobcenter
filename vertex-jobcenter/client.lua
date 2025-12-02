CreateThread(function()
    RequestModel(GetHashKey(Config.NPCModel))
    while not HasModelLoaded(GetHashKey(Config.NPCModel)) do Wait(100) end

    local ped = CreatePed(4, GetHashKey(Config.NPCModel), Config.JobCenterCoords.x, Config.JobCenterCoords.y, Config.JobCenterCoords.z - 1.0, Config.JobCenterCoords.w, false, true)

    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetPedCanRagdoll(ped, false)
    SetEntityCanBeDamaged(ped, false)
    SetPedConfigFlag(ped, 185, true)
    SetPedFleeAttributes(ped, 0, 0)
    SetPedKeepTask(ped, true)
    SetPedAsEnemy(ped, false)

    local inRange = false
    while true do
        local sleep = 1000
        local pCoords = GetEntityCoords(PlayerPedId())
        local dist = #(pCoords - vector3(Config.JobCenterCoords.x, Config.JobCenterCoords.y, Config.JobCenterCoords.z))
        if dist < 10.0 then
            sleep = 5
            if dist < 2.5 then
                if not inRange then
                    lib.showTextUI(Config.PromptText)
                    inRange = true
                end
                if IsControlJustReleased(0,38) then
                    local menu = {}
                    for k,v in pairs(Config.Jobs) do
                        menu[#menu+1] = {title=v.label, description=v.description, serverEvent='vertex-jobcenter:setJob', args=k}
                    end
                    lib.registerContext({id='vertex_jobcenter', title='Job Center', options=menu})
                    lib.showContext('vertex_jobcenter')
                end
            elseif inRange then
                lib.hideTextUI()
                inRange = false
            end
        elseif inRange then
            lib.hideTextUI()
            inRange = false
        end
        Wait(sleep)
    end
end)
