# shellcheck shell=sh

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells) and ~/.bashrc (for interactive shells) :

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v python-build >/dev/null || export PATH="$PYENV_ROOT/plugins/python-build/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
