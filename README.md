# homebrew-tap

Homebrew formulas for [akhil-gautam](https://github.com/akhil-gautam) projects.

## Usage

```bash
brew tap akhil-gautam/tap
brew install <formula>
```

Available formulas:

- [`ecotoken`](https://github.com/akhil-gautam/ecotoken) — environmental impact dashboard for AI coding assistants.
- [`toktracker`](https://github.com/akhil-gautam/toktracker) — proactive insights for AI coding assistants (CLI).

Available casks:

- [`omp-ui`](https://github.com/akhil-gautam/omp-ui) — native macOS app for the omp coding agent: many projects open at once, each with its own agent.
- [`shelfie`](https://github.com/akhil-gautam/shelfie) — sassy widget bar for macOS that takes the Dock's place (macOS 26+). Formerly `dockdock`.
- [`toktracker`](https://github.com/akhil-gautam/toktracker) — Tokscale menubar app + dashboard for macOS.

## Installing Tokscale

```bash
brew tap akhil-gautam/tap
brew install toktracker              # CLI (TUI)
brew install --cask toktracker       # Mac menubar app
```

## Installing omp-ui

```bash
brew tap akhil-gautam/tap
brew install --cask omp-ui
```

omp-ui drives the [omp](https://omp.sh) coding agent, which is installed
separately and has to be on your `PATH`.

## Installing Shelfie

```bash
brew tap akhil-gautam/tap
brew install --cask shelfie
```

Shelfie was called DockDock: `brew upgrade` moves an installed `dockdock`
over to `shelfie`.

