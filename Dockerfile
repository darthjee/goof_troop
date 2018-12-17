FROM darthjee/taa:0.2.1

WORKDIR /home/app/app/
ADD --chown=app:app Gemfile* /home/app/app/

RUN bundle install --clean

