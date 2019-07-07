web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production
