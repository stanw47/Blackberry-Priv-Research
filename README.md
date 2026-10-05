# BlackBerry Priv (STV100-1) — Research

> Boot-chain, `authboot`/RTAS, TrustZone, and kernel-surface research on the
> BlackBerry **Priv** (Android 6.0.1, MSM8992) — the reference Android-BlackBerry
> "legacy LK" device.
>
> Part of the **[Blackberry-Research](https://github.com/stanw47/Blackberry-Research)**
> collection · [Williamson Security Solutions](https://williamsonsecuritysolutions.com)

---

## Disclaimer

> **Research aid, not a flashing guide.** Flashing/editing bootloader partitions
> can **permanently brick** the device. For educational / defensive research on a
> device the author owns. **At your own risk.**

---

## Device Details

| Field | Value |
|---|---|
| Model | BlackBerry Priv **STV100-1** (NA / "venicena") |
| Codename | `venicena` |
| SoC | Qualcomm **MSM8992** (Snapdragon 808) |
| OS / software | **Android 6.0.1** (`AAW068`), security patch 2017-10-05 |
| Current build | AAW068 (primary) |
| Previous builds | AAF153 (pre-grsec; does **not** boot this unit) |
| Carrier / unlock | carrier-unlocked; bootloader locked (`authboot` 1.3) |
| SIM | single |

---

## Current Status

The Priv is **not rooted**, and there is **no realistic software path**: the boot
chain is server-authenticated (`authboot`/RTAS) with an **ECDSA** boot-image gate
re-verified by SBL1, and the factory/token stack is disabled on shipped units.
The full boot gate has been decoded, and the most interesting residual lead — a
**Widevine trustlet underflow** — is blocked on code-exec in `mediaserver`.

---

## Completed

- **`authboot`/RTAS code decode** (the whole command-permission model).
- **Boot-image ECDSA gate** + SBL1 re-verification (patching `aboot` bricks).
- **BIDE / Pathtrust audit** (from GPL source) — no unprivileged escalation.
- **Factory/token stack audit** — present but disabled (`inproductionflag=false`).
- **TrustZone/Trustlet RE** — Widevine trustlet handlers audited.

## Achieved

- **Complete boot-gate map** — why no software unlock exists.
- **Reported a real bug** — `fget`-without-`fput` ref leak in
  `security/pathtrust/ioctl.c`.
- **Widevine trustlet length-underflow** (`RewrapDeviceRSAKey`) — a TEE heap
  OOB-read primitive (needs mediaserver code-exec).

## In Progress

- Audit-only. No active exploitation (the reachable primitives are gated).

## Failed

- **Bootloader unlock** — `authboot` denies; no forged authorization.
- **Kernel LPE** — grsecurity/PaX blocks the usual classes; no public 3.10.84
  exploit; DirtyCOW blocked; QuadRooter patched.
- **Downgrade to pre-grsec** — the old kernel does not boot this hardware.
- **EDL** — needs a **BlackBerry-signed MSM8992 firehose programmer** (none public).
- **`oem set-factory-mode`** — `authboot command permission denied`.

## Future Plans

1. **TrustZone/Trustlet** path — needs code-exec in `mediaserver` first.
2. **EDL** — only with a BlackBerry-signed programmer (unlikely).
3. Otherwise: documentation value (the definitive "why it can't be rooted" map).

---

## Community Activity

- **No root, ever.** An XDA bounty (~US$1000) went unclaimed for ~8 years; the
  bootloader is strictly locked and the device never received Nougat.
- **balika011** did run **LineageOS** on a Priv - but only by desoldering the
  eMMC and fitting a chip with an unlocked bootloader (hardware only).
- **Lasimeri/BBPriv-vibe-root** - open software-only root research on the
  STV100-2: a GPU-DMA (KGSL SMMU) chain that stalled on leaking a physical
  address, concluded reachable only via EDL.
- **sykhangdha/blackberry-priv-survival** - a stock-usability guide (bootloop
  mitigation, TLS root patching, legacy apps).
- Hubs: CrackBerry ("Will someone unlock the PRIV bootloader?"), XDA.

## Repository layout

| Path | Contents |
|---|---|
| `notes/` | the merged Priv research log + session notes + bug report |
| `recon/trustlet/` | Widevine trustlet (`.mdt`/`.b0x`) + handler JSON |
| `recon/firehose/` | public MSM8992 firehose programmers (reference) |
| `recon/sepolicy/` | Priv SEPolicy binary + parser |
| `recon/tokenservice/` | `bb_tokenserviced` RE + `bbts` disasm + tokenloader APK tree |
| `recon/sdmmc-driver/`, `recon/qnx-mmcsd-headers/`, `recon/bb10mt-src/` | driver/tooling RE |
| `devmaps/` | Priv device map (schema v1.0) |
| `firmware/`, `recon/kernel/` | **not committed** — fetch instructions |

---

## Related repos

- **Hub:** [Blackberry-Research](https://github.com/stanw47/Blackberry-Research)
- **KEYone** (same legacy LK lane): [Blackberry-KeyOne-Research](https://github.com/stanw47/Blackberry-KeyOne-Research)
- **KEY2** (modern ABL lane): [Blackberry-Key2-Research](https://github.com/stanw47/Blackberry-Key2-Research)

---

## Citations & Acknowledgements

| Source | URL | Relevance |
|---|---|---|
| Aleph Research — EDL series | https://alephsecurity.com/2018/01/22/qualcomm-edl-1/ | Qualcomm EDL/firehose internals |
| Christopher Wade — Breaking Mobile Bootloaders | https://www.qualcomm.com/.../qpss22-christopher-wade.pdf | ABL fastboot exploit |
| balika011 — Priv/Passport conversion | https://balika011.hu/blackberry/guides/passport/conversion.php | hardware unlock route |

---

## License

Research notes and original scripts are provided for educational purposes;
third-party code retains its own license.
