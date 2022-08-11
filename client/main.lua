local QBCore = exports['qb-core']:GetCoreObject()
local chopping = false

RegisterNetEvent('mr-lumberjack:getLumberStage', function(stage, state, k)
    Config.TreeLocations[k][stage] = state
end)

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

local function axe()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)
    for k, v in pairs(Config.Axe) do
        if pedWeapon == k then
            return true
        end
    end
    QBCore.Functions.Notify(Config.Alerts["error_axe"], 'error')
end

local function ChopLumber(k)
    local animDict = "melee@hatchet@streamed_core"
    local animName = "plyr_rear_takedown_b"
    local MrRebel = PlayerPedId()
    local choptime = Lumber.ChoppingTreeTimer
    chopping = true
    FreezeEntityPosition(MrRebel, true)
    QBCore.Functions.Progressbar("Chopping_Tree", Config.Alerts["chopping_tree"], choptime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('mr-lumberjack:setLumberStage', "isChopped", true, k)
        TriggerServerEvent('mr-lumberjack:setLumberStage', "isOccupied", false, k)
        TriggerServerEvent('mr-lumberjack:recivelumber')
        TriggerServerEvent('mr-lumberjack:setChoppedTimer')
        chopping = false
        TaskPlayAnim(MrRebel, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(MrRebel, false)
    end, function()
        ClearPedTasks(MrRebel)
        TriggerServerEvent('mr-lumberjack:setLumberStage', "isOccupied", false, k)
        chopping = false
        TaskPlayAnim(MrRebel, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(MrRebel, false)
    end)
    TriggerServerEvent('mr-lumberjack:setLumberStage', "isOccupied", true, k)
    CreateThread(function()
        while chopping do
            loadAnimDict(animDict)
            TaskPlayAnim(MrRebel, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Wait(3000)
        end
    end)
end

RegisterNetEvent('mr-lumberjack:StartChopping', function()
    for k, v in pairs(Config.TreeLocations) do
        if not Config.TreeLocations[k]["isChopped"] then
            if axe() then
                ChopLumber(k)
            end
        end
    end
end)

if Config.Job then
    CreateThread(function()
        for k, v in pairs(Config.TreeLocations) do
            exports["qb-target"]:AddBoxZone("trees" .. k, v.coords, 1.5, 1.5, {
                name = "trees" .. k,
                heading = 40,
                minZ = v.coords["z"] - 2,
                maxZ = v.coords["z"] + 2,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            if axe() then
                                ChopLumber(k)
                            end
                        end,
                        type = "client",
                        event = "mr-lumberjack:StartChopping",
                        icon = "fa fa-hand",
                        label = Config.Alerts["Tree_label"],
                        job = "lumberjack",
                        canInteract = function()
                            if v["isChopped"] or v["isOccupied"] then
                                return false
                            end
                            return true
                        end,
                    }
                },
                distance = 1.0
            })

        end
    end)
    exports['qb-target']:AddBoxZone("lumberjackdepo", LumberDepo.targetZone, 1, 1, {
        name = "Lumberjackdepo",
        heading = LumberDepo.targetHeading,
        debugPoly = false,
        minZ = LumberDepo.minZ,
        maxZ = LumberDepo.maxZ,
    }, {
        options = {
        {
          type = "client",
          event = "mr-lumberjack:bossmenu",
          icon = "Fas Fa-hands",
          label = Config.Alerts["depo_label"],
          job = "lumberjack",
        },
        },
        distance = 2.0
    })
    exports['qb-target']:AddBoxZone("LumberProcessor", LumberProcessor.targetZone, 1, 1, {
        name = "LumberProcessor",
        heading = LumberProcessor.targetHeading,
        debugPoly = false,
        minZ = LumberProcessor.minZ,
        maxZ = LumberProcessor.maxZ,
    }, {
        options = {
        {
          type = "client",
          event = "mr-lumberjack:processormenu",
          icon = "Fas Fa-hands",
          label = Config.Alerts["mill_label"],
          job = "lumberjack",
        },
        },
        distance = 2.0
    })
    exports['qb-target']:AddBoxZone("LumberSeller", LumberSeller.targetZone, 1, 1, {
        name = "LumberProcessor",
        heading = LumberSeller.targetHeading,
        debugPoly = false,
        minZ = LumberSeller.minZ,
        maxZ = LumberSeller.maxZ,
    }, {
        options = {
        {
          type = "server",
          event = "mr-lumberjack:sellItems",
          icon = "fa fa-usd",
          label = Config.Alerts["Lumber_Seller"],
          job = "lumberjack",
        },
        },
        distance = 2.0
    })
else
    CreateThread(function()
        for k, v in pairs(Config.TreeLocations) do
            exports["qb-target"]:AddBoxZone("trees" .. k, v.coords, 1.5, 1.5, {
                name = "trees" .. k,
                heading = 40,
                minZ = v.coords["z"] - 2,
                maxZ = v.coords["z"] + 2,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            if axe() then
                                ChopLumber(k)
                            end
                        end,
                        type = "client",
                        event = "mr-lumberjack:StartChopping",
                        icon = "fa fa-hand",
                        label = Config.Alerts["Tree_label"],
                        canInteract = function()
                            if v["isChopped"] or v["isOccupied"] then
                                return false
                            end
                            return true
                        end,
                    }
                },
                distance = 2.0
            })

        end
    end)
    exports['qb-target']:AddBoxZone("lumberjackdepo", LumberDepo.targetZone, 1, 1, {
        name = "Lumberjackdepo",
        heading = LumberDepo.targetHeading,
        debugPoly = false,
        minZ = LumberDepo.minZ,
        maxZ = LumberDepo.maxZ,
    }, {
        options = {
        {
          type = "client",
          event = "mr-lumberjack:bossmenu",
          icon = "Fas Fa-hands",
          label = Config.Alerts["depo_label"],
        },
        },
        distance = 2.0
    })
    exports['qb-target']:AddBoxZone("LumberProcessor", LumberProcessor.targetZone, 1, 1, {
        name = "LumberProcessor",
        heading = LumberProcessor.targetHeading,
        debugPoly = false,
        minZ = LumberProcessor.minZ,
        maxZ = LumberProcessor.maxZ,
    }, {
        options = {
        {
          type = "client",
          event = "mr-lumberjack:processormenu",
          icon = "Fas Fa-hands",
          label = Config.Alerts["mill_label"],
        },
        },
        distance = 2.0
    })
    exports['qb-target']:AddBoxZone("LumberSeller", LumberSeller.targetZone, 1, 1, {
        name = "LumberProcessor",
        heading = LumberSeller.targetHeading,
        debugPoly = false,
        minZ = LumberSeller.minZ,
        maxZ = LumberSeller.maxZ,
    }, {
        options = {
        {
          type = "server",
          event = "mr-lumberjack:sellItems",
          icon = "fa fa-usd",
          label = Config.Alerts["Lumber_Seller"],
        },
        },
        distance = 2.0
    })
