world="world"

puts "hello #{world}" # string interpolation
puts '#{world}' # single quotes: no interpolation

puts 1 + 2 # => 3
puts 1 * 2 # => 2
puts 1 / 2 # => 0
puts 1 / 2.0 # => 0.5
puts 3 ** 2 # => 9
puts Math.sqrt(9) # => 3.0
puts 8 % 3 # => 2

def hi(name='cutie')
  puts "hi #{name}!"
end

hi # => "hi cutie!"
hi('greg') # => "hi greg!"


def hi_capitalised(name='cutie')
  puts "hi #{name.capitalize}!"
end

hi_capitalised 'greg' # => "hi Greg!"
hi_capitalised 'GREG' # => "hi Greg!"

class Greeter
  def initialize(name='cutie')
    @name = name.capitalize
  end

  def greetings
    puts "Greetings, #{@name}."
  end

  def farewell
    puts "Farewell, #{@name}."
  end
end

greeter = Greeter.new('greg')
greeter.greetings # => "Greetings, Greg."
greeter.farewell # => "Farewell, Greg."

puts "#{Greeter.instance_methods}"
puts "#{Greeter.instance_methods(false)}" # => [:greetings, :farewell]

puts greeter.respond_to?('name') # => false

class Greeter # reopens the class to add more functionality (like namespace merging)
  attr_accessor :name
end

puts greeter.respond_to?('name=') # => true
puts greeter.respond_to?('name') # => true
puts "#{Greeter.instance_methods(false)}" # => [:greetings, :farewell, :name=, :name]
greeter.name = 'bruce'
greeter.greetings # => "Greetings, bruce." # no capitalisation because the constructor doesn't isn't called again

class MetaGreeter
  attr_accessor :names

  def initialize(names='cutie')
    @names = names
  end

  def greetings
    if @names.nil?
      puts "..."
    elsif @names.respond_to?('each') # @names is a list of some kind
      @names.each do |name|
        puts "Greetings, #{name.capitalize}."
      end
    else
      puts "Greetings, #{names.capitalize}."
    end
  end

  def farewell
    if @names.nil?
      puts "..."
    elsif @names.respond_to?('join')
      puts "Farewell, #{@names.map(&:capitalize).join(', ')}."
    else
      puts "Farewell, #{@names}."
    end
  end
end

if __FILE__ == $0 # if this file is being run directly
  # add 2 newlines because ruby doesn't print a newline if the string ends with a newline
  print "\nMetaGreeter example\n\n"

  mg = MetaGreeter.new
  mg.greetings
  mg.farewell

  mg.names = 'greg'
  mg.greetings
  mg.farewell

  mg.names = ['john', 'bruce', 'joe']
  mg.greetings
  mg.farewell

  mg.names = nil
  mg.greetings
  mg.farewell
end
