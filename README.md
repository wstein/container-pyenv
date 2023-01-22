# Simple Python Version Management Container

This Dockerfile is based on the official Fedora image, but it should work with other Fedora-based images as well, like Oracle Linux, RHEL, etc.

For more information about pyenv and python-build, see: <https://github.com/pyenv/pyenv>

## Build Image

```bash
export DOCKER=docker # replace with podman if you need the Podman engine

export OS_VERSION=37
export BASEIMAGE=docker.io/fedora:"${OS_VERSION}"
export IMAGE=pyenv:f"${OS_VERSION}"
```

```bash
"${DOCKER}" build --tag "${IMAGE}" \
                  --build-arg=BASEIMAGE="${BASEIMAGE}" \
                  .
```

## Install a specific Python Version

List available Python versions:

```bash
"${DOCKER}" run -it --rm "${IMAGE}" /opt/pyenv/bin/pyenv install -l
```

Install a Python version to a specific host folder:

```bash
export PYTHON_VERSION=3.10.9
export PYTHON_INSTALL_DIR="${PWD}"/python-"${PYTHON_VERSION}"
```

```bash
mkdir -p "${PYTHON_INSTALL_DIR}"
"${DOCKER}" run -it --rm \
                -v "${PYTHON_INSTALL_DIR}":"${PYTHON_INSTALL_DIR}" \
                "${IMAGE}" \
                /opt/pyenv/plugins/python-build/bin/python-build "${PYTHON_VERSION}" "${PYTHON_INSTALL_DIR}"
```

Validate with:

```bash
"${PYTHON_INSTALL_DIR}"/bin/python --version
```
