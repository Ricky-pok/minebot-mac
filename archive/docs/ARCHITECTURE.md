# Architecture

## Objective
Provide a simple, maintainable base for a macOS macro application written in Swift.

## Core Layers

### App
Entry point and top-level orchestration.

### Models
Shared data types such as:
- MacroAction
- MacroEvent
- MacroProfile

### Recorder
Responsible for capturing user input events.

### Player
Responsible for replaying stored macro events.

### Permissions
Handles accessibility and related macOS permission checks.

### Storage
Loads and saves macro profiles.

## Design Principles
- Keep modules small
- Prefer explicit models
- Separate recording from playback
- Keep persistence simple at first
- Start with CLI/app shell, expand UI later
