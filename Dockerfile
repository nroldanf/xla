# Use the official Python 3.10.14 Alpine image
FROM python:3.10.14-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
# RUN pip install --upgrade pip

# Install PyTorch for Alpine Linux (if available)
# Note: Official PyTorch wheels may not be available for Alpine. You might need to use a compatible wheel.
# You can try installing from the PyPI repository first.
RUN python3 -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN python3 -m pip install torch-xla -f https://storage.googleapis.com/pytorch-xla-releases/wheels/tpuvm/torch_xla-2.3.0-cp310-cp310-manylinux_2_28_x86_64.whl


# Install other dependencies (if any)
# RUN pip install <other-packages>

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
# COPY . /app

# Install any remaining dependencies from requirements.txt
# COPY requirements.txt .
# RUN pip install -r requirements.txt

# Set the default command to run when starting the container
CMD ["python3"]
