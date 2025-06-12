# Stage 1: Build the application with all dependencies
FROM python:3.9-slim as builder

WORKDIR /app

# THIS IS THE FIX: Copy requirements.txt using its full path from the repo root
COPY src/app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---

# Stage 2: Create the final, lightweight production image
FROM python:3.9-slim

WORKDIR /app

# Copy the installed packages from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# THIS IS THE FIX: Copy the app source code using its full path from the repo root
COPY src/app/app.py .

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["python", "app.py"]
