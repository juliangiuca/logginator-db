class HitNodeJob < ApplicationJob
  queue_as :default

  def perform(args={})
    logger.info("hit node job was called with args #{args}")
    url = args["url"]
    if url
      logger.info("requesting #{url}")
      response = HTTParty.get("http://localhost:4000/?url=#{url}")
      logger.info("A response of #{response.body} from #{url}")
    else
      logger.info('No URL provided. Did not try')
    end
  end
end
