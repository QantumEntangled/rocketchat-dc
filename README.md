# Rocket.Chat with Docker-Compose

This repository will allow you to setup a basic Rocket.Chat server with just one command.

*This configuration is setup to expose the Rocket.Chat server on port `3000` of the host machine. This is because it is recommended to run a Caddy server as a reverse proxy. This will automatically generate an SSL certificate with Let's Encrypt and keep it up to date indefinitely.*

## Setup

Edit the `rocketchat-variables.env` file and replace the following fields with your server information.

```Bash
ROOT_URL=http://chat.example.com
MAIL_URL=smtp://smtp.gmail.com
```

If you have hubot scripts place them in the `./scripts` directory (this directory will be created by the start script if it has not already been created).

## Starting the Server

To start the server run the following command:

```Bash
sh ./start.sh
```

## Caddy Server

Clone the `https://git.farley.pro/QantumEntangled/caddy-dc.git` repository.

`cd` into that repository and add the following script block to the `Caddyfile` file:

```Bash
# Domain Name
chat.example.com {
          # This is localhost because it should be running on the same host, change it to the IP address or FQDN of the host server if running on a different host
    proxy / localhost:3000 {
        transparent
        websocket
    }
}
```