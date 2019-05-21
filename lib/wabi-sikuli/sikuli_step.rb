require 'wabi-core/wabiutil'
require 'rukuli/key_code'
require 'clipboard'
require 'wabi-sikuli/screenshot'

SCREEN_FOLDER= 'screenshots'
SCREEN_HEADER= '[screenshot] '
Given(/^SCREEN click the (.*)$/) do |obj_name|
    @sikuli.screen.click *@sikuli.get_parameter_from_obj(obj_name)
    puts "SCREEN click #{obj_name}"
end

Given(/^SCREEN right click the (.*)$/) do |obj_name|
    puts @sikuli.get_parameter_from_obj(obj_name)
    @sikuli.screen.right_click *@sikuli.get_parameter_from_obj(obj_name)
    puts "SCREEN right click #{obj_name}"
end

Given(/^SCREEN double click the (.*)$/) do |obj_name|
    @sikuli.screen.double_click *@sikuli.get_parameter_from_obj(obj_name)
    puts "SCREEN double click #{obj_name}"
end

Given(/^SCREEN hover the (.*)$/) do |obj_name|
    @sikuli.screen.hover *@sikuli.get_parameter_from_obj(obj_name)
    puts "SCREEN hover on #{obj_name}"
end

Given(/^SCREEN run (.*)$/) do |app|
    system(app)
    puts "SCREEN run OS command #{app}"
end

Given(/^SCREEN close active window$/) do 
    @sikuli.screen.type(Key::F4,KeyModifier::ALT)
    puts "ALT + F4 is clicked"
end

Given(/^SCREEN type (.*)$/) do | str |
    val = WabiUtil.get_value(@bigmap,str)
    @sikuli.screen.type val
    puts "SCREEN type #{val}"
end

Given(/^SCREEN wheel up (\d*)$/) do | step |
    @sikuli.screen.wheel_up(step.to_i)
    puts "SCREEN wheel up #{step}"
end

Given(/^SCREEN wheel down (\d*)$/) do | step |
    @sikuli.screen.wheel_down(step.to_i)
    puts "SCREEN wheel down #{step}"
end

Given(/^SCREEN enter (.*)$/) do | str |
    val = WabiUtil.get_value(@bigmap,str)
    @sikuli.screen.enter val
    puts "SCREEN enter #{val}"
end

Given(/^SCREEN full screenshot$/) do 
    filename = Time.now.strftime('%y%m%d%H%M%S')+'.png'
    create_screen_shot(SCREEN_FOLDER+"/#{filename}")
    puts SCREEN_HEADER+SCREEN_FOLDER+"/#{filename}"
end

Given(/^SCREEN screenshot (\d*),(\d*),(\d*),(\d*)$/) do | x1,y1,x2,y2|
    filename = Time.now.strftime('%y%m%d%H%M%S')+'.png'
    create_screen_shot(SCREEN_FOLDER+"/#{filename}",x1.to_i,y1.to_i,x2.to_i,y2.to_i)
    puts SCREEN_HEADER+SCREEN_FOLDER+"/#{filename}"
end

Given(/^SCREEN copy into (.*)$/) do | var |
    puts Rukuli::KEY_BACKSPACE
    @sikuli.screen.type 'c', Rukuli::KEY_CTRL 
    puts "SCREEN copy #{Clipboard.paste} into #{var}"
end

Given(/^Load SCREEN object from (.*)$/) do |file|
  @sikuli.load_obj file
end