# Create clean testing container and ssh into it

Sometimes I need to create clean linux environment, but ``docker run -i -t /bin/bash debian:latest``` is not enough, because I need to use ssh and forward ssh-agent into it. Also I need that container lasts longer etc.
