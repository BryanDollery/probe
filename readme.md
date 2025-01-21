# CTL

CTL is short for "control". It's a container that can run bash, kubectl,
ssh-keygen, curl, and git.

## Build/Release

Use the makefile, it's pretty simple. Remember to log into docker hub and set VERSION when you invoke make. eg:

VERSION=1.1.1 make all

You can build and release separately if you want. eg: 

VERSION=dev make build

