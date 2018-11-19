mkdir -p ./scripts
docker-compose up -d db && \
sleep 20 && \
docker-compose up -d db-init && \
sleep 20 && \
docker-compose up -d app