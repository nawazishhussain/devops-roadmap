# Package Management with APT – Week 2

## What a Package Manager Is

A package manager is a system tool used to:

* install software
* update software
* remove software
* manage dependencies

Instead of manually downloading and compiling programs, package managers automate installation and configuration.

---

## What a Package Is

A package is a compressed file that contains:

* program binaries (executables)
* configuration files
* metadata (name, version, dependencies)

Examples of packages:

```id="p1"
nginx
git
curl
python3
```

---

## What APT Is

APT (Advanced Package Tool) is the package manager used in Debian-based systems such as Ubuntu.

APT works with `.deb` packages and simplifies software management by handling dependencies automatically.

---

## Core APT Commands

### Update package index

```id="p2"
sudo apt update
```

Downloads the latest list of available packages from repositories.
It does not install or upgrade software.

---

### Upgrade installed packages

```id="p3"
sudo apt upgrade
```

Updates installed packages to their latest versions.

---

### Install a package

```id="p4"
sudo apt install package_name
```

Example:

```id="p5"
sudo apt install nginx
```

APT will:

* resolve dependencies
* download required packages
* install and configure them

---

### Remove a package

```id="p6"
sudo apt remove package_name
```

Removes the package but keeps configuration files.

---

### Purge a package

```id="p7"
sudo apt purge package_name
```

Removes both the package and its configuration files.

---

### Remove unused dependencies

```id="p8"
sudo apt autoremove
```

Cleans up packages that are no longer required.

---

## What `sudo` Means

`sudo` stands for **superuser do**.

It allows a user to execute commands with root (administrator) privileges.

This is required because installing or modifying software affects system directories such as:

```id="p9"
/usr/bin
/etc
/var/lib
```

---

## What a Repository Is

A repository is a remote server that stores software packages.

APT downloads packages from repositories listed in:

```id="p10"
/etc/apt/sources.list
```

Repositories contain:

* package files
* version information
* dependency metadata

---

## What Happens During `apt update`

1. APT reads repository sources
2. connects to remote servers
3. downloads package lists
4. updates the local package database

This ensures the system knows the latest available versions.

---

## What Dependencies Are

Dependencies are additional packages required for a program to function.

Example:

Installing `nginx` may require:

* system libraries
* SSL libraries
* networking components

APT automatically installs dependencies to ensure proper functionality.

---

## Useful APT Flags

### `-y`

```id="p11"
sudo apt install -y nginx
```

Automatically answers "yes" to prompts.
Used in automation and scripts.

---

### `--no-install-recommends`

```id="p12"
sudo apt install --no-install-recommends nginx
```

Installs only required dependencies, skipping optional packages.
Useful for minimizing system or Docker image size.

---

## Searching for Packages

```id="p13"
apt search package_name
```

Example:

```id="p14"
apt search nginx
```

Displays available packages matching the search term.

---

## Viewing Package Information

```id="p15"
apt show package_name
```

Example:

```id="p16"
apt show nginx
```

Shows:

* version
* dependencies
* description

---

## Listing Installed Packages

```id="p17"
apt list --installed
```

or:

```id="p18"
dpkg -l
```

---

## What `dpkg` Is

`dpkg` is the low-level package manager in Debian systems.

APT is a higher-level tool built on top of `dpkg`.

| Tool | Level                         |
| ---- | ----------------------------- |
| dpkg | low-level package management  |
| apt  | high-level package management |

---

## Common Errors and Fixes

### Package not found

```id="p19"
E: Unable to locate package
```

Cause: package list not updated
Fix:

```id="p20"
sudo apt update
```

---

### Broken dependencies

```id="p21"
Unmet dependencies
```

Fix:

```id="p22"
sudo apt --fix-broken install
```

---

### Lock file error

```id="p23"
Could not get lock /var/lib/dpkg/lock
```

Cause: another package process is running

---

## Real DevOps Usage

APT is used in:

* Dockerfiles for installing dependencies
* CI/CD pipelines for environment setup
* server provisioning and configuration
* security patching and updates

Example (Docker):

```id="p24"
RUN apt update && apt install -y nginx
```

---

## Key Takeaways

* APT manages software installation and updates in Debian-based systems.
* Packages contain binaries, configs, and metadata.
* Repositories provide software sources.
* Dependencies are automatically handled by APT.
* `sudo` is required for system-level changes.
* `apt update` refreshes package lists before installation.
* `apt install`, `remove`, and `purge` manage software lifecycle.

Understanding APT is essential for managing servers, containers, and automated infrastructure.

