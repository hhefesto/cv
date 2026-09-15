# Daniel Herrera — CV

[CV-Daniel-Herrera.md](CV-Daniel-Herrera.md) is the source of truth. Edit that
file, then regenerate the presentation:

```sh
nix run .#beautify
```

This writes a styled, selectable PDF and a standalone HTML version to `dist/`.
`nix run .` does the same. The current CV fits two US Letter pages, with
clickable links and page numbers. Generated files are not committed.

For another input or output directory:

```sh
nix run .#beautify -- CV-Daniel-Herrera.md /tmp/cv-preview
```

Build the source into the Nix store, or check the presentation:

```sh
nix build                 # result/CV-Daniel-Herrera.{html,pdf}
nix flake check           # verifies two pages and key extracted text
```

Nix pins Pandoc, Chromium, and the fonts through `flake.lock`; no system
browser or separately installed document tools are needed. Linux x86-64 and
ARM64 are supported. PDF metadata can contain the rendering time, so the
files are not promised to be byte-identical across rebuilds.

Presentation lives in `style/style.html` and `style/template.html`. The
Markdown remains the only place to edit CV content.
