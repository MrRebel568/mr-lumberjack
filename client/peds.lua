local QBCore = exports['qb-core']:GetCoreObject()
local RebelMan = LumberDepo.coords
local LumberMR = LumberProcessor.coords
local sellRebel = LumberSeller.coords
local RebelPed = Lumber.LumberModel
local RebelHash = Lumber.LumberHash

CreateThread(function()
    RequestModel( GetHashKey( RebelPed ) )
    while ( not HasModelLoaded( GetHashKey( RebelPed ) ) ) do
        Wait(1)
    end
    lumberjack1 = CreatePed(1, RebelHash, RebelMan, false, true)
    lumberjack2 = CreatePed(1, RebelHash, LumberMR, false, true)
    lumberjack3 = CreatePed(1, RebelHash, sellRebel, false, true)
    SetEntityInvincible(lumberjack1, true)
    SetBlockingOfNonTemporaryEvents(lumberjack1, true)
    FreezeEntityPosition(lumberjack1, true)
    SetEntityInvincible(lumberjack2, true)
    SetBlockingOfNonTemporaryEvents(lumberjack2, true)
    FreezeEntityPosition(lumberjack2, true)
    SetEntityInvincible(lumberjack3, true)
    SetBlockingOfNonTemporaryEvents(lumberjack3, true)
    FreezeEntityPosition(lumberjack3, true)
end)