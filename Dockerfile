# Base image with ComfyUI, comfy-cli, and comfyui-manager
FROM runpod/worker-comfyui:5.1.0-base 

# Install custom nodes using comfy-cli
RUN comfy-node-install ComfyUI-GGUF

# Copy your locally downloaded models into the container
COPY worksapce/models/unet/flux1-krea-dev-Q8_0.gguf /workspace/models/unet/flux1-krea-dev-Q8_0.gguf
COPY worksapce/models/vae/ae.safetensors /workspace/models/vae/ae.safetensors
COPY worksapce/models/clip/clip_l.safetensors /workspace/models/clip/clip_l.safetensors
COPY worksapce/models/text_encoders/t5xxl_fp8_e4m3fn.safetensors /workspace/models/text_encoders/t5xxl_fp8_e4m3fn.safetensors

# Optional: refresh model registry so ComfyUI sees the local models
RUN comfy model refresh

# Copy input data (optional)
# COPY input/ /comfyui/input/
