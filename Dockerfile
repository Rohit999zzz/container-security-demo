# Stage 1: Use vulnerable image for testing (intentional)
FROM alpine:3.10 AS vulnerable

# Install outdated Python (for demonstration)
RUN apk add --no-cache python3=3.6.9-r1

# Copy app files
COPY . /app

# Set working directory (recommended)
WORKDIR /app

# Run command (use absolute path)
CMD ["python3", "/app/app.py"]