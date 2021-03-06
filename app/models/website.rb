class Website < ApplicationRecord
  after_create :re_cron

  private
  def re_cron
    logger.info("re_cron called from #{self}")
    Sidekiq::Cron::Job.create(name: "#{self.url}-#{self.interval}", cron: '*/1 * * * *', class: 'HitNodeJob', args: {url: self.url}) # execute at every 1 minutes
  end
end
