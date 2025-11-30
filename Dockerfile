# Base image with comfyui, comfy-cli, and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# Install GGUF custom node for ComfyUI
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    cd ComfyUI-GGUF && \
    pip install -r requirements.txt

# Ensure workspace models folders exist
RUN mkdir -p /comfyui/workspace/models/unet \
    /comfyui/workspace/models/vae \
    /comfyui/workspace/models/clip \
    /comfyui/workspace/models/text_encoders

# Copy already downloaded models from workspace volume
# Adjust paths if your workspace volume already has them mounted
# COPY /workspace/models/unet/* /comfyui/workspace/models/unet/
# COPY /workspace/models/vae/* /comfyui/workspace/models/vae/
# COPY /workspace/models/clip/* /comfyui/workspace/models/clip/
# COPY /workspace/models/text_encoders/* /comfyui/workspace/models/text_encoders/

# Copy input data (optional)
# COPY input/ /comfyui/input/
