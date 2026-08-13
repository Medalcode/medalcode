# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Architecture Decision Records (ADRs)**: Added `docs/adr/0001-agent-facade-pattern.md`, `0002-graphify-knowledge-graph.md`, `0003-containerized-test-suite.md`, and `0004-astro-ecosystem-web-portal.md`.
- **Automated Test Suite**: Integrated `tests/test_scripts.sh` providing Unit, Integration, Smoke, and Regression tests for shell scripts.
- **GitHub Actions Integration**: Added QA test execution step to `.github/workflows/ci.yml`.
- **Reproducible Docker Support**: Added lightweight `Dockerfile` and `.dockerignore` for containerized QA test execution.
- **Documentation Artifacts**: Added architectural review, PR code review, and QA testing strategy reports.

### Changed
- **Featured Portfolio Strategy**: Curated 8 core Tier-1 featured projects in `.github/projects.yml` and `README.md` (`FraudSense`, `NetOpsToolkit`, `FinLogic`, `CodeAgent`, `DataPrep`, `DocuMind`, `PDFTranslate`, `Toallaalacarta`).
- **Legacy Archiving**: Classified `TheMutation` as Tier-3 archived legacy experiment, moving it out of main portfolio visibility while keeping GitHub code intact.
- **Profile & Resume Update**: Updated `README.md` with latest professional experience (Entel Connect, Soprole practicum, Toalla a la Carta), education at INACAP (22+ years in IT, last semester of Software Engineering), and 2026 certifications (Microsoft Power BI, UAB Excel, PUC Data Viz).
- **Parameter Parsing**: Refactored `generate-assets.sh` parameter parsing (`get_project_arg()`) supporting both `-p/--project` flags and positional arguments.
- **Cross-Platform Compatibility**: Replaced Bash 4+ `${var,,}` parameter expansion with POSIX-compatible `to_lowercase()` helper using `tr`.
- **ImageMagick v7 Support**: Updated `optimize_images()` to detect `magick` (ImageMagick v7+) alongside `convert` (ImageMagick v6).
- **Project Scanner**: Updated `check_missing_assets()` to use POSIX `sed -E -n` regex parsing for `README.md` project headers.
- **Git Sync Improvements**: Updated `git_sync.sh` date log parameterization, remote branch detection (`refs/remotes/origin/`), and added `-h/--help` option handler.
- **GitHub Actions Hardening**: Added explicit `permissions: contents: write` to `agent-scheduler.yml` and `permissions: contents: read` to `ci.yml`.
- **OS-Agnostic Date Generator**: Updated `agent-scheduler.yml` Spanish date generation to use Python 3 `datetime` instead of system `es_ES.UTF-8` locale dependencies.

## [1.1.0] - 2026-08-10

### Added
- Super-Skills Architecture specification in `skills.md`.
- Medalcode-Agent generalist persona in `agents.md`.
- Knowledge Graph visualization and report powered by `graphify`.
