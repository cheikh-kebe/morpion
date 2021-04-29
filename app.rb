require'bundler'
Bundler.require 

$:.unshift File.expand_path("./../lib", __FILE__)
require 'boardcase'
require 'board'
require 'game'
require 'player'
require 'show'
require 'application'

game = Game.new
game.turn
