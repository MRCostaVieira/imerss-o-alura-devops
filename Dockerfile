# 1. Use an official Node.js runtime as a parent image.
# The '-alpine' variant is smaller, which is great for production.
From node:alpine3.21

# Set the working directory in the container.
# Files will be copied here, and commands will be run from this directory.
WORKDIR /usr/src/app

# 2. Copy application dependency manifests.
# This is done separately to leverage Docker's layer caching.
# The dependencies will only be re-installed if package.json or package-lock.json changes.
COPY package*.json ./

# 3. Install app dependencies.
RUN npm install

# 4. Copy application source code.
COPY . .

# 5. Expose the port the app runs on. Your app listens on port 3000.
EXPOSE 3000

# 6. Define the command to run the application.
# This will execute the "start" script from your package.json.
CMD [ "npm", "start" ]