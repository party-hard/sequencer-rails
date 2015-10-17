if Rails.env.development?
  Rails.application.config.before_initialize do
    if defined?(Rails::Server)
      puts '=> Starting Webpack in watch mode'
      `cd sequencer-react && npm run dev-rails > ../log/webpack.log & echo $! > tmp/pids/webpack.pid`
    end
  end

  at_exit do
    if defined?(Rails::Server)
      puts "Exiting Webpack"
      `/bin/kill -s SIGINT $(cat tmp/pids/webpack.pid) && rm tmp/pids/webpack.pid`
    end
  end
end
