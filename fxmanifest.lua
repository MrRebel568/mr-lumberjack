fx_version 'cerulean'
game 'gta5'

author 'MrRebel'
description 'LumberJack By mr-script'
version '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts {
	'config.lua'
}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}
