# Credits and acknowledgements

Amala is a customized profile built on the work of open-source projects, model providers and developer tools. This repository does not claim ownership of those upstream projects, model weights, trademarks or services.

## Core platform

- **Dodaios** (formerly Personal Jarvis) provides the desktop agent OS, voice pipeline, computer-use system, Agentic IDE, agents, skills, memory, workflows and plugin architecture. Upstream: <https://github.com/Dodaios/Dodaios>. The upstream project is distributed under the Apache License 2.0.
- **Python** and its package ecosystem provide the application runtime.
- **Microsoft Edge WebView2** provides the embedded Windows desktop web interface.

## AI and coding providers

- **OpenAI Codex and ChatGPT** provide the configured Amala reasoning backend through the user's existing authenticated Codex/ChatGPT access. OpenAI services, models and trademarks remain subject to OpenAI's terms.
- **Claude Code, OpenCode and other supported coding-agent CLIs** can be connected through Dodaios. Each tool remains subject to its publisher's license and service terms.
- **Ollama** is supported as an optional local-model server. Individual model weights have their own licenses and usage terms.

## Voice technology

- **Vosk** provides offline keyword spotting for the custom “Amala” wake phrase.
- **Faster Whisper** and **CTranslate2** provide local speech recognition.
- **Piper-compatible ONNX voices** and **sherpa-onnx** provide local speech synthesis. Voice models and native components can carry licenses separate from the surrounding runtime; distributors must preserve and review those licenses.
- **Windows SAPI** is used only as an optional fallback speech engine.

## Development acknowledgement

The Amala configuration, installation helper and documentation were prepared with AI-assisted development using **OpenAI Codex**, reviewed through local validation, and committed without credentials, conversations, personal memory or downloaded model files.

## Trademarks and licenses

Product names and trademarks belong to their respective owners. Follow the repository's [LICENSE](LICENSE), [NOTICE](NOTICE), upstream notices, third-party license files, and the terms attached to any model or connected service.
