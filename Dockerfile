# Use the official Nginx image to serve the static files
FROM nginx:alpine

# Copy the built React app into the Nginx public directory
COPY ./build /usr/share/nginx/html
# Expose port 80 for the app
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


