# Amala voice assistant

Amala is the custom personal-assistant profile for this Dodaios fork. It keeps the upstream agent OS intact while changing the wake phrase, speech stack and brain selection for a Windows desktop installation.

## Installed profile

- Assistant and wake phrase: **Amala**
- Brain: Codex through an existing ChatGPT login
- Wake detection: offline Vosk keyword spotting
- Speech recognition: offline Faster Whisper (`base`, CPU/int8)
- Speech output: offline Piper, with Windows SAPI fallback
- Computer use: enabled with a visible indicator and strict verification
- Memory: local SQLite
- Startup: enabled through an `Amala` Windows Startup shortcut

The tested installation passed `dodaios --doctor`: all 39 router tools resolve, and the Python and screenshot/computer-use harnesses are registered.

## Apply the profile

First install this fork normally. Then run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\install\amala.ps1
```

The script backs up an existing `dodaios.toml`, copies the safe example profile, creates Desktop and Startup shortcuts, and launches the app. It does not copy or store credentials.

## What Amala can do

- Wake on **“Amala”** and hold continuing voice conversations.
- Accept typed chat when a microphone is unavailable.
- Open and control supported Windows applications.
- Use browsers, click controls, enter text and verify results.
- Take screenshots and use visual context with a vision-capable model.
- Dictate into the active application and paste the last transcript.
- Run Codex, Claude Code, OpenCode and other supported coding-agent CLIs.
- Split coding work across multiple live Agentic IDE panes.
- Create persistent specialist agents, missions, scheduled routines and workflows.
- Keep local memory and a searchable personal wiki.
- Produce artifacts such as reports, pages and dashboards.
- Connect MCP servers, command-line tools, skills and supported plugins.
- Connect services such as GitHub, mail, calendars, messaging, music and home automation after the user authorizes each integration.
- Apply risk checks and request approval before sensitive actions.

## Requirements and limitations

- Voice wake requires a microphone input endpoint visible to Windows. Microphone privacy permission cannot replace disconnected or disabled hardware.
- Image-dependent computer use requires a vision-capable model.
- Optional integrations require their account connection and permissions.
- Phone calls require a telephony provider and may cost money.
- Local Ollama models require a healthy Ollama runtime and enough RAM and disk.
- System-changing and external actions may pause for approval by design.

## Private data policy

Never commit API keys, OAuth tokens, `dodaios.toml`, credential files, conversations, memory databases, logs, screenshots, model weights or virtual environments. The committed `amala.toml.example` contains no secrets.
