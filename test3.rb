require 'win32ole'

app = system("calc")
puts app.class
puts app.methods