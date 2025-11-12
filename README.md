# Claude Session Management Plugin

A Claude Code plugin for managing session snapshots with git versioning.

## Features

- **Save sessions**: Export current session with timestamp and sanitize local details
- **Load sessions**: Browse and load previous sessions with date-sorted list
- **Delete sessions**: Remove unwanted sessions with git tracking
- **Auto-commit**: All operations automatically commit to git
- **Privacy**: Removes local paths, usernames, and machine details from exports

## Installation

### Option 1: Install from Marketplace (Recommended)

1. Add the plugin marketplace to Claude Code:
```
/plugin marketplace add deemkeen/claude-session-management
```

2. Install the plugin:
```
/plugin install claude-session-management
```

3. Start using the `/session-snapshot` command!

### Option 2: Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/deemkeen/claude-session-management.git
```

2. Add the local plugin to Claude Code:
```
/plugin add /path/to/claude-session-management
```

3. Use `/session-snapshot` command

## Usage

### Save a session
```
/session-snapshot save
```
Exports the current conversation, sanitizes it, and commits to git.

### Load a session
```
/session-snapshot load
```
Shows a list of saved sessions sorted by date. Select one to load.

### Delete a session
```
/session-snapshot delete
```
Shows a list of saved sessions. Select one to delete and commit the change.

## Directory Structure

```
claude-session-management/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest
├── commands/
│   └── session-snapshot.md  # Main command definition
├── scripts/
│   └── sanitize-session.sh  # Session sanitization helper
├── saved-sessions/          # Stored session snapshots (gitignored during dev)
└── README.md
```

## Session Storage

Sessions are saved in the `./saved-sessions/` directory with the format:
```
YYYYMMDD-HHMMSS-session-snapshot.txt
```

Example: `20250112-143022-session-snapshot.txt`

## Privacy & Sanitization

The plugin automatically sanitizes session exports by removing:
- Home directory paths (`/home/username` → `/home/user`)
- Current working directories
- System usernames
- Hostnames
- Other identifying information

## Requirements

- Claude Code with plugin support
- Git (for versioning)
- Bash (for sanitization script)

## License

MIT

## Author

deemkeen (dimgur@gmail.com)
