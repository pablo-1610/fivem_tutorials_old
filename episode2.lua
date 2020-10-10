-- Code coté client :

local age = 5
local prenom = "Pablo"
local taille = 1.60


local awnsers = {
    "Vous allez bien ?",
    "Il fait beau aujourd'hui !",
    "Je m'ennuie !",
    "Il fait très chaud !",
    "Ca va ? ",
    "Vous faites quoi ?",
    "J'aime les kiwis"
}


local function getAge(addition)
    print(age + addition)
end

local function generateAwnser(delai)
    while true do
        print(awnsers[math.random(1,#awnsers)])
        Citizen.Wait(delai)
    end
    
end

Citizen.CreateThread(function()
    generateAwnser(500)
end)
