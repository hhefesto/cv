{
  description = "Daniel Herrera's CV: Markdown source, styled HTML and PDF";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      perSystem = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          fonts = pkgs.makeFontsConf {
            fontDirectories = [ pkgs.adwaita-fonts pkgs.dejavu_fonts ];
          };
          beautify = pkgs.writeShellApplication {
            name = "cv-beautify";
            runtimeInputs = [ pkgs.pandoc pkgs.chromium pkgs.coreutils ];
            text = ''
              if [[ "''${1:-}" == "--help" ]]; then
                echo "Usage: nix run .#beautify -- [source.md] [output-directory]"
                echo "Defaults: ./CV-Daniel-Herrera.md and ./dist"
                exit 0
              fi
              if (( $# > 2 )); then
                echo "Expected a Markdown source and an output directory; see --help." >&2
                exit 2
              fi

              source_file=$(realpath "''${1:-CV-Daniel-Herrera.md}")
              output_dir=$(realpath -m "''${2:-dist}")
              name=$(basename "$source_file" .md)
              work=$(mktemp -d)
              trap 'rm -rf -- "$work"' EXIT
              export FONTCONFIG_FILE=${fonts}
              export XDG_CACHE_HOME="$work/cache"
              export XDG_CONFIG_HOME="$work/config"
              export XDG_DATA_HOME="$work/data"
              mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME"

              pandoc "$source_file" --from=markdown --to=html5 --standalone \
                --lua-filter=${./style/metadata.lua} \
                --template=${./style/template.html} \
                --include-in-header=${./style/style.html} \
                --output="$work/document.html"

              # The document is local; disabling Chromium's nested sandbox also
              # permits rendering inside a Nix build sandbox. Fonts are pinned.
              if ! chromium --headless --no-sandbox --disable-gpu \
                --disable-dev-shm-usage --disable-background-networking \
                --no-first-run --no-default-browser-check --no-pdf-header-footer \
                --user-data-dir="$work/browser" \
                --print-to-pdf="$work/document.pdf" \
                "file://$work/document.html" >"$work/chromium.log" 2>&1; then
                cat "$work/chromium.log" >&2
                exit 1
              fi
              test -s "$work/document.pdf"
              mkdir -p "$output_dir"
              install -m 644 "$work/document.html" "$output_dir/$name.html"
              install -m 644 "$work/document.pdf" "$output_dir/$name.pdf"
              printf 'Created %s\n' "$output_dir/$name.html" "$output_dir/$name.pdf"
            '';
          };
          cv = pkgs.runCommand "daniel-herrera-cv" { } ''
            ${beautify}/bin/cv-beautify ${./.}/CV-Daniel-Herrera.md "$out"
          '';
        in {
          inherit beautify cv;
          check = pkgs.runCommand "cv-presentation-check" {
            nativeBuildInputs = [ pkgs.poppler-utils ];
          } ''
            pdf=${cv}/CV-Daniel-Herrera.pdf
            test "$(pdfinfo "$pdf" | awk '/^Pages:/ { print $2 }')" = 2
            pdftotext "$pdf" extracted.txt
            tr -s '[:space:]' ' ' < extracted.txt > content.txt
            grep -Fq 'Daniel Alberto Herrera-Rendon' content.txt
            grep -Fq 'CTO — RDATA' content.txt
            touch "$out"
          '';
        });
    in {
      packages = forAllSystems (system: {
        default = perSystem.${system}.cv;
        inherit (perSystem.${system}) cv beautify;
      });
      apps = forAllSystems (system:
        let app = {
          type = "app";
          program = "${perSystem.${system}.beautify}/bin/cv-beautify";
          meta.description = "Render the Markdown CV as styled HTML and PDF";
        }; in { default = app; beautify = app; });
      checks = forAllSystems (system: { presentation = perSystem.${system}.check; });
    };
}
