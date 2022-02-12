Ruby
set :branch, 'main'
set :server_address, ENV["IP_PORT_SERV"]

ask(:password, nil, echo: false)
server fetch(:server_address), user: "deploy", roles: %w{app db web}

set :nginx_server_name, fetch(:server_address)
set :puma_preload_app, true 
set :branch, 'main'
set :server_address, ENV["IP_PORT_SERV"]
 
ask(:password, nil, echo: false)
server fetch(:server_address), user: "deploy", roles: %w{app db web}
 
set :nginx_server_name, fetch(:server_address)
set :puma_preload_app, true