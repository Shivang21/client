# Use the official Node.js image as a base
FROM node:16.13.1 as build-stage

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project directory
COPY . .

# Build the React app
RUN npm run build

# Use nginx image for serving the static files
FROM nginx:alpine

# Copy the built React app from the build-stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Command to start nginx
CMD ["nginx", "-g", "daemon off;"]
