java_import 'java.awt.Robot'
java_import 'java.awt.Toolkit'
java_import 'java.awt.Dimension'
java_import 'java.awt.Rectangle'
java_import 'java.awt.image.BufferedImage'
java_import 'javax.imageio.ImageIO'
java_import 'java.io.File'

def create_screen_shot(output_file,start_x=nil, start_y=nil, end_x=nil,end_y=nil)
  robot = Robot.new
  toolkit = Toolkit.getDefaultToolkit
  dim = toolkit.getScreenSize
  if start_x.nil? 
    rectangle = Rectangle.new(0, 0, dim.getWidth, dim.getHeight)
  else
    rectangle = Rectangle.new(start_x,start_y,end_x,end_y)
  end

  screen_capture = robot.createScreenCapture(rectangle)
  output = File.new(output_file)
  ImageIO.write(screen_capture,'png',output)
  puts screen_capture.class
end


#create_screen_shot('test.png')
create_screen_shot('test2.png', 100,100,200,200)