require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

require 'benchmark'

def time(times = 1)
  result = nil
  Benchmark.bm { |x| x.report { times.times { result = yield } } }
  result
end


