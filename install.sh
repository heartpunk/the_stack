#!/bin/sh
# install rvm and ruby 1.9.2 before this

# this installs rails
git clone https://github.com/rails/rails.git
cd rails
git checkout 741151c2754a616d9d04b790f566003fd03fdf5f
ruby install.rb `cat RAILS_VERSION`

# this installs heroku and initiates the app
gem install heroku
git remote add heroku git@heroku.com:the-stack.git
bundle install --without=production
rake db:create
rake db:migrate
