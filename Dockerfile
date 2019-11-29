FROM ruby:2.6.5

ADD Gemfile Gemfile.lock ./
RUN gem update bundler
RUN bundle install
ADD . .
RUN rake test
ENV PORT 80
ENV RAILS_ENV=production
ENV HOST=localhost
RUN SECRET_KEY_BASE=dummy rake db:migrate
RUN SECRET_KEY_BASE=dummy rake assets:precompile
CMD ./entrypoint.sh
