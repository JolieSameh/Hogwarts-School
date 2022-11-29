# Docker will pull a pre-built setup by ruby
FROM ruby:3.0.2
# -alpine

# Setup instructions the terminal to run before it's used


# apt: Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those. 


RUN apt-get update && apt-get install -y nodejs
# RUN gem install bundler:2.3.25


# RUN /bin/bash -c 'source /opt/ros/melodic/setup.bash'

# RUN build-base 

# RUN apt-get sqlite3 
    # linux-headers \
# RUN sudo \
#    tzdata 
    

# Default folder location when you start your development environment
WORKDIR /app
COPY . /app/


#  Overwrite and install our gems to gems folder
ENV BUNDLE_PATH / gems
# Install all dependencies
RUN gem install bundler -v 2.3.25 \
  && bundle install

# What command is run when the docker image is started

# Run server, bind to, 0.0.0.0
# CMD ["s","-b","0.0.0.0"]
# CMD ["s"]
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]



# Expose port 3000 of the virtual container to your local machine
EXPOSE 3000
