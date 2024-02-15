# Use the official Nginx image as the base image
FROM nginx:latest

# Expose port 80 to the outside world
EXPOSE 80

# Command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]