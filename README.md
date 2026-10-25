# AgentGuard AI — Threat Detection Command Center

> Real-time security command center designed to monitor, detect, and remediate AI agent threats and indirect prompt injection attacks.


![Docker Compliant](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## ✨ Overview

AgentGuard AI delivers a client-side threat detection engine built to analyze real-time streaming telemetry and raw logs from modern AI agent frameworks (e.g., Copilot, Cursor, LangChain, AutoGen). It identifies malicious payloads, tool abuse, credential exfiltration, and sensitive data exposure using a robust 5-rule taxonomy mapped to **MITRE ATLAS** and **MITRE ATT&CK** frameworks.

## ⚡ Core Features

- **5-Rule Built-in Detection Engine:**
  - `RULE-001`: Indirect Prompt Injection (`MITRE ATLAS: AML.T0051`)
  - `RULE-002`: Embedded Malware Payload Detection (`MITRE ATT&CK: T1027`)
  - `RULE-003`: Tool Credential Harvesting (`MITRE ATT&CK: T1552`)
  - `RULE-004`: PCI-DSS Sensitive Data Leakage (Mathematical Luhn Validation)
  - `RULE-005`: Web Application Infiltration & Boundary Bypass (`MITRE ATT&CK: T1190`)
- **Automated SOAR Playbooks:** One-click containment options to isolate agent API sessions or sanitize prompt memory buffers.
- **Multi-Format Log Parser:** Ingest `.json`, `.ndjson`, or `.jsonl` streams directly via file upload or batch simulation.
- **Zero-Dependency Architecture:** Single static Web UI that runs locally in-browser or within a lightweight Nginx Docker container.

## 🐳 Quick Start (Docker)

```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/AgentGuard-AI.git
cd AgentGuard-AI

# Launch via single-line runner
chmod +x run.sh
./run.sh

# Or run via Docker Compose
docker compose up -d --build
