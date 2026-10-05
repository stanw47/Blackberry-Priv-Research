================================================================================
SESSION 7W - GHIDRA FP-HOOK RE + LIVE SURFACE SCAN (Classic) - 2026-09-01
================================================================================
Goal (priv): find a WRITABLE function-pointer hook in the mmc driver so we can
redirect it to mmc_switch (0x76c0) with crafted args to clear eMMC boot WP
(ext_csd[173] B_PWR_WP_EN) despite /proc/as code being read-only.

[1] TOOLCHAIN SET UP (Parrot)
  - ghidra 12.0.4_DEV present (analyzeHeadless). unicorn 2.1.0 installed.
  - QNX armle cross-compiler (arm-unknown-nto-qnx8.0.0eabi-gcc-4.8.3) confirmed
    inside bbndk.win32.tools.zip (win32-hosted, would need wine; NOT used yet).
  - Ghidra headless import of devb-sdmmc-rim-msmsdcc: PIE rebase 0x10000, so
    Ghidra_addr = file_offset + 0x10000 for code. Writable .data = segment_4.split
    at 0x2b000..0x2b630 (RW), .data.rel.ro at 0x28ea4 (R), text=segment_3.

[2] FUNCTION-POINTER HUNT IN WRITABLE .data (74 candidates -> narrowed)
  - mmc_switch (0x76c0) is called DIRECTLY only (FUN_0001f3b8, FUN_0001f48c=wp
    core, FUN_0001f0c4). NEVER stored as a data pointer => clean redirect target.
  - wp core 0xf48c is called once, from dispatch FUN_0001d574 (file 0xd574).
  - WRITABLE ops-dispatch pointers found (file offsets, targets in parentheses):
       0x2af14 (-> 0x1f234 FUN_0001f234)   : FUN_1f234 is a registered ops handler
       0x2b4f4 (-> 0x1f359) 0x2b4f8 (-> 0x1e27d) : reached from FUN_0001f234
       0x2b520 (-> 0x1d9c9) 0x2b524 (-> 0x20abd) : deref'd from FUN_0001f124
     These are blx'd through (indirect), i.e. feasible redirection points.
  - FUN_0001f234/FUN_0001f124 have NO direct code callers; FUN_1f234 is reached
    via data ptr 0x2af14 => it is a registered devctl/ops handler table.

[3] LIVE SURFACE SCAN (root pidin, Classic)
  - mmc driver: devb-sdmmc-rim-msmsdcc pid 741404 (eMMC /dev/emmc, uid 132)
                and pid 2330666 (SD). <- hijack target
  - mis pid 7409762 -> csdProxy (audio; NOT eMMC path).
  - screen pid 3588143 -> kgsl-3D (GPU; NOT eMMC path).
  - stp_dispatcher pids 802193616, 802275553 load stp-handler-memory/output/
    emmc_health/dc-private/mep/service.so  <- NEW lead (trustlet STP).
  - rpmb-msm8x60 pid 1663016 (RPMB), trustzone/bide/ssr present.
  - adbd pid 802275535 (android), binder/servicemanager/zygote android runtime.
  - csdProxy + kgsl-3D both world-writable confirmed (audio/GPU only).

[4] PENDING / DECISIONS
  - Confirm whether writable .data of pid 741404 is writable via /proc/as
    (7v proved /proc/as DATA writes work; code R/O). If yes, redirect a blx'd
    FP (e.g. 0x2b4f4) to a shellcode/0x76c0 stub. RISK: wrong write or mistrigger
    crashes eMMC driver -> possible filesystem damage / device freeze. Device is
    a daily-use phone => weigh carefully. Best to test on a sacrificial unit
    (loopback devb, or the SD controller pid 2330666) first.
  - Determine how the devctl reaches FUN_1f234 (via 0x2af14) to trigger with
    controlled regs. Not yet traced.
  - stp_dispatcher path: check if /dev/pf* STP gives an eMMC R/W primitive
    (handlers memory/output/emmc_health) -> lower-risk path, no driver patch.

ARTIFACTS: /tmp/opencode/ghidra/{FPHunt,WhoCalls,TblRefs,FindPtr,Decomp,Blocks}.java
  /tmp/opencode/surface.txt (root pidin/ps), /tmp/opencode/qnx.py
  Driver: /home/stanw47/priv-research/sdmmc-driver/devb-sdmmc-rim-msmsdcc
================================================================================

