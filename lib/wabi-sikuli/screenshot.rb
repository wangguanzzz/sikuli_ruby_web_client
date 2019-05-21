require 'java'

def create_screen_shot(output_file,start_x=nil, start_y=nil, end_x=nil,end_y=nil)
  robot = java.awt.Robot.new
  toolkit = java.awt.Toolkit.getDefaultToolkit
  dim = toolkit.getScreenSize
  if start_x.nil? 
    rectangle = java.awt.Rectangle.new(0, 0, dim.getWidth, dim.getHeight)
  else
    rectangle = java.awt.Rectangle.new(start_x,start_y,end_x,end_y)
  end

  screen_capture = robot.createScreenCapture(rectangle)
  output = java.io.File.new(output_file)
  javax.imageio.ImageIO.write(screen_capture,'png',output)
end

# example
# create_screen_shot('test.png')
# create_screen_shot('test2.png', 100,100,200,200)