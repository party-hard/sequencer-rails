env = ENV['RAILS_ENV'] || 'development'

timeout 60
worker_processes env == 'production' ? 4 : 1

listen File.join(File.expand_path('../../../../shared', __FILE__), 'tmp/sockets/unicorn.socket'), backlog: 64
pid 'tmp/pids/unicorn.pid'
stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'

preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
end

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.
  old_pid = 'tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # Old server already killed. Nothing else to do.
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end

