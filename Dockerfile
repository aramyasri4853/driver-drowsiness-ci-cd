# Use Python 3.12 base image (matches your local version)
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy your application code
COPY app/ /app/

# Install system dependencies required for OpenCV
RUN apt-get update && \
    apt-get install -y libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir flask opencv-python numpy

# Expose port for Flask
EXPOSE 5000

# Command to run your app
CMD ["python", "main.py"]
