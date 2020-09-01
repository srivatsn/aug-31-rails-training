ARG VARIANT=2
FROM mcr.microsoft.com/vscode/devcontainers/ruby:${VARIANT}

# Install Rails
RUN gem install rails selenium-webdriver 

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler
RUN bundle install

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ghostscript sqlite3 vim chromium

# [Option] Install Node.js
ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"
