FROM darthjee/taa:0.2.1

WORKDIR /home/app/app/
ADD Gemfile* /home/app/app/

USER root
RUN bundle install --clean

USER app
