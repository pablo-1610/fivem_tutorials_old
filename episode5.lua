RegisterCommand("co", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos.x..", "..pos.y..", "..pos.z)
end, false)

local hasBmx = false

local colorByState = {
    [true] = {
        r = 255,
        g = 0,
        b = 0
    },

    [false] = {
        r = 0,
        g = 255,
        b = 0
    }
}

Citizen.CreateThread(function()
    while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(-1462.05, 102.15, 54.78)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 30 then
            interval = 200
        else
            interval = 1
            local color = colorByState[hasBmx]
            DrawMarker(2, -1462.05, 102.15, 54.78, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, color.r, color.g, color.b, 170, 0, 1, 2, 0, nil, nil, 0)
            if distance < 1 then  
                AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder à cette zone")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    if hasBmx then
                        print("Vous avez déjà eu votre BMX !")
                    else
                        hasBmx = true
                        local model = GetHashKey("bmx")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local bmx = CreateVehicle(model, pos, 90.0, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), bmx, -1)
                        print("Profitez bien de votre balade")
                    end
                end
            end
        end

        Citizen.Wait(interval)
    end
end)


    
