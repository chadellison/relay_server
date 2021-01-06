class ImageEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(imageData)
    ActionCable
      .server
      .broadcast('video_channel', imageData)
  end
end
