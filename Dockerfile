FROM ubuntu:22.04

# Install build dependencies
RUN apt-get update && apt-get install -y \
  python3-pip \
  wget \
  git \
  mrtrix3 \
  curl \
  zip \
  && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install

# Add application code
ADD . /app

# Install application
RUN pip3 install /app

# Set application entrypoint to docker entrypoint
ENTRYPOINT ["xnat-ingest"]
