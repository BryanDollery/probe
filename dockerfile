from bryandollery/ctl:latest
run apk add --no-cache bash bat iputils bind-tools
run echo "alias ll='ls -gAlFh'" >> /root/.bashrc

