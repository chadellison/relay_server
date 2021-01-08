class VideoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'video_channel'
  end

  def unsubscribed
  end

  def create(opts)
    File.open('image.jpeg', 'wb') do|f|
      f.write(Base64.decode64(opts['imageData'].split(',')[1]), '')
    end

    image = RTesseract.new(Rails.root.to_s + '/image.jpeg', lang: 'eng')
    ImageEventBroadcastJob.perform_later({text: image.to_s})
  end
end
