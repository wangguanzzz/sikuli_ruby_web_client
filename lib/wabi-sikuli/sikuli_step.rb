require 'wabi-core/wabiutil'
require 'rukuli/key_code'
require 'clipboard'

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

Given(/^SCREEN type (.*)$/) do | str |
    val = WabiUtil.get_value(@bigmap,str)
    @sikuli.screen.type val
    puts "SCREEN type #{val}"
end

Given(/^SCREEN enter (.*)$/) do | str |
    val = WabiUtil.get_value(@bigmap,str)
    @sikuli.screen.enter val
    puts "SCREEN enter #{val}"
end

Given(/^SCREEN screenshot$/) do 
   
    @sikuli.screen.type Key::PRINTSCREEN,KeyModifier::KEY_WIN
    puts "SCREEN shot"
end

Given(/^SCREEN copy into (.*)$/) do | var |
    puts Rukuli::KEY_BACKSPACE
    @sikuli.screen.type 'c', Rukuli::KEY_CTRL 
  
    @bigmap[var] = Clipboard.paste
    puts "SCREEN copy #{Clipboard.paste} into #{var}"
end

Given(/^Load SCREEN object from (.*)$/) do |file|
  @sikuli.load_obj file
end