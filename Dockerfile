FROM ruby:2.5.3-alpine

RUN apk update && apk add g++ git libc-dev make

RUN mkdir -p /app/lib/prpr/review_request
COPY Gemfile prpr-review_request.gemspec /app/
COPY lib/prpr/review_request/version.rb /app/lib/prpr/review_request/

WORKDIR /app
RUN bundle install

CMD ["/bin/sh"]
