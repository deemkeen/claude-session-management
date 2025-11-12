---
description: Manage Claude Code session snapshots
---

# Session Snapshot Management

Save, load, and delete Claude Code session snapshots with automatic git versioning.

## Usage

- `/session-snapshot save` - Export and save the current session
- `/session-snapshot load` - Load a saved session from the list
- `/session-snapshot delete` - Delete a saved session

## Save Operation

When you use `/session-snapshot save`, Claude will:

1. Create a timestamped export of the current session
2. Sanitize the export to remove local machine details (paths, usernames, etc.)
3. Save it to `./saved-sessions/` directory
4. Commit the snapshot to git with a descriptive message

The exported filename format: `YYYYMMDD-HHMMSS-session-snapshot.txt`

## Load Operation

When you use `/session-snapshot load`, Claude will:

1. Show you a list of available session snapshots sorted by date (newest first)
2. Ask you to select which snapshot to load
3. Clear the current context
4. Load the selected snapshot content into the conversation

This allows you to resume a previous session exactly where you left off.

## Delete Operation

When you use `/session-snapshot delete`, Claude will:

1. Show you a list of available session snapshots sorted by date (newest first)
2. Ask you to select which snapshot to delete
3. Delete the selected file
4. Commit the deletion to git

---

**Arguments:**
- `save` - Save the current session
- `load` - Load a previous session
- `delete` - Delete a saved session
