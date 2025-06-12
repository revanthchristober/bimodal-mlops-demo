# Stage 1: Build the application with all dependencies
FROM python:3.9-slim as builder
WORKDIR /app
COPY src/app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Create the final, lightweight production image
FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
# This path is now correct because the build context is the root of the repo
COPY src/app/app.py .

EXPOSE 8080
CMD ["python", "app.py"]
