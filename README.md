# Developing with the Deephaven R Client

This repository provides a template for creating a development environment that will enable development on the R client. The R client depends on the C++ client, which in turn
depends on several C++ libraries, so getting an environment with everything built, installed, and properly configured, can be tricky. Additionally, building the C++ dependencies
and client has only been thoroughly tested on Ubuntu 20.04, so this template takes the additional step of building and running a Docker image of Ubuntu 20.04 with all of the
necessary dependencies installed. Lastly, we'll take you through the process of using VSCode in conjunction with running Docker containers, which makes the development process 
as painless as possible.
