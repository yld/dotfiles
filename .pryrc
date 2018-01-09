# We do this here as well in case pry was not started through IRB,
# but for example from rails console with pry being in the Gemfile
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

# Further Pry configuration

# vim FTW
Pry.config.editor = "mvim --nofork"

# My pry is polite
Pry.hooks = { :after_session => proc { puts "bye-bye" } }

# Prompt with ruby version
Pry.prompt = [
  proc { |obj, nest_level| "#{RUBY_ENGINE}-#{RUBY_VERSION} (#{obj})#{":#{nest_level}" if nest_level > 0}> " },
  proc { |obj, nest_level| "#{RUBY_ENGINE}-#{RUBY_VERSION} (#{obj})#{":#{nest_level}" if nest_level > 0}* " }
]
require 'benchmark'

def time(times = 1)
  result = nil
  Benchmark.bm { |x| x.report { times.times { result = yield } } }
  result
end

require "awesome_print"
AwesomePrint.pry!

if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt = PryRails::RAILS_PROMPT
end
