docker build --build-arg CACHEBUST=$(date +%s) -t lambdalayer:latest .
docker run -it --rm --name lambdalayer -d lambdalayer:latest bash
docker cp lambdalayer:python.zip .
docker stop lambdalayer
