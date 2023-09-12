#!/bin/bash
set -euo pipefail

EXTRA_ARGS=()

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    EXTRA_ARGS+=(
        "--enable-features=WaylandWindowDecorations"
        "--ozone-platform=wayland"
    )
fi

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
exec zypak-wrapper /app/KopiaUI/kopia-ui "${EXTRA_ARGS[@]}" "$@"

