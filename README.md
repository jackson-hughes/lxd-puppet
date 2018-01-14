# LXD-Puppet

## This repo is a basic template for a puppet testing environment using LXD (Linux Containers).

I was looking for an effective and fast testing environment to replace vagrant and virtualbox. I found docker inapproriate for this use case as it doesn't mirror my target systems (lack of systemctl, services, etc.). 

Enter LXD.

### Prerequisites

*   The only prerequisite is a functional LXD hypervisor. 

Deployment and configuration of LXD is out of scope - [see here instead](https://linuxcontainers.org/lxd/).
    
### Usage

The `lxd-deploy.sh` requires only one argument - the container name (and hostname).

It will:

1.  Deploy the container, pulling an image from Ubuntu's image servers, if required.
2.  Inject the `puppet` directory into the container.
3.  Install puppet (from Ubuntu's repos).
4.  Apply the manifests.
