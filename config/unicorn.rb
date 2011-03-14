rails_root = '/var/www/logomotiv/data/www/demo.logomotiv.ru'
rails_env  = 'production'
pid_file   = "/var/www/logomotiv/data/www/demo.logomotiv.ru/tmp/pids/unicorn.pid"
socket_file= "/var/www/logomotiv/data/www/demo.logomotiv.ru/tmp/unicorn.sock"
log_file   = "/var/www/logomotiv/data/www/demo.logomotiv.ru/log/unicorn.log"
username   = 'www-data'
group	   = 'www-data'

old_pid    = pid_file + '.oldbin'
 
 
timeout 30
 
worker_processes 8
 
listen socket_file, :backlog => 1024
pid pid_file
 
stdout_path log_file
 
preload_app true
 
GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)
 
before_fork do |server, worker|

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
 
 

 
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH

    end
  end
end
 
 
after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
 
 
  worker.user(username, group) if Process.euid == 0 && rails_env == 'production'
end