Gem::Specification.new do |s|
    s.name        = 'wabi-sikuli'
    s.version     = '1.0.0'
    s.date        = '2019-05-01'
    s.summary     = ''
    s.description = ""
    s.authors     = ["Chris Wang"]
    s.email       = ''
    s.homepage    = ''
    s.license       = ''
  
  
    s.add_runtime_dependency 'rukuli'
    s.add_runtime_dependency 'wabi-core'
  
    s.files = Dir.glob("{lib}/**/*")
 #   s.executables << 'wabi_cli'
#  s.executables << 'iima'
  end
  