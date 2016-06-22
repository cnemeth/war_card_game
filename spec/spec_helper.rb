require 'rubygems'
require 'pry' if ENV['APP_ENV'] == 'debug' # add `binding.pry` wherever you need to debug
require 'pry-byebug'
require 'awesome_print'

require_relative '../war'
require_relative '../player'
require_relative '../deck'
require_relative '../card'
require_relative '../score_board'

