# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the static files to the nginx html directory
COPY app/ /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
