server_script {
'@mysql-async/lib/MySQL.lua',
'server/server.lua',
}

client_script {
'client/client.lua',
}

files {
'client/html/index.html',
'client/html/style.css',
'client/html/script.js',
'client/html/images/bg.jpg',
'client/html/images/logo.png',
}

ui_page('client/html/index.html')