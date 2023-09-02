# Use the official Node.js image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY Backend/package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code
COPY Backend/ .

# Expose the port the app runs on
EXPOSE 3001


# Start the application
CMD ["node", "index.js"]
