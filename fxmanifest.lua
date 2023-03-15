fx_version 'cerulean'
games { 'gta5' }

author 'FivePD'
version '1.5'

ui_page './computer/index.html'
loadscreen './loading_screen/index.html'

files {
	'./MenuAPI.dll',
	'./NativeUI.dll',
	'./Newtonsoft.Json.dll',
	'./loading_screen/bundle.js',
	'./loading_screen/index.html',
	'./FivePD.net.dll',
	'./index.html',
    './callouts/*.dll',
	'./callouts/*.json',
	'./callouts/**/*.json',
	'./languages/*.json',
	'./computer/*',
	'./computer/static/*',
	'./computer/static/css/*',
	'./computer/static/js/*',
	'./computer/static/media/*',
	'./computer/public/*',
	'./computer/public/icon/*',
	'./config/callouts.json',
	'./config/coordinates.json',
	'./config/disabled_callouts.json',
	'./config/garage.json',
	'./config/vehicles.json',
	'./config/loadouts.json',
	'./config/questions.json',
	'./config/scene_management.json',
	'./config/menu.json'
}

client_scripts {
    './FivePD_client.net.dll',
  	'./callouts/*.net.dll',
	'./callouts/**/*.net.dll',
	'./plugins/*.net.dll',
	'./plugins/**/*.net.dll'
}
server_scripts {
    './System.Net.dll',
	'./FivePD_server.net.dll'
}
clr_disable_task_scheduler 'yes'