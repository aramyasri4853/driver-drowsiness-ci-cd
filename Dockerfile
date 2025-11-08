FROM python:3.12-slim

WORKDIR /app
COPY app/ /app/

# Install system dependencies required by OpenCV
RUN apt-get update && \
    apt-get install -y \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir flask opencv-python numpy

EXPOSE 5000

CMD ["python", "main.py"]
