#!/usr/bin/env bash

set -euo pipefail

REPO="/home/ryan/.config/nix-config"
LOG_FILE="$REPO/autogen.log"
DRY_RUN=false

ARGS="-av --delete"
[ "$DRY_RUN" = true ] && ARGS="$ARGS --dry-run"

{
    echo "*** autogen started at $(date '+%Y-%m-%d %H:%M:%S') ***"
    [ "$DRY_RUN" = true ] && echo "!!! DRY RUN ENABLED !!!"
    
    echo "Copying .nix files from /etc/nixos..."

    rsync $ARGS \
      --exclude='.git/' \
      --include='*/' \
      --include='*.nix' \
      --exclude='*' \
      /etc/nixos/ "$REPO"

    echo "*** autogen finished at $(date '+%Y-%m-%d %H:%M:%S') ***"
} 2>&1 | tee -a "$LOG_FILE"
