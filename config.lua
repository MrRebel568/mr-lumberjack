Config = Config or {}
Config.UseBlips = true                                       -- True / false option for toggling farm blips
Config.Timeout = 10 * (60 * 1000)                            -- 10 minutes


LumberDepo = {
    targetZone = vector3(-552.56, 5348.69, 74.75),           -- qb-target
    targetHeading = 345, 
    coords = vector4(-552.57, 5348.65, 73.74, 72.84),        -- Move Location (Ped and blip)
    SetBlipSprite = 1,                                       -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                      -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.85,                                     -- Blip Size
    SetBlipColour = 5,                                       -- Blip Color
    BlipLabel = "Lumberjack",                                -- Blip Label
    minZ = 73.85,                                            -- Max Z
    maxZ = 77.85,                                            -- Max Z 
}
LumberProcessor = {
    targetZone = vector3(-533.21, 5293.22, 74.17),
    targetHeading = 1,
    minZ = 71.17,
    maxZ = 75.17,
}
LumberSeller = {
    targetZone = vector3(-473.62, 5307.17, 86.69),
    targetHeading = 340,
    coords = vector4(-473.75, 5307.13, 85.69, 71.28),
    minZ = 85.69,
    maxZ = 89.69,
}

Lumber = {
    LumberModel = "s_m_y_construct_01",                    -- Ped model  (https://docs.fivem.net/docs/game-references/ped-models/)
    LumberHash = 0xD7DA9E99,                               -- Hash numbers for ped model

    ChoppingTreeTimer = 15 * 1000,                         -- 12 second timer
    ProcessingTime = 10 * 1000,                            -- 10 second timer

    LumberAmount_Min = 2,
    LumberAmount_Max = 5,

    TradeAmount_Min = 2,
    TradeAmount_Max = 5,

    TradeRecevied_Min = 1,
    TradeRecevied_Max = 3,

    AxePrice = 50,                                        -- Axe Price ($100)
}

Config.Sell = {
    ["tree_lumber"] = {
        ["price"] = math.random(45, 60)                   -- Seller Price
    },
    ["wood_plank"] = {
        ["price"] = math.random(65, 100)
    },
}

Config.Axe = {
    [`weapon_battleaxe`] = {}
}

Config.TreeLocations = {
    [1] = {
        ["coords"] = vector3(-504.47, 5392.09, 75.82),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [2] = {
        ["coords"] = vector3(-510.08, 5389.15, 73.71),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [3] = {
        ["coords"] = vector3(-558.32, 5418.98, 62.78),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [4] = {
        ["coords"] = vector3(-561.47, 5420.32, 62.39),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [5] = {
        ["coords"] = vector3(-578.9, 5427.22, 58.54),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [6] = {
        ["coords"] = vector3(-600.28, 5397.03, 52.48),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [7] = {
        ["coords"] = vector3(-614.04, 5399.73, 50.86),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [8] = {
        ["coords"] = vector3(-616.38, 5403.72, 50.59),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [9] = {
        ["coords"] = vector3(-553.08, 5445.65, 64.16),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [10] = {
        ["coords"] = vector3(-500.53, 5401.34, 75.05),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [11] = {
        ["coords"] = vector3(-491.78, 5395.47, 77.57),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [12] = {
        ["coords"] = vector3(-457.24, 5398.19, 79.35),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [13] = {
        ["coords"] = vector3(-456.87, 5408.32, 79.26),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [14] = {
        ["coords"] = vector3(-627.6, 5322.19, 59.86),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [15] = {
        ["coords"] = vector3(-626.05, 5315.49, 60.87),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [16] = {
        ["coords"] = vector3(-628.47, 5286.07, 63.75),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [17] = {
        ["coords"] = vector3(-604.23, 5243.57, 71.53),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [18] = {
        ["coords"] = vector3(-599.94, 5239.87, 71.87),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [19] = {
        ["coords"] = vector3(-556.65, 5233.61, 72.53),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [20] = {
        ["coords"] = vector3(-557.92, 5224.02, 77.24),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [21] = {
        ["coords"] = vector3(-546.26, 5219.38, 77.94),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [22] = {
        ["coords"] = vector3(-537.93, 5226.47, 78.52),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [23] = {
        ["coords"] = vector3(-628.32, 5286.04, 63.76),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [24] = {
        ["coords"] = vector3(-633.1, 5275.56, 69.11),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [25] = {
        ["coords"] = vector3(-604.37, 5243.69, 71.89),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [26] = {
        ["coords"] = vector3(-646.03, 5269.73, 74.01),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [27] = {
        ["coords"] = vector3(-644.29, 5241.2, 76.3),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [28] = {
        ["coords"] = vector3(-657.02, 5296.15, 69.35),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [29] = {
        ["coords"] = vector3(-659.05, 5293.48, 70.02),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [30] = {
        ["coords"] = vector3(-664.32, 5277.7, 74.4),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [31] = {
        ["coords"] = vector3(-615.24, 5433.06, 54.3),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [32] = {
        ["coords"] = vector3(-616.14, 5424.5, 51.71),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
}

Config.Alerts = {
    ['cancel'] = 'Cancelled',
    ['error_lumber'] = 'You Do Not Have Any Lumber To Do This',
    ['error_axe'] = 'You dont have a axe to chop the tree',
    ['lumber_progressbar'] = 'Separate The Wood',
    ['itemamount'] = 'You are trying to process a amount that is invalid try again!',
    ['lumber_processed_trade'] = 'You successfully traded ',
    ['lumber_processed_lumberamount'] = ' Amount of Lumber for ',
    ['lumber_processed_received'] = ' Piles of wooden panks',
    ['error_sold'] = 'You Dont Have The Items To Sell Here!',
    ['successfully_sold'] = 'You Have Sold Your Items',
    ["axe_check"] = 'You already have a axe',
    ["axe_bought"] = 'You have bought a axe from the boss for $' ..Lumber.AxePrice,
    ['chopping_tree'] = 'Chopping Tree',
    ['Tree_label'] = 'Start Chopping',
    ['depo_label'] = 'Talk to boss',
    ['mill_label'] = 'Separate Wood',
    ['depo_blocked'] = 'Vehicle blocking depo',
    ['depo_stored'] = 'Job Vehicle Stored',
    ['vehicle_header'] = 'Lumber Jack Boss',
    ['battleaxe_label'] = 'Lumber Axe',
    ['battleaxe_text'] = 'Axe used for chopping down trees',
    ['lumber_mill'] = 'Lumber Mill',
    ['lumber_header'] = 'Process Lumber',
    ['lumber_text'] = 'Separate The Wood Planks',
    ['Lumber_Seller'] = 'Sell Lumber',
    ['goback'] = '< Go Back',
}