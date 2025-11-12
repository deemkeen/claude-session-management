---
description: Manage Claude Code session snapshots
---

# Session Snapshot Management

Save, load, and delete Claude Code session snapshots with automatic git versioning.

## Usage

Simply run the command:
```
/session-snapshot
```

Claude will present you with an interactive dialog to choose your action:
- **Save** - Export and save the current session
- **Load** - Load a saved session from the list
- **Delete** - Delete a saved session

## Workflow

### 1. Initial Dialog
When you run `/session-snapshot`, Claude asks what you want to do:
- Save current session
- Load a previous session
- Delete a saved session

### 2. Save Operation
If you choose **Save**, Claude will:
1. Create a timestamped export of the current session, using the current context
2. Sanitize the export to remove local machine details (paths, usernames, etc.)
3. Save it to `./saved-sessions/` directory, create the directory if not present
4. Commit the snapshot to git with a descriptive message

The exported filename format: `YYYYMMDD-HHMMSS-session-snapshot.txt`

### 3. Load Operation
If you choose **Load**, Claude will:
1. Scan the `./saved-sessions/` directory for available snapshots
2. Show you a list of session snapshots sorted by date (newest first)
3. Ask you to select which snapshot to load
4. Clear the current context
5. Load the selected snapshot content into the conversation

This allows you to resume a previous session exactly where you left off.

### 4. Delete Operation
If you choose **Delete**, Claude will:
1. Scan the `./saved-sessions/` directory for available snapshots
2. Show you a list of session snapshots sorted by date (newest first)
3. Ask you to select which snapshot to delete
4. Delete the selected file
5. Commit the deletion to git

## Implementation Details

The command uses Claude's `AskUserQuestion` tool to provide interactive dialogs at each step, making it intuitive and user-friendly without requiring command-line parameters.

All operations automatically commit changes to git, maintaining a complete version history of your session snapshots.
