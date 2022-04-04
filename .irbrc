# frozen_string_literal: true

require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

require 'awesome_print'
AwesomePrint.irb!

require 'benchmark'

# This makes pry itself and all pry gems available
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

begin
  # Use Pry everywhere
  require 'pry'
rescue LoadError
  puts 'please gem install pry'
end

if defined? Pry
  Pry.start
  exit
else
  begin
    require 'awesome_print'
    AwesomePrint.irb!
  rescue LoadError
    puts 'please gem install awesome_print'
  end

  if defined? r(RAILS_ENV) && RAILS_ENV == 'test'
    begin
      require 'factory_bot'
      FactoryBot.find_definitions
      include FactoryBot::Syntax::Methods
    rescue StandardError
      puts 'please gem install factory_bot'
    end
  end

  def time(times = 1)
    result = nil
    Benchmark.bm { |x| x.report { times.times { result = yield } } }
    result
  end
end
