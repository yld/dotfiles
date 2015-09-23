require 'benchmark'

def time(times = 1)
  result = nil
  Benchmark.bm { |x| x.report { times.times { result = yield } } }
  result
end

require "awesome_print"
AwesomePrint.pry!
