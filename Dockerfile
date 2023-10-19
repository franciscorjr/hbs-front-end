# Stage 1
FROM node:18.18.2 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/hbs-front-end /usr/share/nginx/html