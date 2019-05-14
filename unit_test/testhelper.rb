if ENV['COVERAGE']
    require 'simplecov'
    SimpleCov.start do
     add_filter "/unit_test/"
    end
  end
  
  require 'minitest/autorun'
  require 'redis'

  