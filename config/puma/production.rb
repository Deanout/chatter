def home_dir
    '/home/chatter'
end

def path(p)
    File.join(home_dir, p)
end

directory home_dir
environment 'production'

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

pidfile path('tmp/pids/puma.pid')
state_path path('tmp/pids/puma.state')
stdout_redirect path('log/puma.log'), path('log/error.puma.log'), true
threads 0, 1
bind "unix:///home/chatter/tmp/pids/puma.sock"
activate_control_app
