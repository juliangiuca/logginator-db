class Website < ApplicationRecord
  after_save :re_cron

  private
  def re_cron
    logger.info('re_cron called')
    Sidekiq::Cron::Job.create(name: 'Hard worker - every 1min', cron: '*/1 * * * *', class: 'HitNodeJob', args: {url: self.url}) # execute at every 1 minutes
  end
end
