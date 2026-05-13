## CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

LaTeX-based resume and cover letter for Tyler Kuipers, built with the `awesome-cv` document class. The workflow is: tailor the resume + cover letter for a specific job posting, build PDFs, commit with a message like "Apply to <Company>". Each commit on `main` typically corresponds to one job application.

## Build

```bash
make resume.pdf       # builds out/resume.pdf via xelatex
make coverletter.pdf  # builds out/coverletter.pdf via xelatex
make clean            # rm -rf out/
```

`xelatex` is required (not pdflatex) because the project uses custom fonts under `fonts/` referenced via `\fontdir[fonts/]`. `out/` is gitignored except for the two committed PDFs (`out/resume.pdf`, `out/coverletter.pdf`), which are the published artifacts symlinked from the repo root.

## Structure

- `resume.tex` — top-level document. Sets header info (name, contact) and `\input`s section files from `resume/`.
- `resume/*.tex` — individual sections (`summary.tex`, `experience.tex`, `skills.tex`, `technologies.tex`, `education.tex`, etc.). Edit these to tailor content; do not edit `resume.tex` for content changes.
- `coverletter.tex` — standalone, single-file cover letter. Rewritten per application.
- `awesome-cv.cls`, `fontawesome.sty`, `fonts/` — vendored class + assets. Do not modify.
- `posting.md` — scratchpad for the current job posting being targeted.
- `examples/` — reference templates from upstream awesome-cv. Read-only reference.

## Source of truth for content

`.cursor/rules/history.mdc` is the **authoritative** record of Tyler's career history, roles, dates, metrics, and accomplishments. Always read it before writing or editing resume/cover-letter content. Never invent metrics, scope, or experience not documented there. When tailoring for a posting, reframe what's already in history.mdc — do not fabricate.

The other `.cursor/rules/*.mdc` files are also `alwaysApply: true` and must be respected:

- `ai-tells.mdc` — banned words/phrases (delve, leverage, robust, comprehensive, "results-driven," etc.) and structural patterns (uniform sentence length, hedging verbs, perfect parallel bullets) that detectors flag as AI-generated.
- `experience.mdc` — writing style and accuracy standards. Strong claims ("led", "architected", "expert in") and specific metrics require user confirmation before use.
- `resume-screening.mdc` — background on how ATS / AI screening systems weight resumes; informs tailoring decisions.

## Hard rules (from history.mdc, surfaced here because they are easy to violate)

- **Never use em dashes** (`—` or `---`) in any resume or cover letter content. Use colons, periods, commas, or rewrite. This is a recurring AI tell Tyler watches for.
- **Never use "multi-tenant" / "multi-tenancy."** Tyler's systems at AMA are internal/single-tenant. This is a recurring fabrication that has been corrected multiple times.
- **Headline databases/platforms only when used regularly and deeply.** Currently only PostgreSQL and Kubernetes qualify. Redis and ELK belong in `technologies.tex` without emphasis, never in the summary.
- **Don't conflate total experience with focus-area experience.** 10 years total in software (2014-2026); platform/API focus is only the last ~3 years. Phrase accordingly.
- **Never fabricate metrics.** Use exact numbers from history.mdc ($4.3M, 60x, 99.9%, 2.8M trips, 1400+ policies). If a number isn't there, omit it or ask.

## Tailoring workflow

A typical "Apply to X" change touches some subset of: `resume/summary.tex`, `resume/experience.tex` (reordering bullets, swapping emphasis), `resume/skills.tex`, `resume/technologies.tex`, and a fresh `coverletter.tex`. Build both PDFs and commit them along with the `.tex` changes — the committed PDFs in `out/` are what gets sent.
