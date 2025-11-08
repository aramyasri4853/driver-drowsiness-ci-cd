# Dockerfile — tested for headless OpenCV in Flask apps
FROM python:3.10-slim

# Install OS packages required by OpenCV and common video/image libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    wget \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy only the requirements first (better caching)
COPY requirements.txt /app/requirements.txt

# Install Python deps
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application
COPY app /app

# Expose the Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "main.py"]
