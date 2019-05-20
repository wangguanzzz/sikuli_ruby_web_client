require 'java'
require 'rukuli'

Rukuli::Config.run do |config|
  config.image_path = "#{Dir.pwd}"
  config.logging = false
end

screen = Rukuli::Screen.new
#puts screen.methods
screen.double_click(10, 10) # should open your apple menu
#puts screen.methods