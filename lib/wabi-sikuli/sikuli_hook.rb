Before do |scenario|
    @sikuli = Sikuli.new
    Dir.mkdir 'screenshots' unless File.exists? 'screenshots'
    Dir.mkdir 'regions' unless File.exists? 'regions'
end