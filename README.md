# Create clean sandbox container and ssh into it

Sometimes I need to create clean linux environment, but ```docker run -i -t /bin/bash debian:latest``` is not enough, because I need to use ssh and forward ssh-agent into it. Also I need that container lasts longer etc.

To build image execute
```
./build.sh
```

To run sandobx container instance execute and ssh (using ssh agent) into it
```
./run.sh
```

If you execute ```./run.sh``` multiple times, you will be connected to the same running instance.

If you need to run different instance you can add argument to ./run.sh (ie ```./run.sh 2```). Default argument is 1 (so "./run.sh" = "./run.sh 1")
