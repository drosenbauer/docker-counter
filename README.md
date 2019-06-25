# docker-counter
A tiny Docker container that simply returns an incrementing count over the network via netcat (nc) and bash.

https://hub.docker.com/r/drosenbauer/docker-counter

You may specify the port as an environment variable `PORT`. **Default port if not specified is 12345** (for counting, get it?). Note that 12345 is commonly used by malware, so your system administrators may appreciate it if you choose a different one.

# Example

## Start the listener

Note the use of `PORT` to listen on 54321.

    devin$ docker run -it -ePORT=54321 -p 54321:54321 drosenbauer/docker-counter:latest
    Listening on port 54321

The container will emit no further output after this initial message.

## Connect to the listener

    devin$ nc localhost 54321
    1
    devin$ nc localhost 54321
    2
    devin$ nc localhost 54321
    3
