# Yet another tmux package manager

## Installation

Requirements: `tmux` version 1.9 (or higher), `git`, `bash`.

Clone TPM:

```bash
git clone https://github.com/yehvaed/tpm ~/.local/share/tpm
```

## Usage
#Put this at the bottom of `~/.tmux.conf` (`$XDG_CONFIG_HOME/tmux/tmux.conf` works too):

```bash
# List of plugins
set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.local/share/tpm/tpm'
```

### Installing plugins
1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Reload tmux (reload config file).

Package manager will automatically detect what need to be cloned.

### Installing plugins
2. Run in tmux command prompt "TPMUpdate"

## Disclaimer
The same name as [tpm](https://github.com/tmux-plugins/tpm) indicates that it's somehow replacement.
That is a attempt to write something similar to mentioned one as self improvment.
