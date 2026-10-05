# Priv — Summary

- **Device:** BlackBerry Priv (STV100-1, "venicena")
- **SoC:** MSM8992
- **OS/build:** Android 6.0.1 (`AAW068`)
- **Repo:** https://github.com/stanw47/Blackberry-Priv-Research
- **Visibility:** private
- **Status:** not rooted; authboot/RTAS gate + boot ECDSA gate fully decoded
- **Headline:** full authboot/RTAS + Widevine-trustlet underflow analysis; no public root

## Headlines
- `authboot` gates every privileged fastboot command via an RTAS bitmap.
- Boot-image gate is ECDSA; SBL1 re-verifies aboot (patching bricks).
- Widevine trustlet length-underflow OOB-read (needs mediaserver exec).
- Factory/token stack present but disabled (`inproductionflag=false`).

## Blockers
- No public kernel 0-day; grsecurity/PaX; token write is root-gated.
- EDL needs a BlackBerry-signed MSM8992 firehose programmer (none public).

## Last updated
2026-10-05
