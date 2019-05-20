require 'win32/screenshot'
#require 'clipboard'
#puts Clipboard.copy('test')
#Win32::Screenshot::Take.of(:foreground).write!("image.png")
#puts Clipboard.paste
Win32::Screenshot::Take.of(:window,title: /a/i).write!("image.png")
