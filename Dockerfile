FROM darthjee/taa:0.1.0

WORKDIR /home/app/goof_troop/
ADD Gemfile* /home/app/goof_troop/

USER root
RUN bundle install --clean

USER app
