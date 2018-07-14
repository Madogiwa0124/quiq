class QuizImageHelper
  require "mini_magick"
  require "securerandom"

  BASE_IMAGE_PATH = './app/assets/images/bg_image.png'
  GRAVITY = 'center'
  TEXT_POSITION = '0,0'
  FONT = './app/assets/fonts/komorebi-gothic.ttf'
  FONT_SIZE = '40'
  INDENTION_COUNT = 11
  ROW_LIMIT = 8

  def self.create(text)
    text = prepare_text(text)
    @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    configuration(text)
    @image.write uniq_file_name
  end

  def self.uniq_file_name
    "#{SecureRandom.hex}.png"
  end

  def self.configuration(text)
    @image.combine_options do |config|
      config.font FONT
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end

  def self.prepare_text(text)
    text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end
