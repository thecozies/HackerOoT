.late_rodata
glabel D_80146640
    .float 10430.378

glabel D_80146644
    .float 10430.378

glabel D_80146648
    .float 10430.378

glabel D_8014664C
    .float 10430.378

glabel D_80146650
    .float 10430.378

.text
glabel func_800D20CC
/* B4926C 800D20CC 27BDFFD8 */  addiu $sp, $sp, -0x28
/* B49270 800D20D0 AFBF0024 */  sw    $ra, 0x24($sp)
/* B49274 800D20D4 AFB00020 */  sw    $s0, 0x20($sp)
/* B49278 800D20D8 F7B40018 */  sdc1  $f20, 0x18($sp)
/* B4927C 800D20DC AFA60030 */  sw    $a2, 0x30($sp)
/* B49280 800D20E0 C4940020 */  lwc1  $f20, 0x20($a0)
/* B49284 800D20E4 C4820028 */  lwc1  $f2, 0x28($a0)
/* B49288 800D20E8 C48C0024 */  lwc1  $f12, 0x24($a0)
/* B4928C 800D20EC 4614A502 */  mul.s $f20, $f20, $f20
/* B49290 800D20F0 00A08025 */  move  $s0, $a1
/* B49294 800D20F4 AFA40028 */  sw    $a0, 0x28($sp)
/* B49298 800D20F8 46021102 */  mul.s $f4, $f2, $f2
/* B4929C 800D20FC 46006307 */  neg.s $f12, $f12
/* B492A0 800D2100 4604A500 */  add.s $f20, $f20, $f4
/* B492A4 800D2104 0C03F494 */  jal   Math_atan2f
/* B492A8 800D2108 4600A384 */   sqrt.s $f14, $f20
/* B492AC 800D210C 3C018014 */  lui   $at, %hi(D_80146640)
/* B492B0 800D2110 C4266640 */  lwc1  $f6, %lo(D_80146640)($at)
/* B492B4 800D2114 8FA40028 */  lw    $a0, 0x28($sp)
/* B492B8 800D2118 24014000 */  li    $at, 16384
/* B492BC 800D211C 46060202 */  mul.s $f8, $f0, $f6
/* B492C0 800D2120 4600428D */  trunc.w.s $f10, $f8
/* B492C4 800D2124 440F5000 */  mfc1  $t7, $f10
/* B492C8 800D2128 00000000 */  nop   
/* B492CC 800D212C A60F0000 */  sh    $t7, ($s0)
/* B492D0 800D2130 86020000 */  lh    $v0, ($s0)
/* B492D4 800D2134 10410003 */  beq   $v0, $at, .L800D2144
/* B492D8 800D2138 2401C000 */   li    $at, -16384
/* B492DC 800D213C 5441000E */  bnel  $v0, $at, .L800D2178
/* B492E0 800D2140 C48C0020 */   lwc1  $f12, 0x20($a0)
.L800D2144:
/* B492E4 800D2144 A6000004 */  sh    $zero, 4($s0)
/* B492E8 800D2148 C48C0008 */  lwc1  $f12, 8($a0)
/* B492EC 800D214C C48E0000 */  lwc1  $f14, ($a0)
/* B492F0 800D2150 0C03F494 */  jal   Math_atan2f
/* B492F4 800D2154 46006307 */   neg.s $f12, $f12
/* B492F8 800D2158 3C018014 */  lui   $at, %hi(D_80146644)
/* B492FC 800D215C C4326644 */  lwc1  $f18, %lo(D_80146644)($at)
/* B49300 800D2160 46120102 */  mul.s $f4, $f0, $f18
/* B49304 800D2164 4600218D */  trunc.w.s $f6, $f4
/* B49308 800D2168 44193000 */  mfc1  $t9, $f6
/* B4930C 800D216C 10000038 */  b     .L800D2250
/* B49310 800D2170 A6190002 */   sh    $t9, 2($s0)
/* B49314 800D2174 C48C0020 */  lwc1  $f12, 0x20($a0)
.L800D2178:
/* B49318 800D2178 C48E0028 */  lwc1  $f14, 0x28($a0)
/* B4931C 800D217C 0C03F494 */  jal   Math_atan2f
/* B49320 800D2180 AFA40028 */   sw    $a0, 0x28($sp)
/* B49324 800D2184 3C018014 */  lui   $at, %hi(D_80146648)
/* B49328 800D2188 C4286648 */  lwc1  $f8, %lo(D_80146648)($at)
/* B4932C 800D218C 8FA40028 */  lw    $a0, 0x28($sp)
/* B49330 800D2190 46080282 */  mul.s $f10, $f0, $f8
/* B49334 800D2194 4600548D */  trunc.w.s $f18, $f10
/* B49338 800D2198 44099000 */  mfc1  $t1, $f18
/* B4933C 800D219C 00000000 */  nop   
/* B49340 800D21A0 A6090002 */  sh    $t1, 2($s0)
/* B49344 800D21A4 8FAA0030 */  lw    $t2, 0x30($sp)
/* B49348 800D21A8 5540000C */  bnezl $t2, .L800D21DC
/* B4934C 800D21AC C4940000 */   lwc1  $f20, ($a0)
/* B49350 800D21B0 C48C0004 */  lwc1  $f12, 4($a0)
/* B49354 800D21B4 0C03F494 */  jal   Math_atan2f
/* B49358 800D21B8 C48E0014 */   lwc1  $f14, 0x14($a0)
/* B4935C 800D21BC 3C018014 */  lui   $at, %hi(D_8014664C)
/* B49360 800D21C0 C424664C */  lwc1  $f4, %lo(D_8014664C)($at)
/* B49364 800D21C4 46040182 */  mul.s $f6, $f0, $f4
/* B49368 800D21C8 4600320D */  trunc.w.s $f8, $f6
/* B4936C 800D21CC 440C4000 */  mfc1  $t4, $f8
/* B49370 800D21D0 1000001F */  b     .L800D2250
/* B49374 800D21D4 A60C0004 */   sh    $t4, 4($s0)
/* B49378 800D21D8 C4940000 */  lwc1  $f20, ($a0)
.L800D21DC:
/* B4937C 800D21DC C4820008 */  lwc1  $f2, 8($a0)
/* B49380 800D21E0 C4900018 */  lwc1  $f16, 0x18($a0)
/* B49384 800D21E4 4614A502 */  mul.s $f20, $f20, $f20
/* B49388 800D21E8 00000000 */  nop   
/* B4938C 800D21EC 46021282 */  mul.s $f10, $f2, $f2
/* B49390 800D21F0 C4820004 */  lwc1  $f2, 4($a0)
/* B49394 800D21F4 46021482 */  mul.s $f18, $f2, $f2
/* B49398 800D21F8 460AA500 */  add.s $f20, $f20, $f10
/* B4939C 800D21FC 4612A500 */  add.s $f20, $f20, $f18
/* B493A0 800D2200 4600A004 */  sqrt.s $f0, $f20
/* B493A4 800D2204 46001303 */  div.s $f12, $f2, $f0
/* B493A8 800D2208 C4820010 */  lwc1  $f2, 0x10($a0)
/* B493AC 800D220C 46021082 */  mul.s $f2, $f2, $f2
/* B493B0 800D2210 00000000 */  nop   
/* B493B4 800D2214 46108102 */  mul.s $f4, $f16, $f16
/* B493B8 800D2218 C4900014 */  lwc1  $f16, 0x14($a0)
/* B493BC 800D221C 46108182 */  mul.s $f6, $f16, $f16
/* B493C0 800D2220 46041080 */  add.s $f2, $f2, $f4
/* B493C4 800D2224 46061080 */  add.s $f2, $f2, $f6
/* B493C8 800D2228 46001004 */  sqrt.s $f0, $f2
/* B493CC 800D222C 0C03F494 */  jal   Math_atan2f
/* B493D0 800D2230 46008383 */   div.s $f14, $f16, $f0
/* B493D4 800D2234 3C018014 */  lui   $at, %hi(D_80146650)
/* B493D8 800D2238 C4286650 */  lwc1  $f8, %lo(D_80146650)($at)
/* B493DC 800D223C 46080282 */  mul.s $f10, $f0, $f8
/* B493E0 800D2240 4600548D */  trunc.w.s $f18, $f10
/* B493E4 800D2244 440E9000 */  mfc1  $t6, $f18
/* B493E8 800D2248 00000000 */  nop   
/* B493EC 800D224C A60E0004 */  sh    $t6, 4($s0)
.L800D2250:
/* B493F0 800D2250 8FBF0024 */  lw    $ra, 0x24($sp)
/* B493F4 800D2254 D7B40018 */  ldc1  $f20, 0x18($sp)
/* B493F8 800D2258 8FB00020 */  lw    $s0, 0x20($sp)
/* B493FC 800D225C 03E00008 */  jr    $ra
/* B49400 800D2260 27BD0028 */   addiu $sp, $sp, 0x28