### VERIFIED RUNTIME FP DISPATCH TABLE (LIVE, /proc/741404/as) - X.1
Read via /base/bin/dd from /proc/741404/as (root __root). Confirmed region 0x10fe0000..0x10fee000 readable.
- Text base runtime = 0x10fce000 (code mapping = base + fileoff, confirmed 7t).
- Ghidra addr = fileoff + 0x10000, so code runtime = base + (ghidra_addr - 0x10000).
  FUN_0001f359 = file 0xf359 = runtime 0x10fdd359 ; FUN_0001e27d = 0x10fdc27d ;
  FUN_0001d9c9 = 0x10fdb9c9 ; FUN_00020abd = 0x10fdeabd ; FUN_0001f234 = 0x10fdd234 .
- WRITABLE FP DISPATCH TABLES LOCATED (live):
   @0x10fe94f4 -> 0x10fdd359 (FUN_0001f359)
   @0x10fe94f8 -> 0x10fdc27d (FUN_0001e27d)     <- deref'd in FUN_0001f234
   @0x10fe9520 -> 0x10fdb9c9 (FUN_0001d9c9)
   @0x10fe9524 -> 0x10fdeabd (FUN_00020abd)     <- deref'd in FUN_0001f124
   (dup copies of f359/e27d at 0x10fe975c/0x10fe9760)
- This matches FPHunt's Ghidra .data.split: ghidra 0x2b4f4 -> runtime 0x10fe94f4; base = 0x10fe9000 + (ghidra-0x2b000).
- Surrounding table context (0x10fe94f0..0x10fe9524) holds many text FPs (off 0x16247,0x1667d,0x16683,0x16688,0x164ac,0x15f5d,0x14ff2,...):
   @0x10fe9500: 0x10fe4247 0x10fe467d 0x10fe4683 0x10fe4688
   @0x10fe9510: 0x10fe44ac 0x10fe3f5d 0x10fe2ff2
  => this is an ops/registration dispatch table in WRITABLE .data.
- /proc/741404/as is owned devb:Disk_Drivers (rw-------); readable/writable only as root.
- dd access caveat: whole-region reads fault at RELRO->.data gap; read per-4K-page to locate contiguous data.
- NEXT: decompile FUN_0001f234 / FUN_0001f124 to learn call convention + which devctl path triggers them; then redirect a table entry (FUN_0001d9c9@0x10fe9520 or FUN_00020abd@0x10fe9524) to mmc_switch (runtime 0x10fd56c0) with controlled args.


### CONFIRMED R/W PRIMITIVE ON LIVE MMC DRIVER (X.2) - 2026-09-01
- WRITE via: /base/bin/dd if=<4byte file> of=/proc/741404/as bs=1 seek=<vaddr> conv=notrunc count=4
  (need to create the byte-source file on device first via /base/bin/cp or echo -e; then dd WRITEs to /proc/as).
- ROUND-TRIP PROVEN @0x10fe9520 (FUN_0001d9c9 slot): read c9b9fd10 -> write c9b9fd10 -> read c9b9fd10, WRITERC=0, READRC=0.
- Driver pid 741404 stays alive after write (/proc/741404 exists), filesystem responsive (/etc/passwd reads).
- => /proc/741404/as WRITE to writable FP/ops table is RELIABLE. Leverage locked in.

### DECOMPILE FINDING - CORRECTION on target table (X.3)
- FUN_0001f234 = CAM/XPT controller/device SCAN loop (calls FUN_0001d9cc up to 10x, each -> FUN_0001f124),
  NOT a devctl-issue path. FUN_0001f124 = XPT bus/device registration (FUN_00017a98 parse, cam_create_thread,
  xpt_bus_register, atomic_set). => The FP tables @0x10fe94f4/0x10fe9520 are CAM XPT/SIM OPS REGISTRATION
  callbacks (sim_alloc/attach style), invoked on rescan/attach - NOT reachable via a normal block-layer devctl,
  and redirecting them to mmc_switch would crash (wrong call convention).
- CONCLUSION: DO NOT redirect the XPT-ops FP table to mmc_switch. It is a dead end for injecting CMD6.
- REAL blocker (from 7v still stands): WRITE_PROTECT devctl ALREADY reaches mmc_switch(ext_csd[173]=0xad) and
  the CARD returns SWITCH_ERROR clearing B_PWR_WP_EN(0x04)->0. The issue is the switch is REJECTED, not unreachable.
- PATH FORWARD: (A) find the WRITE_PROTECT handler's wp->mode so we can make the STANDARD path send a vendor
  sequence the card accepts (e.g. select boot partition ext_csd[179] PARTITION_ACCESS first, or set
  B_PERM_WP_DIS=0x10 first) - inspect handler FUN_0000fcec / mmc_switch 0x76c0 arg build; (B) use the working
  /proc/as WRITE to patch writable per-device fields that gate the switch arg/availability.


