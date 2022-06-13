# This file lets you build the image on windows/mac
# Run `docker build . -t app`
# Then run `docker run -d -t app` to run the image
# Then run `docker ps` to get the hash of the running container
# Then use that and run `docker cp -L TheContainerHash:/app/result ./app.tar.gz`
# Then run `docker load < ./app.tar.gz`

FROM nixos/nix

RUN nix-channel --update

WORKDIR /app

RUN nix-env -iA cachix -f https://cachix.org/api/v1/install
RUN cachix use digitallyinduced

ADD . .

RUN nix-build ./docker.nix --option sandbox false