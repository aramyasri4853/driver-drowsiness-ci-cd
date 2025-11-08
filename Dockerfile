# Use the official lightweight Python image
FROM python:3.10-slim

# Install system dependencies required by OpenCV
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the app files
COPY app /app

# Install Python dependencies
RUN pip install --no-cache-dir flask opencv-python numpy

# Expose the app port
EXPOSE 5000

# Run the application
CMD ["python", "main.py"]
