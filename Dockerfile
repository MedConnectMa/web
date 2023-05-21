### Base
FROM node:20.2-alpine3.16 as base

# set working directory
WORKDIR /app

# install dependencies
COPY package*.json .
RUN npm install

# copy source code
COPY . .


### Dev
FROM base as dev

# start app
CMD ["npm", "run", "dev"]


### Prod
FROM base as prod

# build app
RUN npm run build

# start app
CMD ["npm", "run", "start"]
