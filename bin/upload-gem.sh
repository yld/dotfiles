#!/bin/sh

[[ git pull --rebase ]] || ( echo 'rebase needs your attention' && exit  )

command -v bundle || gem install bundler ;

[[ -d spec/dummy ]] && rm Gemfile.lock && bundle install  ;

./tools/reinstall_h2ad_gems.sh

if [[ -f .zeus.sock ]] ; then
  ZEUS_PID=$(fuser $(realpath .zeus.sock) 2> /dev/null | cut -f2|tr -d ' ')
  kill $ZEUS_PID
end

bundle exec rake db:migrate RAILS_ENV=test

[[ rspec spec &&]]
gi push && rake build && gem inabox -o
