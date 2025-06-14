FROM alpine:3.10  # Old version with known CVEs
RUN apk add --no-cache python3=3.6.9-r1  # Outdated Python
COPY . /app
CMD ["python3", "/app/app.py"]