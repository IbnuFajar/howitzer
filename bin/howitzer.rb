#!/usr/bin/env ruby

require 'rubygems' unless ENV['NO_RUBYGEMS']
require 'rubigen'

if %w(-v --version).include? ARGV.first
  require File.dirname(__FILE__) + "/../lib/howitzer"
  puts "#{File.basename($0)} #{Howitzer::VERSION}"
  exit(0)
end

require 'rubigen/scripts/generate'

require 'pp'
RubiGen::Base.use_application_sources! :rubygems
RubiGen::Base.prepend_sources(*[
  RubiGen::PathSource.new(:app, File.join(File.dirname(__FILE__), "..", "generators"))
])

if ARGV.delete "--install"
  case ARGV
    when 'cucumber' then RubiGen::Scripts::Generate.new.run(ARGV, :generator => 'cucumber')
    when 'rspec' then RubiGen::Scripts::Generate.new.run(ARGV, :generator => 'rspec')
    when 'email' then RubiGen::Scripts::Generate.new.run(ARGV, :generator => 'email')
    else
      puts "ERROR"
  end
end

