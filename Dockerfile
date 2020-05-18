# Using an existing docer image as a base
FROM node:alpine as builder

WORKDIR '/app'

# Download and install a depenndency
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html