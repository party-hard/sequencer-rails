if Rails.env.development? and defined?(Rails::Server)
  Rails.application.config.before_initialize do
      puts '=> Starting Webpack in watch mode'
      system('cd sequencer-react && npm run dev-rails > ../log/webpack.log &')
  end
end
