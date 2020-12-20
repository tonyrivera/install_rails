#!/usr/bin/env bash
# Installs ruby on rails

if [ "$(id -u)" = 0 ]
then
    echo "Please run script with a user without admin privileges" 1>&2
    exit 1
fi

sudo apt-get update

# Install nodejs
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.lis
sudo apt install yarn

sudo apt-get --fix-missing install build-essential git-core curl openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev libffi-dev software-properties-common libgdm-dev libncurses5-dev automake autoconf libtool bison postgresql postgresql-contrib libpq-dev pgadmin3 libc6-dev imagemagick rbenv ruby-build -y

rbenv install 2.7.2 --skip-existing --verbose --version
rbenv global 2.7.2

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem env home
gem install rails
rbenv rehash

echo "To install new rails app:"
echo "rails new app_name --skip-spring --skip-listen"
