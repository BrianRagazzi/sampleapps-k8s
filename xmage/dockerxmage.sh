docker run --rm -it \
    -p 17171:17171 \
    -p 17179:17179 \
    -e "XMAGE_DOCKER_SERVER_ADDRESS=0.0.0.0" \
    -e "XMAGE_DOCKER_AUTHENTICATION_ACTIVATED=false"\
    -e "XMAGE_DOCKER_SERVER_NAME=xmage-server" \
    flippyboy/xmage-alpine
