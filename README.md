# BlackBerry Priv (STV100) — Research

> Boot-chain, authboot/RTAS, TrustZone, and kernel-surface research on the
> BlackBerry **Priv** (Android 6.0.1, MSM8992).
>
> Part of the **[Blackberry-Research](https://github.com/stanw47/Blackberry-Research)**
> collection. Cross-device mechanisms live in the hub; this repo is Priv-specific.

---

## Disclaimer

> **Research aid, not a flashing guide.** Flashing/editing bootloader partitions
> can **permanently brick** the device. For educational/defensive research on
> devices the author owns. At your own risk.

---

## Status

| Field | Value |
|---|---|
| Device / model | BlackBerry Priv (STV100-1, "venicena") |
| SoC | Qualcomm MSM8992 (Snapdragon 808) |
| OS / build | Android 6.0.1 (`AAW068`, patch 2017-10-05) |
| Bootloader | locked (`authboot` 1.3); boot/recovery flashable, bootchain signed |
| Root | **not rooted** |
| Access levels | L0 usb, L1 fastboot, L2 adb |
| Status | audit-only; no public kernel 0-day; token/factory paths server-gated |

**Current state:** The Priv is the reference **Android-BlackBerry** device. The
entire authboot/RTAS command gate, the boot-image ECDSA gate, and the
factory/token stack have been decoded. No software root exists; the remaining
paths are a kernel 0-day, a TrustZone/Trustlet bug, or ISP.

---

## TL;DR

- **`authboot` gates everything:** every privileged fastboot command is checked
  against an RTAS permission bitmap from an external BlackBerry service.
- **Boot-image gate is ECDSA** (not RSA): 4 embedded keys; the aboot itself is
  re-verified by SBL1 (so patching aboot bricks).
- **Factory/token stack is present but disabled:** `inproductionflag=false`,
  `stp_server` not running; token writes are root-gated.
- **TrustZone lead:** a length-underflow heap OOB-read in the Widevine trustlet
  (`RewrapDeviceRSAKey`) — but it needs code-exec in `mediaserver` first.
- **No public Priv root** (8-year XDA bounty unclaimed); grsecurity/PaX blocks
  the usual kernel bugs.

---

## Key findings

*Numbered, stable — append only.*

1. **Full authboot/RTAS decode** — command whitelist, permission types, and the
   `bbauthtool`/RTAS path. → [`notes/session3-authfull-decode.md`](notes/session3-authfull-decode.md)
2. **Boot-image ECDSA gate + SBL1 re-verify** — patched aboot bricks.
   → [`notes/priv-research-log.txt`](notes/priv-research-log.txt) §3–4, §8
3. **BIDE / Pathtrust audit** — no unprivileged escalation; reported an
   `fget`-without-`fput` ref leak. → [`notes/bug-report-pathtrust-fput-leak.md`](notes/bug-report-pathtrust-fput-leak.md)
4. **Widevine trustlet underflow** (`RewrapDeviceRSAKey`, cmd 0x0A) — TEE heap
   OOB-read, blocked on mediaserver code-exec. → `notes/priv-research-log.txt` §18
5. **Factory/token stack dead** — `inproductionflag` one-way; `TokenService`
   write is signature-permission gated. → `notes/priv-research-log.txt` §5–6, §13–14
6. **EDL requires a BlackBerry-signed firehose programmer** (none public for
   MSM8992). → `notes/priv-research-log.txt` §15

---

## How to connect

Android device: `adb` (USB `0fca:8042`), `fastboot` (`0fca:8040`). Bootloader is
`authboot`-gated. See hub [`toolchain/`](https://github.com/stanw47/Blackberry-Research/tree/main/toolchain).

---

## Repository layout

| Path | Contents |
|---|---|
| `notes/` | the merged Priv research log + session notes + bug report |
| `docs/` | write-ups (to be filled) |
| `recon/trustlet/` | Widevine trustlet (`.mdt`/`.b0x`) + handler JSON |
| `recon/firehose/` | public MSM8992 firehose programmers (ref) |
| `recon/sepolicy/` | Priv SEPolicy binary + parser |
| `recon/tokenservice/` | `bb_tokenserviced` RE + token samples |
| `recon/kernel/` | kernel symbol maps / source refs (**source not committed**) |
| `devmaps/` | Priv device map (schema v1.0) |
| `firmware/` | **not committed** — fetch instructions |

---

## Related repos

- **Hub:** [Blackberry-Research](https://github.com/stanw47/Blackberry-Research)
- **KEYone:** [Blackberry-KeyOne-Research](https://github.com/stanw47/Blackberry-KeyOne-Research) (same legacy LK lane)
- **KEY2:** [Blackberry-Key2-Research](https://github.com/stanw47/Blackberry-Key2-Research) (modern ABL lane)

---

## References

| Source | URL | Relevance |
|---|---|---|
| alephsecurity EDL series | https://alephsecurity.com/2018/01/22/qualcomm-edl-1/ | Qualcomm EDL/firehose internals |
| Christopher Wade — Breaking Mobile Bootloaders | https://www.qualcomm.com/.../qpss22-christopher-wade.pdf | ABL fastboot exploit |
| balika011 Priv conversion | https://balika011.hu/blackberry/guides/passport/conversion.php | eMMC bootloader swap |

---

## License

Research notes and original scripts are provided for educational purposes;
third-party code retains its own license.
