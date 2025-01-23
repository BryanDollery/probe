from bryandollery/ctl:latest
run apk add --no-cache bash bat iputils bind-tools

run rm -f /root/.bash &> /dev/null || true && \
		echo "#!/bin/bash" > /root/.bashrc && \
		echo "alias ll='ls -gAlFh'" >> /root/.bashrc && \
		echo "source /log.sh" >> /root/.bashrc && \
		chmod a+rwx /root/.bashrc


