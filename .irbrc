require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

require 'benchmark'

def time(times = 1)
  result = nil
  Benchmark.bm { |x| x.report { times.times { result = yield } } }
  result
end

require "awesome_print"
AwesomePrint.irb!

# This makes pry itself and all pry gems available
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

begin
  # Use Pry everywhere
  require 'pry'
rescue LoadError => e
end

if defined? Pry

  Pry.start
  exit

else

  # Do your normal IRB stuff in case Pry is not available

end
