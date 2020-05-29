# Build fase
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run fase
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
