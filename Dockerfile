# Correct syntax
FROM alpine:3.18

# Install Python (note: alpine uses 'apk' not 'apt')
RUN apk add --no-cache python3=3.11.4-r0

# Copy app files
COPY . /app

# Set working directory
WORKDIR /app

# Run command
CMD ["python3", "app.py"]