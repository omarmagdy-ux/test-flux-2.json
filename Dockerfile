# Base image with comfyui, comfy-cli, and comfyui-manager
FROM runpod/worker-comfyui:0.3.75

# install custom nodes using comfy-cli
RUN comfy-node-install ComfyUI-GGUF

# Download FLUX Krea GGUF model into workspace
RUN comfy model download --url "https://huggingface.co/QuantStack/FLUX.1-Krea-dev-GGUF/resolve/main/flux1-krea-dev-Q8_0.gguf" --relative-path workspace/models/unet --filename flux1-krea-fp8.gguf

# Download FLUX VAE into workspace
RUN comfy model download --url "https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors" --relative-path workspace/models/vae --filename ae.safetensors

# Download CLIP-L into workspace
RUN comfy model download --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" --relative-path workspace/models/clip --filename clip_l.safetensors

# Download T5-XXL FP8 into workspace
RUN comfy model download --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" --relative-path workspace/models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors

# Copy input data (optional)
# COPY input/ /comfyui/input/
