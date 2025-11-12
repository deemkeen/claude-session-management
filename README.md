# Claude Session Management Plugin

A Claude Code plugin for managing session snapshots with git versioning.

## Features

- **Interactive dialog**: Simple command with guided prompts for all operations
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

Simply run the command:
```
/session-snapshot
```

Claude will present an interactive dialog to choose your action.

### Interactive Workflow

**Step 1: Choose Action**

Claude asks what you want to do:
- Save current session
- Load a previous session
- Delete a saved session

**Step 2: Perform Operation**

- **Save**: Claude exports, sanitizes, and commits the current session automatically
- **Load**: Select from a date-sorted list of sessions, then Claude clears context and loads it
- **Delete**: Select from a date-sorted list of sessions, then Claude deletes and commits

### Examples

#### Save a session
1. Run `/session-snapshot`
2. Choose "Save current session"
3. Claude exports the conversation, sanitizes it, and commits to git

#### Load a session
1. Run `/session-snapshot`
2. Choose "Load a previous session"
3. Select the snapshot from the list (sorted by date, newest first)
4. Claude clears context and loads the selected session

#### Delete a session
1. Run `/session-snapshot`
2. Choose "Delete a saved session"
3. Select the snapshot to delete from the list
4. Claude deletes the file and commits the change

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
