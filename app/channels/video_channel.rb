class VideoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'video_channel'
  end

  def unsubscribed
  end

  def create(opts)
    File.open(Rails.root.to_s + '/tmp/image.jpeg', 'wb') do|f|
      f.write(Base64.decode64(opts['imageData'].split(',')[1]), '')
    end
    start_time = Time.now
    image = RTesseract.new(Rails.root.to_s + '/tmp/image.jpeg', lang: 'eng')
    puts "TOTAL tesseract time: ********** #{Time.now - start_time}"
    ImageEventBroadcastJob.perform_later({text: image.to_s})
  end
end
