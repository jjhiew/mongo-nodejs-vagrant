#!/bin/bash

apt-get update -qq

### Install Chef Packages
apt-get install ruby ruby-dev build-essential -y
gem install --no-ri --no-rdoc chef