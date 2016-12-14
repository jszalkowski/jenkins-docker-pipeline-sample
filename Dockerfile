FROM node

# Install dep
RUN npm install -g bower

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bower
COPY bower.json /usr/src/app/
COPY .bowerrc /usr/src/app/
RUN bower install --allow-root

# Bundle app source
COPY . /usr/src/app

EXPOSE 4000
CMD [ "npm", "start" ]
