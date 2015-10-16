if Rails.env.development?
  Rails.application.config.before_initialize do
    puts '=> Starting Webpack in watch mode'
    `cd sequencer-react && npm run dev-rails > ../log/webpack.log & echo $! > tmp/pids/webpack.pid`
  end

  at_exit do
    puts "Exiting Webpack"
    `/bin/kill -s SIGINT $(cat tmp/pids/webpack.pid) && rm tmp/pids/webpack.pid`
  end
end
