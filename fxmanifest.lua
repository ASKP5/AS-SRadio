fx_version 'cerulean'
games { 'gta5' }

author 'ASKP#3522'
description 'Airpod system by ASKP#3522'

client_scripts {
    '@menuv/menuv.lua',
    'client/client.lua',
    'config.lua'
}

server_script 'server/server.lua'

ui_page "html/index.html"

files {
	"html/index.html"
}

dependencies {
    'menuv'
}