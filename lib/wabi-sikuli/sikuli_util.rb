require 'java'
require 'rukuli'
require 'csv'
require 'json'
require 'wabi-sikuli/screenshot'

class Sikuli
  attr_accessor :map, :screen

  def initialize
    @map = {}
    @screen = Rukuli::Screen.new
  end

  def load_obj(name, base_dir = 'resource')
    FileUtils.mkdir_p base_dir unless Dir.exist? base_dir
    csv = CSV.read("#{base_dir}/#{name}.csv")#, encoding: 'bom|utf-8')
    csv.each do | arr |
      name,type = arr
      
      if type.downcase == 'picture'
        name,type,url = arr
        @map[name] = {type: :picture, url: url}
      end
      if type.downcase == 'picoffset'
        name,type,url,offx,offy = arr
        @map[name] = {type: :picoffset,url: url, offx: offx.to_i, offy: offy.to_i}
      end

      if type.downcase == 'cordinate'
        name,type,x,y = arr
        @map[name] = {type: :cordinate, x: x.to_i, y: y.to_i}
      end
      if type.downcase == 'region'
        name,type,x1,y1,x2,y2 = arr
        x1 = x1.to_i
        y1 = y1.to_i
        x2 = x2.to_i
        y2 = y2.to_i
        @map[name] = {type: :region, x1: x1, y1: y1, x2: x2, y2: y2, x: (x1+x2)/2, y: (y1+y2)/2 }
      end
    end
    $world.puts "Sikuli file #{base_dir}/#{name}.csv is loaded" if $world
  end


  def get_parameter_from_obj(obj_name)
    obj= @map[obj_name]
    if obj[:type] == :picture
        return [obj[:url]]
    end
    if obj[:type] == :cordinate
        return [obj[:x],obj[:y]]
    end
    if obj[:type] == :region
      create_screen_shot("regions/"+obj_name+".png", obj[:x1],obj[:y1],obj[:x2],obj[:y2])
      $world.puts "region #{obj_name} is saved" if $world
      $world.puts "[screenshot] regions/#{obj_name}.png" if $world
      return [obj[:x],obj[:y]]
    end
    if obj[:type] == :picoffset
      res = @screen.find obj[:url]
      newx = res.x + res.width/2 + obj[:offx]
      newy = res.y + res.height/2 + obj[:offy]
      return [newx,newy]
    end
  end
end

