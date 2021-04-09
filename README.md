## docker-sleep-server

This repository produces a Docker image of a web server that will sleep for X seconds when the `/sleep/:wait` endpoint is hit. Useful for when you have a piece of software that you can configure to load HTTP endpoints before performing an action and all you want it to do is wait for an arbitrary amount of time.

e.g. doing a `curl http://localhost:4567/wait/10` will return a 200 after 10 seconds.

There is also a `/healthz` endpoint provided for checking if the webserver is up and running.

