# Prerequisites

In this lab you will review the machine requirements necessary to follow this tutorial.

## Virtual or Physical Machines

This tutorial requires four (4) virtual or physical ARM64 or AMD64 machines running Rocky Linux 10. The following table lists the four machines and their CPU, memory, and storage requirements.

| Name            | Description            | CPU | RAM   | Storage |
|-----------------|------------------------|-----|-------|---------|
| hub01 (jumpbox) | Administration host    | 1   | 2GB   | 10GB    |
| k8s-server01    | Kubernetes server      | 1   | 2GB   | 20GB    |
| k8s-worker01    | Kubernetes worker node | 1   | 2GB   | 20GB    |
| k8s-worker02    | Kubernetes worker node | 1   | 2GB   | 20GB    |

How you provision the machines is up to you, the only requirement is that each machine meet the above system requirements including the machine specs and OS version. Also take into account that Rocky Linux 10 requires a CPU supporting the x86_64-v3 instruction. Once you have all four machines provisioned, verify the OS requirements by viewing the `/etc/os-release` file:

```bash
cat /etc/os-release
```

You should see something similar to the following output:

```text
NAME="Rocky Linux"
VERSION="10.1 (Red Quartz)"
ID="rocky"
ID_LIKE="rhel centos fedora"
VERSION_ID="10.1"
PLATFORM_ID="platform:el10"
PRETTY_NAME="Rocky Linux 10.1 (Red Quartz)"
```

Next: [setting-up-the-jumpbox](02-jumpbox.md)
