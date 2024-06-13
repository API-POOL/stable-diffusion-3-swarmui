# Stable Diffusion 3 with StableSwarmUI

You can use already built Image: apipool/stable-diffusion-3-swarmui.

## Self Build

1. Stable Diffusion 3 is restericted on Hugging Face. So first go to [stabilityai/stable-diffusion-3-medium](https://huggingface.co/stabilityai/stable-diffusion-3-medium/tree/main) and agree terms.

2. Also you need to create an access token for READ permission on [Token Settings](https://huggingface.co/settings/tokens).

3. Build Docker Image.

```
docker build --build-arg HF_TOKEN=YOUR_HF_TOKEN -t YOUR_DOCKER_USERNAME/IMAGE_NAME:IMAGE_TAG .
```

4. Push Image to Dokcer Hub

```
docker push YOUR_DOCKER_USERNAME/IMAGE_NAME:IMAGE_TAG
```
