class Website < ApplicationRecord
  after_save :re_cron

  private
  def re_cron
    logger.info('re_cron called')
    Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/1 * * * *', class: 'HitNodeJob') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc
  end
end
