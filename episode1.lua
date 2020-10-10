-- Dans le server.cfg

ensure scripttest

-- Code du fxmanifest.lua

fx_version 'adamant'
game 'gta5'

client_scripts {
    'client.lua'
}

-- Code coté client :

local age = 5
local prenom = "Pablo"
local taille = 1.60
local friends = {
    "Pablo",
    "Jacques",
    "Michel"
}


local function getAge(addition)
    print(age + addition)
end
-
Citizen.CreateThread(function()
    print(friends[2].." | "..friends[1])
    getAge(1)
    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        getAge(5)
    end)
    getAge(10)

end)
