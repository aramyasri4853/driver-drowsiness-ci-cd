# Use a lightweight Python image
FROM python:3.10-slim

# Install OpenCV dependencies
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY app /app

# Install Python dependencies
RUN pip install --no-cache-dir flask opencv-python numpy

# Expose Flask port
EXPOSE 5000

# Run the application
CMD ["python", "main.py"]
