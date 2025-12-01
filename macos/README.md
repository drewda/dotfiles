# macOS Spotlight Ignore Launch Agent

Excludes common development directories from Spotlight indexing.

## Installation

```bash
ln -sf ~/code/drewda/dotfiles/macos/com.drewda.spotlight-ignore.plist ~/Library/LaunchAgents/com.drewda.spotlight-ignore.plist
launchctl load ~/Library/LaunchAgents/com.drewda.spotlight-ignore.plist
```

## Management

```bash
# Check status
launchctl list | grep spotlight-ignore

# Unload (stop)
launchctl unload ~/Library/LaunchAgents/com.drewda.spotlight-ignore.plist

# Reload (restart)
launchctl unload ~/Library/LaunchAgents/com.drewda.spotlight-ignore.plist
launchctl load ~/Library/LaunchAgents/com.drewda.spotlight-ignore.plist

# View logs
tail -f ~/Library/Logs/spotlight-ignore.log
```

