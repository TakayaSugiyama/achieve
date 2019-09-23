server '3.115.26.31', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/sugiyamatakashikana/.ssh/id_rsa'