### WRITE_PROTECT PATH RE (raw Thumb) (X.4)
- Handler FUN_0fcec (inside big dispatch FUN_0001d574@0xd574, Ghidra auto-named only FUN_0001d574):
   r6 = ext + (target*0x2c8 + lun*0x58) + 0x1d0   (per-partition record)
   mode = wp->mode & 1  (wp from [r1+0x30]); written back masked.
   calls 0xe53a avail-check; !=1 -> EIO(5).
   range-check nlba vs [r6+0x20]/[r6+0x28].
   GATE: only if [ext+0x24]==1 (ext=[r0+8]) does it call 0xf48c (wp-core).
   wp-core 0xf48c -> mmc_switch 0x76c0 -> raw 0x8240 (CMD6).
- mmc_switch 0x76c0(r0=ext, r1=index, r2=value, r3=cmdset, [sp]=mode, [sp+4]=?):
   lock 0x73b0(r0,1,1) -> 0x8240(*(r0+0x2c), index, value, cmdset, mode, extra) -> unlock 0x73b0(r0,1,-1).
- raw 0x8240 arg build (NON-JEDEC vendor layout): arg = index | (value<<24) | (cmdset<<16) | (5th=<<8).
   i.e. AS arg = { index[7:0], sp+4[15:8], cmdset[23:16], value[31:24] }.
- => The standard WRITE_PROTECT path DOES reach CMD6 to ext_csd[173]; card still rejects (7v). No reachable
   writable-hook to change args yet (devctl dispatch uses direct branches in RO text; writable tables are
   CAM registration = dead end for CMD6).
- VERDICT: R/W primitive solid but no CMD6-injection hook. Fundamental limit may be the CARD rejecting the
   B_PWR_WP_EN clear (possibly silicon-fused / requires vendor Telus/Qualcomm sequence or a different
   partition-attributes write).


### DEFERRED DIAGNOSTIC: live ext_csd[173]/[179] read - BLOCKED, mapped DCMD set (X.5) - 2026-09-01
- Driver supported DCMD literal pool (file 0xd644..0xd65c) -> RIM MMCSD DCMD set:
    0x42001a75 ; 0x40011a46 ; 0x40101a44(CID) ; 0x41081a74 ; 0xc0181a14(CARD_REGISTER) ;
    0xc0081a42 ; 0xc0201a11(WRITE_PROTECT)
  (matches 7p WRITE_PROTECT=0xc0201a11; CARD_REGISTER=0xc0181a14 i.e. size0x18<<16 | 0x1a14)
- devctl probe (berrycore python3.11 + ctypes /proc/boot/libc.so.3, RTLD_GLOBAL, getattr then argtypes)
  opens /dev/emmc O_RDWR but ALL register reads (CARD_REGISTER EXT_CSD/CSD/CID via 0xc0181a14, and even
  CID 0x40101a44) return EAGAIN(25). => issue is NOT the dcmd value; it is ACCESS: Disk_Drivers group
  (gid 132, members: devb only) is required to issue emmc devctl. devuser is NOT in it.
- Root escalation is BLOCKED from running custom binaries: __root runs a process-manager restricted shell
  where ONLY /proc/boot/* and /base/bin/* exec ("Operation not permitted" for python/id/etc; /base/bin/sh
  runs but child id/python also blocked). So root could not be used to run a python devctl that sets egid 132.
- WORKING primitive unaffected: /base/bin/dd can read/write /proc/741404/as (addr space of emmc driver) as root.
=> To read live ext_csd[173]/[179] via block API, need Disk_Drivers gid 132: either a setgid-132 helper or
   a root-run /base/bin tool; OR extract from driver heap via /proc/as (location hunt not yet done).

### STRATEGIC VERDICT (still valid)
- WRITE_PROTECT path already reaches CMD6 ext_csd[173]; card rejects (7v). No diagnostic short of RAW CMD6
  can distinguish clearable-with-vendor-sequence vs fused-silicon. RAW CMD6 needs the exploit primitive.
- Best next moves: (a) get Disk_Drivers(132) to enable CARD_REGISTER ext_csd read for ground truth;
  (b) investigate stp_dispatcher trustlet path (stp-handler-emmc_health/memory.so, /dev/pf*) as a flash-RW
   authority; (c) accept fused and pivot to hardware(ISP/desolder)/Oleksandr technique.

- Access to Disk_Drivers gid 132: /base/bin/g_Disk_Drivers is setgid(132) wrapper (ls: -rwxrwxrws root Disk_Drivers)
  but it does NOT exec arbitrary argv - it runs a designated companion helper; passing id/python produced no output and
  returned to devuser \$ promptly. So gid-132 devctl via wrapper is NOT achievable for our probe. Root \_\_root is
  binary-allowlisted (only /proc/boot/* + /base/bin/* exec; python blocked). => CARD_REGISTER ext_csd live read is
  BLOCKED short of a custom /base/bin-compatible tool or heap extraction via /proc/as.
