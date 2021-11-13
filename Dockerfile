FROM rust:latest AS chef 
# We only pay the installation cost once, 
# it will be cached from the second build onwards
RUN cargo install cargo-chef trunk
RUN rustup target add wasm32-unknown-unknown
WORKDIR /app

RUN apt update && \
    apt upgrade -y && \
    apt-get install -y \
    libssl-dev \
    libarchive-dev \
    build-essential \
    cmake \
    llvm \
    clang \
    libicu-dev \
    nettle-dev \
    libacl1-dev \
    liblzma-dev \
    libzstd-dev \
    liblz4-dev \
    libbz2-dev \
    zlib1g-dev \
    libxml2-dev \
    lsb-release \
    wget \
    software-properties-common \
    libwebkit2gtk-4.0-dev \
    curl \
    libgtk-3-dev \
    libappindicator3-dev \
    patchelf \
    librsvg2-dev

RUN wget https://apt.llvm.org/llvm.sh && \ 
    chmod +x llvm.sh &&\ 
    ./llvm.sh 11
