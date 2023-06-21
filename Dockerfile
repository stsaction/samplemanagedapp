# Dockerfile
# Base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm ci --production

# Copy the application code to the working directory
COPY . .
# Expose port 3000
EXPOSE 3000

# Build the Next.js app
RUN npm run build

# Set the command to start the app
CMD ["npm", "start"]
