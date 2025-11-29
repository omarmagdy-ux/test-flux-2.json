# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install GGUF custom node for ComfyUI
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    cd ComfyUI-GGUF && \
    pip install -r requirements.txt

# download FLUX Krea GGUF model
RUN comfy model download \
    --url "https://huggingface.co/QuantStack/FLUX.1-Krea-dev-GGUF/resolve/main/flux1-krea-dev-Q8_0.gguf" \
    --relative-path models/unet \
    --filename flux1-krea-fp8.gguf

# download FLUX VAE
RUN comfy model download \
    --url "https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors" \
    --relative-path models/vae \
    --filename ae.safetensors

# download CLIP-L
RUN comfy model download \
    --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" \
    --relative-path models/clip \
    --filename clip_l.safetensors

# download T5-XXL FP8
RUN comfy model download \
    --url "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" \
    --relative-path models/clip \
    --filename t5xxl_fp8_e4m3fn.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
