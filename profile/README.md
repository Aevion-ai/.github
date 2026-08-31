<p align="center">
  <strong>Aevion</strong>
</p>

<p align="center">
  <strong>Proof-native governance for autonomous AI systems.</strong><br>
  <sub>Machine-checked invariants. Cryptographic receipts. Byzantine-resilient consensus.</sub>
</p>

<p align="center">
  <a href="https://github.com/Aevion-ai/ProofOS"><img src="https://img.shields.io/badge/ProofOS-v1.0.0-teal" alt="ProofOS"></a>
  <a href="https://github.com/Aevion-ai/Aevion-Verifiable-AI/blob/main/docs/papers/proofos_architecture_arxiv_v1.pdf"><img src="https://img.shields.io/badge/paper-arXiv%20ready-blue" alt="Paper"></a>
  <a href="https://huggingface.co/spaces/aevionai/proofos-receipt-chain"><img src="https://img.shields.io/badge/demo-HF%20Spaces-live-ff9d00" alt="HF Spaces"></a>
  <a href="https://www.kaggle.com/competitions/ai-mathematical-olympiad-progress-prize-3"><img src="https://img.shields.io/badge/AIMO-top%205.7%25%20worldwide-8A2BE2" alt="AIMO"></a>
  <a href="https://aevion.ai"><img src="https://img.shields.io/badge/aevion.ai-SDVOSB%20%7C%20CAGE%2015NV7-darkgreen" alt="SDVOSB"></a>
</p>

---

Aevion builds the **governance layer beneath AI products** ΓÇö the formal, receipted, independently auditable infrastructure that sits between an agent's decision and the world it acts on. Not guardrails. Not classifiers. A **proof-native control plane**.

### The Stack

| Layer | What It Does | Built With |
|-------|-------------|------------|
| **Constitutional Halt Gate** | Blocks any state transition that fails a declared predicate | Lean 4 theorems, kernel-checked at runtime |
| **Receipt Chain** | Every gating decision emits a SHA-256 content-addressed record | ProofDB, canonical JSON, append-only ledger |
| **Agent Counsel Colony** | Multi-agent adversarial review as standing red-team capability | Byzantine + SIFT + DiF + Arbiter (7 agents) |
| **Open-Obligation Surface** | Machine-readable G├╢del register of every unproven obligation | Named, categorized, receipt-stamped ΓÇö no confidence percentages |

### The Thesis

On June 9, 2026, NIST published a mathematical proof (Vassilev, *IEEE S&P*) that no finite guardrail set can be universally robust against adversarial AI. NIST's official guidance: transition to a **continuous-monitor-and-update** security model. The same day, Anthropic launched Fable 5 / Mythos 5 ΓÇö same model, different access envelopes ΓÇö and publicly stated universal jailbreak prevention is "likely impossible."

Aevion's architecture was already built to this specification: **receipt chain** (continuous monitoring), **counsel colony** (proactive red-teaming), **halt gate + human escalation** (operational resilience). We do not claim to have defeated the impossibility theorem. We claim to have built the architecture the theorem says you need ΓÇö and published the exact list of what remains unproven.

---

### Founder

**Scott Leishman** ΓÇö Founder & Principal Investigator

U.S. Navy Air Traffic Controller (2003ΓÇô2014), combat-zone deployment to Camp Lemonnier, Djibouti. M.S. Aeronautics, Embry-Riddle Aeronautical University (2018). B.S. Applied Science and Technology, Thomas Edison State University. B.S. Business Administration - Finance, Southern New Hampshire University. B.S. in progress ΓÇö Information Technology (Cybersecurity), Arizona State University.

