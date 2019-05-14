
Given(/^Screen click at (\d+),(\d+)$/) do |x,y|
    @screen.click(x,y)
end

Given(/^Screen click png (.*)$/) do |pic|
    @screen.click(pic)
end