end


RegisterNetEvent('mr-lumberjack:getaxe', function()
    TriggerServerEvent('mr-lumberjack:BuyAxe')
end)

RegisterNetEvent('mr-lumberjack:bossmenu', function()
    local vehicle = {
      {
        header = Config.Alerts["vehicle_header"],
        isMenuHeader = true,
      },
      {
          header = Config.Alerts["battleaxe_label"],
          txt = Config.Alerts["battleaxe_text"],
          params = {
              event = 'mr-lumberjack:getaxe',
            }
      },
      {
        header = Config.Alerts["goback"],
      },
    }
exports['qb-menu']:openMenu(vehicle)
end)

RegisterNetEvent('mr-lumberjack:processormenu', function()
    local processor = {
      {
        header = Config.Alerts["lumber_mill"],
        isMenuHeader = true,
      },
      {
          header = Config.Alerts["lumber_header"],
          txt = Config.Alerts["lumber_text"],
          params = {
              event = 'mr-lumberjack:processor',
            }
      },
      {
        header = Config.Alerts["goback"],
      },
    }
exports['qb-menu']:openMenu(processor)
end)

RegisterNetEvent('mr-lumberjack:processor', function()
    QBCore.Functions.TriggerCallback('mr-lumberjack:lumber', function(lumber)
      if lumber then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar('lumber_trader', Config.Alerts['lumber_progressbar'], Lumber.ProcessingTime , false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()    
            local playerPed = PlayerPedId()
            local success = exports['qb-lock']:StartLockPickCircle(4,6)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("mr-lumberjack:lumberprocessed")
        end, function() 
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not lumber then
        QBCore.Functions.Notify(Config.Alerts['error_lumber'], "error", 3000)
      end
    end)
end)
