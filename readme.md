# Probe

To test network connectivity, or config map bindings, sometimes it helps to have
a simple pod with some tools installed that you can easily get a shell on.

## Build/Release

Use the makefile, it's pretty simple. Remember to log into docker hub and set VERSION when you invoke make. eg:

```
  VERSION=1.1.1 make all
```

That will build and push to docker hub. 

You can build and release separately if you want. eg:

```
  VERSION=dev make build
```

This is very useful for local testing where you can run `docker run -it --rm
bryandollery/probe:latest`, but for deployment to kubernetes you'll need to push
it to docker hub first.
