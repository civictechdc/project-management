FROM ruby
WORKDIR /home/jekyll

RUN gem install bundler jekyll

VOLUME /home/jekyll

CMD ["jekyll", "new", "docs", "--force"]