class VideoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'video_channel'
  end

  def unsubscribed
  end

  def create(opts)
    start_time = Time.now
    File.open(Rails.root.to_s + '/tmp/image.jpeg', 'wb') do|f|
      f.write(Base64.decode64(opts['imageData'].split(',')[1]), '')
    end
    timage = RTesseract.new(Rails.root.to_s + '/tmp/image.jpeg', lang: 'eng')
    puts "TOTAL processing time: ********** #{Time.now - start_time}"
    image =  Magick::Image.read_inline(opts['imageData']).first
    # img.each_pixel do |pixel, col, row|
    #   puts "Pixel at: #{col}x#{row}:
    #   \tR: #{pixel.red}, G: #{pixel.green}, B: #{pixel.blue}"
    # end
    image.resize_to_fit!(400, 300)
    ImageEventBroadcastJob.perform_later({text: timage.to_s, image: 'data:image/jpeg;base64,' + Base64.encode64(image.to_blob)})
  end
end
