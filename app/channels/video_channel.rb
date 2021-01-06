class VideoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'video_channel'
  end

  def unsubscribed
    # Player.unsubscribe_player(params['userId'])
  end

  def create(opts)
    ImageEventBroadcastJob.perform_later(opts['imageData'])
  end
end
