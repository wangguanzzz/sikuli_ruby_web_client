require 'java'
require 'rukuli'
require 'csv'
require 'json'

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
      if type.downcase == 'cordinate'
        name,type,x,y = arr
        @map[name] = {type: :cordinate, x: x.to_i, y: y.to_i}
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
  end
end

