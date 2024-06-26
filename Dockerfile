FROM mcr.microsoft.com/dotnet/sdk:8.0-bookworm-slim

RUN apt update
RUN apt install -y git wget build-essential python3.11 python3.11-venv python3.11-dev python3-pip

RUN apt install -y libglib2.0-0 libgl1

COPY ./install-swarm.sh /install-swarm.sh
RUN bash /install-swarm.sh

COPY . .

ARG HF_TOKEN
ENV HF_TOKEN=${HF_TOKEN} \
    PIP_BREAK_SYSTEM_PACKAGES=1
RUN pip3 install huggingface_hub[cli]

RUN mkdir -p /StableSwarmUI/Models/Stable-Diffusion
ARG DOWNLOAD_PATH=/StableSwarmUI/Models/Stable-Diffusion
ARG REPO=stabilityai/stable-diffusion-3-medium
ARG FILE=sd3_medium_incl_clips_t5xxlfp16.safetensors

RUN huggingface-cli download ${REPO} ${FILE} \
    --local-dir ${DOWNLOAD_PATH} --token ${HF_TOKEN} 

EXPOSE 7801

RUN chmod +x /start.sh
CMD ["/start.sh"]