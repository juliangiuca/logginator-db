class HitNodeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.info('hit node job was called')
    # Do something later
  end
end