**Research.** [*"Air Traffic Control Human Factors with Drones"*](https://unmannedac.blogspot.com/2019/10/final-capstone-project-unmanned.html) ΓÇö M.S. Capstone, ERAU (2018), peer-reviewed for final grade. SHEL model + ANOVA quantitative analysis against NASA Ames simulation data. Tested the hypothesis that UAS incorporation significantly impacts controller performance. Covered workload measurement, NextGen technologies (ADS-B, UTM, LATAS, LAANC), and loss-of-separation risk thresholds under BLOS automation ΓÇö direct intellectual precursor to Aevion's Koopman ╧ü threshold derivation for autonomous system drift detection.

Additional graduate research (2015ΓÇô2019): ScanEagle risk assessment (MIL-STD-8820), BLOS operations and SATCOM human factors, GCS automation and skill retention, detect-and-avoid separation technologies. Full archive: [unmannedac.blogspot.com](https://unmannedac.blogspot.com).

> Operational aviation safety discipline ΓÇö where traceability, command authority, and zero-failure operating discipline are mission-critical ΓÇö now formalized as machine-checked proof obligations for autonomous AI systems.

---

### Repository strategy

**Aevion-Verifiable-AI** is the canonical monorepo for the whole company. All other `Aevion-ai` repositories are private satellites, worktrees, or historical branches of that single source of truth. The only public-facing artifact is **ProofOS**, a governed mirror of an allow-listed subset pulled from the monorepo.

| Repo | Visibility | Role |
|------|------------|------|
| [**Aevion-Verifiable-AI**](https://github.com/Aevion-ai/Aevion-Verifiable-AI) | Internal | **Canonical monorepo** — full Lean 4 corpus, ProofDB, governance plane, evidence chain, agent specs, and all product code. |
| [**ProofOS**](https://github.com/Aevion-ai/ProofOS) | Public | **Governed public mirror** — constitutional halt gate, receipt chain, ModelAccessEnvelope, schemas, and public docs. |

All other repositories under `Aevion-ai` are private and are not intended for public use. See [`Aevion-Verifiable-AI/docs/ops/repository_strategy.md`](https:/<p align="center">
  <strong>Aevion</strong>
</p>

<p align="center">
  <strong>Proof-native governance for autonomous AI systems.</strong><br>
  <sub>Machine-checked invariants. Cryptographic receipts. Byzantine-resilient consensus.</sub>
</p>

<p align="center">
  <a href="https://github.com/Aevion-ai/ProofOS"><img src="https://img.shields.io/badge/ProofOS-v1.0.0-teal" alt="ProofOS"></a>
  <a href="https://github.com/Aevion-ai/Aevion-Verifiable-AI/blob/main/docs/papers/proofos_architecture_arxiv_v1.pdf"><img src="https://img.shields.io/badge/paper-arXiv%20ready-blue" alt="Paper"></a>
  <a href="https://huggingface.co/spaces/aevionai/proofos-receipt-chain"><img src="https://img.shields.io/badge/demo-HF%20Spaces-live-ff9d00" alt="HF Spaces"></a>
  <a href="https://www.kaggle.com/competitions/ai-mathematical-olympiad-progress-prize-3"><img src="https://img.shields.io/badge/AIMO-top%205.7%25%20worldwide-8A2BE2" alt="AIMO"></a>
  <a href="https://aevion.ai/*"><img src="https://img.shields.io/badge/aevion.ai-SDVOSB%20%7C%20CAGE%2015NV7-darkgreen" alt="SDVOSB"></a>
</p>

---

Aevion builds the **governance layer beneath AI products**—the formal, receipted, independently auditable infrastructure that sits between an agent's decision and the world it acts on. Not guardrails. Not classifiers. A **proof-native control plane**.

### The Stack

| Layer | What It Does | Built With |
|-------|--------------|------------|
| **Constitutional Halt Gate** | Blocks any state transition that fails a declared predicate | Lean 4 theorems, kernel-checked at runtime |
| **Receipt Chain** | Every gating decision emits a SHA-256 content-addressed record | ProofDB, canonical JSON, append-only ledger |
| **Agent Counsel Colony** | Multi-agent adversarial review as standing red-team capability | Byzantine + SIFT + DiF + Arbiter (7 agents) |
| **Open-Obligation Surface** | Machine-readable Gödel register of every unproven obligation | Named, categorized, receipt-stamped—no confidence percentages |

### The Thesis

On June 9, 2026, NIST published a mathematical proof (Vassilev, *IEEE S&P*) that no finite guardrail set can be universally robust against adversarial AI. NIST's official guidance: transition to a **continuous-monitor-and-update** security model. The same day, Anthropic launched Fable 5 / Mythos 5—same model, different access envelopes—and publicly stated universal jailbreak prevention is "likely impossible."

Aevion's architecture was already built to this specification: **receipt chain** (continuous monitoring), **counsel colony** (proactive red-teaming), **halt gate + human escalation** (operational resilience). We do not claim to have defeated the impossibility theorem. We claim to have built the architecture the theorem says you need—and published the exact list of what remains unproven.

---

### Founder

**Scott Leishman** — Founder & Principal Investigator

U.S. Navy Air Traffic Controller (2003–2014), combat-zone deployment to Camp Lemonnier, Djibouti. M.S. Aeronautics, Embry-Riddle Aeronautical University (2018). B.S. Applied Science and Technology, Thomas Edison State University. B.S. Business Administration - Finance, Southern New Hampshire University. B.S. in progress — Information Technology (Cybersecurity), Arizona State University.

**Research.** [*"Air Traffic Control Human Factors with Drones"*](https://unmannedac.blogspot.com/2019/10/final-capstone-project-unmanned.html) — M.S. Capstone, ERAU (2018), peer-reviewed for final grade. SHEL model + ANOVA quantitative analysis against NASA Ames simulation data. Tested the hypothesis that UAS incorporation significantly impacts controller performance. Covered workload measurement, NextGen technologies (ADS-B, UTM, LATAS, LAANC), and loss-of-separation risk thresholds under BLOS automation—direct intellectual precursor to Aevion's Koopman–von Neumann threshold derivation for autonomous system drift detection.

Additional graduate research (2015–2019): ScanEagle risk assessment (MIL-STD-8820), BLOS operations and SATCOM human factors, GCS automation and skill retention, detect-and-avoid separation technologies. Full archive: [unmannedac.blogspot.com](https://unmannedac.blogspot.com).

> Operational aviation safety discipline—where traceability, command authority, and zero-failure operating discipline are mission-critical—now formalized as machine-checked proof obligations for autonomous AI systems.

---

### Repository strategy

**Aevion-Verifiable-AI** is the canonical monorepo for the whole company. All other `Aevion-ai` repositories are private satellites, worktrees, or historical branches of that single source of truth. The only public-facing artifact is **ProofOS**, a governed mirror of an allow-listed subset pulled from the monorepo.

| Repo | Visibility | Role |
|------|------------|------|
| [**Aevion-Verifiable-AI**](https://github.com/Aevion-ai/Aevion-Verifiable-AI) | Internal | **Canonical monorepo** - full Lean 4 corpus, ProofDB, governance plane, evidence chain, agent specs, and all product code. |
| [**ProofOS**](https://github.com/Aevion-ai/ProofOS) | Public | **Governed public mirror** - constitutional halt gate, receipt chain, ModelAccessEnvelope, schemas, and public docs. |

All other repositories under `Aevion-ai` are private and are not intended for public use. See [`Aevion-Verifiable-AI/docs/ops/repository_strategy.md`](https://github.com/Aevion-ai/Aevion-Verifiable-AI/blob/main/docs/ops/repository_strategy.md) for the full inventory and mirror policy.

---

### Competitive Validation

| Signal | Result | Date |
|--------|--------|------|
| Kaggle AIMO Progress Prize 3 | AI Mathematical Olympiad Progress Prize 3 — best Kaggle submission score: 42.0; final team rank: 601 / 4,138. | 2026 |
| EvidenceBench-ArXiv | 10 papers, 22 claims, all PRIMARY\_CONFIRMED | 2026 |
| Lean Build Receipt Bridge | lake build EXIT=0, source authority chain — PROOF\_LEVEL | 2026 |

---

### Company

**Aevion LLC** — Service-Disabled Veteran-Owned Small Business
CAGE: `15NV7` | UEI: `JFCXAGHB3QM6` | St. Cloud, MN
NIST AI Consortium applicant | SBIR/STTR eligible/github.com/Aevion-ai/Aevion-Verifiable-AI/blob/main/docs/ops/repository_strategy.md) for the full inventory and mirror policy.

---

### Competitive Validation

| Signal | Result | Date |
|--------|--------|------|
| Kaggle AIMO Progress Prize 3 | **Top 5.7% worldwide** (235 / 4,138) | 2026 |
| EvidenceBench-ArXiv | 10 papers, 22 claims, all PRIMARY\_CONFIRMED | 2026 |
| Lean Build Receipt Bridge | lake build EXIT=0, source authority chain ΓåÆ PROOF\_LEVEL | 2026 |

---

### Company

**Aevion LLC** ΓÇö Service-Disabled Veteran-Owned Small Business  
CAGE: `15NV7` ┬╖ UEI: `JFCXAGHB3QM6` ┬╖ St. Cloud, MN  
NIST AI Consortium applicant ┬╖ SBIR/STTR eligible  
**Contact:** [scott@aevion.ai](mailto:scott@aevion.ai) ┬╖ [aevion.ai](https://aevion.ai)

---

<p align="center">
  <em>Theorem where provable. Assumption where modeled. Hypothesis where empirical.<br>
  Receipt where observed. Gate where safety-critical.</em>
</p>
