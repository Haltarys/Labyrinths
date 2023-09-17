# frozen_string_literal: true

require "thor"

module Labyrinths
  # CLI driver for the Labyrinths gem.
  class CLI < Thor
    desc "hello NAME", "Prints 'Hello \#{NAME}!'"
    method_option :capitalise, aliases: "-c", type: :boolean, default: false
    def hello(name)
      puts "Hello #{options[:capitalise] ? name.capitalize : name}!"
    end
  end
end
