FROM node:14.6
WORKDIR /usr/src/app

# Install Nodos
RUN npm install --global @nodosjs/cli@0.0.55

# Copy package.json, package-lock.json*, npm-shrinkwrap.json* and install modules
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install

COPY . .

EXPOSE 8080
CMD ["nodos", "server", "-h", "0.0.0.0"]
