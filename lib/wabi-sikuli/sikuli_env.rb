require 'java'
require 'rukuli'

Rukuli::Config.run do |config|
    config.image_path = "#{Dir.pwd}/images/"
    config.logging = true
end