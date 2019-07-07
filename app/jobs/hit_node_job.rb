class HitNodeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.info("hit node job was called with args #{args}")
    url = args['url']
    if url
      response = HTTParty.get("http://localhost:4000/?url=#{args['url']}")
      logger.info(response.body)
    else
      logger.info('No URL provided. Did not try')
  end
end
