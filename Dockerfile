# Step 1: Use official nginx image
FROM nginx:stable-alpine

# Step 2: Set working directory inside container
WORKDIR /usr/share/nginx/html

# Step 3: Remove default nginx website
RUN rm -rf ./*

# Step 4: Copy build output to Nginx html folder
COPY build/ .

# Step 5: Copy custom nginx config (optional, for React routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Step 6: Expose port 80
EXPOSE 80

# Step 7: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
