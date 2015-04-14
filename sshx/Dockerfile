# Start with SSH base image
FROM kaixhin/ssh
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install X server
RUN apt-get update && apt-get install -y xdm

# Run SSH server without detaching
CMD ["/usr/sbin/sshd", "-D"]
