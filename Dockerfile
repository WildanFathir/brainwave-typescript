# Stage 1: Build React App
FROM node:18 AS build

WORKDIR /app

# Copy dependencies file & install
COPY package*.json ./
RUN npm install

# Copy source code & build
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy build result from Stage 1 to nginx html folder
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
