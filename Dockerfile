FROM node:16.13.1 as react-build

# WORKDIR /usr/src/app


COPY package*.json ./

# Install production dependencies.
RUN npm install

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD [ "npm", "start" ]
