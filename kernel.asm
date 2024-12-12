
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	5f013103          	ld	sp,1520(sp) # 800085f0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	761030ef          	jal	ra,80003f7c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <pushRegisters>:
.global pushRegisters
.type pushRegisters, @function
pushRegisters:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <popRegisters>:
.global popRegisters
.type popRegisters, @function
popRegisters:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    ret
    800010f4:	00008067          	ret
	...

0000000080001100 <supervisorTrap>:
.global supervisorTrap
.type supervisorTrap, @function
supervisorTrap:
#cuvamo kontekst procesora pred prekid, iz registersUtil, stim sto ovde cuvamo i registre 0, 1, 2.

        addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256
        .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        sd x\index, \index * 8(sp)
        .endr
    80001104:	00013023          	sd	zero,0(sp)
    80001108:	00113423          	sd	ra,8(sp)
    8000110c:	00213823          	sd	sp,16(sp)
    80001110:	00313c23          	sd	gp,24(sp)
    80001114:	02413023          	sd	tp,32(sp)
    80001118:	02513423          	sd	t0,40(sp)
    8000111c:	02613823          	sd	t1,48(sp)
    80001120:	02713c23          	sd	t2,56(sp)
    80001124:	04813023          	sd	s0,64(sp)
    80001128:	04913423          	sd	s1,72(sp)
    8000112c:	04a13823          	sd	a0,80(sp)
    80001130:	04b13c23          	sd	a1,88(sp)
    80001134:	06c13023          	sd	a2,96(sp)
    80001138:	06d13423          	sd	a3,104(sp)
    8000113c:	06e13823          	sd	a4,112(sp)
    80001140:	06f13c23          	sd	a5,120(sp)
    80001144:	09013023          	sd	a6,128(sp)
    80001148:	09113423          	sd	a7,136(sp)
    8000114c:	09213823          	sd	s2,144(sp)
    80001150:	09313c23          	sd	s3,152(sp)
    80001154:	0b413023          	sd	s4,160(sp)
    80001158:	0b513423          	sd	s5,168(sp)
    8000115c:	0b613823          	sd	s6,176(sp)
    80001160:	0b713c23          	sd	s7,184(sp)
    80001164:	0d813023          	sd	s8,192(sp)
    80001168:	0d913423          	sd	s9,200(sp)
    8000116c:	0da13823          	sd	s10,208(sp)
    80001170:	0db13c23          	sd	s11,216(sp)
    80001174:	0fc13023          	sd	t3,224(sp)
    80001178:	0fd13423          	sd	t4,232(sp)
    8000117c:	0fe13823          	sd	t5,240(sp)
    80001180:	0ff13c23          	sd	t6,248(sp)

        call _ZN5Riscv20handleSupervisorTrapEv
    80001184:	70d000ef          	jal	ra,80002090 <_ZN5Riscv20handleSupervisorTrapEv>

        .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ld x\index, \index * 8(sp)
        .endr
    80001188:	00013003          	ld	zero,0(sp)
    8000118c:	00813083          	ld	ra,8(sp)
    80001190:	01013103          	ld	sp,16(sp)
    80001194:	01813183          	ld	gp,24(sp)
    80001198:	02013203          	ld	tp,32(sp)
    8000119c:	02813283          	ld	t0,40(sp)
    800011a0:	03013303          	ld	t1,48(sp)
    800011a4:	03813383          	ld	t2,56(sp)
    800011a8:	04013403          	ld	s0,64(sp)
    800011ac:	04813483          	ld	s1,72(sp)
    800011b0:	05013503          	ld	a0,80(sp)
    800011b4:	05813583          	ld	a1,88(sp)
    800011b8:	06013603          	ld	a2,96(sp)
    800011bc:	06813683          	ld	a3,104(sp)
    800011c0:	07013703          	ld	a4,112(sp)
    800011c4:	07813783          	ld	a5,120(sp)
    800011c8:	08013803          	ld	a6,128(sp)
    800011cc:	08813883          	ld	a7,136(sp)
    800011d0:	09013903          	ld	s2,144(sp)
    800011d4:	09813983          	ld	s3,152(sp)
    800011d8:	0a013a03          	ld	s4,160(sp)
    800011dc:	0a813a83          	ld	s5,168(sp)
    800011e0:	0b013b03          	ld	s6,176(sp)
    800011e4:	0b813b83          	ld	s7,184(sp)
    800011e8:	0c013c03          	ld	s8,192(sp)
    800011ec:	0c813c83          	ld	s9,200(sp)
    800011f0:	0d013d03          	ld	s10,208(sp)
    800011f4:	0d813d83          	ld	s11,216(sp)
    800011f8:	0e013e03          	ld	t3,224(sp)
    800011fc:	0e813e83          	ld	t4,232(sp)
    80001200:	0f013f03          	ld	t5,240(sp)
    80001204:	0f813f83          	ld	t6,248(sp)
        addi sp, sp, 256
    80001208:	10010113          	addi	sp,sp,256

#_ZN5Riscv14supervisorTrapEv
    sret # povratak iz prekidne rutine, menja se rezim privilegija, iz sstatus se uzima koji se rezim pre prekidne rutine, da bi se sret instrukcijom vratilo u isti. odakle smo usli u prekidnu rutinu se cita iz SEPC registra, to se upisuje u PC pri povratku
    8000120c:	10200073          	sret

0000000080001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # registar a0 ... &old->context
    # registar a1 ... &running->context
    sd ra, 0 * 8(a0)
    80001210:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001214:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001218:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000121c:	0085b103          	ld	sp,8(a1)

    ret
    80001220:	00008067          	ret
	...

0000000080001230 <vectorTable>:
.align 4
.global vectorTable
.type vectorTable, @function

vectorTable:
    j softwareInterrupt
    80001230:	02c0006f          	j	8000125c <softwareInterrupt>
    j timerInterrupt
    80001234:	1380006f          	j	8000136c <timerInterrupt>
    addi zero,zero, 0
    80001238:	00000013          	nop
    addi zero,zero, 0
    8000123c:	00000013          	nop
    addi zero,zero, 0
    80001240:	00000013          	nop
    addi zero,zero, 0
    80001244:	00000013          	nop
    addi zero,zero, 0
    80001248:	00000013          	nop
    addi zero,zero, 0
    8000124c:	00000013          	nop
    addi zero,zero, 0
    80001250:	00000013          	nop
    j consoleInterrupt
    80001254:	2280006f          	j	8000147c <consoleInterrupt>
    sret
    80001258:	10200073          	sret

000000008000125c <softwareInterrupt>:

softwareInterrupt:
    addi sp, sp, -256
    8000125c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001260:	00013023          	sd	zero,0(sp)
    80001264:	00113423          	sd	ra,8(sp)
    80001268:	00213823          	sd	sp,16(sp)
    8000126c:	00313c23          	sd	gp,24(sp)
    80001270:	02413023          	sd	tp,32(sp)
    80001274:	02513423          	sd	t0,40(sp)
    80001278:	02613823          	sd	t1,48(sp)
    8000127c:	02713c23          	sd	t2,56(sp)
    80001280:	04813023          	sd	s0,64(sp)
    80001284:	04913423          	sd	s1,72(sp)
    80001288:	04a13823          	sd	a0,80(sp)
    8000128c:	04b13c23          	sd	a1,88(sp)
    80001290:	06c13023          	sd	a2,96(sp)
    80001294:	06d13423          	sd	a3,104(sp)
    80001298:	06e13823          	sd	a4,112(sp)
    8000129c:	06f13c23          	sd	a5,120(sp)
    800012a0:	09013023          	sd	a6,128(sp)
    800012a4:	09113423          	sd	a7,136(sp)
    800012a8:	09213823          	sd	s2,144(sp)
    800012ac:	09313c23          	sd	s3,152(sp)
    800012b0:	0b413023          	sd	s4,160(sp)
    800012b4:	0b513423          	sd	s5,168(sp)
    800012b8:	0b613823          	sd	s6,176(sp)
    800012bc:	0b713c23          	sd	s7,184(sp)
    800012c0:	0d813023          	sd	s8,192(sp)
    800012c4:	0d913423          	sd	s9,200(sp)
    800012c8:	0da13823          	sd	s10,208(sp)
    800012cc:	0db13c23          	sd	s11,216(sp)
    800012d0:	0fc13023          	sd	t3,224(sp)
    800012d4:	0fd13423          	sd	t4,232(sp)
    800012d8:	0fe13823          	sd	t5,240(sp)
    800012dc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    800012e0:	5b1000ef          	jal	ra,80002090 <_ZN5Riscv20handleSupervisorTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012e4:	00013003          	ld	zero,0(sp)
    800012e8:	00813083          	ld	ra,8(sp)
    800012ec:	01013103          	ld	sp,16(sp)
    800012f0:	01813183          	ld	gp,24(sp)
    800012f4:	02013203          	ld	tp,32(sp)
    800012f8:	02813283          	ld	t0,40(sp)
    800012fc:	03013303          	ld	t1,48(sp)
    80001300:	03813383          	ld	t2,56(sp)
    80001304:	04013403          	ld	s0,64(sp)
    80001308:	04813483          	ld	s1,72(sp)
    8000130c:	05013503          	ld	a0,80(sp)
    80001310:	05813583          	ld	a1,88(sp)
    80001314:	06013603          	ld	a2,96(sp)
    80001318:	06813683          	ld	a3,104(sp)
    8000131c:	07013703          	ld	a4,112(sp)
    80001320:	07813783          	ld	a5,120(sp)
    80001324:	08013803          	ld	a6,128(sp)
    80001328:	08813883          	ld	a7,136(sp)
    8000132c:	09013903          	ld	s2,144(sp)
    80001330:	09813983          	ld	s3,152(sp)
    80001334:	0a013a03          	ld	s4,160(sp)
    80001338:	0a813a83          	ld	s5,168(sp)
    8000133c:	0b013b03          	ld	s6,176(sp)
    80001340:	0b813b83          	ld	s7,184(sp)
    80001344:	0c013c03          	ld	s8,192(sp)
    80001348:	0c813c83          	ld	s9,200(sp)
    8000134c:	0d013d03          	ld	s10,208(sp)
    80001350:	0d813d83          	ld	s11,216(sp)
    80001354:	0e013e03          	ld	t3,224(sp)
    80001358:	0e813e83          	ld	t4,232(sp)
    8000135c:	0f013f03          	ld	t5,240(sp)
    80001360:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001364:	10010113          	addi	sp,sp,256
    sret
    80001368:	10200073          	sret

000000008000136c <timerInterrupt>:

timerInterrupt:
    addi sp, sp, -256
    8000136c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001370:	00013023          	sd	zero,0(sp)
    80001374:	00113423          	sd	ra,8(sp)
    80001378:	00213823          	sd	sp,16(sp)
    8000137c:	00313c23          	sd	gp,24(sp)
    80001380:	02413023          	sd	tp,32(sp)
    80001384:	02513423          	sd	t0,40(sp)
    80001388:	02613823          	sd	t1,48(sp)
    8000138c:	02713c23          	sd	t2,56(sp)
    80001390:	04813023          	sd	s0,64(sp)
    80001394:	04913423          	sd	s1,72(sp)
    80001398:	04a13823          	sd	a0,80(sp)
    8000139c:	04b13c23          	sd	a1,88(sp)
    800013a0:	06c13023          	sd	a2,96(sp)
    800013a4:	06d13423          	sd	a3,104(sp)
    800013a8:	06e13823          	sd	a4,112(sp)
    800013ac:	06f13c23          	sd	a5,120(sp)
    800013b0:	09013023          	sd	a6,128(sp)
    800013b4:	09113423          	sd	a7,136(sp)
    800013b8:	09213823          	sd	s2,144(sp)
    800013bc:	09313c23          	sd	s3,152(sp)
    800013c0:	0b413023          	sd	s4,160(sp)
    800013c4:	0b513423          	sd	s5,168(sp)
    800013c8:	0b613823          	sd	s6,176(sp)
    800013cc:	0b713c23          	sd	s7,184(sp)
    800013d0:	0d813023          	sd	s8,192(sp)
    800013d4:	0d913423          	sd	s9,200(sp)
    800013d8:	0da13823          	sd	s10,208(sp)
    800013dc:	0db13c23          	sd	s11,216(sp)
    800013e0:	0fc13023          	sd	t3,224(sp)
    800013e4:	0fd13423          	sd	t4,232(sp)
    800013e8:	0fe13823          	sd	t5,240(sp)
    800013ec:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv21timerInterruptHandlerEv
    800013f0:	691000ef          	jal	ra,80002280 <_ZN5Riscv21timerInterruptHandlerEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013f4:	00013003          	ld	zero,0(sp)
    800013f8:	00813083          	ld	ra,8(sp)
    800013fc:	01013103          	ld	sp,16(sp)
    80001400:	01813183          	ld	gp,24(sp)
    80001404:	02013203          	ld	tp,32(sp)
    80001408:	02813283          	ld	t0,40(sp)
    8000140c:	03013303          	ld	t1,48(sp)
    80001410:	03813383          	ld	t2,56(sp)
    80001414:	04013403          	ld	s0,64(sp)
    80001418:	04813483          	ld	s1,72(sp)
    8000141c:	05013503          	ld	a0,80(sp)
    80001420:	05813583          	ld	a1,88(sp)
    80001424:	06013603          	ld	a2,96(sp)
    80001428:	06813683          	ld	a3,104(sp)
    8000142c:	07013703          	ld	a4,112(sp)
    80001430:	07813783          	ld	a5,120(sp)
    80001434:	08013803          	ld	a6,128(sp)
    80001438:	08813883          	ld	a7,136(sp)
    8000143c:	09013903          	ld	s2,144(sp)
    80001440:	09813983          	ld	s3,152(sp)
    80001444:	0a013a03          	ld	s4,160(sp)
    80001448:	0a813a83          	ld	s5,168(sp)
    8000144c:	0b013b03          	ld	s6,176(sp)
    80001450:	0b813b83          	ld	s7,184(sp)
    80001454:	0c013c03          	ld	s8,192(sp)
    80001458:	0c813c83          	ld	s9,200(sp)
    8000145c:	0d013d03          	ld	s10,208(sp)
    80001460:	0d813d83          	ld	s11,216(sp)
    80001464:	0e013e03          	ld	t3,224(sp)
    80001468:	0e813e83          	ld	t4,232(sp)
    8000146c:	0f013f03          	ld	t5,240(sp)
    80001470:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001474:	10010113          	addi	sp,sp,256
    sret
    80001478:	10200073          	sret

000000008000147c <consoleInterrupt>:

consoleInterrupt:
    addi sp, sp, -256
    8000147c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001480:	00013023          	sd	zero,0(sp)
    80001484:	00113423          	sd	ra,8(sp)
    80001488:	00213823          	sd	sp,16(sp)
    8000148c:	00313c23          	sd	gp,24(sp)
    80001490:	02413023          	sd	tp,32(sp)
    80001494:	02513423          	sd	t0,40(sp)
    80001498:	02613823          	sd	t1,48(sp)
    8000149c:	02713c23          	sd	t2,56(sp)
    800014a0:	04813023          	sd	s0,64(sp)
    800014a4:	04913423          	sd	s1,72(sp)
    800014a8:	04a13823          	sd	a0,80(sp)
    800014ac:	04b13c23          	sd	a1,88(sp)
    800014b0:	06c13023          	sd	a2,96(sp)
    800014b4:	06d13423          	sd	a3,104(sp)
    800014b8:	06e13823          	sd	a4,112(sp)
    800014bc:	06f13c23          	sd	a5,120(sp)
    800014c0:	09013023          	sd	a6,128(sp)
    800014c4:	09113423          	sd	a7,136(sp)
    800014c8:	09213823          	sd	s2,144(sp)
    800014cc:	09313c23          	sd	s3,152(sp)
    800014d0:	0b413023          	sd	s4,160(sp)
    800014d4:	0b513423          	sd	s5,168(sp)
    800014d8:	0b613823          	sd	s6,176(sp)
    800014dc:	0b713c23          	sd	s7,184(sp)
    800014e0:	0d813023          	sd	s8,192(sp)
    800014e4:	0d913423          	sd	s9,200(sp)
    800014e8:	0da13823          	sd	s10,208(sp)
    800014ec:	0db13c23          	sd	s11,216(sp)
    800014f0:	0fc13023          	sd	t3,224(sp)
    800014f4:	0fd13423          	sd	t4,232(sp)
    800014f8:	0fe13823          	sd	t5,240(sp)
    800014fc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv23consoleInterruptHandlerEv
    80001500:	5a1000ef          	jal	ra,800022a0 <_ZN5Riscv23consoleInterruptHandlerEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001504:	00013003          	ld	zero,0(sp)
    80001508:	00813083          	ld	ra,8(sp)
    8000150c:	01013103          	ld	sp,16(sp)
    80001510:	01813183          	ld	gp,24(sp)
    80001514:	02013203          	ld	tp,32(sp)
    80001518:	02813283          	ld	t0,40(sp)
    8000151c:	03013303          	ld	t1,48(sp)
    80001520:	03813383          	ld	t2,56(sp)
    80001524:	04013403          	ld	s0,64(sp)
    80001528:	04813483          	ld	s1,72(sp)
    8000152c:	05013503          	ld	a0,80(sp)
    80001530:	05813583          	ld	a1,88(sp)
    80001534:	06013603          	ld	a2,96(sp)
    80001538:	06813683          	ld	a3,104(sp)
    8000153c:	07013703          	ld	a4,112(sp)
    80001540:	07813783          	ld	a5,120(sp)
    80001544:	08013803          	ld	a6,128(sp)
    80001548:	08813883          	ld	a7,136(sp)
    8000154c:	09013903          	ld	s2,144(sp)
    80001550:	09813983          	ld	s3,152(sp)
    80001554:	0a013a03          	ld	s4,160(sp)
    80001558:	0a813a83          	ld	s5,168(sp)
    8000155c:	0b013b03          	ld	s6,176(sp)
    80001560:	0b813b83          	ld	s7,184(sp)
    80001564:	0c013c03          	ld	s8,192(sp)
    80001568:	0c813c83          	ld	s9,200(sp)
    8000156c:	0d013d03          	ld	s10,208(sp)
    80001570:	0d813d83          	ld	s11,216(sp)
    80001574:	0e013e03          	ld	t3,224(sp)
    80001578:	0e813e83          	ld	t4,232(sp)
    8000157c:	0f013f03          	ld	t5,240(sp)
    80001580:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001584:	10010113          	addi	sp,sp,256
    80001588:	10200073          	sret
	...

0000000080001598 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001598:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    8000159c:	00b29a63          	bne	t0,a1,800015b0 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    800015a0:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    800015a4:	fe029ae3          	bnez	t0,80001598 <copy_and_swap>
    li a0, 0               # Set return to success.
    800015a8:	00000513          	li	a0,0
    jr ra                  # Return.
    800015ac:	00008067          	ret

00000000800015b0 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    800015b0:	00100513          	li	a0,1
    800015b4:	00008067          	ret

00000000800015b8 <_Z9mem_allocm>:
//
#include "../h/syscall_c.hpp"
extern "C" void pushRegisters();
extern "C" void popRegisters();

void *mem_alloc(size_t size) {
    800015b8:	ff010113          	addi	sp,sp,-16
    800015bc:	00813423          	sd	s0,8(sp)
    800015c0:	01010413          	addi	s0,sp,16
    size_t sizeInBlocks;
    if (size % MEM_BLOCK_SIZE != 0) {
    800015c4:	03f57793          	andi	a5,a0,63
    800015c8:	02078463          	beqz	a5,800015f0 <_Z9mem_allocm+0x38>
        sizeInBlocks = (size / MEM_BLOCK_SIZE) + 1;
    800015cc:	00655513          	srli	a0,a0,0x6
    800015d0:	00150513          	addi	a0,a0,1
    } else {
        sizeInBlocks = (size / MEM_BLOCK_SIZE);
    }
    __asm__ volatile("mv a1, %0" : : "r"(sizeInBlocks));
    800015d4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x01");
    800015d8:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    800015dc:	00000073          	ecall

    void *ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800015e0:	00050513          	mv	a0,a0
    return ret;
}
    800015e4:	00813403          	ld	s0,8(sp)
    800015e8:	01010113          	addi	sp,sp,16
    800015ec:	00008067          	ret
        sizeInBlocks = (size / MEM_BLOCK_SIZE);
    800015f0:	00655513          	srli	a0,a0,0x6
    800015f4:	fe1ff06f          	j	800015d4 <_Z9mem_allocm+0x1c>

00000000800015f8 <_Z8mem_freePv>:

int mem_free(void *ptr) {
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00813423          	sd	s0,8(sp)
    80001600:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(ptr));
    80001604:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x02");
    80001608:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    8000160c:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001610:	00050513          	mv	a0,a0
    return (int) ret;
}
    80001614:	0005051b          	sext.w	a0,a0
    80001618:	00813403          	ld	s0,8(sp)
    8000161c:	01010113          	addi	sp,sp,16
    80001620:	00008067          	ret

0000000080001624 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
){
    80001624:	fd010113          	addi	sp,sp,-48
    80001628:	02113423          	sd	ra,40(sp)
    8000162c:	02813023          	sd	s0,32(sp)
    80001630:	00913c23          	sd	s1,24(sp)
    80001634:	01213823          	sd	s2,16(sp)
    80001638:	01313423          	sd	s3,8(sp)
    8000163c:	03010413          	addi	s0,sp,48
    80001640:	00050913          	mv	s2,a0
    80001644:	00058493          	mv	s1,a1
    80001648:	00060993          	mv	s3,a2
    void* stack = nullptr;
//    uint64 rar;
//    __asm__ volatile("mv %0, ra" : "=r"(rar));
    if(start_routine){
    8000164c:	04058863          	beqz	a1,8000169c <_Z13thread_createPP3TCBPFvPvES2_+0x78>

        stack = mem_alloc(DEFAULT_STACK_SIZE);
    80001650:	00001537          	lui	a0,0x1
    80001654:	00000097          	auipc	ra,0x0
    80001658:	f64080e7          	jalr	-156(ra) # 800015b8 <_Z9mem_allocm>

    }
    __asm__ volatile("mv a7, %[stack]" : : [stack]"r"(stack));
    8000165c:	00050893          	mv	a7,a0
    __asm__ volatile("mv a6, %0" : : "r"(arg));
    80001660:	00098813          	mv	a6,s3
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    80001664:	00048613          	mv	a2,s1
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001668:	00090593          	mv	a1,s2
    __asm__ volatile("li a0, 0x11");
    8000166c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001670:	00000073          	ecall

    uint64 ret;

    __asm__ volatile("mv %0, a1" : "=r"(handle));
    80001674:	00058793          	mv	a5,a1
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001678:	00050513          	mv	a0,a0
//    __asm__ volatile("mv ra, %0" : : "r"(rar));
    return ret;
}
    8000167c:	0005051b          	sext.w	a0,a0
    80001680:	02813083          	ld	ra,40(sp)
    80001684:	02013403          	ld	s0,32(sp)
    80001688:	01813483          	ld	s1,24(sp)
    8000168c:	01013903          	ld	s2,16(sp)
    80001690:	00813983          	ld	s3,8(sp)
    80001694:	03010113          	addi	sp,sp,48
    80001698:	00008067          	ret
    void* stack = nullptr;
    8000169c:	00000513          	li	a0,0
    800016a0:	fbdff06f          	j	8000165c <_Z13thread_createPP3TCBPFvPvES2_+0x38>

00000000800016a4 <_Z11thread_exitv>:
int thread_exit() {
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00813423          	sd	s0,8(sp)
    800016ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x12");
    800016b0:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    800016b4:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800016b8:	00050513          	mv	a0,a0
    return (int) ret;
}
    800016bc:	0005051b          	sext.w	a0,a0
    800016c0:	00813403          	ld	s0,8(sp)
    800016c4:	01010113          	addi	sp,sp,16
    800016c8:	00008067          	ret

00000000800016cc <_Z15thread_dispatchv>:

void thread_dispatch() {
    800016cc:	ff010113          	addi	sp,sp,-16
    800016d0:	00813423          	sd	s0,8(sp)
    800016d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x13");
    800016d8:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    800016dc:	00000073          	ecall
}
    800016e0:	00813403          	ld	s0,8(sp)
    800016e4:	01010113          	addi	sp,sp,16
    800016e8:	00008067          	ret

00000000800016ec <_Z11thread_joinP3TCB>:

void thread_join(
        thread_t handle
) {
    800016ec:	ff010113          	addi	sp,sp,-16
    800016f0:	00813423          	sd	s0,8(sp)
    800016f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    800016f8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    800016fc:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001700:	00000073          	ecall
}
    80001704:	00813403          	ld	s0,8(sp)
    80001708:	01010113          	addi	sp,sp,16
    8000170c:	00008067          	ret

0000000080001710 <_Z8sem_openPP4_semj>:

int sem_open(
        sem_t *handle,
        unsigned init
) {
    80001710:	ff010113          	addi	sp,sp,-16
    80001714:	00813423          	sd	s0,8(sp)
    80001718:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r"(init));
    8000171c:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001720:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x21");
    80001724:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    80001728:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    8000172c:	00050513          	mv	a0,a0
    return (int) ret;
}
    80001730:	0005051b          	sext.w	a0,a0
    80001734:	00813403          	ld	s0,8(sp)
    80001738:	01010113          	addi	sp,sp,16
    8000173c:	00008067          	ret

0000000080001740 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80001740:	ff010113          	addi	sp,sp,-16
    80001744:	00813423          	sd	s0,8(sp)
    80001748:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x22");
    8000174c:	02200513          	li	a0,34
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001750:	00050593          	mv	a1,a0
    __asm__ volatile("ecall");
    80001754:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001758:	00050513          	mv	a0,a0
    return (int) ret;
}
    8000175c:	0005051b          	sext.w	a0,a0
    80001760:	00813403          	ld	s0,8(sp)
    80001764:	01010113          	addi	sp,sp,16
    80001768:	00008067          	ret

000000008000176c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    8000176c:	ff010113          	addi	sp,sp,-16
    80001770:	00813423          	sd	s0,8(sp)
    80001774:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x23");
    80001778:	02300513          	li	a0,35
    __asm__ volatile("mv a1, %0" : : "r"(id));
    8000177c:	00050593          	mv	a1,a0
    __asm__ volatile("ecall");
    80001780:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001784:	00050513          	mv	a0,a0
    return (int) ret;
}
    80001788:	0005051b          	sext.w	a0,a0
    8000178c:	00813403          	ld	s0,8(sp)
    80001790:	01010113          	addi	sp,sp,16
    80001794:	00008067          	ret

0000000080001798 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    80001798:	ff010113          	addi	sp,sp,-16
    8000179c:	00813423          	sd	s0,8(sp)
    800017a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x24");
    800017a4:	02400513          	li	a0,36
    __asm__ volatile("mv a1, %0" : : "r"(id));
    800017a8:	00050593          	mv	a1,a0
    __asm__ volatile("ecall");
    800017ac:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800017b0:	00050513          	mv	a0,a0
    return (int) ret;
}
    800017b4:	0005051b          	sext.w	a0,a0
    800017b8:	00813403          	ld	s0,8(sp)
    800017bc:	01010113          	addi	sp,sp,16
    800017c0:	00008067          	ret

00000000800017c4 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    800017c4:	ff010113          	addi	sp,sp,-16
    800017c8:	00813423          	sd	s0,8(sp)
    800017cc:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x31");
    800017d0:	03100513          	li	a0,49
    __asm__ volatile("mv a1, %0" : : "r"(time));
    800017d4:	00050593          	mv	a1,a0
    __asm__ volatile("ecall");
    800017d8:	00000073          	ecall

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800017dc:	00050513          	mv	a0,a0
    return (int) ret;
}
    800017e0:	0005051b          	sext.w	a0,a0
    800017e4:	00813403          	ld	s0,8(sp)
    800017e8:	01010113          	addi	sp,sp,16
    800017ec:	00008067          	ret

00000000800017f0 <_Z4getcv>:

char getc() {
    800017f0:	ff010113          	addi	sp,sp,-16
    800017f4:	00813423          	sd	s0,8(sp)
    800017f8:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x41");
    800017fc:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    80001800:	00000073          	ecall

    char ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001804:	00050513          	mv	a0,a0
    return ret;
}
    80001808:	0ff57513          	andi	a0,a0,255
    8000180c:	00813403          	ld	s0,8(sp)
    80001810:	01010113          	addi	sp,sp,16
    80001814:	00008067          	ret

0000000080001818 <_Z4putcc>:

void putc(char c) {
    80001818:	ff010113          	addi	sp,sp,-16
    8000181c:	00813423          	sd	s0,8(sp)
    80001820:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(c));
    80001824:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x42");
    80001828:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    8000182c:	00000073          	ecall
    80001830:	00813403          	ld	s0,8(sp)
    80001834:	01010113          	addi	sp,sp,16
    80001838:	00008067          	ret

000000008000183c <_Z41__static_initialization_and_destruction_0ii>:
//
// Created by os on 1/9/24.
//
#include "../h/Scheduler.hpp"

List<TCB> Scheduler::readyQueue;
    8000183c:	ff010113          	addi	sp,sp,-16
    80001840:	00813423          	sd	s0,8(sp)
    80001844:	01010413          	addi	s0,sp,16
    80001848:	00100793          	li	a5,1
    8000184c:	00f50863          	beq	a0,a5,8000185c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001850:	00813403          	ld	s0,8(sp)
    80001854:	01010113          	addi	sp,sp,16
    80001858:	00008067          	ret
    8000185c:	000107b7          	lui	a5,0x10
    80001860:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001864:	fef596e3          	bne	a1,a5,80001850 <_Z41__static_initialization_and_destruction_0ii+0x14>

    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    80001868:	00007797          	auipc	a5,0x7
    8000186c:	df878793          	addi	a5,a5,-520 # 80008660 <_ZN9Scheduler10readyQueueE>
    80001870:	0007b023          	sd	zero,0(a5)
    80001874:	0007b423          	sd	zero,8(a5)
    80001878:	fd9ff06f          	j	80001850 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000187c <_GLOBAL__sub_I__ZN9Scheduler10readyQueueE>:
    8000187c:	ff010113          	addi	sp,sp,-16
    80001880:	00113423          	sd	ra,8(sp)
    80001884:	00813023          	sd	s0,0(sp)
    80001888:	01010413          	addi	s0,sp,16
    8000188c:	000105b7          	lui	a1,0x10
    80001890:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001894:	00100513          	li	a0,1
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	fa4080e7          	jalr	-92(ra) # 8000183c <_Z41__static_initialization_and_destruction_0ii>
    800018a0:	00813083          	ld	ra,8(sp)
    800018a4:	00013403          	ld	s0,0(sp)
    800018a8:	01010113          	addi	sp,sp,16
    800018ac:	00008067          	ret

00000000800018b0 <_Z15userMainWrapperPv>:
}
thread_t idle_handle = nullptr;

//int userMain();
extern void userMain();
void userMainWrapper(void *){
    800018b0:	ff010113          	addi	sp,sp,-16
    800018b4:	00113423          	sd	ra,8(sp)
    800018b8:	00813023          	sd	s0,0(sp)
    800018bc:	01010413          	addi	s0,sp,16
    userMain();
    800018c0:	00002097          	auipc	ra,0x2
    800018c4:	fa0080e7          	jalr	-96(ra) # 80003860 <_Z8userMainv>
}
    800018c8:	00813083          	ld	ra,8(sp)
    800018cc:	00013403          	ld	s0,0(sp)
    800018d0:	01010113          	addi	sp,sp,16
    800018d4:	00008067          	ret

00000000800018d8 <_Z10idleThreadPv>:
void idleThread(void *){
    800018d8:	ff010113          	addi	sp,sp,-16
    800018dc:	00113423          	sd	ra,8(sp)
    800018e0:	00813023          	sd	s0,0(sp)
    800018e4:	01010413          	addi	s0,sp,16
        thread_dispatch();
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	de4080e7          	jalr	-540(ra) # 800016cc <_Z15thread_dispatchv>
    while(true){
    800018f0:	ff9ff06f          	j	800018e8 <_Z10idleThreadPv+0x10>

00000000800018f4 <main>:

int main(){
    800018f4:	fe010113          	addi	sp,sp,-32
    800018f8:	00113c23          	sd	ra,24(sp)
    800018fc:	00813823          	sd	s0,16(sp)
    80001900:	02010413          	addi	s0,sp,32

    Riscv::w_stvec((uint64) &vectorTable | 0b01);
    80001904:	00007797          	auipc	a5,0x7
    80001908:	d0c7b783          	ld	a5,-756(a5) # 80008610 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000190c:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec){
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001910:	10579073          	csrw	stvec,a5

    MemoryAllocator::getInstance();
    80001914:	00001097          	auipc	ra,0x1
    80001918:	9b4080e7          	jalr	-1612(ra) # 800022c8 <_ZN15MemoryAllocator11getInstanceEv>
//    List();
    thread_t mainHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    8000191c:	00000613          	li	a2,0
    80001920:	00000593          	li	a1,0
    80001924:	fe840513          	addi	a0,s0,-24
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	cfc080e7          	jalr	-772(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainHandle;
    80001930:	00007797          	auipc	a5,0x7
    80001934:	cc87b783          	ld	a5,-824(a5) # 800085f8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001938:	fe843703          	ld	a4,-24(s0)
    8000193c:	00e7b023          	sd	a4,0(a5)
}
inline void Riscv::w_sstatus(uint64 sstatus){
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}
inline void Riscv::ms_sstatus(uint64 mask){
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001940:	00200793          	li	a5,2
    80001944:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE); //supervisor interrupt enable
//    thread_create(&idle_handle, &idleThread, nullptr);

    thread_t userMainHandle;
//    int ret;
    thread_create(&userMainHandle, userMainWrapper, nullptr);
    80001948:	00000613          	li	a2,0
    8000194c:	00000597          	auipc	a1,0x0
    80001950:	f6458593          	addi	a1,a1,-156 # 800018b0 <_Z15userMainWrapperPv>
    80001954:	fe040513          	addi	a0,s0,-32
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	ccc080e7          	jalr	-820(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userMainHandle);
    80001960:	fe043503          	ld	a0,-32(s0)
    80001964:	00000097          	auipc	ra,0x0
    80001968:	d88080e7          	jalr	-632(ra) # 800016ec <_Z11thread_joinP3TCB>

//    printInteger(ret);
    printString("FINISHED\n");
    8000196c:	00005517          	auipc	a0,0x5
    80001970:	6b450513          	addi	a0,a0,1716 # 80007020 <CONSOLE_STATUS+0x10>
    80001974:	00002097          	auipc	ra,0x2
    80001978:	c1c080e7          	jalr	-996(ra) # 80003590 <_Z11printStringPKc>
//    return ret;
    return 0;
}
    8000197c:	00000513          	li	a0,0
    80001980:	01813083          	ld	ra,24(sp)
    80001984:	01013403          	ld	s0,16(sp)
    80001988:	02010113          	addi	sp,sp,32
    8000198c:	00008067          	ret

0000000080001990 <_ZN3TCBC1EPFvPvES0_S0_>:
extern "C" void popRegisters();

TCB *TCB::running = nullptr;
typedef TCB *thread_t;
extern thread_t idle_handle;
TCB::TCB(TCB::Body body, void *arg, void *stack)
    80001990:	ff010113          	addi	sp,sp,-16
    80001994:	00813423          	sd	s0,8(sp)
    80001998:	01010413          	addi	s0,sp,16
        : body(body), arg(arg), stack(stack),
          context({
                          (uint64) &threadWrapper,
                          (uint64) stack + DEFAULT_STACK_SIZE - 1
                  }), finished(false), joined(false), is_main(body == nullptr), joined_list() {
    8000199c:	00b53023          	sd	a1,0(a0)
    800019a0:	00c53423          	sd	a2,8(a0)
    800019a4:	00d53823          	sd	a3,16(a0)
    800019a8:	00000797          	auipc	a5,0x0
    800019ac:	42c78793          	addi	a5,a5,1068 # 80001dd4 <_ZN3TCB13threadWrapperEv>
    800019b0:	00f53c23          	sd	a5,24(a0)
                          (uint64) stack + DEFAULT_STACK_SIZE - 1
    800019b4:	000017b7          	lui	a5,0x1
    800019b8:	fff78793          	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
    800019bc:	00f686b3          	add	a3,a3,a5
                  }), finished(false), joined(false), is_main(body == nullptr), joined_list() {
    800019c0:	02d53023          	sd	a3,32(a0)
    800019c4:	02050423          	sb	zero,40(a0)
    800019c8:	020504a3          	sb	zero,41(a0)
    800019cc:	0015b593          	seqz	a1,a1
    800019d0:	02b50523          	sb	a1,42(a0)
    800019d4:	02053823          	sd	zero,48(a0)
    800019d8:	02053c23          	sd	zero,56(a0)

}
    800019dc:	00813403          	ld	s0,8(sp)
    800019e0:	01010113          	addi	sp,sp,16
    800019e4:	00008067          	ret

00000000800019e8 <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_>:


TCB *TCB::createThread(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    800019e8:	fc010113          	addi	sp,sp,-64
    800019ec:	02113c23          	sd	ra,56(sp)
    800019f0:	02813823          	sd	s0,48(sp)
    800019f4:	02913423          	sd	s1,40(sp)
    800019f8:	03213023          	sd	s2,32(sp)
    800019fc:	01313c23          	sd	s3,24(sp)
    80001a00:	01413823          	sd	s4,16(sp)
    80001a04:	01513423          	sd	s5,8(sp)
    80001a08:	04010413          	addi	s0,sp,64
    80001a0c:	00050493          	mv	s1,a0
    80001a10:	00058913          	mv	s2,a1
    80001a14:	00060a13          	mv	s4,a2
    80001a18:	00068a93          	mv	s5,a3
        if (size % MEM_BLOCK_SIZE != 0) {
            sizeInBlocks = (size / MEM_BLOCK_SIZE) + 1;
        } else {
            sizeInBlocks = (size / MEM_BLOCK_SIZE);
        }
        return MemoryAllocator::mem_alloc(sizeInBlocks);
    80001a1c:	00100513          	li	a0,1
    80001a20:	00001097          	auipc	ra,0x1
    80001a24:	900080e7          	jalr	-1792(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
    80001a28:	00050993          	mv	s3,a0
    *handle = new TCB(start_routine, arg, stack);
    80001a2c:	000a8693          	mv	a3,s5
    80001a30:	000a0613          	mv	a2,s4
    80001a34:	00090593          	mv	a1,s2
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	f58080e7          	jalr	-168(ra) # 80001990 <_ZN3TCBC1EPFvPvES0_S0_>
    80001a40:	0134b023          	sd	s3,0(s1)
//    print_String("12");

    if (start_routine){
    80001a44:	02090c63          	beqz	s2,80001a7c <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_+0x94>
            return MemoryAllocator::mem_alloc(sizeInBlocks);
    80001a48:	00100513          	li	a0,1
    80001a4c:	00001097          	auipc	ra,0x1
    80001a50:	8d4080e7          	jalr	-1836(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next) : data(data), next(next) {
    80001a54:	01353023          	sd	s3,0(a0)
    80001a58:	00053423          	sd	zero,8(a0)

    void addLast(T *data) {
//        print_String("addlast");
        Elem *elem = new Elem(data,nullptr);
//        printInteger((uint64)elem);
        if (tail) {
    80001a5c:	00007797          	auipc	a5,0x7
    80001a60:	b8c7b783          	ld	a5,-1140(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001a64:	0087b783          	ld	a5,8(a5)
    80001a68:	02078e63          	beqz	a5,80001aa4 <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_+0xbc>
            tail->next = elem;
    80001a6c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001a70:	00007797          	auipc	a5,0x7
    80001a74:	b787b783          	ld	a5,-1160(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001a78:	00a7b423          	sd	a0,8(a5)
        Scheduler::put(*handle);
//        printInteger(Scheduler::count());
    }

    return *handle;
}
    80001a7c:	0004b503          	ld	a0,0(s1)
    80001a80:	03813083          	ld	ra,56(sp)
    80001a84:	03013403          	ld	s0,48(sp)
    80001a88:	02813483          	ld	s1,40(sp)
    80001a8c:	02013903          	ld	s2,32(sp)
    80001a90:	01813983          	ld	s3,24(sp)
    80001a94:	01013a03          	ld	s4,16(sp)
    80001a98:	00813a83          	ld	s5,8(sp)
    80001a9c:	04010113          	addi	sp,sp,64
    80001aa0:	00008067          	ret
        } else {
            head = tail = elem;
    80001aa4:	00007797          	auipc	a5,0x7
    80001aa8:	b447b783          	ld	a5,-1212(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001aac:	00a7b423          	sd	a0,8(a5)
    80001ab0:	00a7b023          	sd	a0,0(a5)
    static  TCB* get(){
        return readyQueue.removeFirst();
    }
    static  void put(TCB *tcb){
        readyQueue.addLast(tcb);
    }
    80001ab4:	fc9ff06f          	j	80001a7c <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_+0x94>

0000000080001ab8 <_ZN3TCB8dispatchEv>:
    TCB::dispatch();

    popRegisters();
}

void TCB::dispatch() {
    80001ab8:	fe010113          	addi	sp,sp,-32
    80001abc:	00113c23          	sd	ra,24(sp)
    80001ac0:	00813823          	sd	s0,16(sp)
    80001ac4:	00913423          	sd	s1,8(sp)
    80001ac8:	01213023          	sd	s2,0(sp)
    80001acc:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80001ad0:	00007497          	auipc	s1,0x7
    80001ad4:	ba84b483          	ld	s1,-1112(s1) # 80008678 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80001ad8:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && old != idle_handle && !old->isJoined()) {
    80001adc:	00079e63          	bnez	a5,80001af8 <_ZN3TCB8dispatchEv+0x40>
    80001ae0:	00007717          	auipc	a4,0x7
    80001ae4:	b2873703          	ld	a4,-1240(a4) # 80008608 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ae8:	00073703          	ld	a4,0(a4)
    80001aec:	00970663          	beq	a4,s1,80001af8 <_ZN3TCB8dispatchEv+0x40>
    bool isJoined() const { return joined; }
    80001af0:	0294c703          	lbu	a4,41(s1)
    80001af4:	02070463          	beqz	a4,80001b1c <_ZN3TCB8dispatchEv+0x64>
        Scheduler::put(old);
//        printInteger(Scheduler::count());
    }else if(old->isFinished()){
    80001af8:	06079863          	bnez	a5,80001b68 <_ZN3TCB8dispatchEv+0xb0>
        delete elem;
        return ret;
    }

    int count(){
        Elem *cur = head;
    80001afc:	00007797          	auipc	a5,0x7
    80001b00:	aec7b783          	ld	a5,-1300(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001b04:	0007b783          	ld	a5,0(a5)
        int cnt = 0;
    80001b08:	00000713          	li	a4,0
        while(cur){
    80001b0c:	06078663          	beqz	a5,80001b78 <_ZN3TCB8dispatchEv+0xc0>
            cnt = cnt +1;
    80001b10:	0017071b          	addiw	a4,a4,1
            cur = cur->next;
    80001b14:	0087b783          	ld	a5,8(a5)
        while(cur){
    80001b18:	ff5ff06f          	j	80001b0c <_ZN3TCB8dispatchEv+0x54>
            return MemoryAllocator::mem_alloc(sizeInBlocks);
    80001b1c:	00100513          	li	a0,1
    80001b20:	00001097          	auipc	ra,0x1
    80001b24:	800080e7          	jalr	-2048(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next) : data(data), next(next) {
    80001b28:	00953023          	sd	s1,0(a0)
    80001b2c:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001b30:	00007797          	auipc	a5,0x7
    80001b34:	ab87b783          	ld	a5,-1352(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001b38:	0087b783          	ld	a5,8(a5)
    80001b3c:	00078c63          	beqz	a5,80001b54 <_ZN3TCB8dispatchEv+0x9c>
            tail->next = elem;
    80001b40:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001b44:	00007797          	auipc	a5,0x7
    80001b48:	aa47b783          	ld	a5,-1372(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001b4c:	00a7b423          	sd	a0,8(a5)
    80001b50:	fadff06f          	j	80001afc <_ZN3TCB8dispatchEv+0x44>
            head = tail = elem;
    80001b54:	00007797          	auipc	a5,0x7
    80001b58:	a947b783          	ld	a5,-1388(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001b5c:	00a7b423          	sd	a0,8(a5)
    80001b60:	00a7b023          	sd	a0,0(a5)
    80001b64:	f99ff06f          	j	80001afc <_ZN3TCB8dispatchEv+0x44>
        MemoryAllocator::mem_free(old->stack);
    80001b68:	0104b503          	ld	a0,16(s1)
    80001b6c:	00001097          	auipc	ra,0x1
    80001b70:	9e0080e7          	jalr	-1568(ra) # 8000254c <_ZN15MemoryAllocator8mem_freeEPv>
    80001b74:	f89ff06f          	j	80001afc <_ZN3TCB8dispatchEv+0x44>
    }
    if(Scheduler::count() == 0)
    80001b78:	04071c63          	bnez	a4,80001bd0 <_ZN3TCB8dispatchEv+0x118>
        running = idle_handle;
    80001b7c:	00007797          	auipc	a5,0x7
    80001b80:	a8c7b783          	ld	a5,-1396(a5) # 80008608 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b84:	0007b783          	ld	a5,0(a5)
    80001b88:	00007717          	auipc	a4,0x7
    80001b8c:	aef73823          	sd	a5,-1296(a4) # 80008678 <_ZN3TCB7runningE>
    else
        running = Scheduler::get();
//    printInteger(Scheduler::count());
    if(running->is_main)
    80001b90:	00007597          	auipc	a1,0x7
    80001b94:	ae85b583          	ld	a1,-1304(a1) # 80008678 <_ZN3TCB7runningE>
    80001b98:	02a5c783          	lbu	a5,42(a1)
    80001b9c:	08078063          	beqz	a5,80001c1c <_ZN3TCB8dispatchEv+0x164>
    80001ba0:	10000793          	li	a5,256
    80001ba4:	1007a073          	csrs	sstatus,a5
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    else
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);


    TCB::contextSwitch(&old->context, &running->context);
    80001ba8:	01858593          	addi	a1,a1,24
    80001bac:	01848513          	addi	a0,s1,24
    80001bb0:	fffff097          	auipc	ra,0xfffff
    80001bb4:	660080e7          	jalr	1632(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001bb8:	01813083          	ld	ra,24(sp)
    80001bbc:	01013403          	ld	s0,16(sp)
    80001bc0:	00813483          	ld	s1,8(sp)
    80001bc4:	00013903          	ld	s2,0(sp)
    80001bc8:	02010113          	addi	sp,sp,32
    80001bcc:	00008067          	ret
        if (!head) { return 0; }
    80001bd0:	00007797          	auipc	a5,0x7
    80001bd4:	a187b783          	ld	a5,-1512(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001bd8:	0007b503          	ld	a0,0(a5)
    80001bdc:	02050c63          	beqz	a0,80001c14 <_ZN3TCB8dispatchEv+0x15c>
        head = head->next;
    80001be0:	00853783          	ld	a5,8(a0)
    80001be4:	00007717          	auipc	a4,0x7
    80001be8:	a0473703          	ld	a4,-1532(a4) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001bec:	00f73023          	sd	a5,0(a4)
        if (!head) { tail = 0; }
    80001bf0:	00078e63          	beqz	a5,80001c0c <_ZN3TCB8dispatchEv+0x154>
        T *ret = elem->data;
    80001bf4:	00053903          	ld	s2,0(a0)
        void operator delete(void *pointer) { MemoryAllocator::mem_free(pointer); }
    80001bf8:	00001097          	auipc	ra,0x1
    80001bfc:	954080e7          	jalr	-1708(ra) # 8000254c <_ZN15MemoryAllocator8mem_freeEPv>
        running = Scheduler::get();
    80001c00:	00007797          	auipc	a5,0x7
    80001c04:	a727bc23          	sd	s2,-1416(a5) # 80008678 <_ZN3TCB7runningE>
    80001c08:	f89ff06f          	j	80001b90 <_ZN3TCB8dispatchEv+0xd8>
        if (!head) { tail = 0; }
    80001c0c:	00073423          	sd	zero,8(a4)
    80001c10:	fe5ff06f          	j	80001bf4 <_ZN3TCB8dispatchEv+0x13c>
        if (!head) { return 0; }
    80001c14:	00050913          	mv	s2,a0
    80001c18:	fe9ff06f          	j	80001c00 <_ZN3TCB8dispatchEv+0x148>
}
inline void Riscv::mc_sstatus(uint64 mask){
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001c1c:	10000793          	li	a5,256
    80001c20:	1007b073          	csrc	sstatus,a5
}
    80001c24:	f85ff06f          	j	80001ba8 <_ZN3TCB8dispatchEv+0xf0>

0000000080001c28 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80001c28:	ff010113          	addi	sp,sp,-16
    80001c2c:	00113423          	sd	ra,8(sp)
    80001c30:	00813023          	sd	s0,0(sp)
    80001c34:	01010413          	addi	s0,sp,16
    pushRegisters();
    80001c38:	fffff097          	auipc	ra,0xfffff
    80001c3c:	3c8080e7          	jalr	968(ra) # 80001000 <pushRegisters>
    TCB::dispatch();
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	e78080e7          	jalr	-392(ra) # 80001ab8 <_ZN3TCB8dispatchEv>
    popRegisters();
    80001c48:	fffff097          	auipc	ra,0xfffff
    80001c4c:	434080e7          	jalr	1076(ra) # 8000107c <popRegisters>
}
    80001c50:	00813083          	ld	ra,8(sp)
    80001c54:	00013403          	ld	s0,0(sp)
    80001c58:	01010113          	addi	sp,sp,16
    80001c5c:	00008067          	ret

0000000080001c60 <_ZN3TCB10threadExitEv>:

void TCB::threadExit(){
    80001c60:	ff010113          	addi	sp,sp,-16
    80001c64:	00113423          	sd	ra,8(sp)
    80001c68:	00813023          	sd	s0,0(sp)
    80001c6c:	01010413          	addi	s0,sp,16
    void setFinished(bool finished) { TCB::finished = finished; }
    80001c70:	00007797          	auipc	a5,0x7
    80001c74:	a087b783          	ld	a5,-1528(a5) # 80008678 <_ZN3TCB7runningE>
    80001c78:	00100713          	li	a4,1
    80001c7c:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    TCB::yield();
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	fa8080e7          	jalr	-88(ra) # 80001c28 <_ZN3TCB5yieldEv>
}
    80001c88:	00813083          	ld	ra,8(sp)
    80001c8c:	00013403          	ld	s0,0(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	00008067          	ret

0000000080001c98 <_ZN3TCB4joinEPS_>:
    bool isFinished() const { return finished; }
    80001c98:	02854783          	lbu	a5,40(a0)

void TCB::join(thread_t handle){
    if(handle->isFinished())
    80001c9c:	00078463          	beqz	a5,80001ca4 <_ZN3TCB4joinEPS_+0xc>
    80001ca0:	00008067          	ret
void TCB::join(thread_t handle){
    80001ca4:	fe010113          	addi	sp,sp,-32
    80001ca8:	00113c23          	sd	ra,24(sp)
    80001cac:	00813823          	sd	s0,16(sp)
    80001cb0:	00913423          	sd	s1,8(sp)
    80001cb4:	01213023          	sd	s2,0(sp)
    80001cb8:	02010413          	addi	s0,sp,32
    80001cbc:	00050493          	mv	s1,a0
        return;
    running->setJoined(true);
    80001cc0:	00007917          	auipc	s2,0x7
    80001cc4:	9b893903          	ld	s2,-1608(s2) # 80008678 <_ZN3TCB7runningE>
    void setJoined(bool joined) { TCB::joined = joined; }
    80001cc8:	00100793          	li	a5,1
    80001ccc:	02f904a3          	sb	a5,41(s2)
            return MemoryAllocator::mem_alloc(sizeInBlocks);
    80001cd0:	00100513          	li	a0,1
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	64c080e7          	jalr	1612(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next) : data(data), next(next) {
    80001cdc:	01253023          	sd	s2,0(a0)
    80001ce0:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001ce4:	0384b783          	ld	a5,56(s1)
    80001ce8:	02078663          	beqz	a5,80001d14 <_ZN3TCB4joinEPS_+0x7c>
            tail->next = elem;
    80001cec:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001cf0:	02a4bc23          	sd	a0,56(s1)
    handle->joined_list.addLast(running);
    TCB::yield();
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	f34080e7          	jalr	-204(ra) # 80001c28 <_ZN3TCB5yieldEv>
}
    80001cfc:	01813083          	ld	ra,24(sp)
    80001d00:	01013403          	ld	s0,16(sp)
    80001d04:	00813483          	ld	s1,8(sp)
    80001d08:	00013903          	ld	s2,0(sp)
    80001d0c:	02010113          	addi	sp,sp,32
    80001d10:	00008067          	ret
            head = tail = elem;
    80001d14:	02a4bc23          	sd	a0,56(s1)
    80001d18:	02a4b823          	sd	a0,48(s1)
    80001d1c:	fd9ff06f          	j	80001cf4 <_ZN3TCB4joinEPS_+0x5c>

0000000080001d20 <_ZN3TCB11startJoinedEv>:
    running->setFinished(true);
    running->startJoined();
    thread_exit();
}

void TCB::startJoined() {
    80001d20:	fe010113          	addi	sp,sp,-32
    80001d24:	00113c23          	sd	ra,24(sp)
    80001d28:	00813823          	sd	s0,16(sp)
    80001d2c:	00913423          	sd	s1,8(sp)
    80001d30:	01213023          	sd	s2,0(sp)
    80001d34:	02010413          	addi	s0,sp,32
    80001d38:	00050913          	mv	s2,a0
    80001d3c:	01c0006f          	j	80001d58 <_ZN3TCB11startJoinedEv+0x38>
        if (!head) { tail = 0; }
    80001d40:	02093c23          	sd	zero,56(s2)
    80001d44:	0300006f          	j	80001d74 <_ZN3TCB11startJoinedEv+0x54>
            head = tail = elem;
    80001d48:	00007797          	auipc	a5,0x7
    80001d4c:	8a07b783          	ld	a5,-1888(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001d50:	00a7b423          	sd	a0,8(a5)
    80001d54:	00a7b023          	sd	a0,0(a5)
        }
        return cnt;
    }
    T *peekFirst(){
        if(!head){return 0;}
    80001d58:	03093503          	ld	a0,48(s2)
    80001d5c:	06050063          	beqz	a0,80001dbc <_ZN3TCB11startJoinedEv+0x9c>
        return head->data;
    80001d60:	00053783          	ld	a5,0(a0)
    while(this->joined_list.peekFirst()){
    80001d64:	04078c63          	beqz	a5,80001dbc <_ZN3TCB11startJoinedEv+0x9c>
        head = head->next;
    80001d68:	00853783          	ld	a5,8(a0)
    80001d6c:	02f93823          	sd	a5,48(s2)
        if (!head) { tail = 0; }
    80001d70:	fc0788e3          	beqz	a5,80001d40 <_ZN3TCB11startJoinedEv+0x20>
        T *ret = elem->data;
    80001d74:	00053483          	ld	s1,0(a0)
        void operator delete(void *pointer) { MemoryAllocator::mem_free(pointer); }
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	7d4080e7          	jalr	2004(ra) # 8000254c <_ZN15MemoryAllocator8mem_freeEPv>
    80001d80:	020484a3          	sb	zero,41(s1)
            return MemoryAllocator::mem_alloc(sizeInBlocks);
    80001d84:	00100513          	li	a0,1
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	598080e7          	jalr	1432(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next) : data(data), next(next) {
    80001d90:	00953023          	sd	s1,0(a0)
    80001d94:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001d98:	00007797          	auipc	a5,0x7
    80001d9c:	8507b783          	ld	a5,-1968(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001da0:	0087b783          	ld	a5,8(a5)
    80001da4:	fa0782e3          	beqz	a5,80001d48 <_ZN3TCB11startJoinedEv+0x28>
            tail->next = elem;
    80001da8:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001dac:	00007797          	auipc	a5,0x7
    80001db0:	83c7b783          	ld	a5,-1988(a5) # 800085e8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001db4:	00a7b423          	sd	a0,8(a5)
    80001db8:	fa1ff06f          	j	80001d58 <_ZN3TCB11startJoinedEv+0x38>
        thread_t to_start = this->joined_list.removeFirst();
        to_start->setJoined(false);
        Scheduler::put(to_start);
    }
}
    80001dbc:	01813083          	ld	ra,24(sp)
    80001dc0:	01013403          	ld	s0,16(sp)
    80001dc4:	00813483          	ld	s1,8(sp)
    80001dc8:	00013903          	ld	s2,0(sp)
    80001dcc:	02010113          	addi	sp,sp,32
    80001dd0:	00008067          	ret

0000000080001dd4 <_ZN3TCB13threadWrapperEv>:
void TCB::threadWrapper() {
    80001dd4:	fe010113          	addi	sp,sp,-32
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	00813823          	sd	s0,16(sp)
    80001de0:	00913423          	sd	s1,8(sp)
    80001de4:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	288080e7          	jalr	648(ra) # 80002070 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001df0:	00007497          	auipc	s1,0x7
    80001df4:	88848493          	addi	s1,s1,-1912 # 80008678 <_ZN3TCB7runningE>
    80001df8:	0004b783          	ld	a5,0(s1)
    80001dfc:	0007b703          	ld	a4,0(a5)
    80001e00:	0087b503          	ld	a0,8(a5)
    80001e04:	000700e7          	jalr	a4
    running->setFinished(true);
    80001e08:	0004b503          	ld	a0,0(s1)
    void setFinished(bool finished) { TCB::finished = finished; }
    80001e0c:	00100793          	li	a5,1
    80001e10:	02f50423          	sb	a5,40(a0)
    running->startJoined();
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	f0c080e7          	jalr	-244(ra) # 80001d20 <_ZN3TCB11startJoinedEv>
    thread_exit();
    80001e1c:	00000097          	auipc	ra,0x0
    80001e20:	888080e7          	jalr	-1912(ra) # 800016a4 <_Z11thread_exitv>
}
    80001e24:	01813083          	ld	ra,24(sp)
    80001e28:	01013403          	ld	s0,16(sp)
    80001e2c:	00813483          	ld	s1,8(sp)
    80001e30:	02010113          	addi	sp,sp,32
    80001e34:	00008067          	ret

0000000080001e38 <_ZN6ThreadD1Ev>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

Thread::~Thread() {
    80001e38:	ff010113          	addi	sp,sp,-16
    80001e3c:	00813423          	sd	s0,8(sp)
    80001e40:	01010413          	addi	s0,sp,16

}
    80001e44:	00813403          	ld	s0,8(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret

0000000080001e50 <_ZN6Thread11bodyWrapperEPv>:

int Thread::sleep(time_t) {
    return 0;
}

void Thread::bodyWrapper(void *arg) {
    80001e50:	ff010113          	addi	sp,sp,-16
    80001e54:	00113423          	sd	ra,8(sp)
    80001e58:	00813023          	sd	s0,0(sp)
    80001e5c:	01010413          	addi	s0,sp,16
    Thread* thread = (Thread*) arg;
    if(thread->body)
    80001e60:	01053783          	ld	a5,16(a0)
    80001e64:	00078e63          	beqz	a5,80001e80 <_ZN6Thread11bodyWrapperEPv+0x30>
        thread->body(thread->arg);
    80001e68:	01853503          	ld	a0,24(a0)
    80001e6c:	000780e7          	jalr	a5
    else
        thread->run();
}
    80001e70:	00813083          	ld	ra,8(sp)
    80001e74:	00013403          	ld	s0,0(sp)
    80001e78:	01010113          	addi	sp,sp,16
    80001e7c:	00008067          	ret
        thread->run();
    80001e80:	00053783          	ld	a5,0(a0)
    80001e84:	0107b783          	ld	a5,16(a5)
    80001e88:	000780e7          	jalr	a5
}
    80001e8c:	fe5ff06f          	j	80001e70 <_ZN6Thread11bodyWrapperEPv+0x20>

0000000080001e90 <_Znwm>:
void* operator new (size_t size){
    80001e90:	ff010113          	addi	sp,sp,-16
    80001e94:	00113423          	sd	ra,8(sp)
    80001e98:	00813023          	sd	s0,0(sp)
    80001e9c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001ea0:	fffff097          	auipc	ra,0xfffff
    80001ea4:	718080e7          	jalr	1816(ra) # 800015b8 <_Z9mem_allocm>
}
    80001ea8:	00813083          	ld	ra,8(sp)
    80001eac:	00013403          	ld	s0,0(sp)
    80001eb0:	01010113          	addi	sp,sp,16
    80001eb4:	00008067          	ret

0000000080001eb8 <_ZdlPv>:
void operator delete (void* ptr){
    80001eb8:	ff010113          	addi	sp,sp,-16
    80001ebc:	00113423          	sd	ra,8(sp)
    80001ec0:	00813023          	sd	s0,0(sp)
    80001ec4:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	730080e7          	jalr	1840(ra) # 800015f8 <_Z8mem_freePv>
}
    80001ed0:	00813083          	ld	ra,8(sp)
    80001ed4:	00013403          	ld	s0,0(sp)
    80001ed8:	01010113          	addi	sp,sp,16
    80001edc:	00008067          	ret

0000000080001ee0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001ee0:	ff010113          	addi	sp,sp,-16
    80001ee4:	00113423          	sd	ra,8(sp)
    80001ee8:	00813023          	sd	s0,0(sp)
    80001eec:	01010413          	addi	s0,sp,16
}
    80001ef0:	00000097          	auipc	ra,0x0
    80001ef4:	fc8080e7          	jalr	-56(ra) # 80001eb8 <_ZdlPv>
    80001ef8:	00813083          	ld	ra,8(sp)
    80001efc:	00013403          	ld	s0,0(sp)
    80001f00:	01010113          	addi	sp,sp,16
    80001f04:	00008067          	ret

0000000080001f08 <_Znam>:
void *operator new[](uint64 n){
    80001f08:	ff010113          	addi	sp,sp,-16
    80001f0c:	00113423          	sd	ra,8(sp)
    80001f10:	00813023          	sd	s0,0(sp)
    80001f14:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001f18:	fffff097          	auipc	ra,0xfffff
    80001f1c:	6a0080e7          	jalr	1696(ra) # 800015b8 <_Z9mem_allocm>
}
    80001f20:	00813083          	ld	ra,8(sp)
    80001f24:	00013403          	ld	s0,0(sp)
    80001f28:	01010113          	addi	sp,sp,16
    80001f2c:	00008067          	ret

0000000080001f30 <_ZdaPv>:
void operator delete[](void* ptr) noexcept{
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00113423          	sd	ra,8(sp)
    80001f38:	00813023          	sd	s0,0(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	6b8080e7          	jalr	1720(ra) # 800015f8 <_Z8mem_freePv>
}
    80001f48:	00813083          	ld	ra,8(sp)
    80001f4c:	00013403          	ld	s0,0(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret

0000000080001f58 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00813423          	sd	s0,8(sp)
    80001f60:	01010413          	addi	s0,sp,16
    80001f64:	00006797          	auipc	a5,0x6
    80001f68:	59c78793          	addi	a5,a5,1436 # 80008500 <_ZTV6Thread+0x10>
    80001f6c:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80001f70:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80001f74:	00c53c23          	sd	a2,24(a0)
}
    80001f78:	00813403          	ld	s0,8(sp)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00813423          	sd	s0,8(sp)
    80001f8c:	01010413          	addi	s0,sp,16
    80001f90:	00006797          	auipc	a5,0x6
    80001f94:	57078793          	addi	a5,a5,1392 # 80008500 <_ZTV6Thread+0x10>
    80001f98:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80001f9c:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80001fa0:	00053c23          	sd	zero,24(a0)
}
    80001fa4:	00813403          	ld	s0,8(sp)
    80001fa8:	01010113          	addi	sp,sp,16
    80001fac:	00008067          	ret

0000000080001fb0 <_ZN6Thread5startEv>:
int Thread::start() {
    80001fb0:	ff010113          	addi	sp,sp,-16
    80001fb4:	00113423          	sd	ra,8(sp)
    80001fb8:	00813023          	sd	s0,0(sp)
    80001fbc:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &bodyWrapper, this);
    80001fc0:	00050613          	mv	a2,a0
    80001fc4:	00000597          	auipc	a1,0x0
    80001fc8:	e8c58593          	addi	a1,a1,-372 # 80001e50 <_ZN6Thread11bodyWrapperEPv>
    80001fcc:	00850513          	addi	a0,a0,8
    80001fd0:	fffff097          	auipc	ra,0xfffff
    80001fd4:	654080e7          	jalr	1620(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001fd8:	00813083          	ld	ra,8(sp)
    80001fdc:	00013403          	ld	s0,0(sp)
    80001fe0:	01010113          	addi	sp,sp,16
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN6Thread4joinEv>:
void Thread::join() {
    80001fe8:	ff010113          	addi	sp,sp,-16
    80001fec:	00113423          	sd	ra,8(sp)
    80001ff0:	00813023          	sd	s0,0(sp)
    80001ff4:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80001ff8:	00853503          	ld	a0,8(a0)
    80001ffc:	fffff097          	auipc	ra,0xfffff
    80002000:	6f0080e7          	jalr	1776(ra) # 800016ec <_Z11thread_joinP3TCB>
}
    80002004:	00813083          	ld	ra,8(sp)
    80002008:	00013403          	ld	s0,0(sp)
    8000200c:	01010113          	addi	sp,sp,16
    80002010:	00008067          	ret

0000000080002014 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002014:	ff010113          	addi	sp,sp,-16
    80002018:	00113423          	sd	ra,8(sp)
    8000201c:	00813023          	sd	s0,0(sp)
    80002020:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002024:	fffff097          	auipc	ra,0xfffff
    80002028:	6a8080e7          	jalr	1704(ra) # 800016cc <_Z15thread_dispatchv>
}
    8000202c:	00813083          	ld	ra,8(sp)
    80002030:	00013403          	ld	s0,0(sp)
    80002034:	01010113          	addi	sp,sp,16
    80002038:	00008067          	ret

000000008000203c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    8000203c:	ff010113          	addi	sp,sp,-16
    80002040:	00813423          	sd	s0,8(sp)
    80002044:	01010413          	addi	s0,sp,16
}
    80002048:	00000513          	li	a0,0
    8000204c:	00813403          	ld	s0,8(sp)
    80002050:	01010113          	addi	sp,sp,16
    80002054:	00008067          	ret

0000000080002058 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
    static void bodyWrapper(void *);
protected:
    Thread ();
    virtual void run () {}
    80002058:	ff010113          	addi	sp,sp,-16
    8000205c:	00813423          	sd	s0,8(sp)
    80002060:	01010413          	addi	s0,sp,16
    80002064:	00813403          	ld	s0,8(sp)
    80002068:	01010113          	addi	sp,sp,16
    8000206c:	00008067          	ret

0000000080002070 <_ZN5Riscv10popSppSpieEv>:
#include "../test/printing.hpp"
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"


void Riscv::popSppSpie() {
    80002070:	ff010113          	addi	sp,sp,-16
    80002074:	00813423          	sd	s0,8(sp)
    80002078:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra"); //ra je lokacija sa koje je staticka metoda pozvana
    8000207c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret"); //izlazimo iz prekidne rutine ovim sret umesto onim iz supervisorTrap
    80002080:	10200073          	sret
}
    80002084:	00813403          	ld	s0,8(sp)
    80002088:	01010113          	addi	sp,sp,16
    8000208c:	00008067          	ret

0000000080002090 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002090:	fb010113          	addi	sp,sp,-80
    80002094:	04113423          	sd	ra,72(sp)
    80002098:	04813023          	sd	s0,64(sp)
    8000209c:	02913c23          	sd	s1,56(sp)
    800020a0:	03213823          	sd	s2,48(sp)
    800020a4:	03313423          	sd	s3,40(sp)
    800020a8:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800020ac:	142027f3          	csrr	a5,scause
    800020b0:	faf43823          	sd	a5,-80(s0)
    return scause;
    800020b4:	fb043783          	ld	a5,-80(s0)
//    print_String("handlesuptrap()");
    uint64 scause = r_scause();
    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {
    800020b8:	ff878793          	addi	a5,a5,-8
    800020bc:	00100713          	li	a4,1
    800020c0:	12f76663          	bltu	a4,a5,800021ec <_ZN5Riscv20handleSupervisorTrapEv+0x15c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020c4:	141027f3          	csrr	a5,sepc
    800020c8:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800020cc:	fc843483          	ld	s1,-56(s0)
        //interrupt: NO, cause code : environment call from S-mode (9)
        uint64 sepc = r_sepc() +
                      4; //sacuvan sepc na steku prve niti // povecavamo za jednu adresu da bismo se vratili na jednu instrukciju iza ecall-a
    800020d0:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020d4:	100027f3          	csrr	a5,sstatus
    800020d8:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    800020dc:	fc043983          	ld	s3,-64(s0)
        uint64 sstatus = r_sstatus();
        uint64 a0reg;
        __asm__ volatile("mv %0, a0" : "=r"(a0reg));
    800020e0:	00050793          	mv	a5,a0
        int ret;
        int retval;
        switch (a0reg) {
    800020e4:	01400713          	li	a4,20
    800020e8:	02f76463          	bltu	a4,a5,80002110 <_ZN5Riscv20handleSupervisorTrapEv+0x80>
    800020ec:	04078e63          	beqz	a5,80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
    800020f0:	04f76c63          	bltu	a4,a5,80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
    800020f4:	00279793          	slli	a5,a5,0x2
    800020f8:	00005717          	auipc	a4,0x5
    800020fc:	f5470713          	addi	a4,a4,-172 # 8000704c <CONSOLE_STATUS+0x3c>
    80002100:	00e787b3          	add	a5,a5,a4
    80002104:	0007a783          	lw	a5,0(a5)
    80002108:	00e787b3          	add	a5,a5,a4
    8000210c:	00078067          	jr	a5
    80002110:	04100713          	li	a4,65
    80002114:	0ce78263          	beq	a5,a4,800021d8 <_ZN5Riscv20handleSupervisorTrapEv+0x148>
    80002118:	04200713          	li	a4,66
    8000211c:	02e79663          	bne	a5,a4,80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                __asm__ volatile ("mv t0, %0" : : "r"(retval));
                __asm__ volatile("sw t0, 80(fp)");
                break;
            case 0x42: //putc
                char c;
                __asm__ volatile("mv %0, a1" : "=r"(c));
    80002120:	00058513          	mv	a0,a1
                __putc(c);
    80002124:	0ff57513          	andi	a0,a0,255
    80002128:	00004097          	auipc	ra,0x4
    8000212c:	f14080e7          	jalr	-236(ra) # 8000603c <__putc>
                break;
    80002130:	0180006f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                __asm__ volatile("mv %0, a1" : "=r"(size));
    80002134:	00058513          	mv	a0,a1
                ptr = MemoryAllocator::mem_alloc(size);
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	1e8080e7          	jalr	488(ra) # 80002320 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("mv t0, %0" : : "r"(ptr));
    80002140:	00050293          	mv	t0,a0
                __asm__ volatile("sw t0, 80(fp)");
    80002144:	04542823          	sw	t0,80(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002148:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000214c:	14149073          	csrw	sepc,s1

        while(1);

    }

}
    80002150:	04813083          	ld	ra,72(sp)
    80002154:	04013403          	ld	s0,64(sp)
    80002158:	03813483          	ld	s1,56(sp)
    8000215c:	03013903          	ld	s2,48(sp)
    80002160:	02813983          	ld	s3,40(sp)
    80002164:	05010113          	addi	sp,sp,80
    80002168:	00008067          	ret
                __asm__ volatile("mv %0, a1" : "=r"(addr));
    8000216c:	00058513          	mv	a0,a1
                ret = MemoryAllocator::mem_free(addr);
    80002170:	00000097          	auipc	ra,0x0
    80002174:	3dc080e7          	jalr	988(ra) # 8000254c <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("mv t0, %0" : : "r"(ret));
    80002178:	00050293          	mv	t0,a0
                __asm__ volatile ("sw t0, 80(fp)");
    8000217c:	04542823          	sw	t0,80(s0)
                break;
    80002180:	fc9ff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                __asm__ volatile("mv %0, a1" : "=r"(handle));
    80002184:	00058913          	mv	s2,a1
                __asm__ volatile("mv %0, a2" : "=r"(body));
    80002188:	00060593          	mv	a1,a2
                __asm__ volatile("mv %0, a6" : "=r"(arg));
    8000218c:	00080613          	mv	a2,a6
                __asm__ volatile("mv %0, a7" : "=r"(stack));
    80002190:	00088693          	mv	a3,a7
                *handle = TCB::createThread(handle, body,arg, stack);
    80002194:	00090513          	mv	a0,s2
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	850080e7          	jalr	-1968(ra) # 800019e8 <_ZN3TCB12createThreadEPPS_PFvPvES2_S2_>
    800021a0:	00a93023          	sd	a0,0(s2)
                __asm__ volatile("li t0, 0");
    800021a4:	00000293          	li	t0,0
                __asm__ volatile ("sw t0, 80(fp)");
    800021a8:	04542823          	sw	t0,80(s0)
                break;
    800021ac:	f9dff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                TCB::threadExit();
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	ab0080e7          	jalr	-1360(ra) # 80001c60 <_ZN3TCB10threadExitEv>
                break;
    800021b8:	f91ff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                TCB::yield();
    800021bc:	00000097          	auipc	ra,0x0
    800021c0:	a6c080e7          	jalr	-1428(ra) # 80001c28 <_ZN3TCB5yieldEv>
                break;
    800021c4:	f85ff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                __asm__ volatile("mv %0, a1" : "=r"(handle_join));
    800021c8:	00058513          	mv	a0,a1
                TCB::join(handle_join);
    800021cc:	00000097          	auipc	ra,0x0
    800021d0:	acc080e7          	jalr	-1332(ra) # 80001c98 <_ZN3TCB4joinEPS_>
                break;
    800021d4:	f75ff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
                 retval = __getc();
    800021d8:	00004097          	auipc	ra,0x4
    800021dc:	ea0080e7          	jalr	-352(ra) # 80006078 <__getc>
                __asm__ volatile ("mv t0, %0" : : "r"(retval));
    800021e0:	00050293          	mv	t0,a0
                __asm__ volatile("sw t0, 80(fp)");
    800021e4:	04542823          	sw	t0,80(s0)
                break;
    800021e8:	f61ff06f          	j	80002148 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
        printString("Cause: ");
    800021ec:	00005517          	auipc	a0,0x5
    800021f0:	e4450513          	addi	a0,a0,-444 # 80007030 <CONSOLE_STATUS+0x20>
    800021f4:	00001097          	auipc	ra,0x1
    800021f8:	39c080e7          	jalr	924(ra) # 80003590 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800021fc:	142027f3          	csrr	a5,scause
    80002200:	fcf43423          	sd	a5,-56(s0)
    return scause;
    80002204:	fc843503          	ld	a0,-56(s0)
        printInt(r_scause());
    80002208:	00000613          	li	a2,0
    8000220c:	00a00593          	li	a1,10
    80002210:	0005051b          	sext.w	a0,a0
    80002214:	00001097          	auipc	ra,0x1
    80002218:	52c080e7          	jalr	1324(ra) # 80003740 <_Z8printIntiii>
        printString("\nPC: ");
    8000221c:	00005517          	auipc	a0,0x5
    80002220:	e1c50513          	addi	a0,a0,-484 # 80007038 <CONSOLE_STATUS+0x28>
    80002224:	00001097          	auipc	ra,0x1
    80002228:	36c080e7          	jalr	876(ra) # 80003590 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000222c:	141027f3          	csrr	a5,sepc
    80002230:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    80002234:	fc043503          	ld	a0,-64(s0)
        printInt(r_sepc());
    80002238:	00000613          	li	a2,0
    8000223c:	00a00593          	li	a1,10
    80002240:	0005051b          	sext.w	a0,a0
    80002244:	00001097          	auipc	ra,0x1
    80002248:	4fc080e7          	jalr	1276(ra) # 80003740 <_Z8printIntiii>
        printString("\nTrapVal: ");
    8000224c:	00005517          	auipc	a0,0x5
    80002250:	df450513          	addi	a0,a0,-524 # 80007040 <CONSOLE_STATUS+0x30>
    80002254:	00001097          	auipc	ra,0x1
    80002258:	33c080e7          	jalr	828(ra) # 80003590 <_Z11printStringPKc>
    __asm__ volatile("csrr %[stval], stval" : [stval] "=r"(stval));
    8000225c:	143027f3          	csrr	a5,stval
    80002260:	faf43c23          	sd	a5,-72(s0)
    return stval;
    80002264:	fb843503          	ld	a0,-72(s0)
        printInt(r_stval());
    80002268:	00000613          	li	a2,0
    8000226c:	00a00593          	li	a1,10
    80002270:	0005051b          	sext.w	a0,a0
    80002274:	00001097          	auipc	ra,0x1
    80002278:	4cc080e7          	jalr	1228(ra) # 80003740 <_Z8printIntiii>
        while(1);
    8000227c:	0000006f          	j	8000227c <_ZN5Riscv20handleSupervisorTrapEv+0x1ec>

0000000080002280 <_ZN5Riscv21timerInterruptHandlerEv>:

void Riscv::timerInterruptHandler() {
    80002280:	ff010113          	addi	sp,sp,-16
    80002284:	00813423          	sd	s0,8(sp)
    80002288:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000228c:	00200793          	li	a5,2
    80002290:	1447b073          	csrc	sip,a5

        }
        mc_sip(SIP_SSIP);

     */
}
    80002294:	00813403          	ld	s0,8(sp)
    80002298:	01010113          	addi	sp,sp,16
    8000229c:	00008067          	ret

00000000800022a0 <_ZN5Riscv23consoleInterruptHandlerEv>:


void Riscv::consoleInterruptHandler() {
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00113423          	sd	ra,8(sp)
    800022a8:	00813023          	sd	s0,0(sp)
    800022ac:	01010413          	addi	s0,sp,16
    console_handler();
    800022b0:	00004097          	auipc	ra,0x4
    800022b4:	e00080e7          	jalr	-512(ra) # 800060b0 <console_handler>
    800022b8:	00813083          	ld	ra,8(sp)
    800022bc:	00013403          	ld	s0,0(sp)
    800022c0:	01010113          	addi	sp,sp,16
    800022c4:	00008067          	ret

00000000800022c8 <_ZN15MemoryAllocator11getInstanceEv>:
//size_t MemoryAllocator::NUMBER_OF_BLOCKS =
//size_t MemoryAllocator::NUMBER_OF_BLOCKS = 500;



void MemoryAllocator::getInstance() {
    800022c8:	ff010113          	addi	sp,sp,-16
    800022cc:	00813423          	sd	s0,8(sp)
    800022d0:	01010413          	addi	s0,sp,16
    MemoryAllocator::freeMemHead = (FragmentHeader *) ((char *) HEAP_START_ADDR);
    800022d4:	00006697          	auipc	a3,0x6
    800022d8:	30c6b683          	ld	a3,780(a3) # 800085e0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800022dc:	0006b783          	ld	a5,0(a3)
    800022e0:	00006717          	auipc	a4,0x6
    800022e4:	3a070713          	addi	a4,a4,928 # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    800022e8:	00f73023          	sd	a5,0(a4)
    freeMemHead->next = nullptr;
    800022ec:	0007b023          	sd	zero,0(a5)
    freeMemHead->size_in_blocks = ((size_t) HEAP_END_ADDR - (size_t) HEAP_START_ADDR) / 64;
    800022f0:	00006797          	auipc	a5,0x6
    800022f4:	3107b783          	ld	a5,784(a5) # 80008600 <_GLOBAL_OFFSET_TABLE_+0x28>
    800022f8:	0007b783          	ld	a5,0(a5)
    800022fc:	0006b683          	ld	a3,0(a3)
    80002300:	40d787b3          	sub	a5,a5,a3
    80002304:	00073683          	ld	a3,0(a4)
    80002308:	0067d793          	srli	a5,a5,0x6
    8000230c:	00f6b423          	sd	a5,8(a3)
    MemoryAllocator::allocatedMemHead = nullptr;
    80002310:	00073423          	sd	zero,8(a4)
}
    80002314:	00813403          	ld	s0,8(sp)
    80002318:	01010113          	addi	sp,sp,16
    8000231c:	00008067          	ret

0000000080002320 <_ZN15MemoryAllocator9mem_allocEm>:

void *MemoryAllocator::mem_alloc(size_t numOfBlocksToAlloc) {
    80002320:	fd010113          	addi	sp,sp,-48
    80002324:	02113423          	sd	ra,40(sp)
    80002328:	02813023          	sd	s0,32(sp)
    8000232c:	00913c23          	sd	s1,24(sp)
    80002330:	01213823          	sd	s2,16(sp)
    80002334:	01313423          	sd	s3,8(sp)
    80002338:	03010413          	addi	s0,sp,48
    8000233c:	00050913          	mv	s2,a0
//    printFree();

    FragmentHeader *fragment = freeMemHead, *prev = nullptr;
    80002340:	00006497          	auipc	s1,0x6
    80002344:	3404b483          	ld	s1,832(s1) # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    80002348:	00000993          	li	s3,0
    for (; fragment != nullptr; prev = fragment, fragment = fragment->next)
    8000234c:	00048c63          	beqz	s1,80002364 <_ZN15MemoryAllocator9mem_allocEm+0x44>
        if (fragment->size_in_blocks >= numOfBlocksToAlloc)
    80002350:	0084b783          	ld	a5,8(s1)
    80002354:	0127f863          	bgeu	a5,s2,80002364 <_ZN15MemoryAllocator9mem_allocEm+0x44>
    for (; fragment != nullptr; prev = fragment, fragment = fragment->next)
    80002358:	00048993          	mv	s3,s1
    8000235c:	0004b483          	ld	s1,0(s1)
    80002360:	fedff06f          	j	8000234c <_ZN15MemoryAllocator9mem_allocEm+0x2c>
            break;
    if (fragment == nullptr) {
    80002364:	06048e63          	beqz	s1,800023e0 <_ZN15MemoryAllocator9mem_allocEm+0xc0>
        printString("Memory allocator error: no free fragments!");
    }
    size_t remainingBlocks = fragment->size_in_blocks - numOfBlocksToAlloc;//minus jedan jer jedan blok rezervisemo za fragment header
    80002368:	0084b703          	ld	a4,8(s1)
    8000236c:	41270733          	sub	a4,a4,s2
//    printAllocated();
    if (remainingBlocks >= 2) {// minimalna velicina fragmenta su dva bloka
    80002370:	00100793          	li	a5,1
    80002374:	08e7f663          	bgeu	a5,a4,80002400 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
        // pravimo novi fragment od ostatka blokova
        fragment->size_in_blocks = numOfBlocksToAlloc;
    80002378:	0124b423          	sd	s2,8(s1)
        FragmentHeader *newFragment = (FragmentHeader *) ((char *) fragment +
                                                          (1 + numOfBlocksToAlloc) * MEM_BLOCK_SIZE);
    8000237c:	00190793          	addi	a5,s2,1
    80002380:	00679793          	slli	a5,a5,0x6
        FragmentHeader *newFragment = (FragmentHeader *) ((char *) fragment +
    80002384:	00f487b3          	add	a5,s1,a5
        if (prev) prev->next = newFragment;
    80002388:	06098663          	beqz	s3,800023f4 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    8000238c:	00f9b023          	sd	a5,0(s3)
        else freeMemHead = newFragment;
        newFragment->next = fragment->next;
    80002390:	0004b683          	ld	a3,0(s1)
    80002394:	00d7b023          	sd	a3,0(a5)
        newFragment->size_in_blocks = remainingBlocks-1;
    80002398:	fff70713          	addi	a4,a4,-1
    8000239c:	00e7b423          	sd	a4,8(a5)
    } else {
        //premalo blokova, spajaju se u jedan fragment
        if (prev) prev->next = fragment->next;
        else freeMemHead = fragment->next;
    }
    fragment->next = nullptr;
    800023a0:	0004b023          	sd	zero,0(s1)

    //dodavanje u listu alociranih
//    print_String("**********");
    FragmentHeader *last = allocatedMemHead;
    800023a4:	00006797          	auipc	a5,0x6
    800023a8:	2e47b783          	ld	a5,740(a5) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    if (allocatedMemHead == nullptr) {
    800023ac:	06078a63          	beqz	a5,80002420 <_ZN15MemoryAllocator9mem_allocEm+0x100>
        allocatedMemHead = fragment;

    } else {
        while (last->next) {
    800023b0:	00078713          	mv	a4,a5
    800023b4:	0007b783          	ld	a5,0(a5)
    800023b8:	fe079ce3          	bnez	a5,800023b0 <_ZN15MemoryAllocator9mem_allocEm+0x90>
//            printInteger((uint64)last);
            last = last->next;
        }

        last->next = fragment;
    800023bc:	00973023          	sd	s1,0(a4)
//    print_String("Allocated fragment:");
//    printInteger((uint64)fragment);
//    printAllocated();
//    printFree();
    return (void *)( (char*)fragment + sizeof(FragmentHeader));
}
    800023c0:	01048513          	addi	a0,s1,16
    800023c4:	02813083          	ld	ra,40(sp)
    800023c8:	02013403          	ld	s0,32(sp)
    800023cc:	01813483          	ld	s1,24(sp)
    800023d0:	01013903          	ld	s2,16(sp)
    800023d4:	00813983          	ld	s3,8(sp)
    800023d8:	03010113          	addi	sp,sp,48
    800023dc:	00008067          	ret
        printString("Memory allocator error: no free fragments!");
    800023e0:	00005517          	auipc	a0,0x5
    800023e4:	cc050513          	addi	a0,a0,-832 # 800070a0 <CONSOLE_STATUS+0x90>
    800023e8:	00001097          	auipc	ra,0x1
    800023ec:	1a8080e7          	jalr	424(ra) # 80003590 <_Z11printStringPKc>
    800023f0:	f79ff06f          	j	80002368 <_ZN15MemoryAllocator9mem_allocEm+0x48>
        else freeMemHead = newFragment;
    800023f4:	00006697          	auipc	a3,0x6
    800023f8:	28f6b623          	sd	a5,652(a3) # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    800023fc:	f95ff06f          	j	80002390 <_ZN15MemoryAllocator9mem_allocEm+0x70>
        if (prev) prev->next = fragment->next;
    80002400:	00098863          	beqz	s3,80002410 <_ZN15MemoryAllocator9mem_allocEm+0xf0>
    80002404:	0004b783          	ld	a5,0(s1)
    80002408:	00f9b023          	sd	a5,0(s3)
    8000240c:	f95ff06f          	j	800023a0 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        else freeMemHead = fragment->next;
    80002410:	0004b783          	ld	a5,0(s1)
    80002414:	00006717          	auipc	a4,0x6
    80002418:	26f73623          	sd	a5,620(a4) # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    8000241c:	f85ff06f          	j	800023a0 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        allocatedMemHead = fragment;
    80002420:	00006797          	auipc	a5,0x6
    80002424:	2697b423          	sd	s1,616(a5) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    80002428:	f99ff06f          	j	800023c0 <_ZN15MemoryAllocator9mem_allocEm+0xa0>

000000008000242c <_ZN15MemoryAllocator20getAllocatedFragmentEPc>:
//    printFree();

    return 0;
}

FragmentHeader* MemoryAllocator::getAllocatedFragment(char* addr){
    8000242c:	ff010113          	addi	sp,sp,-16
    80002430:	00813423          	sd	s0,8(sp)
    80002434:	01010413          	addi	s0,sp,16
    80002438:	00050713          	mv	a4,a0
    FragmentHeader* cur = allocatedMemHead;
    8000243c:	00006517          	auipc	a0,0x6
    80002440:	24c53503          	ld	a0,588(a0) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    while(cur){
    80002444:	00050a63          	beqz	a0,80002458 <_ZN15MemoryAllocator20getAllocatedFragmentEPc+0x2c>
        if((char*)cur == addr - sizeof(FragmentHeader)) {
    80002448:	ff070793          	addi	a5,a4,-16
    8000244c:	00a78663          	beq	a5,a0,80002458 <_ZN15MemoryAllocator20getAllocatedFragmentEPc+0x2c>
            return cur;
        }
        cur = cur->next;
    80002450:	00053503          	ld	a0,0(a0)
    while(cur){
    80002454:	ff1ff06f          	j	80002444 <_ZN15MemoryAllocator20getAllocatedFragmentEPc+0x18>
    }
    return nullptr;
}
    80002458:	00813403          	ld	s0,8(sp)
    8000245c:	01010113          	addi	sp,sp,16
    80002460:	00008067          	ret

0000000080002464 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc>:
//        cur = cur->next;
//    }
//    print_String("+++++++++++++++++++++");
//
//}
void MemoryAllocator::deleteAllocatedFragment(char* addr){
    80002464:	ff010113          	addi	sp,sp,-16
    80002468:	00813423          	sd	s0,8(sp)
    8000246c:	01010413          	addi	s0,sp,16
    if(allocatedMemHead == nullptr) return;
    80002470:	00006797          	auipc	a5,0x6
    80002474:	2187b783          	ld	a5,536(a5) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    80002478:	04078463          	beqz	a5,800024c0 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x5c>
    if(allocatedMemHead == (FragmentHeader*) addr) {
    8000247c:	00a78a63          	beq	a5,a0,80002490 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x2c>
        allocatedMemHead = allocatedMemHead->next;
    }
    FragmentHeader* temp = allocatedMemHead;
    80002480:	00006797          	auipc	a5,0x6
    80002484:	2087b783          	ld	a5,520(a5) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    FragmentHeader* prev = nullptr;
    80002488:	00000713          	li	a4,0
    8000248c:	0200006f          	j	800024ac <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x48>
        allocatedMemHead = allocatedMemHead->next;
    80002490:	0007b783          	ld	a5,0(a5)
    80002494:	00006717          	auipc	a4,0x6
    80002498:	1ef73a23          	sd	a5,500(a4) # 80008688 <_ZN15MemoryAllocator16allocatedMemHeadE>
    8000249c:	fe5ff06f          	j	80002480 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x1c>
    while(temp!=nullptr){
        if(temp==(FragmentHeader*)addr){
            prev->next = temp->next;
    800024a0:	0007b683          	ld	a3,0(a5)
    800024a4:	00d73023          	sd	a3,0(a4)
            temp = temp->next;
    800024a8:	0007b783          	ld	a5,0(a5)
    while(temp!=nullptr){
    800024ac:	00078a63          	beqz	a5,800024c0 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x5c>
        if(temp==(FragmentHeader*)addr){
    800024b0:	fea788e3          	beq	a5,a0,800024a0 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x3c>
        }else{
            prev = temp;
    800024b4:	00078713          	mv	a4,a5
            temp = temp->next;
    800024b8:	0007b783          	ld	a5,0(a5)
    800024bc:	ff1ff06f          	j	800024ac <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc+0x48>
        }
    }
    return;
}
    800024c0:	00813403          	ld	s0,8(sp)
    800024c4:	01010113          	addi	sp,sp,16
    800024c8:	00008067          	ret

00000000800024cc <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader>:


int MemoryAllocator::tryToJoin(FragmentHeader *cur) {
    if (!cur) return 0;
    800024cc:	06050863          	beqz	a0,8000253c <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader+0x70>
    if (cur->next && (char *) cur + (cur->size_in_blocks + 1)* MEM_BLOCK_SIZE == (char *) (cur->next)) {
    800024d0:	00053703          	ld	a4,0(a0)
    800024d4:	06070863          	beqz	a4,80002544 <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader+0x78>
    800024d8:	00853683          	ld	a3,8(a0)
    800024dc:	00168793          	addi	a5,a3,1
    800024e0:	00679793          	slli	a5,a5,0x6
    800024e4:	00f507b3          	add	a5,a0,a5
    800024e8:	00f70663          	beq	a4,a5,800024f4 <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader+0x28>
        cur->size_in_blocks += cur->next->size_in_blocks + 1;
        cur->next = cur->next->next;
        deleteAllocatedFragment((char*)cur->next);
        return 1;
    } else
        return 0;
    800024ec:	00000513          	li	a0,0
    800024f0:	00008067          	ret
int MemoryAllocator::tryToJoin(FragmentHeader *cur) {
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00113423          	sd	ra,8(sp)
    800024fc:	00813023          	sd	s0,0(sp)
    80002500:	01010413          	addi	s0,sp,16
        cur->size_in_blocks += cur->next->size_in_blocks + 1;
    80002504:	00873783          	ld	a5,8(a4)
    80002508:	00f686b3          	add	a3,a3,a5
    8000250c:	00168693          	addi	a3,a3,1
    80002510:	00d53423          	sd	a3,8(a0)
        cur->next = cur->next->next;
    80002514:	00073783          	ld	a5,0(a4)
    80002518:	00f53023          	sd	a5,0(a0)
        deleteAllocatedFragment((char*)cur->next);
    8000251c:	00078513          	mv	a0,a5
    80002520:	00000097          	auipc	ra,0x0
    80002524:	f44080e7          	jalr	-188(ra) # 80002464 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc>
        return 1;
    80002528:	00100513          	li	a0,1
    8000252c:	00813083          	ld	ra,8(sp)
    80002530:	00013403          	ld	s0,0(sp)
    80002534:	01010113          	addi	sp,sp,16
    80002538:	00008067          	ret
    if (!cur) return 0;
    8000253c:	00000513          	li	a0,0
    80002540:	00008067          	ret
        return 0;
    80002544:	00000513          	li	a0,0
    80002548:	00008067          	ret

000000008000254c <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *ptr) {
    8000254c:	fe010113          	addi	sp,sp,-32
    80002550:	00113c23          	sd	ra,24(sp)
    80002554:	00813823          	sd	s0,16(sp)
    80002558:	00913423          	sd	s1,8(sp)
    8000255c:	01213023          	sd	s2,0(sp)
    80002560:	02010413          	addi	s0,sp,32
    FragmentHeader* toFree = getAllocatedFragment((char*)ptr);
    80002564:	00000097          	auipc	ra,0x0
    80002568:	ec8080e7          	jalr	-312(ra) # 8000242c <_ZN15MemoryAllocator20getAllocatedFragmentEPc>
    8000256c:	00050493          	mv	s1,a0
    deleteAllocatedFragment((char*)toFree);
    80002570:	00000097          	auipc	ra,0x0
    80002574:	ef4080e7          	jalr	-268(ra) # 80002464 <_ZN15MemoryAllocator23deleteAllocatedFragmentEPc>
    if(!toFree){
    80002578:	02048a63          	beqz	s1,800025ac <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    if(!freeMemHead || (char*)toFree < (char*)freeMemHead)
    8000257c:	00006717          	auipc	a4,0x6
    80002580:	10473703          	ld	a4,260(a4) # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    80002584:	04070063          	beqz	a4,800025c4 <_ZN15MemoryAllocator8mem_freeEPv+0x78>
    80002588:	04e4e263          	bltu	s1,a4,800025cc <_ZN15MemoryAllocator8mem_freeEPv+0x80>
        for(cur = freeMemHead; cur->next != nullptr && (char*)toFree > (char*)(cur->next); cur = cur->next);
    8000258c:	00070793          	mv	a5,a4
    80002590:	00078913          	mv	s2,a5
    80002594:	0007b783          	ld	a5,0(a5)
    80002598:	00078463          	beqz	a5,800025a0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
    8000259c:	fe97eae3          	bltu	a5,s1,80002590 <_ZN15MemoryAllocator8mem_freeEPv+0x44>
    if(cur) toFree->next = cur->next;
    800025a0:	02090863          	beqz	s2,800025d0 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    800025a4:	00f4b023          	sd	a5,0(s1)
    800025a8:	02c0006f          	j	800025d4 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        printString("MemFree error : nije alociran segment sa tom adresom");
    800025ac:	00005517          	auipc	a0,0x5
    800025b0:	b2450513          	addi	a0,a0,-1244 # 800070d0 <CONSOLE_STATUS+0xc0>
    800025b4:	00001097          	auipc	ra,0x1
    800025b8:	fdc080e7          	jalr	-36(ra) # 80003590 <_Z11printStringPKc>
        return -1; // nije alociran segment sa tom adresom
    800025bc:	fff00513          	li	a0,-1
    800025c0:	0380006f          	j	800025f8 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
        cur = nullptr;
    800025c4:	00070913          	mv	s2,a4
    800025c8:	0080006f          	j	800025d0 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    800025cc:	00000913          	li	s2,0
    else toFree->next = freeMemHead;
    800025d0:	00e4b023          	sd	a4,0(s1)
    if(cur) cur->next = toFree;
    800025d4:	02090e63          	beqz	s2,80002610 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    800025d8:	00993023          	sd	s1,0(s2)
    tryToJoin(toFree);
    800025dc:	00048513          	mv	a0,s1
    800025e0:	00000097          	auipc	ra,0x0
    800025e4:	eec080e7          	jalr	-276(ra) # 800024cc <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader>
    tryToJoin(cur);
    800025e8:	00090513          	mv	a0,s2
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	ee0080e7          	jalr	-288(ra) # 800024cc <_ZN15MemoryAllocator9tryToJoinEP14FragmentHeader>
    return 0;
    800025f4:	00000513          	li	a0,0
}
    800025f8:	01813083          	ld	ra,24(sp)
    800025fc:	01013403          	ld	s0,16(sp)
    80002600:	00813483          	ld	s1,8(sp)
    80002604:	00013903          	ld	s2,0(sp)
    80002608:	02010113          	addi	sp,sp,32
    8000260c:	00008067          	ret
    else freeMemHead = toFree;
    80002610:	00006797          	auipc	a5,0x6
    80002614:	0697b823          	sd	s1,112(a5) # 80008680 <_ZN15MemoryAllocator11freeMemHeadE>
    80002618:	fc5ff06f          	j	800025dc <_ZN15MemoryAllocator8mem_freeEPv+0x90>

000000008000261c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000261c:	fe010113          	addi	sp,sp,-32
    80002620:	00113c23          	sd	ra,24(sp)
    80002624:	00813823          	sd	s0,16(sp)
    80002628:	00913423          	sd	s1,8(sp)
    8000262c:	01213023          	sd	s2,0(sp)
    80002630:	02010413          	addi	s0,sp,32
    80002634:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002638:	00100793          	li	a5,1
    8000263c:	02a7f863          	bgeu	a5,a0,8000266c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002640:	00a00793          	li	a5,10
    80002644:	02f577b3          	remu	a5,a0,a5
    80002648:	02078e63          	beqz	a5,80002684 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000264c:	fff48513          	addi	a0,s1,-1
    80002650:	00000097          	auipc	ra,0x0
    80002654:	fcc080e7          	jalr	-52(ra) # 8000261c <_ZL9fibonaccim>
    80002658:	00050913          	mv	s2,a0
    8000265c:	ffe48513          	addi	a0,s1,-2
    80002660:	00000097          	auipc	ra,0x0
    80002664:	fbc080e7          	jalr	-68(ra) # 8000261c <_ZL9fibonaccim>
    80002668:	00a90533          	add	a0,s2,a0
}
    8000266c:	01813083          	ld	ra,24(sp)
    80002670:	01013403          	ld	s0,16(sp)
    80002674:	00813483          	ld	s1,8(sp)
    80002678:	00013903          	ld	s2,0(sp)
    8000267c:	02010113          	addi	sp,sp,32
    80002680:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	048080e7          	jalr	72(ra) # 800016cc <_Z15thread_dispatchv>
    8000268c:	fc1ff06f          	j	8000264c <_ZL9fibonaccim+0x30>

0000000080002690 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002690:	fe010113          	addi	sp,sp,-32
    80002694:	00113c23          	sd	ra,24(sp)
    80002698:	00813823          	sd	s0,16(sp)
    8000269c:	00913423          	sd	s1,8(sp)
    800026a0:	01213023          	sd	s2,0(sp)
    800026a4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800026a8:	00000913          	li	s2,0
    800026ac:	0380006f          	j	800026e4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	01c080e7          	jalr	28(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800026b8:	00148493          	addi	s1,s1,1
    800026bc:	000027b7          	lui	a5,0x2
    800026c0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800026c4:	0097ee63          	bltu	a5,s1,800026e0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800026c8:	00000713          	li	a4,0
    800026cc:	000077b7          	lui	a5,0x7
    800026d0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800026d4:	fce7eee3          	bltu	a5,a4,800026b0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800026d8:	00170713          	addi	a4,a4,1
    800026dc:	ff1ff06f          	j	800026cc <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800026e0:	00190913          	addi	s2,s2,1
    800026e4:	00900793          	li	a5,9
    800026e8:	0527e063          	bltu	a5,s2,80002728 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800026ec:	00005517          	auipc	a0,0x5
    800026f0:	a1c50513          	addi	a0,a0,-1508 # 80007108 <CONSOLE_STATUS+0xf8>
    800026f4:	00001097          	auipc	ra,0x1
    800026f8:	e9c080e7          	jalr	-356(ra) # 80003590 <_Z11printStringPKc>
    800026fc:	00000613          	li	a2,0
    80002700:	00a00593          	li	a1,10
    80002704:	0009051b          	sext.w	a0,s2
    80002708:	00001097          	auipc	ra,0x1
    8000270c:	038080e7          	jalr	56(ra) # 80003740 <_Z8printIntiii>
    80002710:	00005517          	auipc	a0,0x5
    80002714:	91850513          	addi	a0,a0,-1768 # 80007028 <CONSOLE_STATUS+0x18>
    80002718:	00001097          	auipc	ra,0x1
    8000271c:	e78080e7          	jalr	-392(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002720:	00000493          	li	s1,0
    80002724:	f99ff06f          	j	800026bc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002728:	00005517          	auipc	a0,0x5
    8000272c:	9e850513          	addi	a0,a0,-1560 # 80007110 <CONSOLE_STATUS+0x100>
    80002730:	00001097          	auipc	ra,0x1
    80002734:	e60080e7          	jalr	-416(ra) # 80003590 <_Z11printStringPKc>
    finishedA = true;
    80002738:	00100793          	li	a5,1
    8000273c:	00006717          	auipc	a4,0x6
    80002740:	f4f70a23          	sb	a5,-172(a4) # 80008690 <_ZL9finishedA>
}
    80002744:	01813083          	ld	ra,24(sp)
    80002748:	01013403          	ld	s0,16(sp)
    8000274c:	00813483          	ld	s1,8(sp)
    80002750:	00013903          	ld	s2,0(sp)
    80002754:	02010113          	addi	sp,sp,32
    80002758:	00008067          	ret

000000008000275c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000275c:	fe010113          	addi	sp,sp,-32
    80002760:	00113c23          	sd	ra,24(sp)
    80002764:	00813823          	sd	s0,16(sp)
    80002768:	00913423          	sd	s1,8(sp)
    8000276c:	01213023          	sd	s2,0(sp)
    80002770:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002774:	00000913          	li	s2,0
    80002778:	0380006f          	j	800027b0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000277c:	fffff097          	auipc	ra,0xfffff
    80002780:	f50080e7          	jalr	-176(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002784:	00148493          	addi	s1,s1,1
    80002788:	000027b7          	lui	a5,0x2
    8000278c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002790:	0097ee63          	bltu	a5,s1,800027ac <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002794:	00000713          	li	a4,0
    80002798:	000077b7          	lui	a5,0x7
    8000279c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800027a0:	fce7eee3          	bltu	a5,a4,8000277c <_ZN7WorkerB11workerBodyBEPv+0x20>
    800027a4:	00170713          	addi	a4,a4,1
    800027a8:	ff1ff06f          	j	80002798 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800027ac:	00190913          	addi	s2,s2,1
    800027b0:	00f00793          	li	a5,15
    800027b4:	0527e063          	bltu	a5,s2,800027f4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800027b8:	00005517          	auipc	a0,0x5
    800027bc:	96850513          	addi	a0,a0,-1688 # 80007120 <CONSOLE_STATUS+0x110>
    800027c0:	00001097          	auipc	ra,0x1
    800027c4:	dd0080e7          	jalr	-560(ra) # 80003590 <_Z11printStringPKc>
    800027c8:	00000613          	li	a2,0
    800027cc:	00a00593          	li	a1,10
    800027d0:	0009051b          	sext.w	a0,s2
    800027d4:	00001097          	auipc	ra,0x1
    800027d8:	f6c080e7          	jalr	-148(ra) # 80003740 <_Z8printIntiii>
    800027dc:	00005517          	auipc	a0,0x5
    800027e0:	84c50513          	addi	a0,a0,-1972 # 80007028 <CONSOLE_STATUS+0x18>
    800027e4:	00001097          	auipc	ra,0x1
    800027e8:	dac080e7          	jalr	-596(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800027ec:	00000493          	li	s1,0
    800027f0:	f99ff06f          	j	80002788 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800027f4:	00005517          	auipc	a0,0x5
    800027f8:	93450513          	addi	a0,a0,-1740 # 80007128 <CONSOLE_STATUS+0x118>
    800027fc:	00001097          	auipc	ra,0x1
    80002800:	d94080e7          	jalr	-620(ra) # 80003590 <_Z11printStringPKc>
    finishedB = true;
    80002804:	00100793          	li	a5,1
    80002808:	00006717          	auipc	a4,0x6
    8000280c:	e8f704a3          	sb	a5,-375(a4) # 80008691 <_ZL9finishedB>
    thread_dispatch();
    80002810:	fffff097          	auipc	ra,0xfffff
    80002814:	ebc080e7          	jalr	-324(ra) # 800016cc <_Z15thread_dispatchv>
}
    80002818:	01813083          	ld	ra,24(sp)
    8000281c:	01013403          	ld	s0,16(sp)
    80002820:	00813483          	ld	s1,8(sp)
    80002824:	00013903          	ld	s2,0(sp)
    80002828:	02010113          	addi	sp,sp,32
    8000282c:	00008067          	ret

0000000080002830 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002830:	fe010113          	addi	sp,sp,-32
    80002834:	00113c23          	sd	ra,24(sp)
    80002838:	00813823          	sd	s0,16(sp)
    8000283c:	00913423          	sd	s1,8(sp)
    80002840:	01213023          	sd	s2,0(sp)
    80002844:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002848:	00000493          	li	s1,0
    8000284c:	0400006f          	j	8000288c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002850:	00005517          	auipc	a0,0x5
    80002854:	8e850513          	addi	a0,a0,-1816 # 80007138 <CONSOLE_STATUS+0x128>
    80002858:	00001097          	auipc	ra,0x1
    8000285c:	d38080e7          	jalr	-712(ra) # 80003590 <_Z11printStringPKc>
    80002860:	00000613          	li	a2,0
    80002864:	00a00593          	li	a1,10
    80002868:	00048513          	mv	a0,s1
    8000286c:	00001097          	auipc	ra,0x1
    80002870:	ed4080e7          	jalr	-300(ra) # 80003740 <_Z8printIntiii>
    80002874:	00004517          	auipc	a0,0x4
    80002878:	7b450513          	addi	a0,a0,1972 # 80007028 <CONSOLE_STATUS+0x18>
    8000287c:	00001097          	auipc	ra,0x1
    80002880:	d14080e7          	jalr	-748(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002884:	0014849b          	addiw	s1,s1,1
    80002888:	0ff4f493          	andi	s1,s1,255
    8000288c:	00200793          	li	a5,2
    80002890:	fc97f0e3          	bgeu	a5,s1,80002850 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002894:	00005517          	auipc	a0,0x5
    80002898:	8ac50513          	addi	a0,a0,-1876 # 80007140 <CONSOLE_STATUS+0x130>
    8000289c:	00001097          	auipc	ra,0x1
    800028a0:	cf4080e7          	jalr	-780(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800028a4:	00700313          	li	t1,7
    thread_dispatch();
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	e24080e7          	jalr	-476(ra) # 800016cc <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800028b0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800028b4:	00005517          	auipc	a0,0x5
    800028b8:	89c50513          	addi	a0,a0,-1892 # 80007150 <CONSOLE_STATUS+0x140>
    800028bc:	00001097          	auipc	ra,0x1
    800028c0:	cd4080e7          	jalr	-812(ra) # 80003590 <_Z11printStringPKc>
    800028c4:	00000613          	li	a2,0
    800028c8:	00a00593          	li	a1,10
    800028cc:	0009051b          	sext.w	a0,s2
    800028d0:	00001097          	auipc	ra,0x1
    800028d4:	e70080e7          	jalr	-400(ra) # 80003740 <_Z8printIntiii>
    800028d8:	00004517          	auipc	a0,0x4
    800028dc:	75050513          	addi	a0,a0,1872 # 80007028 <CONSOLE_STATUS+0x18>
    800028e0:	00001097          	auipc	ra,0x1
    800028e4:	cb0080e7          	jalr	-848(ra) # 80003590 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800028e8:	00c00513          	li	a0,12
    800028ec:	00000097          	auipc	ra,0x0
    800028f0:	d30080e7          	jalr	-720(ra) # 8000261c <_ZL9fibonaccim>
    800028f4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800028f8:	00005517          	auipc	a0,0x5
    800028fc:	86050513          	addi	a0,a0,-1952 # 80007158 <CONSOLE_STATUS+0x148>
    80002900:	00001097          	auipc	ra,0x1
    80002904:	c90080e7          	jalr	-880(ra) # 80003590 <_Z11printStringPKc>
    80002908:	00000613          	li	a2,0
    8000290c:	00a00593          	li	a1,10
    80002910:	0009051b          	sext.w	a0,s2
    80002914:	00001097          	auipc	ra,0x1
    80002918:	e2c080e7          	jalr	-468(ra) # 80003740 <_Z8printIntiii>
    8000291c:	00004517          	auipc	a0,0x4
    80002920:	70c50513          	addi	a0,a0,1804 # 80007028 <CONSOLE_STATUS+0x18>
    80002924:	00001097          	auipc	ra,0x1
    80002928:	c6c080e7          	jalr	-916(ra) # 80003590 <_Z11printStringPKc>
    8000292c:	0400006f          	j	8000296c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002930:	00005517          	auipc	a0,0x5
    80002934:	80850513          	addi	a0,a0,-2040 # 80007138 <CONSOLE_STATUS+0x128>
    80002938:	00001097          	auipc	ra,0x1
    8000293c:	c58080e7          	jalr	-936(ra) # 80003590 <_Z11printStringPKc>
    80002940:	00000613          	li	a2,0
    80002944:	00a00593          	li	a1,10
    80002948:	00048513          	mv	a0,s1
    8000294c:	00001097          	auipc	ra,0x1
    80002950:	df4080e7          	jalr	-524(ra) # 80003740 <_Z8printIntiii>
    80002954:	00004517          	auipc	a0,0x4
    80002958:	6d450513          	addi	a0,a0,1748 # 80007028 <CONSOLE_STATUS+0x18>
    8000295c:	00001097          	auipc	ra,0x1
    80002960:	c34080e7          	jalr	-972(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002964:	0014849b          	addiw	s1,s1,1
    80002968:	0ff4f493          	andi	s1,s1,255
    8000296c:	00500793          	li	a5,5
    80002970:	fc97f0e3          	bgeu	a5,s1,80002930 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80002974:	00004517          	auipc	a0,0x4
    80002978:	79c50513          	addi	a0,a0,1948 # 80007110 <CONSOLE_STATUS+0x100>
    8000297c:	00001097          	auipc	ra,0x1
    80002980:	c14080e7          	jalr	-1004(ra) # 80003590 <_Z11printStringPKc>
    finishedC = true;
    80002984:	00100793          	li	a5,1
    80002988:	00006717          	auipc	a4,0x6
    8000298c:	d0f70523          	sb	a5,-758(a4) # 80008692 <_ZL9finishedC>
    thread_dispatch();
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	d3c080e7          	jalr	-708(ra) # 800016cc <_Z15thread_dispatchv>
}
    80002998:	01813083          	ld	ra,24(sp)
    8000299c:	01013403          	ld	s0,16(sp)
    800029a0:	00813483          	ld	s1,8(sp)
    800029a4:	00013903          	ld	s2,0(sp)
    800029a8:	02010113          	addi	sp,sp,32
    800029ac:	00008067          	ret

00000000800029b0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800029b0:	fe010113          	addi	sp,sp,-32
    800029b4:	00113c23          	sd	ra,24(sp)
    800029b8:	00813823          	sd	s0,16(sp)
    800029bc:	00913423          	sd	s1,8(sp)
    800029c0:	01213023          	sd	s2,0(sp)
    800029c4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800029c8:	00a00493          	li	s1,10
    800029cc:	0400006f          	j	80002a0c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800029d0:	00004517          	auipc	a0,0x4
    800029d4:	79850513          	addi	a0,a0,1944 # 80007168 <CONSOLE_STATUS+0x158>
    800029d8:	00001097          	auipc	ra,0x1
    800029dc:	bb8080e7          	jalr	-1096(ra) # 80003590 <_Z11printStringPKc>
    800029e0:	00000613          	li	a2,0
    800029e4:	00a00593          	li	a1,10
    800029e8:	00048513          	mv	a0,s1
    800029ec:	00001097          	auipc	ra,0x1
    800029f0:	d54080e7          	jalr	-684(ra) # 80003740 <_Z8printIntiii>
    800029f4:	00004517          	auipc	a0,0x4
    800029f8:	63450513          	addi	a0,a0,1588 # 80007028 <CONSOLE_STATUS+0x18>
    800029fc:	00001097          	auipc	ra,0x1
    80002a00:	b94080e7          	jalr	-1132(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002a04:	0014849b          	addiw	s1,s1,1
    80002a08:	0ff4f493          	andi	s1,s1,255
    80002a0c:	00c00793          	li	a5,12
    80002a10:	fc97f0e3          	bgeu	a5,s1,800029d0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80002a14:	00004517          	auipc	a0,0x4
    80002a18:	75c50513          	addi	a0,a0,1884 # 80007170 <CONSOLE_STATUS+0x160>
    80002a1c:	00001097          	auipc	ra,0x1
    80002a20:	b74080e7          	jalr	-1164(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002a24:	00500313          	li	t1,5
    thread_dispatch();
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	ca4080e7          	jalr	-860(ra) # 800016cc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002a30:	01000513          	li	a0,16
    80002a34:	00000097          	auipc	ra,0x0
    80002a38:	be8080e7          	jalr	-1048(ra) # 8000261c <_ZL9fibonaccim>
    80002a3c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002a40:	00004517          	auipc	a0,0x4
    80002a44:	74050513          	addi	a0,a0,1856 # 80007180 <CONSOLE_STATUS+0x170>
    80002a48:	00001097          	auipc	ra,0x1
    80002a4c:	b48080e7          	jalr	-1208(ra) # 80003590 <_Z11printStringPKc>
    80002a50:	00000613          	li	a2,0
    80002a54:	00a00593          	li	a1,10
    80002a58:	0009051b          	sext.w	a0,s2
    80002a5c:	00001097          	auipc	ra,0x1
    80002a60:	ce4080e7          	jalr	-796(ra) # 80003740 <_Z8printIntiii>
    80002a64:	00004517          	auipc	a0,0x4
    80002a68:	5c450513          	addi	a0,a0,1476 # 80007028 <CONSOLE_STATUS+0x18>
    80002a6c:	00001097          	auipc	ra,0x1
    80002a70:	b24080e7          	jalr	-1244(ra) # 80003590 <_Z11printStringPKc>
    80002a74:	0400006f          	j	80002ab4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002a78:	00004517          	auipc	a0,0x4
    80002a7c:	6f050513          	addi	a0,a0,1776 # 80007168 <CONSOLE_STATUS+0x158>
    80002a80:	00001097          	auipc	ra,0x1
    80002a84:	b10080e7          	jalr	-1264(ra) # 80003590 <_Z11printStringPKc>
    80002a88:	00000613          	li	a2,0
    80002a8c:	00a00593          	li	a1,10
    80002a90:	00048513          	mv	a0,s1
    80002a94:	00001097          	auipc	ra,0x1
    80002a98:	cac080e7          	jalr	-852(ra) # 80003740 <_Z8printIntiii>
    80002a9c:	00004517          	auipc	a0,0x4
    80002aa0:	58c50513          	addi	a0,a0,1420 # 80007028 <CONSOLE_STATUS+0x18>
    80002aa4:	00001097          	auipc	ra,0x1
    80002aa8:	aec080e7          	jalr	-1300(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002aac:	0014849b          	addiw	s1,s1,1
    80002ab0:	0ff4f493          	andi	s1,s1,255
    80002ab4:	00f00793          	li	a5,15
    80002ab8:	fc97f0e3          	bgeu	a5,s1,80002a78 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002abc:	00004517          	auipc	a0,0x4
    80002ac0:	6d450513          	addi	a0,a0,1748 # 80007190 <CONSOLE_STATUS+0x180>
    80002ac4:	00001097          	auipc	ra,0x1
    80002ac8:	acc080e7          	jalr	-1332(ra) # 80003590 <_Z11printStringPKc>
    finishedD = true;
    80002acc:	00100793          	li	a5,1
    80002ad0:	00006717          	auipc	a4,0x6
    80002ad4:	bcf701a3          	sb	a5,-1085(a4) # 80008693 <_ZL9finishedD>
    thread_dispatch();
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	bf4080e7          	jalr	-1036(ra) # 800016cc <_Z15thread_dispatchv>
}
    80002ae0:	01813083          	ld	ra,24(sp)
    80002ae4:	01013403          	ld	s0,16(sp)
    80002ae8:	00813483          	ld	s1,8(sp)
    80002aec:	00013903          	ld	s2,0(sp)
    80002af0:	02010113          	addi	sp,sp,32
    80002af4:	00008067          	ret

0000000080002af8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80002af8:	fc010113          	addi	sp,sp,-64
    80002afc:	02113c23          	sd	ra,56(sp)
    80002b00:	02813823          	sd	s0,48(sp)
    80002b04:	02913423          	sd	s1,40(sp)
    80002b08:	03213023          	sd	s2,32(sp)
    80002b0c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80002b10:	02000513          	li	a0,32
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	37c080e7          	jalr	892(ra) # 80001e90 <_Znwm>
    80002b1c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	464080e7          	jalr	1124(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80002b28:	00006797          	auipc	a5,0x6
    80002b2c:	a0878793          	addi	a5,a5,-1528 # 80008530 <_ZTV7WorkerA+0x10>
    80002b30:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80002b34:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80002b38:	00004517          	auipc	a0,0x4
    80002b3c:	66850513          	addi	a0,a0,1640 # 800071a0 <CONSOLE_STATUS+0x190>
    80002b40:	00001097          	auipc	ra,0x1
    80002b44:	a50080e7          	jalr	-1456(ra) # 80003590 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002b48:	02000513          	li	a0,32
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	344080e7          	jalr	836(ra) # 80001e90 <_Znwm>
    80002b54:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	42c080e7          	jalr	1068(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80002b60:	00006797          	auipc	a5,0x6
    80002b64:	9f878793          	addi	a5,a5,-1544 # 80008558 <_ZTV7WorkerB+0x10>
    80002b68:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80002b6c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80002b70:	00004517          	auipc	a0,0x4
    80002b74:	64850513          	addi	a0,a0,1608 # 800071b8 <CONSOLE_STATUS+0x1a8>
    80002b78:	00001097          	auipc	ra,0x1
    80002b7c:	a18080e7          	jalr	-1512(ra) # 80003590 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80002b80:	02000513          	li	a0,32
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	30c080e7          	jalr	780(ra) # 80001e90 <_Znwm>
    80002b8c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80002b90:	fffff097          	auipc	ra,0xfffff
    80002b94:	3f4080e7          	jalr	1012(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80002b98:	00006797          	auipc	a5,0x6
    80002b9c:	9e878793          	addi	a5,a5,-1560 # 80008580 <_ZTV7WorkerC+0x10>
    80002ba0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80002ba4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80002ba8:	00004517          	auipc	a0,0x4
    80002bac:	62850513          	addi	a0,a0,1576 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80002bb0:	00001097          	auipc	ra,0x1
    80002bb4:	9e0080e7          	jalr	-1568(ra) # 80003590 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002bb8:	02000513          	li	a0,32
    80002bbc:	fffff097          	auipc	ra,0xfffff
    80002bc0:	2d4080e7          	jalr	724(ra) # 80001e90 <_Znwm>
    80002bc4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	3bc080e7          	jalr	956(ra) # 80001f84 <_ZN6ThreadC1Ev>
    80002bd0:	00006797          	auipc	a5,0x6
    80002bd4:	9d878793          	addi	a5,a5,-1576 # 800085a8 <_ZTV7WorkerD+0x10>
    80002bd8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002bdc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002be0:	00004517          	auipc	a0,0x4
    80002be4:	60850513          	addi	a0,a0,1544 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80002be8:	00001097          	auipc	ra,0x1
    80002bec:	9a8080e7          	jalr	-1624(ra) # 80003590 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002bf0:	00000493          	li	s1,0
    80002bf4:	00300793          	li	a5,3
    80002bf8:	0297c663          	blt	a5,s1,80002c24 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002bfc:	00349793          	slli	a5,s1,0x3
    80002c00:	fe040713          	addi	a4,s0,-32
    80002c04:	00f707b3          	add	a5,a4,a5
    80002c08:	fe07b503          	ld	a0,-32(a5)
    80002c0c:	fffff097          	auipc	ra,0xfffff
    80002c10:	3a4080e7          	jalr	932(ra) # 80001fb0 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80002c14:	0014849b          	addiw	s1,s1,1
    80002c18:	fddff06f          	j	80002bf4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002c1c:	fffff097          	auipc	ra,0xfffff
    80002c20:	3f8080e7          	jalr	1016(ra) # 80002014 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002c24:	00006797          	auipc	a5,0x6
    80002c28:	a6c7c783          	lbu	a5,-1428(a5) # 80008690 <_ZL9finishedA>
    80002c2c:	fe0788e3          	beqz	a5,80002c1c <_Z20Threads_CPP_API_testv+0x124>
    80002c30:	00006797          	auipc	a5,0x6
    80002c34:	a617c783          	lbu	a5,-1439(a5) # 80008691 <_ZL9finishedB>
    80002c38:	fe0782e3          	beqz	a5,80002c1c <_Z20Threads_CPP_API_testv+0x124>
    80002c3c:	00006797          	auipc	a5,0x6
    80002c40:	a567c783          	lbu	a5,-1450(a5) # 80008692 <_ZL9finishedC>
    80002c44:	fc078ce3          	beqz	a5,80002c1c <_Z20Threads_CPP_API_testv+0x124>
    80002c48:	00006797          	auipc	a5,0x6
    80002c4c:	a4b7c783          	lbu	a5,-1461(a5) # 80008693 <_ZL9finishedD>
    80002c50:	fc0786e3          	beqz	a5,80002c1c <_Z20Threads_CPP_API_testv+0x124>
    80002c54:	fc040493          	addi	s1,s0,-64
    80002c58:	0080006f          	j	80002c60 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80002c5c:	00848493          	addi	s1,s1,8
    80002c60:	fe040793          	addi	a5,s0,-32
    80002c64:	08f48663          	beq	s1,a5,80002cf0 <_Z20Threads_CPP_API_testv+0x1f8>
    80002c68:	0004b503          	ld	a0,0(s1)
    80002c6c:	fe0508e3          	beqz	a0,80002c5c <_Z20Threads_CPP_API_testv+0x164>
    80002c70:	00053783          	ld	a5,0(a0)
    80002c74:	0087b783          	ld	a5,8(a5)
    80002c78:	000780e7          	jalr	a5
    80002c7c:	fe1ff06f          	j	80002c5c <_Z20Threads_CPP_API_testv+0x164>
    80002c80:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80002c84:	00048513          	mv	a0,s1
    80002c88:	fffff097          	auipc	ra,0xfffff
    80002c8c:	230080e7          	jalr	560(ra) # 80001eb8 <_ZdlPv>
    80002c90:	00090513          	mv	a0,s2
    80002c94:	00007097          	auipc	ra,0x7
    80002c98:	ae4080e7          	jalr	-1308(ra) # 80009778 <_Unwind_Resume>
    80002c9c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002ca0:	00048513          	mv	a0,s1
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	214080e7          	jalr	532(ra) # 80001eb8 <_ZdlPv>
    80002cac:	00090513          	mv	a0,s2
    80002cb0:	00007097          	auipc	ra,0x7
    80002cb4:	ac8080e7          	jalr	-1336(ra) # 80009778 <_Unwind_Resume>
    80002cb8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002cbc:	00048513          	mv	a0,s1
    80002cc0:	fffff097          	auipc	ra,0xfffff
    80002cc4:	1f8080e7          	jalr	504(ra) # 80001eb8 <_ZdlPv>
    80002cc8:	00090513          	mv	a0,s2
    80002ccc:	00007097          	auipc	ra,0x7
    80002cd0:	aac080e7          	jalr	-1364(ra) # 80009778 <_Unwind_Resume>
    80002cd4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002cd8:	00048513          	mv	a0,s1
    80002cdc:	fffff097          	auipc	ra,0xfffff
    80002ce0:	1dc080e7          	jalr	476(ra) # 80001eb8 <_ZdlPv>
    80002ce4:	00090513          	mv	a0,s2
    80002ce8:	00007097          	auipc	ra,0x7
    80002cec:	a90080e7          	jalr	-1392(ra) # 80009778 <_Unwind_Resume>
}
    80002cf0:	03813083          	ld	ra,56(sp)
    80002cf4:	03013403          	ld	s0,48(sp)
    80002cf8:	02813483          	ld	s1,40(sp)
    80002cfc:	02013903          	ld	s2,32(sp)
    80002d00:	04010113          	addi	sp,sp,64
    80002d04:	00008067          	ret

0000000080002d08 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80002d08:	ff010113          	addi	sp,sp,-16
    80002d0c:	00113423          	sd	ra,8(sp)
    80002d10:	00813023          	sd	s0,0(sp)
    80002d14:	01010413          	addi	s0,sp,16
    80002d18:	00006797          	auipc	a5,0x6
    80002d1c:	81878793          	addi	a5,a5,-2024 # 80008530 <_ZTV7WorkerA+0x10>
    80002d20:	00f53023          	sd	a5,0(a0)
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	114080e7          	jalr	276(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002d2c:	00813083          	ld	ra,8(sp)
    80002d30:	00013403          	ld	s0,0(sp)
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00008067          	ret

0000000080002d3c <_ZN7WorkerAD0Ev>:
    80002d3c:	fe010113          	addi	sp,sp,-32
    80002d40:	00113c23          	sd	ra,24(sp)
    80002d44:	00813823          	sd	s0,16(sp)
    80002d48:	00913423          	sd	s1,8(sp)
    80002d4c:	02010413          	addi	s0,sp,32
    80002d50:	00050493          	mv	s1,a0
    80002d54:	00005797          	auipc	a5,0x5
    80002d58:	7dc78793          	addi	a5,a5,2012 # 80008530 <_ZTV7WorkerA+0x10>
    80002d5c:	00f53023          	sd	a5,0(a0)
    80002d60:	fffff097          	auipc	ra,0xfffff
    80002d64:	0d8080e7          	jalr	216(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002d68:	00048513          	mv	a0,s1
    80002d6c:	fffff097          	auipc	ra,0xfffff
    80002d70:	14c080e7          	jalr	332(ra) # 80001eb8 <_ZdlPv>
    80002d74:	01813083          	ld	ra,24(sp)
    80002d78:	01013403          	ld	s0,16(sp)
    80002d7c:	00813483          	ld	s1,8(sp)
    80002d80:	02010113          	addi	sp,sp,32
    80002d84:	00008067          	ret

0000000080002d88 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002d88:	ff010113          	addi	sp,sp,-16
    80002d8c:	00113423          	sd	ra,8(sp)
    80002d90:	00813023          	sd	s0,0(sp)
    80002d94:	01010413          	addi	s0,sp,16
    80002d98:	00005797          	auipc	a5,0x5
    80002d9c:	7c078793          	addi	a5,a5,1984 # 80008558 <_ZTV7WorkerB+0x10>
    80002da0:	00f53023          	sd	a5,0(a0)
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	094080e7          	jalr	148(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002dac:	00813083          	ld	ra,8(sp)
    80002db0:	00013403          	ld	s0,0(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <_ZN7WorkerBD0Ev>:
    80002dbc:	fe010113          	addi	sp,sp,-32
    80002dc0:	00113c23          	sd	ra,24(sp)
    80002dc4:	00813823          	sd	s0,16(sp)
    80002dc8:	00913423          	sd	s1,8(sp)
    80002dcc:	02010413          	addi	s0,sp,32
    80002dd0:	00050493          	mv	s1,a0
    80002dd4:	00005797          	auipc	a5,0x5
    80002dd8:	78478793          	addi	a5,a5,1924 # 80008558 <_ZTV7WorkerB+0x10>
    80002ddc:	00f53023          	sd	a5,0(a0)
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	058080e7          	jalr	88(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002de8:	00048513          	mv	a0,s1
    80002dec:	fffff097          	auipc	ra,0xfffff
    80002df0:	0cc080e7          	jalr	204(ra) # 80001eb8 <_ZdlPv>
    80002df4:	01813083          	ld	ra,24(sp)
    80002df8:	01013403          	ld	s0,16(sp)
    80002dfc:	00813483          	ld	s1,8(sp)
    80002e00:	02010113          	addi	sp,sp,32
    80002e04:	00008067          	ret

0000000080002e08 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80002e08:	ff010113          	addi	sp,sp,-16
    80002e0c:	00113423          	sd	ra,8(sp)
    80002e10:	00813023          	sd	s0,0(sp)
    80002e14:	01010413          	addi	s0,sp,16
    80002e18:	00005797          	auipc	a5,0x5
    80002e1c:	76878793          	addi	a5,a5,1896 # 80008580 <_ZTV7WorkerC+0x10>
    80002e20:	00f53023          	sd	a5,0(a0)
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	014080e7          	jalr	20(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002e2c:	00813083          	ld	ra,8(sp)
    80002e30:	00013403          	ld	s0,0(sp)
    80002e34:	01010113          	addi	sp,sp,16
    80002e38:	00008067          	ret

0000000080002e3c <_ZN7WorkerCD0Ev>:
    80002e3c:	fe010113          	addi	sp,sp,-32
    80002e40:	00113c23          	sd	ra,24(sp)
    80002e44:	00813823          	sd	s0,16(sp)
    80002e48:	00913423          	sd	s1,8(sp)
    80002e4c:	02010413          	addi	s0,sp,32
    80002e50:	00050493          	mv	s1,a0
    80002e54:	00005797          	auipc	a5,0x5
    80002e58:	72c78793          	addi	a5,a5,1836 # 80008580 <_ZTV7WorkerC+0x10>
    80002e5c:	00f53023          	sd	a5,0(a0)
    80002e60:	fffff097          	auipc	ra,0xfffff
    80002e64:	fd8080e7          	jalr	-40(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002e68:	00048513          	mv	a0,s1
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	04c080e7          	jalr	76(ra) # 80001eb8 <_ZdlPv>
    80002e74:	01813083          	ld	ra,24(sp)
    80002e78:	01013403          	ld	s0,16(sp)
    80002e7c:	00813483          	ld	s1,8(sp)
    80002e80:	02010113          	addi	sp,sp,32
    80002e84:	00008067          	ret

0000000080002e88 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002e88:	ff010113          	addi	sp,sp,-16
    80002e8c:	00113423          	sd	ra,8(sp)
    80002e90:	00813023          	sd	s0,0(sp)
    80002e94:	01010413          	addi	s0,sp,16
    80002e98:	00005797          	auipc	a5,0x5
    80002e9c:	71078793          	addi	a5,a5,1808 # 800085a8 <_ZTV7WorkerD+0x10>
    80002ea0:	00f53023          	sd	a5,0(a0)
    80002ea4:	fffff097          	auipc	ra,0xfffff
    80002ea8:	f94080e7          	jalr	-108(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002eac:	00813083          	ld	ra,8(sp)
    80002eb0:	00013403          	ld	s0,0(sp)
    80002eb4:	01010113          	addi	sp,sp,16
    80002eb8:	00008067          	ret

0000000080002ebc <_ZN7WorkerDD0Ev>:
    80002ebc:	fe010113          	addi	sp,sp,-32
    80002ec0:	00113c23          	sd	ra,24(sp)
    80002ec4:	00813823          	sd	s0,16(sp)
    80002ec8:	00913423          	sd	s1,8(sp)
    80002ecc:	02010413          	addi	s0,sp,32
    80002ed0:	00050493          	mv	s1,a0
    80002ed4:	00005797          	auipc	a5,0x5
    80002ed8:	6d478793          	addi	a5,a5,1748 # 800085a8 <_ZTV7WorkerD+0x10>
    80002edc:	00f53023          	sd	a5,0(a0)
    80002ee0:	fffff097          	auipc	ra,0xfffff
    80002ee4:	f58080e7          	jalr	-168(ra) # 80001e38 <_ZN6ThreadD1Ev>
    80002ee8:	00048513          	mv	a0,s1
    80002eec:	fffff097          	auipc	ra,0xfffff
    80002ef0:	fcc080e7          	jalr	-52(ra) # 80001eb8 <_ZdlPv>
    80002ef4:	01813083          	ld	ra,24(sp)
    80002ef8:	01013403          	ld	s0,16(sp)
    80002efc:	00813483          	ld	s1,8(sp)
    80002f00:	02010113          	addi	sp,sp,32
    80002f04:	00008067          	ret

0000000080002f08 <_ZN7WorkerA3runEv>:
    void run() override {
    80002f08:	ff010113          	addi	sp,sp,-16
    80002f0c:	00113423          	sd	ra,8(sp)
    80002f10:	00813023          	sd	s0,0(sp)
    80002f14:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80002f18:	00000593          	li	a1,0
    80002f1c:	fffff097          	auipc	ra,0xfffff
    80002f20:	774080e7          	jalr	1908(ra) # 80002690 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002f24:	00813083          	ld	ra,8(sp)
    80002f28:	00013403          	ld	s0,0(sp)
    80002f2c:	01010113          	addi	sp,sp,16
    80002f30:	00008067          	ret

0000000080002f34 <_ZN7WorkerB3runEv>:
    void run() override {
    80002f34:	ff010113          	addi	sp,sp,-16
    80002f38:	00113423          	sd	ra,8(sp)
    80002f3c:	00813023          	sd	s0,0(sp)
    80002f40:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80002f44:	00000593          	li	a1,0
    80002f48:	00000097          	auipc	ra,0x0
    80002f4c:	814080e7          	jalr	-2028(ra) # 8000275c <_ZN7WorkerB11workerBodyBEPv>
    }
    80002f50:	00813083          	ld	ra,8(sp)
    80002f54:	00013403          	ld	s0,0(sp)
    80002f58:	01010113          	addi	sp,sp,16
    80002f5c:	00008067          	ret

0000000080002f60 <_ZN7WorkerC3runEv>:
    void run() override {
    80002f60:	ff010113          	addi	sp,sp,-16
    80002f64:	00113423          	sd	ra,8(sp)
    80002f68:	00813023          	sd	s0,0(sp)
    80002f6c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002f70:	00000593          	li	a1,0
    80002f74:	00000097          	auipc	ra,0x0
    80002f78:	8bc080e7          	jalr	-1860(ra) # 80002830 <_ZN7WorkerC11workerBodyCEPv>
    }
    80002f7c:	00813083          	ld	ra,8(sp)
    80002f80:	00013403          	ld	s0,0(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret

0000000080002f8c <_ZN7WorkerD3runEv>:
    void run() override {
    80002f8c:	ff010113          	addi	sp,sp,-16
    80002f90:	00113423          	sd	ra,8(sp)
    80002f94:	00813023          	sd	s0,0(sp)
    80002f98:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80002f9c:	00000593          	li	a1,0
    80002fa0:	00000097          	auipc	ra,0x0
    80002fa4:	a10080e7          	jalr	-1520(ra) # 800029b0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002fa8:	00813083          	ld	ra,8(sp)
    80002fac:	00013403          	ld	s0,0(sp)
    80002fb0:	01010113          	addi	sp,sp,16
    80002fb4:	00008067          	ret

0000000080002fb8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002fb8:	fe010113          	addi	sp,sp,-32
    80002fbc:	00113c23          	sd	ra,24(sp)
    80002fc0:	00813823          	sd	s0,16(sp)
    80002fc4:	00913423          	sd	s1,8(sp)
    80002fc8:	01213023          	sd	s2,0(sp)
    80002fcc:	02010413          	addi	s0,sp,32
    80002fd0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002fd4:	00100793          	li	a5,1
    80002fd8:	02a7f863          	bgeu	a5,a0,80003008 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002fdc:	00a00793          	li	a5,10
    80002fe0:	02f577b3          	remu	a5,a0,a5
    80002fe4:	02078e63          	beqz	a5,80003020 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002fe8:	fff48513          	addi	a0,s1,-1
    80002fec:	00000097          	auipc	ra,0x0
    80002ff0:	fcc080e7          	jalr	-52(ra) # 80002fb8 <_ZL9fibonaccim>
    80002ff4:	00050913          	mv	s2,a0
    80002ff8:	ffe48513          	addi	a0,s1,-2
    80002ffc:	00000097          	auipc	ra,0x0
    80003000:	fbc080e7          	jalr	-68(ra) # 80002fb8 <_ZL9fibonaccim>
    80003004:	00a90533          	add	a0,s2,a0
}
    80003008:	01813083          	ld	ra,24(sp)
    8000300c:	01013403          	ld	s0,16(sp)
    80003010:	00813483          	ld	s1,8(sp)
    80003014:	00013903          	ld	s2,0(sp)
    80003018:	02010113          	addi	sp,sp,32
    8000301c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003020:	ffffe097          	auipc	ra,0xffffe
    80003024:	6ac080e7          	jalr	1708(ra) # 800016cc <_Z15thread_dispatchv>
    80003028:	fc1ff06f          	j	80002fe8 <_ZL9fibonaccim+0x30>

000000008000302c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000302c:	fe010113          	addi	sp,sp,-32
    80003030:	00113c23          	sd	ra,24(sp)
    80003034:	00813823          	sd	s0,16(sp)
    80003038:	00913423          	sd	s1,8(sp)
    8000303c:	01213023          	sd	s2,0(sp)
    80003040:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003044:	00a00493          	li	s1,10
    80003048:	0400006f          	j	80003088 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000304c:	00004517          	auipc	a0,0x4
    80003050:	11c50513          	addi	a0,a0,284 # 80007168 <CONSOLE_STATUS+0x158>
    80003054:	00000097          	auipc	ra,0x0
    80003058:	53c080e7          	jalr	1340(ra) # 80003590 <_Z11printStringPKc>
    8000305c:	00000613          	li	a2,0
    80003060:	00a00593          	li	a1,10
    80003064:	00048513          	mv	a0,s1
    80003068:	00000097          	auipc	ra,0x0
    8000306c:	6d8080e7          	jalr	1752(ra) # 80003740 <_Z8printIntiii>
    80003070:	00004517          	auipc	a0,0x4
    80003074:	fb850513          	addi	a0,a0,-72 # 80007028 <CONSOLE_STATUS+0x18>
    80003078:	00000097          	auipc	ra,0x0
    8000307c:	518080e7          	jalr	1304(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003080:	0014849b          	addiw	s1,s1,1
    80003084:	0ff4f493          	andi	s1,s1,255
    80003088:	00c00793          	li	a5,12
    8000308c:	fc97f0e3          	bgeu	a5,s1,8000304c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003090:	00004517          	auipc	a0,0x4
    80003094:	0e050513          	addi	a0,a0,224 # 80007170 <CONSOLE_STATUS+0x160>
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	4f8080e7          	jalr	1272(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800030a0:	00500313          	li	t1,5
    thread_dispatch();
    800030a4:	ffffe097          	auipc	ra,0xffffe
    800030a8:	628080e7          	jalr	1576(ra) # 800016cc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800030ac:	01000513          	li	a0,16
    800030b0:	00000097          	auipc	ra,0x0
    800030b4:	f08080e7          	jalr	-248(ra) # 80002fb8 <_ZL9fibonaccim>
    800030b8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800030bc:	00004517          	auipc	a0,0x4
    800030c0:	0c450513          	addi	a0,a0,196 # 80007180 <CONSOLE_STATUS+0x170>
    800030c4:	00000097          	auipc	ra,0x0
    800030c8:	4cc080e7          	jalr	1228(ra) # 80003590 <_Z11printStringPKc>
    800030cc:	00000613          	li	a2,0
    800030d0:	00a00593          	li	a1,10
    800030d4:	0009051b          	sext.w	a0,s2
    800030d8:	00000097          	auipc	ra,0x0
    800030dc:	668080e7          	jalr	1640(ra) # 80003740 <_Z8printIntiii>
    800030e0:	00004517          	auipc	a0,0x4
    800030e4:	f4850513          	addi	a0,a0,-184 # 80007028 <CONSOLE_STATUS+0x18>
    800030e8:	00000097          	auipc	ra,0x0
    800030ec:	4a8080e7          	jalr	1192(ra) # 80003590 <_Z11printStringPKc>
    800030f0:	0400006f          	j	80003130 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800030f4:	00004517          	auipc	a0,0x4
    800030f8:	07450513          	addi	a0,a0,116 # 80007168 <CONSOLE_STATUS+0x158>
    800030fc:	00000097          	auipc	ra,0x0
    80003100:	494080e7          	jalr	1172(ra) # 80003590 <_Z11printStringPKc>
    80003104:	00000613          	li	a2,0
    80003108:	00a00593          	li	a1,10
    8000310c:	00048513          	mv	a0,s1
    80003110:	00000097          	auipc	ra,0x0
    80003114:	630080e7          	jalr	1584(ra) # 80003740 <_Z8printIntiii>
    80003118:	00004517          	auipc	a0,0x4
    8000311c:	f1050513          	addi	a0,a0,-240 # 80007028 <CONSOLE_STATUS+0x18>
    80003120:	00000097          	auipc	ra,0x0
    80003124:	470080e7          	jalr	1136(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003128:	0014849b          	addiw	s1,s1,1
    8000312c:	0ff4f493          	andi	s1,s1,255
    80003130:	00f00793          	li	a5,15
    80003134:	fc97f0e3          	bgeu	a5,s1,800030f4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003138:	00004517          	auipc	a0,0x4
    8000313c:	05850513          	addi	a0,a0,88 # 80007190 <CONSOLE_STATUS+0x180>
    80003140:	00000097          	auipc	ra,0x0
    80003144:	450080e7          	jalr	1104(ra) # 80003590 <_Z11printStringPKc>
    finishedD = true;
    80003148:	00100793          	li	a5,1
    8000314c:	00005717          	auipc	a4,0x5
    80003150:	54f70423          	sb	a5,1352(a4) # 80008694 <_ZL9finishedD>
    thread_dispatch();
    80003154:	ffffe097          	auipc	ra,0xffffe
    80003158:	578080e7          	jalr	1400(ra) # 800016cc <_Z15thread_dispatchv>
}
    8000315c:	01813083          	ld	ra,24(sp)
    80003160:	01013403          	ld	s0,16(sp)
    80003164:	00813483          	ld	s1,8(sp)
    80003168:	00013903          	ld	s2,0(sp)
    8000316c:	02010113          	addi	sp,sp,32
    80003170:	00008067          	ret

0000000080003174 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003174:	fe010113          	addi	sp,sp,-32
    80003178:	00113c23          	sd	ra,24(sp)
    8000317c:	00813823          	sd	s0,16(sp)
    80003180:	00913423          	sd	s1,8(sp)
    80003184:	01213023          	sd	s2,0(sp)
    80003188:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000318c:	00000493          	li	s1,0
    80003190:	0400006f          	j	800031d0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003194:	00004517          	auipc	a0,0x4
    80003198:	fa450513          	addi	a0,a0,-92 # 80007138 <CONSOLE_STATUS+0x128>
    8000319c:	00000097          	auipc	ra,0x0
    800031a0:	3f4080e7          	jalr	1012(ra) # 80003590 <_Z11printStringPKc>
    800031a4:	00000613          	li	a2,0
    800031a8:	00a00593          	li	a1,10
    800031ac:	00048513          	mv	a0,s1
    800031b0:	00000097          	auipc	ra,0x0
    800031b4:	590080e7          	jalr	1424(ra) # 80003740 <_Z8printIntiii>
    800031b8:	00004517          	auipc	a0,0x4
    800031bc:	e7050513          	addi	a0,a0,-400 # 80007028 <CONSOLE_STATUS+0x18>
    800031c0:	00000097          	auipc	ra,0x0
    800031c4:	3d0080e7          	jalr	976(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800031c8:	0014849b          	addiw	s1,s1,1
    800031cc:	0ff4f493          	andi	s1,s1,255
    800031d0:	00200793          	li	a5,2
    800031d4:	fc97f0e3          	bgeu	a5,s1,80003194 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800031d8:	00004517          	auipc	a0,0x4
    800031dc:	f6850513          	addi	a0,a0,-152 # 80007140 <CONSOLE_STATUS+0x130>
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	3b0080e7          	jalr	944(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800031e8:	00700313          	li	t1,7
    thread_dispatch();
    800031ec:	ffffe097          	auipc	ra,0xffffe
    800031f0:	4e0080e7          	jalr	1248(ra) # 800016cc <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800031f4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800031f8:	00004517          	auipc	a0,0x4
    800031fc:	f5850513          	addi	a0,a0,-168 # 80007150 <CONSOLE_STATUS+0x140>
    80003200:	00000097          	auipc	ra,0x0
    80003204:	390080e7          	jalr	912(ra) # 80003590 <_Z11printStringPKc>
    80003208:	00000613          	li	a2,0
    8000320c:	00a00593          	li	a1,10
    80003210:	0009051b          	sext.w	a0,s2
    80003214:	00000097          	auipc	ra,0x0
    80003218:	52c080e7          	jalr	1324(ra) # 80003740 <_Z8printIntiii>
    8000321c:	00004517          	auipc	a0,0x4
    80003220:	e0c50513          	addi	a0,a0,-500 # 80007028 <CONSOLE_STATUS+0x18>
    80003224:	00000097          	auipc	ra,0x0
    80003228:	36c080e7          	jalr	876(ra) # 80003590 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000322c:	00c00513          	li	a0,12
    80003230:	00000097          	auipc	ra,0x0
    80003234:	d88080e7          	jalr	-632(ra) # 80002fb8 <_ZL9fibonaccim>
    80003238:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000323c:	00004517          	auipc	a0,0x4
    80003240:	f1c50513          	addi	a0,a0,-228 # 80007158 <CONSOLE_STATUS+0x148>
    80003244:	00000097          	auipc	ra,0x0
    80003248:	34c080e7          	jalr	844(ra) # 80003590 <_Z11printStringPKc>
    8000324c:	00000613          	li	a2,0
    80003250:	00a00593          	li	a1,10
    80003254:	0009051b          	sext.w	a0,s2
    80003258:	00000097          	auipc	ra,0x0
    8000325c:	4e8080e7          	jalr	1256(ra) # 80003740 <_Z8printIntiii>
    80003260:	00004517          	auipc	a0,0x4
    80003264:	dc850513          	addi	a0,a0,-568 # 80007028 <CONSOLE_STATUS+0x18>
    80003268:	00000097          	auipc	ra,0x0
    8000326c:	328080e7          	jalr	808(ra) # 80003590 <_Z11printStringPKc>
    80003270:	0400006f          	j	800032b0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003274:	00004517          	auipc	a0,0x4
    80003278:	ec450513          	addi	a0,a0,-316 # 80007138 <CONSOLE_STATUS+0x128>
    8000327c:	00000097          	auipc	ra,0x0
    80003280:	314080e7          	jalr	788(ra) # 80003590 <_Z11printStringPKc>
    80003284:	00000613          	li	a2,0
    80003288:	00a00593          	li	a1,10
    8000328c:	00048513          	mv	a0,s1
    80003290:	00000097          	auipc	ra,0x0
    80003294:	4b0080e7          	jalr	1200(ra) # 80003740 <_Z8printIntiii>
    80003298:	00004517          	auipc	a0,0x4
    8000329c:	d9050513          	addi	a0,a0,-624 # 80007028 <CONSOLE_STATUS+0x18>
    800032a0:	00000097          	auipc	ra,0x0
    800032a4:	2f0080e7          	jalr	752(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800032a8:	0014849b          	addiw	s1,s1,1
    800032ac:	0ff4f493          	andi	s1,s1,255
    800032b0:	00500793          	li	a5,5
    800032b4:	fc97f0e3          	bgeu	a5,s1,80003274 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800032b8:	00004517          	auipc	a0,0x4
    800032bc:	e5850513          	addi	a0,a0,-424 # 80007110 <CONSOLE_STATUS+0x100>
    800032c0:	00000097          	auipc	ra,0x0
    800032c4:	2d0080e7          	jalr	720(ra) # 80003590 <_Z11printStringPKc>
    finishedC = true;
    800032c8:	00100793          	li	a5,1
    800032cc:	00005717          	auipc	a4,0x5
    800032d0:	3cf704a3          	sb	a5,969(a4) # 80008695 <_ZL9finishedC>
    thread_dispatch();
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	3f8080e7          	jalr	1016(ra) # 800016cc <_Z15thread_dispatchv>
}
    800032dc:	01813083          	ld	ra,24(sp)
    800032e0:	01013403          	ld	s0,16(sp)
    800032e4:	00813483          	ld	s1,8(sp)
    800032e8:	00013903          	ld	s2,0(sp)
    800032ec:	02010113          	addi	sp,sp,32
    800032f0:	00008067          	ret

00000000800032f4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800032f4:	fe010113          	addi	sp,sp,-32
    800032f8:	00113c23          	sd	ra,24(sp)
    800032fc:	00813823          	sd	s0,16(sp)
    80003300:	00913423          	sd	s1,8(sp)
    80003304:	01213023          	sd	s2,0(sp)
    80003308:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000330c:	00000913          	li	s2,0
    80003310:	0380006f          	j	80003348 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80003314:	ffffe097          	auipc	ra,0xffffe
    80003318:	3b8080e7          	jalr	952(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000331c:	00148493          	addi	s1,s1,1
    80003320:	000027b7          	lui	a5,0x2
    80003324:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003328:	0097ee63          	bltu	a5,s1,80003344 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000332c:	00000713          	li	a4,0
    80003330:	000077b7          	lui	a5,0x7
    80003334:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003338:	fce7eee3          	bltu	a5,a4,80003314 <_ZL11workerBodyBPv+0x20>
    8000333c:	00170713          	addi	a4,a4,1
    80003340:	ff1ff06f          	j	80003330 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003344:	00190913          	addi	s2,s2,1
    80003348:	00f00793          	li	a5,15
    8000334c:	0527e063          	bltu	a5,s2,8000338c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003350:	00004517          	auipc	a0,0x4
    80003354:	dd050513          	addi	a0,a0,-560 # 80007120 <CONSOLE_STATUS+0x110>
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	238080e7          	jalr	568(ra) # 80003590 <_Z11printStringPKc>
    80003360:	00000613          	li	a2,0
    80003364:	00a00593          	li	a1,10
    80003368:	0009051b          	sext.w	a0,s2
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	3d4080e7          	jalr	980(ra) # 80003740 <_Z8printIntiii>
    80003374:	00004517          	auipc	a0,0x4
    80003378:	cb450513          	addi	a0,a0,-844 # 80007028 <CONSOLE_STATUS+0x18>
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	214080e7          	jalr	532(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003384:	00000493          	li	s1,0
    80003388:	f99ff06f          	j	80003320 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000338c:	00004517          	auipc	a0,0x4
    80003390:	d9c50513          	addi	a0,a0,-612 # 80007128 <CONSOLE_STATUS+0x118>
    80003394:	00000097          	auipc	ra,0x0
    80003398:	1fc080e7          	jalr	508(ra) # 80003590 <_Z11printStringPKc>
    finishedB = true;
    8000339c:	00100793          	li	a5,1
    800033a0:	00005717          	auipc	a4,0x5
    800033a4:	2ef70b23          	sb	a5,758(a4) # 80008696 <_ZL9finishedB>
    thread_dispatch();
    800033a8:	ffffe097          	auipc	ra,0xffffe
    800033ac:	324080e7          	jalr	804(ra) # 800016cc <_Z15thread_dispatchv>
}
    800033b0:	01813083          	ld	ra,24(sp)
    800033b4:	01013403          	ld	s0,16(sp)
    800033b8:	00813483          	ld	s1,8(sp)
    800033bc:	00013903          	ld	s2,0(sp)
    800033c0:	02010113          	addi	sp,sp,32
    800033c4:	00008067          	ret

00000000800033c8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800033c8:	fe010113          	addi	sp,sp,-32
    800033cc:	00113c23          	sd	ra,24(sp)
    800033d0:	00813823          	sd	s0,16(sp)
    800033d4:	00913423          	sd	s1,8(sp)
    800033d8:	01213023          	sd	s2,0(sp)
    800033dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800033e0:	00000913          	li	s2,0
    800033e4:	0380006f          	j	8000341c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	2e4080e7          	jalr	740(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800033f0:	00148493          	addi	s1,s1,1
    800033f4:	000027b7          	lui	a5,0x2
    800033f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800033fc:	0097ee63          	bltu	a5,s1,80003418 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003400:	00000713          	li	a4,0
    80003404:	000077b7          	lui	a5,0x7
    80003408:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000340c:	fce7eee3          	bltu	a5,a4,800033e8 <_ZL11workerBodyAPv+0x20>
    80003410:	00170713          	addi	a4,a4,1
    80003414:	ff1ff06f          	j	80003404 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003418:	00190913          	addi	s2,s2,1
    8000341c:	00900793          	li	a5,9
    80003420:	0527e063          	bltu	a5,s2,80003460 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003424:	00004517          	auipc	a0,0x4
    80003428:	ce450513          	addi	a0,a0,-796 # 80007108 <CONSOLE_STATUS+0xf8>
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	164080e7          	jalr	356(ra) # 80003590 <_Z11printStringPKc>
    80003434:	00000613          	li	a2,0
    80003438:	00a00593          	li	a1,10
    8000343c:	0009051b          	sext.w	a0,s2
    80003440:	00000097          	auipc	ra,0x0
    80003444:	300080e7          	jalr	768(ra) # 80003740 <_Z8printIntiii>
    80003448:	00004517          	auipc	a0,0x4
    8000344c:	be050513          	addi	a0,a0,-1056 # 80007028 <CONSOLE_STATUS+0x18>
    80003450:	00000097          	auipc	ra,0x0
    80003454:	140080e7          	jalr	320(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003458:	00000493          	li	s1,0
    8000345c:	f99ff06f          	j	800033f4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003460:	00004517          	auipc	a0,0x4
    80003464:	cb050513          	addi	a0,a0,-848 # 80007110 <CONSOLE_STATUS+0x100>
    80003468:	00000097          	auipc	ra,0x0
    8000346c:	128080e7          	jalr	296(ra) # 80003590 <_Z11printStringPKc>
    finishedA = true;
    80003470:	00100793          	li	a5,1
    80003474:	00005717          	auipc	a4,0x5
    80003478:	22f701a3          	sb	a5,547(a4) # 80008697 <_ZL9finishedA>
}
    8000347c:	01813083          	ld	ra,24(sp)
    80003480:	01013403          	ld	s0,16(sp)
    80003484:	00813483          	ld	s1,8(sp)
    80003488:	00013903          	ld	s2,0(sp)
    8000348c:	02010113          	addi	sp,sp,32
    80003490:	00008067          	ret

0000000080003494 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003494:	fd010113          	addi	sp,sp,-48
    80003498:	02113423          	sd	ra,40(sp)
    8000349c:	02813023          	sd	s0,32(sp)
    800034a0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800034a4:	00000613          	li	a2,0
    800034a8:	00000597          	auipc	a1,0x0
    800034ac:	f2058593          	addi	a1,a1,-224 # 800033c8 <_ZL11workerBodyAPv>
    800034b0:	fd040513          	addi	a0,s0,-48
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	170080e7          	jalr	368(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800034bc:	00004517          	auipc	a0,0x4
    800034c0:	ce450513          	addi	a0,a0,-796 # 800071a0 <CONSOLE_STATUS+0x190>
    800034c4:	00000097          	auipc	ra,0x0
    800034c8:	0cc080e7          	jalr	204(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800034cc:	00000613          	li	a2,0
    800034d0:	00000597          	auipc	a1,0x0
    800034d4:	e2458593          	addi	a1,a1,-476 # 800032f4 <_ZL11workerBodyBPv>
    800034d8:	fd840513          	addi	a0,s0,-40
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	148080e7          	jalr	328(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800034e4:	00004517          	auipc	a0,0x4
    800034e8:	cd450513          	addi	a0,a0,-812 # 800071b8 <CONSOLE_STATUS+0x1a8>
    800034ec:	00000097          	auipc	ra,0x0
    800034f0:	0a4080e7          	jalr	164(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800034f4:	00000613          	li	a2,0
    800034f8:	00000597          	auipc	a1,0x0
    800034fc:	c7c58593          	addi	a1,a1,-900 # 80003174 <_ZL11workerBodyCPv>
    80003500:	fe040513          	addi	a0,s0,-32
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	120080e7          	jalr	288(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000350c:	00004517          	auipc	a0,0x4
    80003510:	cc450513          	addi	a0,a0,-828 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003514:	00000097          	auipc	ra,0x0
    80003518:	07c080e7          	jalr	124(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000351c:	00000613          	li	a2,0
    80003520:	00000597          	auipc	a1,0x0
    80003524:	b0c58593          	addi	a1,a1,-1268 # 8000302c <_ZL11workerBodyDPv>
    80003528:	fe840513          	addi	a0,s0,-24
    8000352c:	ffffe097          	auipc	ra,0xffffe
    80003530:	0f8080e7          	jalr	248(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003534:	00004517          	auipc	a0,0x4
    80003538:	cb450513          	addi	a0,a0,-844 # 800071e8 <CONSOLE_STATUS+0x1d8>
    8000353c:	00000097          	auipc	ra,0x0
    80003540:	054080e7          	jalr	84(ra) # 80003590 <_Z11printStringPKc>
    80003544:	00c0006f          	j	80003550 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003548:	ffffe097          	auipc	ra,0xffffe
    8000354c:	184080e7          	jalr	388(ra) # 800016cc <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003550:	00005797          	auipc	a5,0x5
    80003554:	1477c783          	lbu	a5,327(a5) # 80008697 <_ZL9finishedA>
    80003558:	fe0788e3          	beqz	a5,80003548 <_Z18Threads_C_API_testv+0xb4>
    8000355c:	00005797          	auipc	a5,0x5
    80003560:	13a7c783          	lbu	a5,314(a5) # 80008696 <_ZL9finishedB>
    80003564:	fe0782e3          	beqz	a5,80003548 <_Z18Threads_C_API_testv+0xb4>
    80003568:	00005797          	auipc	a5,0x5
    8000356c:	12d7c783          	lbu	a5,301(a5) # 80008695 <_ZL9finishedC>
    80003570:	fc078ce3          	beqz	a5,80003548 <_Z18Threads_C_API_testv+0xb4>
    80003574:	00005797          	auipc	a5,0x5
    80003578:	1207c783          	lbu	a5,288(a5) # 80008694 <_ZL9finishedD>
    8000357c:	fc0786e3          	beqz	a5,80003548 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003580:	02813083          	ld	ra,40(sp)
    80003584:	02013403          	ld	s0,32(sp)
    80003588:	03010113          	addi	sp,sp,48
    8000358c:	00008067          	ret

0000000080003590 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003590:	fe010113          	addi	sp,sp,-32
    80003594:	00113c23          	sd	ra,24(sp)
    80003598:	00813823          	sd	s0,16(sp)
    8000359c:	00913423          	sd	s1,8(sp)
    800035a0:	02010413          	addi	s0,sp,32
    800035a4:	00050493          	mv	s1,a0
    LOCK();
    800035a8:	00100613          	li	a2,1
    800035ac:	00000593          	li	a1,0
    800035b0:	00005517          	auipc	a0,0x5
    800035b4:	0e850513          	addi	a0,a0,232 # 80008698 <lockPrint>
    800035b8:	ffffe097          	auipc	ra,0xffffe
    800035bc:	fe0080e7          	jalr	-32(ra) # 80001598 <copy_and_swap>
    800035c0:	00050863          	beqz	a0,800035d0 <_Z11printStringPKc+0x40>
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	108080e7          	jalr	264(ra) # 800016cc <_Z15thread_dispatchv>
    800035cc:	fddff06f          	j	800035a8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800035d0:	0004c503          	lbu	a0,0(s1)
    800035d4:	00050a63          	beqz	a0,800035e8 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800035d8:	ffffe097          	auipc	ra,0xffffe
    800035dc:	240080e7          	jalr	576(ra) # 80001818 <_Z4putcc>
        string++;
    800035e0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800035e4:	fedff06f          	j	800035d0 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800035e8:	00000613          	li	a2,0
    800035ec:	00100593          	li	a1,1
    800035f0:	00005517          	auipc	a0,0x5
    800035f4:	0a850513          	addi	a0,a0,168 # 80008698 <lockPrint>
    800035f8:	ffffe097          	auipc	ra,0xffffe
    800035fc:	fa0080e7          	jalr	-96(ra) # 80001598 <copy_and_swap>
    80003600:	fe0514e3          	bnez	a0,800035e8 <_Z11printStringPKc+0x58>
}
    80003604:	01813083          	ld	ra,24(sp)
    80003608:	01013403          	ld	s0,16(sp)
    8000360c:	00813483          	ld	s1,8(sp)
    80003610:	02010113          	addi	sp,sp,32
    80003614:	00008067          	ret

0000000080003618 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003618:	fd010113          	addi	sp,sp,-48
    8000361c:	02113423          	sd	ra,40(sp)
    80003620:	02813023          	sd	s0,32(sp)
    80003624:	00913c23          	sd	s1,24(sp)
    80003628:	01213823          	sd	s2,16(sp)
    8000362c:	01313423          	sd	s3,8(sp)
    80003630:	01413023          	sd	s4,0(sp)
    80003634:	03010413          	addi	s0,sp,48
    80003638:	00050993          	mv	s3,a0
    8000363c:	00058a13          	mv	s4,a1
    LOCK();
    80003640:	00100613          	li	a2,1
    80003644:	00000593          	li	a1,0
    80003648:	00005517          	auipc	a0,0x5
    8000364c:	05050513          	addi	a0,a0,80 # 80008698 <lockPrint>
    80003650:	ffffe097          	auipc	ra,0xffffe
    80003654:	f48080e7          	jalr	-184(ra) # 80001598 <copy_and_swap>
    80003658:	00050863          	beqz	a0,80003668 <_Z9getStringPci+0x50>
    8000365c:	ffffe097          	auipc	ra,0xffffe
    80003660:	070080e7          	jalr	112(ra) # 800016cc <_Z15thread_dispatchv>
    80003664:	fddff06f          	j	80003640 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003668:	00000913          	li	s2,0
    8000366c:	00090493          	mv	s1,s2
    80003670:	0019091b          	addiw	s2,s2,1
    80003674:	03495a63          	bge	s2,s4,800036a8 <_Z9getStringPci+0x90>
        cc = getc();
    80003678:	ffffe097          	auipc	ra,0xffffe
    8000367c:	178080e7          	jalr	376(ra) # 800017f0 <_Z4getcv>
        if(cc < 1)
    80003680:	02050463          	beqz	a0,800036a8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80003684:	009984b3          	add	s1,s3,s1
    80003688:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000368c:	00a00793          	li	a5,10
    80003690:	00f50a63          	beq	a0,a5,800036a4 <_Z9getStringPci+0x8c>
    80003694:	00d00793          	li	a5,13
    80003698:	fcf51ae3          	bne	a0,a5,8000366c <_Z9getStringPci+0x54>
        buf[i++] = c;
    8000369c:	00090493          	mv	s1,s2
    800036a0:	0080006f          	j	800036a8 <_Z9getStringPci+0x90>
    800036a4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800036a8:	009984b3          	add	s1,s3,s1
    800036ac:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800036b0:	00000613          	li	a2,0
    800036b4:	00100593          	li	a1,1
    800036b8:	00005517          	auipc	a0,0x5
    800036bc:	fe050513          	addi	a0,a0,-32 # 80008698 <lockPrint>
    800036c0:	ffffe097          	auipc	ra,0xffffe
    800036c4:	ed8080e7          	jalr	-296(ra) # 80001598 <copy_and_swap>
    800036c8:	fe0514e3          	bnez	a0,800036b0 <_Z9getStringPci+0x98>
    return buf;
}
    800036cc:	00098513          	mv	a0,s3
    800036d0:	02813083          	ld	ra,40(sp)
    800036d4:	02013403          	ld	s0,32(sp)
    800036d8:	01813483          	ld	s1,24(sp)
    800036dc:	01013903          	ld	s2,16(sp)
    800036e0:	00813983          	ld	s3,8(sp)
    800036e4:	00013a03          	ld	s4,0(sp)
    800036e8:	03010113          	addi	sp,sp,48
    800036ec:	00008067          	ret

00000000800036f0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800036f0:	ff010113          	addi	sp,sp,-16
    800036f4:	00813423          	sd	s0,8(sp)
    800036f8:	01010413          	addi	s0,sp,16
    800036fc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003700:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003704:	0006c603          	lbu	a2,0(a3)
    80003708:	fd06071b          	addiw	a4,a2,-48
    8000370c:	0ff77713          	andi	a4,a4,255
    80003710:	00900793          	li	a5,9
    80003714:	02e7e063          	bltu	a5,a4,80003734 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003718:	0025179b          	slliw	a5,a0,0x2
    8000371c:	00a787bb          	addw	a5,a5,a0
    80003720:	0017979b          	slliw	a5,a5,0x1
    80003724:	00168693          	addi	a3,a3,1
    80003728:	00c787bb          	addw	a5,a5,a2
    8000372c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003730:	fd5ff06f          	j	80003704 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003734:	00813403          	ld	s0,8(sp)
    80003738:	01010113          	addi	sp,sp,16
    8000373c:	00008067          	ret

0000000080003740 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003740:	fc010113          	addi	sp,sp,-64
    80003744:	02113c23          	sd	ra,56(sp)
    80003748:	02813823          	sd	s0,48(sp)
    8000374c:	02913423          	sd	s1,40(sp)
    80003750:	03213023          	sd	s2,32(sp)
    80003754:	01313c23          	sd	s3,24(sp)
    80003758:	04010413          	addi	s0,sp,64
    8000375c:	00050493          	mv	s1,a0
    80003760:	00058913          	mv	s2,a1
    80003764:	00060993          	mv	s3,a2
    LOCK();
    80003768:	00100613          	li	a2,1
    8000376c:	00000593          	li	a1,0
    80003770:	00005517          	auipc	a0,0x5
    80003774:	f2850513          	addi	a0,a0,-216 # 80008698 <lockPrint>
    80003778:	ffffe097          	auipc	ra,0xffffe
    8000377c:	e20080e7          	jalr	-480(ra) # 80001598 <copy_and_swap>
    80003780:	00050863          	beqz	a0,80003790 <_Z8printIntiii+0x50>
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	f48080e7          	jalr	-184(ra) # 800016cc <_Z15thread_dispatchv>
    8000378c:	fddff06f          	j	80003768 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003790:	00098463          	beqz	s3,80003798 <_Z8printIntiii+0x58>
    80003794:	0804c463          	bltz	s1,8000381c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003798:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000379c:	00000593          	li	a1,0
    }

    i = 0;
    800037a0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800037a4:	0009079b          	sext.w	a5,s2
    800037a8:	0325773b          	remuw	a4,a0,s2
    800037ac:	00048613          	mv	a2,s1
    800037b0:	0014849b          	addiw	s1,s1,1
    800037b4:	02071693          	slli	a3,a4,0x20
    800037b8:	0206d693          	srli	a3,a3,0x20
    800037bc:	00005717          	auipc	a4,0x5
    800037c0:	e0470713          	addi	a4,a4,-508 # 800085c0 <digits>
    800037c4:	00d70733          	add	a4,a4,a3
    800037c8:	00074683          	lbu	a3,0(a4)
    800037cc:	fd040713          	addi	a4,s0,-48
    800037d0:	00c70733          	add	a4,a4,a2
    800037d4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800037d8:	0005071b          	sext.w	a4,a0
    800037dc:	0325553b          	divuw	a0,a0,s2
    800037e0:	fcf772e3          	bgeu	a4,a5,800037a4 <_Z8printIntiii+0x64>
    if(neg)
    800037e4:	00058c63          	beqz	a1,800037fc <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800037e8:	fd040793          	addi	a5,s0,-48
    800037ec:	009784b3          	add	s1,a5,s1
    800037f0:	02d00793          	li	a5,45
    800037f4:	fef48823          	sb	a5,-16(s1)
    800037f8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800037fc:	fff4849b          	addiw	s1,s1,-1
    80003800:	0204c463          	bltz	s1,80003828 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80003804:	fd040793          	addi	a5,s0,-48
    80003808:	009787b3          	add	a5,a5,s1
    8000380c:	ff07c503          	lbu	a0,-16(a5)
    80003810:	ffffe097          	auipc	ra,0xffffe
    80003814:	008080e7          	jalr	8(ra) # 80001818 <_Z4putcc>
    80003818:	fe5ff06f          	j	800037fc <_Z8printIntiii+0xbc>
        x = -xx;
    8000381c:	4090053b          	negw	a0,s1
        neg = 1;
    80003820:	00100593          	li	a1,1
        x = -xx;
    80003824:	f7dff06f          	j	800037a0 <_Z8printIntiii+0x60>

    UNLOCK();
    80003828:	00000613          	li	a2,0
    8000382c:	00100593          	li	a1,1
    80003830:	00005517          	auipc	a0,0x5
    80003834:	e6850513          	addi	a0,a0,-408 # 80008698 <lockPrint>
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	d60080e7          	jalr	-672(ra) # 80001598 <copy_and_swap>
    80003840:	fe0514e3          	bnez	a0,80003828 <_Z8printIntiii+0xe8>
    80003844:	03813083          	ld	ra,56(sp)
    80003848:	03013403          	ld	s0,48(sp)
    8000384c:	02813483          	ld	s1,40(sp)
    80003850:	02013903          	ld	s2,32(sp)
    80003854:	01813983          	ld	s3,24(sp)
    80003858:	04010113          	addi	sp,sp,64
    8000385c:	00008067          	ret

0000000080003860 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00113c23          	sd	ra,24(sp)
    80003868:	00813823          	sd	s0,16(sp)
    8000386c:	00913423          	sd	s1,8(sp)
    80003870:	01213023          	sd	s2,0(sp)
    80003874:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80003878:	00004517          	auipc	a0,0x4
    8000387c:	98850513          	addi	a0,a0,-1656 # 80007200 <CONSOLE_STATUS+0x1f0>
    80003880:	00000097          	auipc	ra,0x0
    80003884:	d10080e7          	jalr	-752(ra) # 80003590 <_Z11printStringPKc>
    int test = getc() - '0';
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	f68080e7          	jalr	-152(ra) # 800017f0 <_Z4getcv>
    80003890:	0005091b          	sext.w	s2,a0
    80003894:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80003898:	ffffe097          	auipc	ra,0xffffe
    8000389c:	f58080e7          	jalr	-168(ra) # 800017f0 <_Z4getcv>
            printString("Nije navedeno da je zadatak 2 implementiran\n");
            return;
        }
    }

    if (test >= 3 && test <= 4) {
    800038a0:	fcd9071b          	addiw	a4,s2,-51
    800038a4:	00100793          	li	a5,1
    800038a8:	04e7f663          	bgeu	a5,a4,800038f4 <_Z8userMainv+0x94>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    800038ac:	fcb9091b          	addiw	s2,s2,-53
    800038b0:	00100793          	li	a5,1
    800038b4:	0727f463          	bgeu	a5,s2,8000391c <_Z8userMainv+0xbc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800038b8:	00600793          	li	a5,6
    800038bc:	0697ca63          	blt	a5,s1,80003930 <_Z8userMainv+0xd0>
    800038c0:	00300793          	li	a5,3
    800038c4:	04f4d063          	bge	s1,a5,80003904 <_Z8userMainv+0xa4>
    800038c8:	00100793          	li	a5,1
    800038cc:	08f48c63          	beq	s1,a5,80003964 <_Z8userMainv+0x104>
    800038d0:	00200793          	li	a5,2
    800038d4:	0af49663          	bne	s1,a5,80003980 <_Z8userMainv+0x120>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
#endif
            break;
        case 2:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_CPP_API_test();
    800038d8:	fffff097          	auipc	ra,0xfffff
    800038dc:	220080e7          	jalr	544(ra) # 80002af8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800038e0:	00004517          	auipc	a0,0x4
    800038e4:	9e050513          	addi	a0,a0,-1568 # 800072c0 <CONSOLE_STATUS+0x2b0>
    800038e8:	00000097          	auipc	ra,0x0
    800038ec:	ca8080e7          	jalr	-856(ra) # 80003590 <_Z11printStringPKc>
#endif
            break;
    800038f0:	0140006f          	j	80003904 <_Z8userMainv+0xa4>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
    800038f4:	00004517          	auipc	a0,0x4
    800038f8:	92c50513          	addi	a0,a0,-1748 # 80007220 <CONSOLE_STATUS+0x210>
    800038fc:	00000097          	auipc	ra,0x0
    80003900:	c94080e7          	jalr	-876(ra) # 80003590 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80003904:	01813083          	ld	ra,24(sp)
    80003908:	01013403          	ld	s0,16(sp)
    8000390c:	00813483          	ld	s1,8(sp)
    80003910:	00013903          	ld	s2,0(sp)
    80003914:	02010113          	addi	sp,sp,32
    80003918:	00008067          	ret
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    8000391c:	00004517          	auipc	a0,0x4
    80003920:	93450513          	addi	a0,a0,-1740 # 80007250 <CONSOLE_STATUS+0x240>
    80003924:	00000097          	auipc	ra,0x0
    80003928:	c6c080e7          	jalr	-916(ra) # 80003590 <_Z11printStringPKc>
            return;
    8000392c:	fd9ff06f          	j	80003904 <_Z8userMainv+0xa4>
    switch (test) {
    80003930:	00700793          	li	a5,7
    80003934:	04f49663          	bne	s1,a5,80003980 <_Z8userMainv+0x120>
            System_Mode_test();
    80003938:	00000097          	auipc	ra,0x0
    8000393c:	548080e7          	jalr	1352(ra) # 80003e80 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80003940:	00004517          	auipc	a0,0x4
    80003944:	9c050513          	addi	a0,a0,-1600 # 80007300 <CONSOLE_STATUS+0x2f0>
    80003948:	00000097          	auipc	ra,0x0
    8000394c:	c48080e7          	jalr	-952(ra) # 80003590 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80003950:	00004517          	auipc	a0,0x4
    80003954:	9d050513          	addi	a0,a0,-1584 # 80007320 <CONSOLE_STATUS+0x310>
    80003958:	00000097          	auipc	ra,0x0
    8000395c:	c38080e7          	jalr	-968(ra) # 80003590 <_Z11printStringPKc>
            break;
    80003960:	fa5ff06f          	j	80003904 <_Z8userMainv+0xa4>
            Threads_C_API_test();
    80003964:	00000097          	auipc	ra,0x0
    80003968:	b30080e7          	jalr	-1232(ra) # 80003494 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    8000396c:	00004517          	auipc	a0,0x4
    80003970:	91450513          	addi	a0,a0,-1772 # 80007280 <CONSOLE_STATUS+0x270>
    80003974:	00000097          	auipc	ra,0x0
    80003978:	c1c080e7          	jalr	-996(ra) # 80003590 <_Z11printStringPKc>
            break;
    8000397c:	f89ff06f          	j	80003904 <_Z8userMainv+0xa4>
            printString("Niste uneli odgovarajuci broj za test\n");
    80003980:	00004517          	auipc	a0,0x4
    80003984:	9f850513          	addi	a0,a0,-1544 # 80007378 <CONSOLE_STATUS+0x368>
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	c08080e7          	jalr	-1016(ra) # 80003590 <_Z11printStringPKc>
    80003990:	f75ff06f          	j	80003904 <_Z8userMainv+0xa4>

0000000080003994 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003994:	fe010113          	addi	sp,sp,-32
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00913423          	sd	s1,8(sp)
    800039a4:	01213023          	sd	s2,0(sp)
    800039a8:	02010413          	addi	s0,sp,32
    800039ac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800039b0:	00100793          	li	a5,1
    800039b4:	02a7f863          	bgeu	a5,a0,800039e4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800039b8:	00a00793          	li	a5,10
    800039bc:	02f577b3          	remu	a5,a0,a5
    800039c0:	02078e63          	beqz	a5,800039fc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800039c4:	fff48513          	addi	a0,s1,-1
    800039c8:	00000097          	auipc	ra,0x0
    800039cc:	fcc080e7          	jalr	-52(ra) # 80003994 <_ZL9fibonaccim>
    800039d0:	00050913          	mv	s2,a0
    800039d4:	ffe48513          	addi	a0,s1,-2
    800039d8:	00000097          	auipc	ra,0x0
    800039dc:	fbc080e7          	jalr	-68(ra) # 80003994 <_ZL9fibonaccim>
    800039e0:	00a90533          	add	a0,s2,a0
}
    800039e4:	01813083          	ld	ra,24(sp)
    800039e8:	01013403          	ld	s0,16(sp)
    800039ec:	00813483          	ld	s1,8(sp)
    800039f0:	00013903          	ld	s2,0(sp)
    800039f4:	02010113          	addi	sp,sp,32
    800039f8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800039fc:	ffffe097          	auipc	ra,0xffffe
    80003a00:	cd0080e7          	jalr	-816(ra) # 800016cc <_Z15thread_dispatchv>
    80003a04:	fc1ff06f          	j	800039c4 <_ZL9fibonaccim+0x30>

0000000080003a08 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80003a08:	fe010113          	addi	sp,sp,-32
    80003a0c:	00113c23          	sd	ra,24(sp)
    80003a10:	00813823          	sd	s0,16(sp)
    80003a14:	00913423          	sd	s1,8(sp)
    80003a18:	01213023          	sd	s2,0(sp)
    80003a1c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003a20:	00a00493          	li	s1,10
    80003a24:	0400006f          	j	80003a64 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003a28:	00003517          	auipc	a0,0x3
    80003a2c:	74050513          	addi	a0,a0,1856 # 80007168 <CONSOLE_STATUS+0x158>
    80003a30:	00000097          	auipc	ra,0x0
    80003a34:	b60080e7          	jalr	-1184(ra) # 80003590 <_Z11printStringPKc>
    80003a38:	00000613          	li	a2,0
    80003a3c:	00a00593          	li	a1,10
    80003a40:	00048513          	mv	a0,s1
    80003a44:	00000097          	auipc	ra,0x0
    80003a48:	cfc080e7          	jalr	-772(ra) # 80003740 <_Z8printIntiii>
    80003a4c:	00003517          	auipc	a0,0x3
    80003a50:	5dc50513          	addi	a0,a0,1500 # 80007028 <CONSOLE_STATUS+0x18>
    80003a54:	00000097          	auipc	ra,0x0
    80003a58:	b3c080e7          	jalr	-1220(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003a5c:	0014849b          	addiw	s1,s1,1
    80003a60:	0ff4f493          	andi	s1,s1,255
    80003a64:	00c00793          	li	a5,12
    80003a68:	fc97f0e3          	bgeu	a5,s1,80003a28 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003a6c:	00003517          	auipc	a0,0x3
    80003a70:	70450513          	addi	a0,a0,1796 # 80007170 <CONSOLE_STATUS+0x160>
    80003a74:	00000097          	auipc	ra,0x0
    80003a78:	b1c080e7          	jalr	-1252(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003a7c:	00500313          	li	t1,5
    thread_dispatch();
    80003a80:	ffffe097          	auipc	ra,0xffffe
    80003a84:	c4c080e7          	jalr	-948(ra) # 800016cc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003a88:	01000513          	li	a0,16
    80003a8c:	00000097          	auipc	ra,0x0
    80003a90:	f08080e7          	jalr	-248(ra) # 80003994 <_ZL9fibonaccim>
    80003a94:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003a98:	00003517          	auipc	a0,0x3
    80003a9c:	6e850513          	addi	a0,a0,1768 # 80007180 <CONSOLE_STATUS+0x170>
    80003aa0:	00000097          	auipc	ra,0x0
    80003aa4:	af0080e7          	jalr	-1296(ra) # 80003590 <_Z11printStringPKc>
    80003aa8:	00000613          	li	a2,0
    80003aac:	00a00593          	li	a1,10
    80003ab0:	0009051b          	sext.w	a0,s2
    80003ab4:	00000097          	auipc	ra,0x0
    80003ab8:	c8c080e7          	jalr	-884(ra) # 80003740 <_Z8printIntiii>
    80003abc:	00003517          	auipc	a0,0x3
    80003ac0:	56c50513          	addi	a0,a0,1388 # 80007028 <CONSOLE_STATUS+0x18>
    80003ac4:	00000097          	auipc	ra,0x0
    80003ac8:	acc080e7          	jalr	-1332(ra) # 80003590 <_Z11printStringPKc>
    80003acc:	0400006f          	j	80003b0c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ad0:	00003517          	auipc	a0,0x3
    80003ad4:	69850513          	addi	a0,a0,1688 # 80007168 <CONSOLE_STATUS+0x158>
    80003ad8:	00000097          	auipc	ra,0x0
    80003adc:	ab8080e7          	jalr	-1352(ra) # 80003590 <_Z11printStringPKc>
    80003ae0:	00000613          	li	a2,0
    80003ae4:	00a00593          	li	a1,10
    80003ae8:	00048513          	mv	a0,s1
    80003aec:	00000097          	auipc	ra,0x0
    80003af0:	c54080e7          	jalr	-940(ra) # 80003740 <_Z8printIntiii>
    80003af4:	00003517          	auipc	a0,0x3
    80003af8:	53450513          	addi	a0,a0,1332 # 80007028 <CONSOLE_STATUS+0x18>
    80003afc:	00000097          	auipc	ra,0x0
    80003b00:	a94080e7          	jalr	-1388(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003b04:	0014849b          	addiw	s1,s1,1
    80003b08:	0ff4f493          	andi	s1,s1,255
    80003b0c:	00f00793          	li	a5,15
    80003b10:	fc97f0e3          	bgeu	a5,s1,80003ad0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003b14:	00003517          	auipc	a0,0x3
    80003b18:	67c50513          	addi	a0,a0,1660 # 80007190 <CONSOLE_STATUS+0x180>
    80003b1c:	00000097          	auipc	ra,0x0
    80003b20:	a74080e7          	jalr	-1420(ra) # 80003590 <_Z11printStringPKc>
    finishedD = true;
    80003b24:	00100793          	li	a5,1
    80003b28:	00005717          	auipc	a4,0x5
    80003b2c:	b6f70c23          	sb	a5,-1160(a4) # 800086a0 <_ZL9finishedD>
    thread_dispatch();
    80003b30:	ffffe097          	auipc	ra,0xffffe
    80003b34:	b9c080e7          	jalr	-1124(ra) # 800016cc <_Z15thread_dispatchv>
}
    80003b38:	01813083          	ld	ra,24(sp)
    80003b3c:	01013403          	ld	s0,16(sp)
    80003b40:	00813483          	ld	s1,8(sp)
    80003b44:	00013903          	ld	s2,0(sp)
    80003b48:	02010113          	addi	sp,sp,32
    80003b4c:	00008067          	ret

0000000080003b50 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003b50:	fe010113          	addi	sp,sp,-32
    80003b54:	00113c23          	sd	ra,24(sp)
    80003b58:	00813823          	sd	s0,16(sp)
    80003b5c:	00913423          	sd	s1,8(sp)
    80003b60:	01213023          	sd	s2,0(sp)
    80003b64:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003b68:	00000493          	li	s1,0
    80003b6c:	0400006f          	j	80003bac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003b70:	00003517          	auipc	a0,0x3
    80003b74:	5c850513          	addi	a0,a0,1480 # 80007138 <CONSOLE_STATUS+0x128>
    80003b78:	00000097          	auipc	ra,0x0
    80003b7c:	a18080e7          	jalr	-1512(ra) # 80003590 <_Z11printStringPKc>
    80003b80:	00000613          	li	a2,0
    80003b84:	00a00593          	li	a1,10
    80003b88:	00048513          	mv	a0,s1
    80003b8c:	00000097          	auipc	ra,0x0
    80003b90:	bb4080e7          	jalr	-1100(ra) # 80003740 <_Z8printIntiii>
    80003b94:	00003517          	auipc	a0,0x3
    80003b98:	49450513          	addi	a0,a0,1172 # 80007028 <CONSOLE_STATUS+0x18>
    80003b9c:	00000097          	auipc	ra,0x0
    80003ba0:	9f4080e7          	jalr	-1548(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003ba4:	0014849b          	addiw	s1,s1,1
    80003ba8:	0ff4f493          	andi	s1,s1,255
    80003bac:	00200793          	li	a5,2
    80003bb0:	fc97f0e3          	bgeu	a5,s1,80003b70 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003bb4:	00003517          	auipc	a0,0x3
    80003bb8:	58c50513          	addi	a0,a0,1420 # 80007140 <CONSOLE_STATUS+0x130>
    80003bbc:	00000097          	auipc	ra,0x0
    80003bc0:	9d4080e7          	jalr	-1580(ra) # 80003590 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003bc4:	00700313          	li	t1,7
    thread_dispatch();
    80003bc8:	ffffe097          	auipc	ra,0xffffe
    80003bcc:	b04080e7          	jalr	-1276(ra) # 800016cc <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003bd0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003bd4:	00003517          	auipc	a0,0x3
    80003bd8:	57c50513          	addi	a0,a0,1404 # 80007150 <CONSOLE_STATUS+0x140>
    80003bdc:	00000097          	auipc	ra,0x0
    80003be0:	9b4080e7          	jalr	-1612(ra) # 80003590 <_Z11printStringPKc>
    80003be4:	00000613          	li	a2,0
    80003be8:	00a00593          	li	a1,10
    80003bec:	0009051b          	sext.w	a0,s2
    80003bf0:	00000097          	auipc	ra,0x0
    80003bf4:	b50080e7          	jalr	-1200(ra) # 80003740 <_Z8printIntiii>
    80003bf8:	00003517          	auipc	a0,0x3
    80003bfc:	43050513          	addi	a0,a0,1072 # 80007028 <CONSOLE_STATUS+0x18>
    80003c00:	00000097          	auipc	ra,0x0
    80003c04:	990080e7          	jalr	-1648(ra) # 80003590 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003c08:	00c00513          	li	a0,12
    80003c0c:	00000097          	auipc	ra,0x0
    80003c10:	d88080e7          	jalr	-632(ra) # 80003994 <_ZL9fibonaccim>
    80003c14:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003c18:	00003517          	auipc	a0,0x3
    80003c1c:	54050513          	addi	a0,a0,1344 # 80007158 <CONSOLE_STATUS+0x148>
    80003c20:	00000097          	auipc	ra,0x0
    80003c24:	970080e7          	jalr	-1680(ra) # 80003590 <_Z11printStringPKc>
    80003c28:	00000613          	li	a2,0
    80003c2c:	00a00593          	li	a1,10
    80003c30:	0009051b          	sext.w	a0,s2
    80003c34:	00000097          	auipc	ra,0x0
    80003c38:	b0c080e7          	jalr	-1268(ra) # 80003740 <_Z8printIntiii>
    80003c3c:	00003517          	auipc	a0,0x3
    80003c40:	3ec50513          	addi	a0,a0,1004 # 80007028 <CONSOLE_STATUS+0x18>
    80003c44:	00000097          	auipc	ra,0x0
    80003c48:	94c080e7          	jalr	-1716(ra) # 80003590 <_Z11printStringPKc>
    80003c4c:	0400006f          	j	80003c8c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003c50:	00003517          	auipc	a0,0x3
    80003c54:	4e850513          	addi	a0,a0,1256 # 80007138 <CONSOLE_STATUS+0x128>
    80003c58:	00000097          	auipc	ra,0x0
    80003c5c:	938080e7          	jalr	-1736(ra) # 80003590 <_Z11printStringPKc>
    80003c60:	00000613          	li	a2,0
    80003c64:	00a00593          	li	a1,10
    80003c68:	00048513          	mv	a0,s1
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	ad4080e7          	jalr	-1324(ra) # 80003740 <_Z8printIntiii>
    80003c74:	00003517          	auipc	a0,0x3
    80003c78:	3b450513          	addi	a0,a0,948 # 80007028 <CONSOLE_STATUS+0x18>
    80003c7c:	00000097          	auipc	ra,0x0
    80003c80:	914080e7          	jalr	-1772(ra) # 80003590 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003c84:	0014849b          	addiw	s1,s1,1
    80003c88:	0ff4f493          	andi	s1,s1,255
    80003c8c:	00500793          	li	a5,5
    80003c90:	fc97f0e3          	bgeu	a5,s1,80003c50 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003c94:	00003517          	auipc	a0,0x3
    80003c98:	47c50513          	addi	a0,a0,1148 # 80007110 <CONSOLE_STATUS+0x100>
    80003c9c:	00000097          	auipc	ra,0x0
    80003ca0:	8f4080e7          	jalr	-1804(ra) # 80003590 <_Z11printStringPKc>
    finishedC = true;
    80003ca4:	00100793          	li	a5,1
    80003ca8:	00005717          	auipc	a4,0x5
    80003cac:	9ef70ca3          	sb	a5,-1543(a4) # 800086a1 <_ZL9finishedC>
    thread_dispatch();
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	a1c080e7          	jalr	-1508(ra) # 800016cc <_Z15thread_dispatchv>
}
    80003cb8:	01813083          	ld	ra,24(sp)
    80003cbc:	01013403          	ld	s0,16(sp)
    80003cc0:	00813483          	ld	s1,8(sp)
    80003cc4:	00013903          	ld	s2,0(sp)
    80003cc8:	02010113          	addi	sp,sp,32
    80003ccc:	00008067          	ret

0000000080003cd0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003cd0:	fe010113          	addi	sp,sp,-32
    80003cd4:	00113c23          	sd	ra,24(sp)
    80003cd8:	00813823          	sd	s0,16(sp)
    80003cdc:	00913423          	sd	s1,8(sp)
    80003ce0:	01213023          	sd	s2,0(sp)
    80003ce4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003ce8:	00000913          	li	s2,0
    80003cec:	0400006f          	j	80003d2c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80003cf0:	ffffe097          	auipc	ra,0xffffe
    80003cf4:	9dc080e7          	jalr	-1572(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cf8:	00148493          	addi	s1,s1,1
    80003cfc:	000027b7          	lui	a5,0x2
    80003d00:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d04:	0097ee63          	bltu	a5,s1,80003d20 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d08:	00000713          	li	a4,0
    80003d0c:	000077b7          	lui	a5,0x7
    80003d10:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003d14:	fce7eee3          	bltu	a5,a4,80003cf0 <_ZL11workerBodyBPv+0x20>
    80003d18:	00170713          	addi	a4,a4,1
    80003d1c:	ff1ff06f          	j	80003d0c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80003d20:	00a00793          	li	a5,10
    80003d24:	04f90663          	beq	s2,a5,80003d70 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80003d28:	00190913          	addi	s2,s2,1
    80003d2c:	00f00793          	li	a5,15
    80003d30:	0527e463          	bltu	a5,s2,80003d78 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80003d34:	00003517          	auipc	a0,0x3
    80003d38:	3ec50513          	addi	a0,a0,1004 # 80007120 <CONSOLE_STATUS+0x110>
    80003d3c:	00000097          	auipc	ra,0x0
    80003d40:	854080e7          	jalr	-1964(ra) # 80003590 <_Z11printStringPKc>
    80003d44:	00000613          	li	a2,0
    80003d48:	00a00593          	li	a1,10
    80003d4c:	0009051b          	sext.w	a0,s2
    80003d50:	00000097          	auipc	ra,0x0
    80003d54:	9f0080e7          	jalr	-1552(ra) # 80003740 <_Z8printIntiii>
    80003d58:	00003517          	auipc	a0,0x3
    80003d5c:	2d050513          	addi	a0,a0,720 # 80007028 <CONSOLE_STATUS+0x18>
    80003d60:	00000097          	auipc	ra,0x0
    80003d64:	830080e7          	jalr	-2000(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d68:	00000493          	li	s1,0
    80003d6c:	f91ff06f          	j	80003cfc <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80003d70:	14102ff3          	csrr	t6,sepc
    80003d74:	fb5ff06f          	j	80003d28 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80003d78:	00003517          	auipc	a0,0x3
    80003d7c:	3b050513          	addi	a0,a0,944 # 80007128 <CONSOLE_STATUS+0x118>
    80003d80:	00000097          	auipc	ra,0x0
    80003d84:	810080e7          	jalr	-2032(ra) # 80003590 <_Z11printStringPKc>
    finishedB = true;
    80003d88:	00100793          	li	a5,1
    80003d8c:	00005717          	auipc	a4,0x5
    80003d90:	90f70b23          	sb	a5,-1770(a4) # 800086a2 <_ZL9finishedB>
    thread_dispatch();
    80003d94:	ffffe097          	auipc	ra,0xffffe
    80003d98:	938080e7          	jalr	-1736(ra) # 800016cc <_Z15thread_dispatchv>
}
    80003d9c:	01813083          	ld	ra,24(sp)
    80003da0:	01013403          	ld	s0,16(sp)
    80003da4:	00813483          	ld	s1,8(sp)
    80003da8:	00013903          	ld	s2,0(sp)
    80003dac:	02010113          	addi	sp,sp,32
    80003db0:	00008067          	ret

0000000080003db4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003db4:	fe010113          	addi	sp,sp,-32
    80003db8:	00113c23          	sd	ra,24(sp)
    80003dbc:	00813823          	sd	s0,16(sp)
    80003dc0:	00913423          	sd	s1,8(sp)
    80003dc4:	01213023          	sd	s2,0(sp)
    80003dc8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003dcc:	00000913          	li	s2,0
    80003dd0:	0380006f          	j	80003e08 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003dd4:	ffffe097          	auipc	ra,0xffffe
    80003dd8:	8f8080e7          	jalr	-1800(ra) # 800016cc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ddc:	00148493          	addi	s1,s1,1
    80003de0:	000027b7          	lui	a5,0x2
    80003de4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003de8:	0097ee63          	bltu	a5,s1,80003e04 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003dec:	00000713          	li	a4,0
    80003df0:	000077b7          	lui	a5,0x7
    80003df4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003df8:	fce7eee3          	bltu	a5,a4,80003dd4 <_ZL11workerBodyAPv+0x20>
    80003dfc:	00170713          	addi	a4,a4,1
    80003e00:	ff1ff06f          	j	80003df0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003e04:	00190913          	addi	s2,s2,1
    80003e08:	00900793          	li	a5,9
    80003e0c:	0527e063          	bltu	a5,s2,80003e4c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003e10:	00003517          	auipc	a0,0x3
    80003e14:	2f850513          	addi	a0,a0,760 # 80007108 <CONSOLE_STATUS+0xf8>
    80003e18:	fffff097          	auipc	ra,0xfffff
    80003e1c:	778080e7          	jalr	1912(ra) # 80003590 <_Z11printStringPKc>
    80003e20:	00000613          	li	a2,0
    80003e24:	00a00593          	li	a1,10
    80003e28:	0009051b          	sext.w	a0,s2
    80003e2c:	00000097          	auipc	ra,0x0
    80003e30:	914080e7          	jalr	-1772(ra) # 80003740 <_Z8printIntiii>
    80003e34:	00003517          	auipc	a0,0x3
    80003e38:	1f450513          	addi	a0,a0,500 # 80007028 <CONSOLE_STATUS+0x18>
    80003e3c:	fffff097          	auipc	ra,0xfffff
    80003e40:	754080e7          	jalr	1876(ra) # 80003590 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e44:	00000493          	li	s1,0
    80003e48:	f99ff06f          	j	80003de0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003e4c:	00003517          	auipc	a0,0x3
    80003e50:	2c450513          	addi	a0,a0,708 # 80007110 <CONSOLE_STATUS+0x100>
    80003e54:	fffff097          	auipc	ra,0xfffff
    80003e58:	73c080e7          	jalr	1852(ra) # 80003590 <_Z11printStringPKc>
    finishedA = true;
    80003e5c:	00100793          	li	a5,1
    80003e60:	00005717          	auipc	a4,0x5
    80003e64:	84f701a3          	sb	a5,-1981(a4) # 800086a3 <_ZL9finishedA>
}
    80003e68:	01813083          	ld	ra,24(sp)
    80003e6c:	01013403          	ld	s0,16(sp)
    80003e70:	00813483          	ld	s1,8(sp)
    80003e74:	00013903          	ld	s2,0(sp)
    80003e78:	02010113          	addi	sp,sp,32
    80003e7c:	00008067          	ret

0000000080003e80 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80003e80:	fd010113          	addi	sp,sp,-48
    80003e84:	02113423          	sd	ra,40(sp)
    80003e88:	02813023          	sd	s0,32(sp)
    80003e8c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003e90:	00000613          	li	a2,0
    80003e94:	00000597          	auipc	a1,0x0
    80003e98:	f2058593          	addi	a1,a1,-224 # 80003db4 <_ZL11workerBodyAPv>
    80003e9c:	fd040513          	addi	a0,s0,-48
    80003ea0:	ffffd097          	auipc	ra,0xffffd
    80003ea4:	784080e7          	jalr	1924(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003ea8:	00003517          	auipc	a0,0x3
    80003eac:	2f850513          	addi	a0,a0,760 # 800071a0 <CONSOLE_STATUS+0x190>
    80003eb0:	fffff097          	auipc	ra,0xfffff
    80003eb4:	6e0080e7          	jalr	1760(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003eb8:	00000613          	li	a2,0
    80003ebc:	00000597          	auipc	a1,0x0
    80003ec0:	e1458593          	addi	a1,a1,-492 # 80003cd0 <_ZL11workerBodyBPv>
    80003ec4:	fd840513          	addi	a0,s0,-40
    80003ec8:	ffffd097          	auipc	ra,0xffffd
    80003ecc:	75c080e7          	jalr	1884(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003ed0:	00003517          	auipc	a0,0x3
    80003ed4:	2e850513          	addi	a0,a0,744 # 800071b8 <CONSOLE_STATUS+0x1a8>
    80003ed8:	fffff097          	auipc	ra,0xfffff
    80003edc:	6b8080e7          	jalr	1720(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003ee0:	00000613          	li	a2,0
    80003ee4:	00000597          	auipc	a1,0x0
    80003ee8:	c6c58593          	addi	a1,a1,-916 # 80003b50 <_ZL11workerBodyCPv>
    80003eec:	fe040513          	addi	a0,s0,-32
    80003ef0:	ffffd097          	auipc	ra,0xffffd
    80003ef4:	734080e7          	jalr	1844(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003ef8:	00003517          	auipc	a0,0x3
    80003efc:	2d850513          	addi	a0,a0,728 # 800071d0 <CONSOLE_STATUS+0x1c0>
    80003f00:	fffff097          	auipc	ra,0xfffff
    80003f04:	690080e7          	jalr	1680(ra) # 80003590 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003f08:	00000613          	li	a2,0
    80003f0c:	00000597          	auipc	a1,0x0
    80003f10:	afc58593          	addi	a1,a1,-1284 # 80003a08 <_ZL11workerBodyDPv>
    80003f14:	fe840513          	addi	a0,s0,-24
    80003f18:	ffffd097          	auipc	ra,0xffffd
    80003f1c:	70c080e7          	jalr	1804(ra) # 80001624 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003f20:	00003517          	auipc	a0,0x3
    80003f24:	2c850513          	addi	a0,a0,712 # 800071e8 <CONSOLE_STATUS+0x1d8>
    80003f28:	fffff097          	auipc	ra,0xfffff
    80003f2c:	668080e7          	jalr	1640(ra) # 80003590 <_Z11printStringPKc>
    80003f30:	00c0006f          	j	80003f3c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003f34:	ffffd097          	auipc	ra,0xffffd
    80003f38:	798080e7          	jalr	1944(ra) # 800016cc <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003f3c:	00004797          	auipc	a5,0x4
    80003f40:	7677c783          	lbu	a5,1895(a5) # 800086a3 <_ZL9finishedA>
    80003f44:	fe0788e3          	beqz	a5,80003f34 <_Z16System_Mode_testv+0xb4>
    80003f48:	00004797          	auipc	a5,0x4
    80003f4c:	75a7c783          	lbu	a5,1882(a5) # 800086a2 <_ZL9finishedB>
    80003f50:	fe0782e3          	beqz	a5,80003f34 <_Z16System_Mode_testv+0xb4>
    80003f54:	00004797          	auipc	a5,0x4
    80003f58:	74d7c783          	lbu	a5,1869(a5) # 800086a1 <_ZL9finishedC>
    80003f5c:	fc078ce3          	beqz	a5,80003f34 <_Z16System_Mode_testv+0xb4>
    80003f60:	00004797          	auipc	a5,0x4
    80003f64:	7407c783          	lbu	a5,1856(a5) # 800086a0 <_ZL9finishedD>
    80003f68:	fc0786e3          	beqz	a5,80003f34 <_Z16System_Mode_testv+0xb4>
    }

}
    80003f6c:	02813083          	ld	ra,40(sp)
    80003f70:	02013403          	ld	s0,32(sp)
    80003f74:	03010113          	addi	sp,sp,48
    80003f78:	00008067          	ret

0000000080003f7c <start>:
    80003f7c:	ff010113          	addi	sp,sp,-16
    80003f80:	00813423          	sd	s0,8(sp)
    80003f84:	01010413          	addi	s0,sp,16
    80003f88:	300027f3          	csrr	a5,mstatus
    80003f8c:	ffffe737          	lui	a4,0xffffe
    80003f90:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff4eef>
    80003f94:	00e7f7b3          	and	a5,a5,a4
    80003f98:	00001737          	lui	a4,0x1
    80003f9c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003fa0:	00e7e7b3          	or	a5,a5,a4
    80003fa4:	30079073          	csrw	mstatus,a5
    80003fa8:	00000797          	auipc	a5,0x0
    80003fac:	16078793          	addi	a5,a5,352 # 80004108 <system_main>
    80003fb0:	34179073          	csrw	mepc,a5
    80003fb4:	00000793          	li	a5,0
    80003fb8:	18079073          	csrw	satp,a5
    80003fbc:	000107b7          	lui	a5,0x10
    80003fc0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003fc4:	30279073          	csrw	medeleg,a5
    80003fc8:	30379073          	csrw	mideleg,a5
    80003fcc:	104027f3          	csrr	a5,sie
    80003fd0:	2227e793          	ori	a5,a5,546
    80003fd4:	10479073          	csrw	sie,a5
    80003fd8:	fff00793          	li	a5,-1
    80003fdc:	00a7d793          	srli	a5,a5,0xa
    80003fe0:	3b079073          	csrw	pmpaddr0,a5
    80003fe4:	00f00793          	li	a5,15
    80003fe8:	3a079073          	csrw	pmpcfg0,a5
    80003fec:	f14027f3          	csrr	a5,mhartid
    80003ff0:	0200c737          	lui	a4,0x200c
    80003ff4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003ff8:	0007869b          	sext.w	a3,a5
    80003ffc:	00269713          	slli	a4,a3,0x2
    80004000:	000f4637          	lui	a2,0xf4
    80004004:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004008:	00d70733          	add	a4,a4,a3
    8000400c:	0037979b          	slliw	a5,a5,0x3
    80004010:	020046b7          	lui	a3,0x2004
    80004014:	00d787b3          	add	a5,a5,a3
    80004018:	00c585b3          	add	a1,a1,a2
    8000401c:	00371693          	slli	a3,a4,0x3
    80004020:	00004717          	auipc	a4,0x4
    80004024:	69070713          	addi	a4,a4,1680 # 800086b0 <timer_scratch>
    80004028:	00b7b023          	sd	a1,0(a5)
    8000402c:	00d70733          	add	a4,a4,a3
    80004030:	00f73c23          	sd	a5,24(a4)
    80004034:	02c73023          	sd	a2,32(a4)
    80004038:	34071073          	csrw	mscratch,a4
    8000403c:	00000797          	auipc	a5,0x0
    80004040:	6e478793          	addi	a5,a5,1764 # 80004720 <timervec>
    80004044:	30579073          	csrw	mtvec,a5
    80004048:	300027f3          	csrr	a5,mstatus
    8000404c:	0087e793          	ori	a5,a5,8
    80004050:	30079073          	csrw	mstatus,a5
    80004054:	304027f3          	csrr	a5,mie
    80004058:	0807e793          	ori	a5,a5,128
    8000405c:	30479073          	csrw	mie,a5
    80004060:	f14027f3          	csrr	a5,mhartid
    80004064:	0007879b          	sext.w	a5,a5
    80004068:	00078213          	mv	tp,a5
    8000406c:	30200073          	mret
    80004070:	00813403          	ld	s0,8(sp)
    80004074:	01010113          	addi	sp,sp,16
    80004078:	00008067          	ret

000000008000407c <timerinit>:
    8000407c:	ff010113          	addi	sp,sp,-16
    80004080:	00813423          	sd	s0,8(sp)
    80004084:	01010413          	addi	s0,sp,16
    80004088:	f14027f3          	csrr	a5,mhartid
    8000408c:	0200c737          	lui	a4,0x200c
    80004090:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004094:	0007869b          	sext.w	a3,a5
    80004098:	00269713          	slli	a4,a3,0x2
    8000409c:	000f4637          	lui	a2,0xf4
    800040a0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800040a4:	00d70733          	add	a4,a4,a3
    800040a8:	0037979b          	slliw	a5,a5,0x3
    800040ac:	020046b7          	lui	a3,0x2004
    800040b0:	00d787b3          	add	a5,a5,a3
    800040b4:	00c585b3          	add	a1,a1,a2
    800040b8:	00371693          	slli	a3,a4,0x3
    800040bc:	00004717          	auipc	a4,0x4
    800040c0:	5f470713          	addi	a4,a4,1524 # 800086b0 <timer_scratch>
    800040c4:	00b7b023          	sd	a1,0(a5)
    800040c8:	00d70733          	add	a4,a4,a3
    800040cc:	00f73c23          	sd	a5,24(a4)
    800040d0:	02c73023          	sd	a2,32(a4)
    800040d4:	34071073          	csrw	mscratch,a4
    800040d8:	00000797          	auipc	a5,0x0
    800040dc:	64878793          	addi	a5,a5,1608 # 80004720 <timervec>
    800040e0:	30579073          	csrw	mtvec,a5
    800040e4:	300027f3          	csrr	a5,mstatus
    800040e8:	0087e793          	ori	a5,a5,8
    800040ec:	30079073          	csrw	mstatus,a5
    800040f0:	304027f3          	csrr	a5,mie
    800040f4:	0807e793          	ori	a5,a5,128
    800040f8:	30479073          	csrw	mie,a5
    800040fc:	00813403          	ld	s0,8(sp)
    80004100:	01010113          	addi	sp,sp,16
    80004104:	00008067          	ret

0000000080004108 <system_main>:
    80004108:	fe010113          	addi	sp,sp,-32
    8000410c:	00813823          	sd	s0,16(sp)
    80004110:	00913423          	sd	s1,8(sp)
    80004114:	00113c23          	sd	ra,24(sp)
    80004118:	02010413          	addi	s0,sp,32
    8000411c:	00000097          	auipc	ra,0x0
    80004120:	0c4080e7          	jalr	196(ra) # 800041e0 <cpuid>
    80004124:	00004497          	auipc	s1,0x4
    80004128:	50c48493          	addi	s1,s1,1292 # 80008630 <started>
    8000412c:	02050263          	beqz	a0,80004150 <system_main+0x48>
    80004130:	0004a783          	lw	a5,0(s1)
    80004134:	0007879b          	sext.w	a5,a5
    80004138:	fe078ce3          	beqz	a5,80004130 <system_main+0x28>
    8000413c:	0ff0000f          	fence
    80004140:	00003517          	auipc	a0,0x3
    80004144:	29050513          	addi	a0,a0,656 # 800073d0 <CONSOLE_STATUS+0x3c0>
    80004148:	00001097          	auipc	ra,0x1
    8000414c:	a74080e7          	jalr	-1420(ra) # 80004bbc <panic>
    80004150:	00001097          	auipc	ra,0x1
    80004154:	9c8080e7          	jalr	-1592(ra) # 80004b18 <consoleinit>
    80004158:	00001097          	auipc	ra,0x1
    8000415c:	154080e7          	jalr	340(ra) # 800052ac <printfinit>
    80004160:	00003517          	auipc	a0,0x3
    80004164:	ec850513          	addi	a0,a0,-312 # 80007028 <CONSOLE_STATUS+0x18>
    80004168:	00001097          	auipc	ra,0x1
    8000416c:	ab0080e7          	jalr	-1360(ra) # 80004c18 <__printf>
    80004170:	00003517          	auipc	a0,0x3
    80004174:	23050513          	addi	a0,a0,560 # 800073a0 <CONSOLE_STATUS+0x390>
    80004178:	00001097          	auipc	ra,0x1
    8000417c:	aa0080e7          	jalr	-1376(ra) # 80004c18 <__printf>
    80004180:	00003517          	auipc	a0,0x3
    80004184:	ea850513          	addi	a0,a0,-344 # 80007028 <CONSOLE_STATUS+0x18>
    80004188:	00001097          	auipc	ra,0x1
    8000418c:	a90080e7          	jalr	-1392(ra) # 80004c18 <__printf>
    80004190:	00001097          	auipc	ra,0x1
    80004194:	4a8080e7          	jalr	1192(ra) # 80005638 <kinit>
    80004198:	00000097          	auipc	ra,0x0
    8000419c:	148080e7          	jalr	328(ra) # 800042e0 <trapinit>
    800041a0:	00000097          	auipc	ra,0x0
    800041a4:	16c080e7          	jalr	364(ra) # 8000430c <trapinithart>
    800041a8:	00000097          	auipc	ra,0x0
    800041ac:	5b8080e7          	jalr	1464(ra) # 80004760 <plicinit>
    800041b0:	00000097          	auipc	ra,0x0
    800041b4:	5d8080e7          	jalr	1496(ra) # 80004788 <plicinithart>
    800041b8:	00000097          	auipc	ra,0x0
    800041bc:	078080e7          	jalr	120(ra) # 80004230 <userinit>
    800041c0:	0ff0000f          	fence
    800041c4:	00100793          	li	a5,1
    800041c8:	00003517          	auipc	a0,0x3
    800041cc:	1f050513          	addi	a0,a0,496 # 800073b8 <CONSOLE_STATUS+0x3a8>
    800041d0:	00f4a023          	sw	a5,0(s1)
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	a44080e7          	jalr	-1468(ra) # 80004c18 <__printf>
    800041dc:	0000006f          	j	800041dc <system_main+0xd4>

00000000800041e0 <cpuid>:
    800041e0:	ff010113          	addi	sp,sp,-16
    800041e4:	00813423          	sd	s0,8(sp)
    800041e8:	01010413          	addi	s0,sp,16
    800041ec:	00020513          	mv	a0,tp
    800041f0:	00813403          	ld	s0,8(sp)
    800041f4:	0005051b          	sext.w	a0,a0
    800041f8:	01010113          	addi	sp,sp,16
    800041fc:	00008067          	ret

0000000080004200 <mycpu>:
    80004200:	ff010113          	addi	sp,sp,-16
    80004204:	00813423          	sd	s0,8(sp)
    80004208:	01010413          	addi	s0,sp,16
    8000420c:	00020793          	mv	a5,tp
    80004210:	00813403          	ld	s0,8(sp)
    80004214:	0007879b          	sext.w	a5,a5
    80004218:	00779793          	slli	a5,a5,0x7
    8000421c:	00005517          	auipc	a0,0x5
    80004220:	4c450513          	addi	a0,a0,1220 # 800096e0 <cpus>
    80004224:	00f50533          	add	a0,a0,a5
    80004228:	01010113          	addi	sp,sp,16
    8000422c:	00008067          	ret

0000000080004230 <userinit>:
    80004230:	ff010113          	addi	sp,sp,-16
    80004234:	00813423          	sd	s0,8(sp)
    80004238:	01010413          	addi	s0,sp,16
    8000423c:	00813403          	ld	s0,8(sp)
    80004240:	01010113          	addi	sp,sp,16
    80004244:	ffffd317          	auipc	t1,0xffffd
    80004248:	6b030067          	jr	1712(t1) # 800018f4 <main>

000000008000424c <either_copyout>:
    8000424c:	ff010113          	addi	sp,sp,-16
    80004250:	00813023          	sd	s0,0(sp)
    80004254:	00113423          	sd	ra,8(sp)
    80004258:	01010413          	addi	s0,sp,16
    8000425c:	02051663          	bnez	a0,80004288 <either_copyout+0x3c>
    80004260:	00058513          	mv	a0,a1
    80004264:	00060593          	mv	a1,a2
    80004268:	0006861b          	sext.w	a2,a3
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	c58080e7          	jalr	-936(ra) # 80005ec4 <__memmove>
    80004274:	00813083          	ld	ra,8(sp)
    80004278:	00013403          	ld	s0,0(sp)
    8000427c:	00000513          	li	a0,0
    80004280:	01010113          	addi	sp,sp,16
    80004284:	00008067          	ret
    80004288:	00003517          	auipc	a0,0x3
    8000428c:	17050513          	addi	a0,a0,368 # 800073f8 <CONSOLE_STATUS+0x3e8>
    80004290:	00001097          	auipc	ra,0x1
    80004294:	92c080e7          	jalr	-1748(ra) # 80004bbc <panic>

0000000080004298 <either_copyin>:
    80004298:	ff010113          	addi	sp,sp,-16
    8000429c:	00813023          	sd	s0,0(sp)
    800042a0:	00113423          	sd	ra,8(sp)
    800042a4:	01010413          	addi	s0,sp,16
    800042a8:	02059463          	bnez	a1,800042d0 <either_copyin+0x38>
    800042ac:	00060593          	mv	a1,a2
    800042b0:	0006861b          	sext.w	a2,a3
    800042b4:	00002097          	auipc	ra,0x2
    800042b8:	c10080e7          	jalr	-1008(ra) # 80005ec4 <__memmove>
    800042bc:	00813083          	ld	ra,8(sp)
    800042c0:	00013403          	ld	s0,0(sp)
    800042c4:	00000513          	li	a0,0
    800042c8:	01010113          	addi	sp,sp,16
    800042cc:	00008067          	ret
    800042d0:	00003517          	auipc	a0,0x3
    800042d4:	15050513          	addi	a0,a0,336 # 80007420 <CONSOLE_STATUS+0x410>
    800042d8:	00001097          	auipc	ra,0x1
    800042dc:	8e4080e7          	jalr	-1820(ra) # 80004bbc <panic>

00000000800042e0 <trapinit>:
    800042e0:	ff010113          	addi	sp,sp,-16
    800042e4:	00813423          	sd	s0,8(sp)
    800042e8:	01010413          	addi	s0,sp,16
    800042ec:	00813403          	ld	s0,8(sp)
    800042f0:	00003597          	auipc	a1,0x3
    800042f4:	15858593          	addi	a1,a1,344 # 80007448 <CONSOLE_STATUS+0x438>
    800042f8:	00005517          	auipc	a0,0x5
    800042fc:	46850513          	addi	a0,a0,1128 # 80009760 <tickslock>
    80004300:	01010113          	addi	sp,sp,16
    80004304:	00001317          	auipc	t1,0x1
    80004308:	5c430067          	jr	1476(t1) # 800058c8 <initlock>

000000008000430c <trapinithart>:
    8000430c:	ff010113          	addi	sp,sp,-16
    80004310:	00813423          	sd	s0,8(sp)
    80004314:	01010413          	addi	s0,sp,16
    80004318:	00000797          	auipc	a5,0x0
    8000431c:	2f878793          	addi	a5,a5,760 # 80004610 <kernelvec>
    80004320:	10579073          	csrw	stvec,a5
    80004324:	00813403          	ld	s0,8(sp)
    80004328:	01010113          	addi	sp,sp,16
    8000432c:	00008067          	ret

0000000080004330 <usertrap>:
    80004330:	ff010113          	addi	sp,sp,-16
    80004334:	00813423          	sd	s0,8(sp)
    80004338:	01010413          	addi	s0,sp,16
    8000433c:	00813403          	ld	s0,8(sp)
    80004340:	01010113          	addi	sp,sp,16
    80004344:	00008067          	ret

0000000080004348 <usertrapret>:
    80004348:	ff010113          	addi	sp,sp,-16
    8000434c:	00813423          	sd	s0,8(sp)
    80004350:	01010413          	addi	s0,sp,16
    80004354:	00813403          	ld	s0,8(sp)
    80004358:	01010113          	addi	sp,sp,16
    8000435c:	00008067          	ret

0000000080004360 <kerneltrap>:
    80004360:	fe010113          	addi	sp,sp,-32
    80004364:	00813823          	sd	s0,16(sp)
    80004368:	00113c23          	sd	ra,24(sp)
    8000436c:	00913423          	sd	s1,8(sp)
    80004370:	02010413          	addi	s0,sp,32
    80004374:	142025f3          	csrr	a1,scause
    80004378:	100027f3          	csrr	a5,sstatus
    8000437c:	0027f793          	andi	a5,a5,2
    80004380:	10079c63          	bnez	a5,80004498 <kerneltrap+0x138>
    80004384:	142027f3          	csrr	a5,scause
    80004388:	0207ce63          	bltz	a5,800043c4 <kerneltrap+0x64>
    8000438c:	00003517          	auipc	a0,0x3
    80004390:	10450513          	addi	a0,a0,260 # 80007490 <CONSOLE_STATUS+0x480>
    80004394:	00001097          	auipc	ra,0x1
    80004398:	884080e7          	jalr	-1916(ra) # 80004c18 <__printf>
    8000439c:	141025f3          	csrr	a1,sepc
    800043a0:	14302673          	csrr	a2,stval
    800043a4:	00003517          	auipc	a0,0x3
    800043a8:	0fc50513          	addi	a0,a0,252 # 800074a0 <CONSOLE_STATUS+0x490>
    800043ac:	00001097          	auipc	ra,0x1
    800043b0:	86c080e7          	jalr	-1940(ra) # 80004c18 <__printf>
    800043b4:	00003517          	auipc	a0,0x3
    800043b8:	10450513          	addi	a0,a0,260 # 800074b8 <CONSOLE_STATUS+0x4a8>
    800043bc:	00001097          	auipc	ra,0x1
    800043c0:	800080e7          	jalr	-2048(ra) # 80004bbc <panic>
    800043c4:	0ff7f713          	andi	a4,a5,255
    800043c8:	00900693          	li	a3,9
    800043cc:	04d70063          	beq	a4,a3,8000440c <kerneltrap+0xac>
    800043d0:	fff00713          	li	a4,-1
    800043d4:	03f71713          	slli	a4,a4,0x3f
    800043d8:	00170713          	addi	a4,a4,1
    800043dc:	fae798e3          	bne	a5,a4,8000438c <kerneltrap+0x2c>
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	e00080e7          	jalr	-512(ra) # 800041e0 <cpuid>
    800043e8:	06050663          	beqz	a0,80004454 <kerneltrap+0xf4>
    800043ec:	144027f3          	csrr	a5,sip
    800043f0:	ffd7f793          	andi	a5,a5,-3
    800043f4:	14479073          	csrw	sip,a5
    800043f8:	01813083          	ld	ra,24(sp)
    800043fc:	01013403          	ld	s0,16(sp)
    80004400:	00813483          	ld	s1,8(sp)
    80004404:	02010113          	addi	sp,sp,32
    80004408:	00008067          	ret
    8000440c:	00000097          	auipc	ra,0x0
    80004410:	3c8080e7          	jalr	968(ra) # 800047d4 <plic_claim>
    80004414:	00a00793          	li	a5,10
    80004418:	00050493          	mv	s1,a0
    8000441c:	06f50863          	beq	a0,a5,8000448c <kerneltrap+0x12c>
    80004420:	fc050ce3          	beqz	a0,800043f8 <kerneltrap+0x98>
    80004424:	00050593          	mv	a1,a0
    80004428:	00003517          	auipc	a0,0x3
    8000442c:	04850513          	addi	a0,a0,72 # 80007470 <CONSOLE_STATUS+0x460>
    80004430:	00000097          	auipc	ra,0x0
    80004434:	7e8080e7          	jalr	2024(ra) # 80004c18 <__printf>
    80004438:	01013403          	ld	s0,16(sp)
    8000443c:	01813083          	ld	ra,24(sp)
    80004440:	00048513          	mv	a0,s1
    80004444:	00813483          	ld	s1,8(sp)
    80004448:	02010113          	addi	sp,sp,32
    8000444c:	00000317          	auipc	t1,0x0
    80004450:	3c030067          	jr	960(t1) # 8000480c <plic_complete>
    80004454:	00005517          	auipc	a0,0x5
    80004458:	30c50513          	addi	a0,a0,780 # 80009760 <tickslock>
    8000445c:	00001097          	auipc	ra,0x1
    80004460:	490080e7          	jalr	1168(ra) # 800058ec <acquire>
    80004464:	00004717          	auipc	a4,0x4
    80004468:	1d070713          	addi	a4,a4,464 # 80008634 <ticks>
    8000446c:	00072783          	lw	a5,0(a4)
    80004470:	00005517          	auipc	a0,0x5
    80004474:	2f050513          	addi	a0,a0,752 # 80009760 <tickslock>
    80004478:	0017879b          	addiw	a5,a5,1
    8000447c:	00f72023          	sw	a5,0(a4)
    80004480:	00001097          	auipc	ra,0x1
    80004484:	538080e7          	jalr	1336(ra) # 800059b8 <release>
    80004488:	f65ff06f          	j	800043ec <kerneltrap+0x8c>
    8000448c:	00001097          	auipc	ra,0x1
    80004490:	094080e7          	jalr	148(ra) # 80005520 <uartintr>
    80004494:	fa5ff06f          	j	80004438 <kerneltrap+0xd8>
    80004498:	00003517          	auipc	a0,0x3
    8000449c:	fb850513          	addi	a0,a0,-72 # 80007450 <CONSOLE_STATUS+0x440>
    800044a0:	00000097          	auipc	ra,0x0
    800044a4:	71c080e7          	jalr	1820(ra) # 80004bbc <panic>

00000000800044a8 <clockintr>:
    800044a8:	fe010113          	addi	sp,sp,-32
    800044ac:	00813823          	sd	s0,16(sp)
    800044b0:	00913423          	sd	s1,8(sp)
    800044b4:	00113c23          	sd	ra,24(sp)
    800044b8:	02010413          	addi	s0,sp,32
    800044bc:	00005497          	auipc	s1,0x5
    800044c0:	2a448493          	addi	s1,s1,676 # 80009760 <tickslock>
    800044c4:	00048513          	mv	a0,s1
    800044c8:	00001097          	auipc	ra,0x1
    800044cc:	424080e7          	jalr	1060(ra) # 800058ec <acquire>
    800044d0:	00004717          	auipc	a4,0x4
    800044d4:	16470713          	addi	a4,a4,356 # 80008634 <ticks>
    800044d8:	00072783          	lw	a5,0(a4)
    800044dc:	01013403          	ld	s0,16(sp)
    800044e0:	01813083          	ld	ra,24(sp)
    800044e4:	00048513          	mv	a0,s1
    800044e8:	0017879b          	addiw	a5,a5,1
    800044ec:	00813483          	ld	s1,8(sp)
    800044f0:	00f72023          	sw	a5,0(a4)
    800044f4:	02010113          	addi	sp,sp,32
    800044f8:	00001317          	auipc	t1,0x1
    800044fc:	4c030067          	jr	1216(t1) # 800059b8 <release>

0000000080004500 <devintr>:
    80004500:	142027f3          	csrr	a5,scause
    80004504:	00000513          	li	a0,0
    80004508:	0007c463          	bltz	a5,80004510 <devintr+0x10>
    8000450c:	00008067          	ret
    80004510:	fe010113          	addi	sp,sp,-32
    80004514:	00813823          	sd	s0,16(sp)
    80004518:	00113c23          	sd	ra,24(sp)
    8000451c:	00913423          	sd	s1,8(sp)
    80004520:	02010413          	addi	s0,sp,32
    80004524:	0ff7f713          	andi	a4,a5,255
    80004528:	00900693          	li	a3,9
    8000452c:	04d70c63          	beq	a4,a3,80004584 <devintr+0x84>
    80004530:	fff00713          	li	a4,-1
    80004534:	03f71713          	slli	a4,a4,0x3f
    80004538:	00170713          	addi	a4,a4,1
    8000453c:	00e78c63          	beq	a5,a4,80004554 <devintr+0x54>
    80004540:	01813083          	ld	ra,24(sp)
    80004544:	01013403          	ld	s0,16(sp)
    80004548:	00813483          	ld	s1,8(sp)
    8000454c:	02010113          	addi	sp,sp,32
    80004550:	00008067          	ret
    80004554:	00000097          	auipc	ra,0x0
    80004558:	c8c080e7          	jalr	-884(ra) # 800041e0 <cpuid>
    8000455c:	06050663          	beqz	a0,800045c8 <devintr+0xc8>
    80004560:	144027f3          	csrr	a5,sip
    80004564:	ffd7f793          	andi	a5,a5,-3
    80004568:	14479073          	csrw	sip,a5
    8000456c:	01813083          	ld	ra,24(sp)
    80004570:	01013403          	ld	s0,16(sp)
    80004574:	00813483          	ld	s1,8(sp)
    80004578:	00200513          	li	a0,2
    8000457c:	02010113          	addi	sp,sp,32
    80004580:	00008067          	ret
    80004584:	00000097          	auipc	ra,0x0
    80004588:	250080e7          	jalr	592(ra) # 800047d4 <plic_claim>
    8000458c:	00a00793          	li	a5,10
    80004590:	00050493          	mv	s1,a0
    80004594:	06f50663          	beq	a0,a5,80004600 <devintr+0x100>
    80004598:	00100513          	li	a0,1
    8000459c:	fa0482e3          	beqz	s1,80004540 <devintr+0x40>
    800045a0:	00048593          	mv	a1,s1
    800045a4:	00003517          	auipc	a0,0x3
    800045a8:	ecc50513          	addi	a0,a0,-308 # 80007470 <CONSOLE_STATUS+0x460>
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	66c080e7          	jalr	1644(ra) # 80004c18 <__printf>
    800045b4:	00048513          	mv	a0,s1
    800045b8:	00000097          	auipc	ra,0x0
    800045bc:	254080e7          	jalr	596(ra) # 8000480c <plic_complete>
    800045c0:	00100513          	li	a0,1
    800045c4:	f7dff06f          	j	80004540 <devintr+0x40>
    800045c8:	00005517          	auipc	a0,0x5
    800045cc:	19850513          	addi	a0,a0,408 # 80009760 <tickslock>
    800045d0:	00001097          	auipc	ra,0x1
    800045d4:	31c080e7          	jalr	796(ra) # 800058ec <acquire>
    800045d8:	00004717          	auipc	a4,0x4
    800045dc:	05c70713          	addi	a4,a4,92 # 80008634 <ticks>
    800045e0:	00072783          	lw	a5,0(a4)
    800045e4:	00005517          	auipc	a0,0x5
    800045e8:	17c50513          	addi	a0,a0,380 # 80009760 <tickslock>
    800045ec:	0017879b          	addiw	a5,a5,1
    800045f0:	00f72023          	sw	a5,0(a4)
    800045f4:	00001097          	auipc	ra,0x1
    800045f8:	3c4080e7          	jalr	964(ra) # 800059b8 <release>
    800045fc:	f65ff06f          	j	80004560 <devintr+0x60>
    80004600:	00001097          	auipc	ra,0x1
    80004604:	f20080e7          	jalr	-224(ra) # 80005520 <uartintr>
    80004608:	fadff06f          	j	800045b4 <devintr+0xb4>
    8000460c:	0000                	unimp
	...

0000000080004610 <kernelvec>:
    80004610:	f0010113          	addi	sp,sp,-256
    80004614:	00113023          	sd	ra,0(sp)
    80004618:	00213423          	sd	sp,8(sp)
    8000461c:	00313823          	sd	gp,16(sp)
    80004620:	00413c23          	sd	tp,24(sp)
    80004624:	02513023          	sd	t0,32(sp)
    80004628:	02613423          	sd	t1,40(sp)
    8000462c:	02713823          	sd	t2,48(sp)
    80004630:	02813c23          	sd	s0,56(sp)
    80004634:	04913023          	sd	s1,64(sp)
    80004638:	04a13423          	sd	a0,72(sp)
    8000463c:	04b13823          	sd	a1,80(sp)
    80004640:	04c13c23          	sd	a2,88(sp)
    80004644:	06d13023          	sd	a3,96(sp)
    80004648:	06e13423          	sd	a4,104(sp)
    8000464c:	06f13823          	sd	a5,112(sp)
    80004650:	07013c23          	sd	a6,120(sp)
    80004654:	09113023          	sd	a7,128(sp)
    80004658:	09213423          	sd	s2,136(sp)
    8000465c:	09313823          	sd	s3,144(sp)
    80004660:	09413c23          	sd	s4,152(sp)
    80004664:	0b513023          	sd	s5,160(sp)
    80004668:	0b613423          	sd	s6,168(sp)
    8000466c:	0b713823          	sd	s7,176(sp)
    80004670:	0b813c23          	sd	s8,184(sp)
    80004674:	0d913023          	sd	s9,192(sp)
    80004678:	0da13423          	sd	s10,200(sp)
    8000467c:	0db13823          	sd	s11,208(sp)
    80004680:	0dc13c23          	sd	t3,216(sp)
    80004684:	0fd13023          	sd	t4,224(sp)
    80004688:	0fe13423          	sd	t5,232(sp)
    8000468c:	0ff13823          	sd	t6,240(sp)
    80004690:	cd1ff0ef          	jal	ra,80004360 <kerneltrap>
    80004694:	00013083          	ld	ra,0(sp)
    80004698:	00813103          	ld	sp,8(sp)
    8000469c:	01013183          	ld	gp,16(sp)
    800046a0:	02013283          	ld	t0,32(sp)
    800046a4:	02813303          	ld	t1,40(sp)
    800046a8:	03013383          	ld	t2,48(sp)
    800046ac:	03813403          	ld	s0,56(sp)
    800046b0:	04013483          	ld	s1,64(sp)
    800046b4:	04813503          	ld	a0,72(sp)
    800046b8:	05013583          	ld	a1,80(sp)
    800046bc:	05813603          	ld	a2,88(sp)
    800046c0:	06013683          	ld	a3,96(sp)
    800046c4:	06813703          	ld	a4,104(sp)
    800046c8:	07013783          	ld	a5,112(sp)
    800046cc:	07813803          	ld	a6,120(sp)
    800046d0:	08013883          	ld	a7,128(sp)
    800046d4:	08813903          	ld	s2,136(sp)
    800046d8:	09013983          	ld	s3,144(sp)
    800046dc:	09813a03          	ld	s4,152(sp)
    800046e0:	0a013a83          	ld	s5,160(sp)
    800046e4:	0a813b03          	ld	s6,168(sp)
    800046e8:	0b013b83          	ld	s7,176(sp)
    800046ec:	0b813c03          	ld	s8,184(sp)
    800046f0:	0c013c83          	ld	s9,192(sp)
    800046f4:	0c813d03          	ld	s10,200(sp)
    800046f8:	0d013d83          	ld	s11,208(sp)
    800046fc:	0d813e03          	ld	t3,216(sp)
    80004700:	0e013e83          	ld	t4,224(sp)
    80004704:	0e813f03          	ld	t5,232(sp)
    80004708:	0f013f83          	ld	t6,240(sp)
    8000470c:	10010113          	addi	sp,sp,256
    80004710:	10200073          	sret
    80004714:	00000013          	nop
    80004718:	00000013          	nop
    8000471c:	00000013          	nop

0000000080004720 <timervec>:
    80004720:	34051573          	csrrw	a0,mscratch,a0
    80004724:	00b53023          	sd	a1,0(a0)
    80004728:	00c53423          	sd	a2,8(a0)
    8000472c:	00d53823          	sd	a3,16(a0)
    80004730:	01853583          	ld	a1,24(a0)
    80004734:	02053603          	ld	a2,32(a0)
    80004738:	0005b683          	ld	a3,0(a1)
    8000473c:	00c686b3          	add	a3,a3,a2
    80004740:	00d5b023          	sd	a3,0(a1)
    80004744:	00200593          	li	a1,2
    80004748:	14459073          	csrw	sip,a1
    8000474c:	01053683          	ld	a3,16(a0)
    80004750:	00853603          	ld	a2,8(a0)
    80004754:	00053583          	ld	a1,0(a0)
    80004758:	34051573          	csrrw	a0,mscratch,a0
    8000475c:	30200073          	mret

0000000080004760 <plicinit>:
    80004760:	ff010113          	addi	sp,sp,-16
    80004764:	00813423          	sd	s0,8(sp)
    80004768:	01010413          	addi	s0,sp,16
    8000476c:	00813403          	ld	s0,8(sp)
    80004770:	0c0007b7          	lui	a5,0xc000
    80004774:	00100713          	li	a4,1
    80004778:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000477c:	00e7a223          	sw	a4,4(a5)
    80004780:	01010113          	addi	sp,sp,16
    80004784:	00008067          	ret

0000000080004788 <plicinithart>:
    80004788:	ff010113          	addi	sp,sp,-16
    8000478c:	00813023          	sd	s0,0(sp)
    80004790:	00113423          	sd	ra,8(sp)
    80004794:	01010413          	addi	s0,sp,16
    80004798:	00000097          	auipc	ra,0x0
    8000479c:	a48080e7          	jalr	-1464(ra) # 800041e0 <cpuid>
    800047a0:	0085171b          	slliw	a4,a0,0x8
    800047a4:	0c0027b7          	lui	a5,0xc002
    800047a8:	00e787b3          	add	a5,a5,a4
    800047ac:	40200713          	li	a4,1026
    800047b0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800047b4:	00813083          	ld	ra,8(sp)
    800047b8:	00013403          	ld	s0,0(sp)
    800047bc:	00d5151b          	slliw	a0,a0,0xd
    800047c0:	0c2017b7          	lui	a5,0xc201
    800047c4:	00a78533          	add	a0,a5,a0
    800047c8:	00052023          	sw	zero,0(a0)
    800047cc:	01010113          	addi	sp,sp,16
    800047d0:	00008067          	ret

00000000800047d4 <plic_claim>:
    800047d4:	ff010113          	addi	sp,sp,-16
    800047d8:	00813023          	sd	s0,0(sp)
    800047dc:	00113423          	sd	ra,8(sp)
    800047e0:	01010413          	addi	s0,sp,16
    800047e4:	00000097          	auipc	ra,0x0
    800047e8:	9fc080e7          	jalr	-1540(ra) # 800041e0 <cpuid>
    800047ec:	00813083          	ld	ra,8(sp)
    800047f0:	00013403          	ld	s0,0(sp)
    800047f4:	00d5151b          	slliw	a0,a0,0xd
    800047f8:	0c2017b7          	lui	a5,0xc201
    800047fc:	00a78533          	add	a0,a5,a0
    80004800:	00452503          	lw	a0,4(a0)
    80004804:	01010113          	addi	sp,sp,16
    80004808:	00008067          	ret

000000008000480c <plic_complete>:
    8000480c:	fe010113          	addi	sp,sp,-32
    80004810:	00813823          	sd	s0,16(sp)
    80004814:	00913423          	sd	s1,8(sp)
    80004818:	00113c23          	sd	ra,24(sp)
    8000481c:	02010413          	addi	s0,sp,32
    80004820:	00050493          	mv	s1,a0
    80004824:	00000097          	auipc	ra,0x0
    80004828:	9bc080e7          	jalr	-1604(ra) # 800041e0 <cpuid>
    8000482c:	01813083          	ld	ra,24(sp)
    80004830:	01013403          	ld	s0,16(sp)
    80004834:	00d5179b          	slliw	a5,a0,0xd
    80004838:	0c201737          	lui	a4,0xc201
    8000483c:	00f707b3          	add	a5,a4,a5
    80004840:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004844:	00813483          	ld	s1,8(sp)
    80004848:	02010113          	addi	sp,sp,32
    8000484c:	00008067          	ret

0000000080004850 <consolewrite>:
    80004850:	fb010113          	addi	sp,sp,-80
    80004854:	04813023          	sd	s0,64(sp)
    80004858:	04113423          	sd	ra,72(sp)
    8000485c:	02913c23          	sd	s1,56(sp)
    80004860:	03213823          	sd	s2,48(sp)
    80004864:	03313423          	sd	s3,40(sp)
    80004868:	03413023          	sd	s4,32(sp)
    8000486c:	01513c23          	sd	s5,24(sp)
    80004870:	05010413          	addi	s0,sp,80
    80004874:	06c05c63          	blez	a2,800048ec <consolewrite+0x9c>
    80004878:	00060993          	mv	s3,a2
    8000487c:	00050a13          	mv	s4,a0
    80004880:	00058493          	mv	s1,a1
    80004884:	00000913          	li	s2,0
    80004888:	fff00a93          	li	s5,-1
    8000488c:	01c0006f          	j	800048a8 <consolewrite+0x58>
    80004890:	fbf44503          	lbu	a0,-65(s0)
    80004894:	0019091b          	addiw	s2,s2,1
    80004898:	00148493          	addi	s1,s1,1
    8000489c:	00001097          	auipc	ra,0x1
    800048a0:	a9c080e7          	jalr	-1380(ra) # 80005338 <uartputc>
    800048a4:	03298063          	beq	s3,s2,800048c4 <consolewrite+0x74>
    800048a8:	00048613          	mv	a2,s1
    800048ac:	00100693          	li	a3,1
    800048b0:	000a0593          	mv	a1,s4
    800048b4:	fbf40513          	addi	a0,s0,-65
    800048b8:	00000097          	auipc	ra,0x0
    800048bc:	9e0080e7          	jalr	-1568(ra) # 80004298 <either_copyin>
    800048c0:	fd5518e3          	bne	a0,s5,80004890 <consolewrite+0x40>
    800048c4:	04813083          	ld	ra,72(sp)
    800048c8:	04013403          	ld	s0,64(sp)
    800048cc:	03813483          	ld	s1,56(sp)
    800048d0:	02813983          	ld	s3,40(sp)
    800048d4:	02013a03          	ld	s4,32(sp)
    800048d8:	01813a83          	ld	s5,24(sp)
    800048dc:	00090513          	mv	a0,s2
    800048e0:	03013903          	ld	s2,48(sp)
    800048e4:	05010113          	addi	sp,sp,80
    800048e8:	00008067          	ret
    800048ec:	00000913          	li	s2,0
    800048f0:	fd5ff06f          	j	800048c4 <consolewrite+0x74>

00000000800048f4 <consoleread>:
    800048f4:	f9010113          	addi	sp,sp,-112
    800048f8:	06813023          	sd	s0,96(sp)
    800048fc:	04913c23          	sd	s1,88(sp)
    80004900:	05213823          	sd	s2,80(sp)
    80004904:	05313423          	sd	s3,72(sp)
    80004908:	05413023          	sd	s4,64(sp)
    8000490c:	03513c23          	sd	s5,56(sp)
    80004910:	03613823          	sd	s6,48(sp)
    80004914:	03713423          	sd	s7,40(sp)
    80004918:	03813023          	sd	s8,32(sp)
    8000491c:	06113423          	sd	ra,104(sp)
    80004920:	01913c23          	sd	s9,24(sp)
    80004924:	07010413          	addi	s0,sp,112
    80004928:	00060b93          	mv	s7,a2
    8000492c:	00050913          	mv	s2,a0
    80004930:	00058c13          	mv	s8,a1
    80004934:	00060b1b          	sext.w	s6,a2
    80004938:	00005497          	auipc	s1,0x5
    8000493c:	e5048493          	addi	s1,s1,-432 # 80009788 <cons>
    80004940:	00400993          	li	s3,4
    80004944:	fff00a13          	li	s4,-1
    80004948:	00a00a93          	li	s5,10
    8000494c:	05705e63          	blez	s7,800049a8 <consoleread+0xb4>
    80004950:	09c4a703          	lw	a4,156(s1)
    80004954:	0984a783          	lw	a5,152(s1)
    80004958:	0007071b          	sext.w	a4,a4
    8000495c:	08e78463          	beq	a5,a4,800049e4 <consoleread+0xf0>
    80004960:	07f7f713          	andi	a4,a5,127
    80004964:	00e48733          	add	a4,s1,a4
    80004968:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000496c:	0017869b          	addiw	a3,a5,1
    80004970:	08d4ac23          	sw	a3,152(s1)
    80004974:	00070c9b          	sext.w	s9,a4
    80004978:	0b370663          	beq	a4,s3,80004a24 <consoleread+0x130>
    8000497c:	00100693          	li	a3,1
    80004980:	f9f40613          	addi	a2,s0,-97
    80004984:	000c0593          	mv	a1,s8
    80004988:	00090513          	mv	a0,s2
    8000498c:	f8e40fa3          	sb	a4,-97(s0)
    80004990:	00000097          	auipc	ra,0x0
    80004994:	8bc080e7          	jalr	-1860(ra) # 8000424c <either_copyout>
    80004998:	01450863          	beq	a0,s4,800049a8 <consoleread+0xb4>
    8000499c:	001c0c13          	addi	s8,s8,1
    800049a0:	fffb8b9b          	addiw	s7,s7,-1
    800049a4:	fb5c94e3          	bne	s9,s5,8000494c <consoleread+0x58>
    800049a8:	000b851b          	sext.w	a0,s7
    800049ac:	06813083          	ld	ra,104(sp)
    800049b0:	06013403          	ld	s0,96(sp)
    800049b4:	05813483          	ld	s1,88(sp)
    800049b8:	05013903          	ld	s2,80(sp)
    800049bc:	04813983          	ld	s3,72(sp)
    800049c0:	04013a03          	ld	s4,64(sp)
    800049c4:	03813a83          	ld	s5,56(sp)
    800049c8:	02813b83          	ld	s7,40(sp)
    800049cc:	02013c03          	ld	s8,32(sp)
    800049d0:	01813c83          	ld	s9,24(sp)
    800049d4:	40ab053b          	subw	a0,s6,a0
    800049d8:	03013b03          	ld	s6,48(sp)
    800049dc:	07010113          	addi	sp,sp,112
    800049e0:	00008067          	ret
    800049e4:	00001097          	auipc	ra,0x1
    800049e8:	1d8080e7          	jalr	472(ra) # 80005bbc <push_on>
    800049ec:	0984a703          	lw	a4,152(s1)
    800049f0:	09c4a783          	lw	a5,156(s1)
    800049f4:	0007879b          	sext.w	a5,a5
    800049f8:	fef70ce3          	beq	a4,a5,800049f0 <consoleread+0xfc>
    800049fc:	00001097          	auipc	ra,0x1
    80004a00:	234080e7          	jalr	564(ra) # 80005c30 <pop_on>
    80004a04:	0984a783          	lw	a5,152(s1)
    80004a08:	07f7f713          	andi	a4,a5,127
    80004a0c:	00e48733          	add	a4,s1,a4
    80004a10:	01874703          	lbu	a4,24(a4)
    80004a14:	0017869b          	addiw	a3,a5,1
    80004a18:	08d4ac23          	sw	a3,152(s1)
    80004a1c:	00070c9b          	sext.w	s9,a4
    80004a20:	f5371ee3          	bne	a4,s3,8000497c <consoleread+0x88>
    80004a24:	000b851b          	sext.w	a0,s7
    80004a28:	f96bf2e3          	bgeu	s7,s6,800049ac <consoleread+0xb8>
    80004a2c:	08f4ac23          	sw	a5,152(s1)
    80004a30:	f7dff06f          	j	800049ac <consoleread+0xb8>

0000000080004a34 <consputc>:
    80004a34:	10000793          	li	a5,256
    80004a38:	00f50663          	beq	a0,a5,80004a44 <consputc+0x10>
    80004a3c:	00001317          	auipc	t1,0x1
    80004a40:	9f430067          	jr	-1548(t1) # 80005430 <uartputc_sync>
    80004a44:	ff010113          	addi	sp,sp,-16
    80004a48:	00113423          	sd	ra,8(sp)
    80004a4c:	00813023          	sd	s0,0(sp)
    80004a50:	01010413          	addi	s0,sp,16
    80004a54:	00800513          	li	a0,8
    80004a58:	00001097          	auipc	ra,0x1
    80004a5c:	9d8080e7          	jalr	-1576(ra) # 80005430 <uartputc_sync>
    80004a60:	02000513          	li	a0,32
    80004a64:	00001097          	auipc	ra,0x1
    80004a68:	9cc080e7          	jalr	-1588(ra) # 80005430 <uartputc_sync>
    80004a6c:	00013403          	ld	s0,0(sp)
    80004a70:	00813083          	ld	ra,8(sp)
    80004a74:	00800513          	li	a0,8
    80004a78:	01010113          	addi	sp,sp,16
    80004a7c:	00001317          	auipc	t1,0x1
    80004a80:	9b430067          	jr	-1612(t1) # 80005430 <uartputc_sync>

0000000080004a84 <consoleintr>:
    80004a84:	fe010113          	addi	sp,sp,-32
    80004a88:	00813823          	sd	s0,16(sp)
    80004a8c:	00913423          	sd	s1,8(sp)
    80004a90:	01213023          	sd	s2,0(sp)
    80004a94:	00113c23          	sd	ra,24(sp)
    80004a98:	02010413          	addi	s0,sp,32
    80004a9c:	00005917          	auipc	s2,0x5
    80004aa0:	cec90913          	addi	s2,s2,-788 # 80009788 <cons>
    80004aa4:	00050493          	mv	s1,a0
    80004aa8:	00090513          	mv	a0,s2
    80004aac:	00001097          	auipc	ra,0x1
    80004ab0:	e40080e7          	jalr	-448(ra) # 800058ec <acquire>
    80004ab4:	02048c63          	beqz	s1,80004aec <consoleintr+0x68>
    80004ab8:	0a092783          	lw	a5,160(s2)
    80004abc:	09892703          	lw	a4,152(s2)
    80004ac0:	07f00693          	li	a3,127
    80004ac4:	40e7873b          	subw	a4,a5,a4
    80004ac8:	02e6e263          	bltu	a3,a4,80004aec <consoleintr+0x68>
    80004acc:	00d00713          	li	a4,13
    80004ad0:	04e48063          	beq	s1,a4,80004b10 <consoleintr+0x8c>
    80004ad4:	07f7f713          	andi	a4,a5,127
    80004ad8:	00e90733          	add	a4,s2,a4
    80004adc:	0017879b          	addiw	a5,a5,1
    80004ae0:	0af92023          	sw	a5,160(s2)
    80004ae4:	00970c23          	sb	s1,24(a4)
    80004ae8:	08f92e23          	sw	a5,156(s2)
    80004aec:	01013403          	ld	s0,16(sp)
    80004af0:	01813083          	ld	ra,24(sp)
    80004af4:	00813483          	ld	s1,8(sp)
    80004af8:	00013903          	ld	s2,0(sp)
    80004afc:	00005517          	auipc	a0,0x5
    80004b00:	c8c50513          	addi	a0,a0,-884 # 80009788 <cons>
    80004b04:	02010113          	addi	sp,sp,32
    80004b08:	00001317          	auipc	t1,0x1
    80004b0c:	eb030067          	jr	-336(t1) # 800059b8 <release>
    80004b10:	00a00493          	li	s1,10
    80004b14:	fc1ff06f          	j	80004ad4 <consoleintr+0x50>

0000000080004b18 <consoleinit>:
    80004b18:	fe010113          	addi	sp,sp,-32
    80004b1c:	00113c23          	sd	ra,24(sp)
    80004b20:	00813823          	sd	s0,16(sp)
    80004b24:	00913423          	sd	s1,8(sp)
    80004b28:	02010413          	addi	s0,sp,32
    80004b2c:	00005497          	auipc	s1,0x5
    80004b30:	c5c48493          	addi	s1,s1,-932 # 80009788 <cons>
    80004b34:	00048513          	mv	a0,s1
    80004b38:	00003597          	auipc	a1,0x3
    80004b3c:	99058593          	addi	a1,a1,-1648 # 800074c8 <CONSOLE_STATUS+0x4b8>
    80004b40:	00001097          	auipc	ra,0x1
    80004b44:	d88080e7          	jalr	-632(ra) # 800058c8 <initlock>
    80004b48:	00000097          	auipc	ra,0x0
    80004b4c:	7ac080e7          	jalr	1964(ra) # 800052f4 <uartinit>
    80004b50:	01813083          	ld	ra,24(sp)
    80004b54:	01013403          	ld	s0,16(sp)
    80004b58:	00000797          	auipc	a5,0x0
    80004b5c:	d9c78793          	addi	a5,a5,-612 # 800048f4 <consoleread>
    80004b60:	0af4bc23          	sd	a5,184(s1)
    80004b64:	00000797          	auipc	a5,0x0
    80004b68:	cec78793          	addi	a5,a5,-788 # 80004850 <consolewrite>
    80004b6c:	0cf4b023          	sd	a5,192(s1)
    80004b70:	00813483          	ld	s1,8(sp)
    80004b74:	02010113          	addi	sp,sp,32
    80004b78:	00008067          	ret

0000000080004b7c <console_read>:
    80004b7c:	ff010113          	addi	sp,sp,-16
    80004b80:	00813423          	sd	s0,8(sp)
    80004b84:	01010413          	addi	s0,sp,16
    80004b88:	00813403          	ld	s0,8(sp)
    80004b8c:	00005317          	auipc	t1,0x5
    80004b90:	cb433303          	ld	t1,-844(t1) # 80009840 <devsw+0x10>
    80004b94:	01010113          	addi	sp,sp,16
    80004b98:	00030067          	jr	t1

0000000080004b9c <console_write>:
    80004b9c:	ff010113          	addi	sp,sp,-16
    80004ba0:	00813423          	sd	s0,8(sp)
    80004ba4:	01010413          	addi	s0,sp,16
    80004ba8:	00813403          	ld	s0,8(sp)
    80004bac:	00005317          	auipc	t1,0x5
    80004bb0:	c9c33303          	ld	t1,-868(t1) # 80009848 <devsw+0x18>
    80004bb4:	01010113          	addi	sp,sp,16
    80004bb8:	00030067          	jr	t1

0000000080004bbc <panic>:
    80004bbc:	fe010113          	addi	sp,sp,-32
    80004bc0:	00113c23          	sd	ra,24(sp)
    80004bc4:	00813823          	sd	s0,16(sp)
    80004bc8:	00913423          	sd	s1,8(sp)
    80004bcc:	02010413          	addi	s0,sp,32
    80004bd0:	00050493          	mv	s1,a0
    80004bd4:	00003517          	auipc	a0,0x3
    80004bd8:	8fc50513          	addi	a0,a0,-1796 # 800074d0 <CONSOLE_STATUS+0x4c0>
    80004bdc:	00005797          	auipc	a5,0x5
    80004be0:	d007a623          	sw	zero,-756(a5) # 800098e8 <pr+0x18>
    80004be4:	00000097          	auipc	ra,0x0
    80004be8:	034080e7          	jalr	52(ra) # 80004c18 <__printf>
    80004bec:	00048513          	mv	a0,s1
    80004bf0:	00000097          	auipc	ra,0x0
    80004bf4:	028080e7          	jalr	40(ra) # 80004c18 <__printf>
    80004bf8:	00002517          	auipc	a0,0x2
    80004bfc:	43050513          	addi	a0,a0,1072 # 80007028 <CONSOLE_STATUS+0x18>
    80004c00:	00000097          	auipc	ra,0x0
    80004c04:	018080e7          	jalr	24(ra) # 80004c18 <__printf>
    80004c08:	00100793          	li	a5,1
    80004c0c:	00004717          	auipc	a4,0x4
    80004c10:	a2f72623          	sw	a5,-1492(a4) # 80008638 <panicked>
    80004c14:	0000006f          	j	80004c14 <panic+0x58>

0000000080004c18 <__printf>:
    80004c18:	f3010113          	addi	sp,sp,-208
    80004c1c:	08813023          	sd	s0,128(sp)
    80004c20:	07313423          	sd	s3,104(sp)
    80004c24:	09010413          	addi	s0,sp,144
    80004c28:	05813023          	sd	s8,64(sp)
    80004c2c:	08113423          	sd	ra,136(sp)
    80004c30:	06913c23          	sd	s1,120(sp)
    80004c34:	07213823          	sd	s2,112(sp)
    80004c38:	07413023          	sd	s4,96(sp)
    80004c3c:	05513c23          	sd	s5,88(sp)
    80004c40:	05613823          	sd	s6,80(sp)
    80004c44:	05713423          	sd	s7,72(sp)
    80004c48:	03913c23          	sd	s9,56(sp)
    80004c4c:	03a13823          	sd	s10,48(sp)
    80004c50:	03b13423          	sd	s11,40(sp)
    80004c54:	00005317          	auipc	t1,0x5
    80004c58:	c7c30313          	addi	t1,t1,-900 # 800098d0 <pr>
    80004c5c:	01832c03          	lw	s8,24(t1)
    80004c60:	00b43423          	sd	a1,8(s0)
    80004c64:	00c43823          	sd	a2,16(s0)
    80004c68:	00d43c23          	sd	a3,24(s0)
    80004c6c:	02e43023          	sd	a4,32(s0)
    80004c70:	02f43423          	sd	a5,40(s0)
    80004c74:	03043823          	sd	a6,48(s0)
    80004c78:	03143c23          	sd	a7,56(s0)
    80004c7c:	00050993          	mv	s3,a0
    80004c80:	4a0c1663          	bnez	s8,8000512c <__printf+0x514>
    80004c84:	60098c63          	beqz	s3,8000529c <__printf+0x684>
    80004c88:	0009c503          	lbu	a0,0(s3)
    80004c8c:	00840793          	addi	a5,s0,8
    80004c90:	f6f43c23          	sd	a5,-136(s0)
    80004c94:	00000493          	li	s1,0
    80004c98:	22050063          	beqz	a0,80004eb8 <__printf+0x2a0>
    80004c9c:	00002a37          	lui	s4,0x2
    80004ca0:	00018ab7          	lui	s5,0x18
    80004ca4:	000f4b37          	lui	s6,0xf4
    80004ca8:	00989bb7          	lui	s7,0x989
    80004cac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004cb0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004cb4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004cb8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004cbc:	00148c9b          	addiw	s9,s1,1
    80004cc0:	02500793          	li	a5,37
    80004cc4:	01998933          	add	s2,s3,s9
    80004cc8:	38f51263          	bne	a0,a5,8000504c <__printf+0x434>
    80004ccc:	00094783          	lbu	a5,0(s2)
    80004cd0:	00078c9b          	sext.w	s9,a5
    80004cd4:	1e078263          	beqz	a5,80004eb8 <__printf+0x2a0>
    80004cd8:	0024849b          	addiw	s1,s1,2
    80004cdc:	07000713          	li	a4,112
    80004ce0:	00998933          	add	s2,s3,s1
    80004ce4:	38e78a63          	beq	a5,a4,80005078 <__printf+0x460>
    80004ce8:	20f76863          	bltu	a4,a5,80004ef8 <__printf+0x2e0>
    80004cec:	42a78863          	beq	a5,a0,8000511c <__printf+0x504>
    80004cf0:	06400713          	li	a4,100
    80004cf4:	40e79663          	bne	a5,a4,80005100 <__printf+0x4e8>
    80004cf8:	f7843783          	ld	a5,-136(s0)
    80004cfc:	0007a603          	lw	a2,0(a5)
    80004d00:	00878793          	addi	a5,a5,8
    80004d04:	f6f43c23          	sd	a5,-136(s0)
    80004d08:	42064a63          	bltz	a2,8000513c <__printf+0x524>
    80004d0c:	00a00713          	li	a4,10
    80004d10:	02e677bb          	remuw	a5,a2,a4
    80004d14:	00002d97          	auipc	s11,0x2
    80004d18:	7e4d8d93          	addi	s11,s11,2020 # 800074f8 <digits>
    80004d1c:	00900593          	li	a1,9
    80004d20:	0006051b          	sext.w	a0,a2
    80004d24:	00000c93          	li	s9,0
    80004d28:	02079793          	slli	a5,a5,0x20
    80004d2c:	0207d793          	srli	a5,a5,0x20
    80004d30:	00fd87b3          	add	a5,s11,a5
    80004d34:	0007c783          	lbu	a5,0(a5)
    80004d38:	02e656bb          	divuw	a3,a2,a4
    80004d3c:	f8f40023          	sb	a5,-128(s0)
    80004d40:	14c5d863          	bge	a1,a2,80004e90 <__printf+0x278>
    80004d44:	06300593          	li	a1,99
    80004d48:	00100c93          	li	s9,1
    80004d4c:	02e6f7bb          	remuw	a5,a3,a4
    80004d50:	02079793          	slli	a5,a5,0x20
    80004d54:	0207d793          	srli	a5,a5,0x20
    80004d58:	00fd87b3          	add	a5,s11,a5
    80004d5c:	0007c783          	lbu	a5,0(a5)
    80004d60:	02e6d73b          	divuw	a4,a3,a4
    80004d64:	f8f400a3          	sb	a5,-127(s0)
    80004d68:	12a5f463          	bgeu	a1,a0,80004e90 <__printf+0x278>
    80004d6c:	00a00693          	li	a3,10
    80004d70:	00900593          	li	a1,9
    80004d74:	02d777bb          	remuw	a5,a4,a3
    80004d78:	02079793          	slli	a5,a5,0x20
    80004d7c:	0207d793          	srli	a5,a5,0x20
    80004d80:	00fd87b3          	add	a5,s11,a5
    80004d84:	0007c503          	lbu	a0,0(a5)
    80004d88:	02d757bb          	divuw	a5,a4,a3
    80004d8c:	f8a40123          	sb	a0,-126(s0)
    80004d90:	48e5f263          	bgeu	a1,a4,80005214 <__printf+0x5fc>
    80004d94:	06300513          	li	a0,99
    80004d98:	02d7f5bb          	remuw	a1,a5,a3
    80004d9c:	02059593          	slli	a1,a1,0x20
    80004da0:	0205d593          	srli	a1,a1,0x20
    80004da4:	00bd85b3          	add	a1,s11,a1
    80004da8:	0005c583          	lbu	a1,0(a1)
    80004dac:	02d7d7bb          	divuw	a5,a5,a3
    80004db0:	f8b401a3          	sb	a1,-125(s0)
    80004db4:	48e57263          	bgeu	a0,a4,80005238 <__printf+0x620>
    80004db8:	3e700513          	li	a0,999
    80004dbc:	02d7f5bb          	remuw	a1,a5,a3
    80004dc0:	02059593          	slli	a1,a1,0x20
    80004dc4:	0205d593          	srli	a1,a1,0x20
    80004dc8:	00bd85b3          	add	a1,s11,a1
    80004dcc:	0005c583          	lbu	a1,0(a1)
    80004dd0:	02d7d7bb          	divuw	a5,a5,a3
    80004dd4:	f8b40223          	sb	a1,-124(s0)
    80004dd8:	46e57663          	bgeu	a0,a4,80005244 <__printf+0x62c>
    80004ddc:	02d7f5bb          	remuw	a1,a5,a3
    80004de0:	02059593          	slli	a1,a1,0x20
    80004de4:	0205d593          	srli	a1,a1,0x20
    80004de8:	00bd85b3          	add	a1,s11,a1
    80004dec:	0005c583          	lbu	a1,0(a1)
    80004df0:	02d7d7bb          	divuw	a5,a5,a3
    80004df4:	f8b402a3          	sb	a1,-123(s0)
    80004df8:	46ea7863          	bgeu	s4,a4,80005268 <__printf+0x650>
    80004dfc:	02d7f5bb          	remuw	a1,a5,a3
    80004e00:	02059593          	slli	a1,a1,0x20
    80004e04:	0205d593          	srli	a1,a1,0x20
    80004e08:	00bd85b3          	add	a1,s11,a1
    80004e0c:	0005c583          	lbu	a1,0(a1)
    80004e10:	02d7d7bb          	divuw	a5,a5,a3
    80004e14:	f8b40323          	sb	a1,-122(s0)
    80004e18:	3eeaf863          	bgeu	s5,a4,80005208 <__printf+0x5f0>
    80004e1c:	02d7f5bb          	remuw	a1,a5,a3
    80004e20:	02059593          	slli	a1,a1,0x20
    80004e24:	0205d593          	srli	a1,a1,0x20
    80004e28:	00bd85b3          	add	a1,s11,a1
    80004e2c:	0005c583          	lbu	a1,0(a1)
    80004e30:	02d7d7bb          	divuw	a5,a5,a3
    80004e34:	f8b403a3          	sb	a1,-121(s0)
    80004e38:	42eb7e63          	bgeu	s6,a4,80005274 <__printf+0x65c>
    80004e3c:	02d7f5bb          	remuw	a1,a5,a3
    80004e40:	02059593          	slli	a1,a1,0x20
    80004e44:	0205d593          	srli	a1,a1,0x20
    80004e48:	00bd85b3          	add	a1,s11,a1
    80004e4c:	0005c583          	lbu	a1,0(a1)
    80004e50:	02d7d7bb          	divuw	a5,a5,a3
    80004e54:	f8b40423          	sb	a1,-120(s0)
    80004e58:	42ebfc63          	bgeu	s7,a4,80005290 <__printf+0x678>
    80004e5c:	02079793          	slli	a5,a5,0x20
    80004e60:	0207d793          	srli	a5,a5,0x20
    80004e64:	00fd8db3          	add	s11,s11,a5
    80004e68:	000dc703          	lbu	a4,0(s11)
    80004e6c:	00a00793          	li	a5,10
    80004e70:	00900c93          	li	s9,9
    80004e74:	f8e404a3          	sb	a4,-119(s0)
    80004e78:	00065c63          	bgez	a2,80004e90 <__printf+0x278>
    80004e7c:	f9040713          	addi	a4,s0,-112
    80004e80:	00f70733          	add	a4,a4,a5
    80004e84:	02d00693          	li	a3,45
    80004e88:	fed70823          	sb	a3,-16(a4)
    80004e8c:	00078c93          	mv	s9,a5
    80004e90:	f8040793          	addi	a5,s0,-128
    80004e94:	01978cb3          	add	s9,a5,s9
    80004e98:	f7f40d13          	addi	s10,s0,-129
    80004e9c:	000cc503          	lbu	a0,0(s9)
    80004ea0:	fffc8c93          	addi	s9,s9,-1
    80004ea4:	00000097          	auipc	ra,0x0
    80004ea8:	b90080e7          	jalr	-1136(ra) # 80004a34 <consputc>
    80004eac:	ffac98e3          	bne	s9,s10,80004e9c <__printf+0x284>
    80004eb0:	00094503          	lbu	a0,0(s2)
    80004eb4:	e00514e3          	bnez	a0,80004cbc <__printf+0xa4>
    80004eb8:	1a0c1663          	bnez	s8,80005064 <__printf+0x44c>
    80004ebc:	08813083          	ld	ra,136(sp)
    80004ec0:	08013403          	ld	s0,128(sp)
    80004ec4:	07813483          	ld	s1,120(sp)
    80004ec8:	07013903          	ld	s2,112(sp)
    80004ecc:	06813983          	ld	s3,104(sp)
    80004ed0:	06013a03          	ld	s4,96(sp)
    80004ed4:	05813a83          	ld	s5,88(sp)
    80004ed8:	05013b03          	ld	s6,80(sp)
    80004edc:	04813b83          	ld	s7,72(sp)
    80004ee0:	04013c03          	ld	s8,64(sp)
    80004ee4:	03813c83          	ld	s9,56(sp)
    80004ee8:	03013d03          	ld	s10,48(sp)
    80004eec:	02813d83          	ld	s11,40(sp)
    80004ef0:	0d010113          	addi	sp,sp,208
    80004ef4:	00008067          	ret
    80004ef8:	07300713          	li	a4,115
    80004efc:	1ce78a63          	beq	a5,a4,800050d0 <__printf+0x4b8>
    80004f00:	07800713          	li	a4,120
    80004f04:	1ee79e63          	bne	a5,a4,80005100 <__printf+0x4e8>
    80004f08:	f7843783          	ld	a5,-136(s0)
    80004f0c:	0007a703          	lw	a4,0(a5)
    80004f10:	00878793          	addi	a5,a5,8
    80004f14:	f6f43c23          	sd	a5,-136(s0)
    80004f18:	28074263          	bltz	a4,8000519c <__printf+0x584>
    80004f1c:	00002d97          	auipc	s11,0x2
    80004f20:	5dcd8d93          	addi	s11,s11,1500 # 800074f8 <digits>
    80004f24:	00f77793          	andi	a5,a4,15
    80004f28:	00fd87b3          	add	a5,s11,a5
    80004f2c:	0007c683          	lbu	a3,0(a5)
    80004f30:	00f00613          	li	a2,15
    80004f34:	0007079b          	sext.w	a5,a4
    80004f38:	f8d40023          	sb	a3,-128(s0)
    80004f3c:	0047559b          	srliw	a1,a4,0x4
    80004f40:	0047569b          	srliw	a3,a4,0x4
    80004f44:	00000c93          	li	s9,0
    80004f48:	0ee65063          	bge	a2,a4,80005028 <__printf+0x410>
    80004f4c:	00f6f693          	andi	a3,a3,15
    80004f50:	00dd86b3          	add	a3,s11,a3
    80004f54:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004f58:	0087d79b          	srliw	a5,a5,0x8
    80004f5c:	00100c93          	li	s9,1
    80004f60:	f8d400a3          	sb	a3,-127(s0)
    80004f64:	0cb67263          	bgeu	a2,a1,80005028 <__printf+0x410>
    80004f68:	00f7f693          	andi	a3,a5,15
    80004f6c:	00dd86b3          	add	a3,s11,a3
    80004f70:	0006c583          	lbu	a1,0(a3)
    80004f74:	00f00613          	li	a2,15
    80004f78:	0047d69b          	srliw	a3,a5,0x4
    80004f7c:	f8b40123          	sb	a1,-126(s0)
    80004f80:	0047d593          	srli	a1,a5,0x4
    80004f84:	28f67e63          	bgeu	a2,a5,80005220 <__printf+0x608>
    80004f88:	00f6f693          	andi	a3,a3,15
    80004f8c:	00dd86b3          	add	a3,s11,a3
    80004f90:	0006c503          	lbu	a0,0(a3)
    80004f94:	0087d813          	srli	a6,a5,0x8
    80004f98:	0087d69b          	srliw	a3,a5,0x8
    80004f9c:	f8a401a3          	sb	a0,-125(s0)
    80004fa0:	28b67663          	bgeu	a2,a1,8000522c <__printf+0x614>
    80004fa4:	00f6f693          	andi	a3,a3,15
    80004fa8:	00dd86b3          	add	a3,s11,a3
    80004fac:	0006c583          	lbu	a1,0(a3)
    80004fb0:	00c7d513          	srli	a0,a5,0xc
    80004fb4:	00c7d69b          	srliw	a3,a5,0xc
    80004fb8:	f8b40223          	sb	a1,-124(s0)
    80004fbc:	29067a63          	bgeu	a2,a6,80005250 <__printf+0x638>
    80004fc0:	00f6f693          	andi	a3,a3,15
    80004fc4:	00dd86b3          	add	a3,s11,a3
    80004fc8:	0006c583          	lbu	a1,0(a3)
    80004fcc:	0107d813          	srli	a6,a5,0x10
    80004fd0:	0107d69b          	srliw	a3,a5,0x10
    80004fd4:	f8b402a3          	sb	a1,-123(s0)
    80004fd8:	28a67263          	bgeu	a2,a0,8000525c <__printf+0x644>
    80004fdc:	00f6f693          	andi	a3,a3,15
    80004fe0:	00dd86b3          	add	a3,s11,a3
    80004fe4:	0006c683          	lbu	a3,0(a3)
    80004fe8:	0147d79b          	srliw	a5,a5,0x14
    80004fec:	f8d40323          	sb	a3,-122(s0)
    80004ff0:	21067663          	bgeu	a2,a6,800051fc <__printf+0x5e4>
    80004ff4:	02079793          	slli	a5,a5,0x20
    80004ff8:	0207d793          	srli	a5,a5,0x20
    80004ffc:	00fd8db3          	add	s11,s11,a5
    80005000:	000dc683          	lbu	a3,0(s11)
    80005004:	00800793          	li	a5,8
    80005008:	00700c93          	li	s9,7
    8000500c:	f8d403a3          	sb	a3,-121(s0)
    80005010:	00075c63          	bgez	a4,80005028 <__printf+0x410>
    80005014:	f9040713          	addi	a4,s0,-112
    80005018:	00f70733          	add	a4,a4,a5
    8000501c:	02d00693          	li	a3,45
    80005020:	fed70823          	sb	a3,-16(a4)
    80005024:	00078c93          	mv	s9,a5
    80005028:	f8040793          	addi	a5,s0,-128
    8000502c:	01978cb3          	add	s9,a5,s9
    80005030:	f7f40d13          	addi	s10,s0,-129
    80005034:	000cc503          	lbu	a0,0(s9)
    80005038:	fffc8c93          	addi	s9,s9,-1
    8000503c:	00000097          	auipc	ra,0x0
    80005040:	9f8080e7          	jalr	-1544(ra) # 80004a34 <consputc>
    80005044:	ff9d18e3          	bne	s10,s9,80005034 <__printf+0x41c>
    80005048:	0100006f          	j	80005058 <__printf+0x440>
    8000504c:	00000097          	auipc	ra,0x0
    80005050:	9e8080e7          	jalr	-1560(ra) # 80004a34 <consputc>
    80005054:	000c8493          	mv	s1,s9
    80005058:	00094503          	lbu	a0,0(s2)
    8000505c:	c60510e3          	bnez	a0,80004cbc <__printf+0xa4>
    80005060:	e40c0ee3          	beqz	s8,80004ebc <__printf+0x2a4>
    80005064:	00005517          	auipc	a0,0x5
    80005068:	86c50513          	addi	a0,a0,-1940 # 800098d0 <pr>
    8000506c:	00001097          	auipc	ra,0x1
    80005070:	94c080e7          	jalr	-1716(ra) # 800059b8 <release>
    80005074:	e49ff06f          	j	80004ebc <__printf+0x2a4>
    80005078:	f7843783          	ld	a5,-136(s0)
    8000507c:	03000513          	li	a0,48
    80005080:	01000d13          	li	s10,16
    80005084:	00878713          	addi	a4,a5,8
    80005088:	0007bc83          	ld	s9,0(a5)
    8000508c:	f6e43c23          	sd	a4,-136(s0)
    80005090:	00000097          	auipc	ra,0x0
    80005094:	9a4080e7          	jalr	-1628(ra) # 80004a34 <consputc>
    80005098:	07800513          	li	a0,120
    8000509c:	00000097          	auipc	ra,0x0
    800050a0:	998080e7          	jalr	-1640(ra) # 80004a34 <consputc>
    800050a4:	00002d97          	auipc	s11,0x2
    800050a8:	454d8d93          	addi	s11,s11,1108 # 800074f8 <digits>
    800050ac:	03ccd793          	srli	a5,s9,0x3c
    800050b0:	00fd87b3          	add	a5,s11,a5
    800050b4:	0007c503          	lbu	a0,0(a5)
    800050b8:	fffd0d1b          	addiw	s10,s10,-1
    800050bc:	004c9c93          	slli	s9,s9,0x4
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	974080e7          	jalr	-1676(ra) # 80004a34 <consputc>
    800050c8:	fe0d12e3          	bnez	s10,800050ac <__printf+0x494>
    800050cc:	f8dff06f          	j	80005058 <__printf+0x440>
    800050d0:	f7843783          	ld	a5,-136(s0)
    800050d4:	0007bc83          	ld	s9,0(a5)
    800050d8:	00878793          	addi	a5,a5,8
    800050dc:	f6f43c23          	sd	a5,-136(s0)
    800050e0:	000c9a63          	bnez	s9,800050f4 <__printf+0x4dc>
    800050e4:	1080006f          	j	800051ec <__printf+0x5d4>
    800050e8:	001c8c93          	addi	s9,s9,1
    800050ec:	00000097          	auipc	ra,0x0
    800050f0:	948080e7          	jalr	-1720(ra) # 80004a34 <consputc>
    800050f4:	000cc503          	lbu	a0,0(s9)
    800050f8:	fe0518e3          	bnez	a0,800050e8 <__printf+0x4d0>
    800050fc:	f5dff06f          	j	80005058 <__printf+0x440>
    80005100:	02500513          	li	a0,37
    80005104:	00000097          	auipc	ra,0x0
    80005108:	930080e7          	jalr	-1744(ra) # 80004a34 <consputc>
    8000510c:	000c8513          	mv	a0,s9
    80005110:	00000097          	auipc	ra,0x0
    80005114:	924080e7          	jalr	-1756(ra) # 80004a34 <consputc>
    80005118:	f41ff06f          	j	80005058 <__printf+0x440>
    8000511c:	02500513          	li	a0,37
    80005120:	00000097          	auipc	ra,0x0
    80005124:	914080e7          	jalr	-1772(ra) # 80004a34 <consputc>
    80005128:	f31ff06f          	j	80005058 <__printf+0x440>
    8000512c:	00030513          	mv	a0,t1
    80005130:	00000097          	auipc	ra,0x0
    80005134:	7bc080e7          	jalr	1980(ra) # 800058ec <acquire>
    80005138:	b4dff06f          	j	80004c84 <__printf+0x6c>
    8000513c:	40c0053b          	negw	a0,a2
    80005140:	00a00713          	li	a4,10
    80005144:	02e576bb          	remuw	a3,a0,a4
    80005148:	00002d97          	auipc	s11,0x2
    8000514c:	3b0d8d93          	addi	s11,s11,944 # 800074f8 <digits>
    80005150:	ff700593          	li	a1,-9
    80005154:	02069693          	slli	a3,a3,0x20
    80005158:	0206d693          	srli	a3,a3,0x20
    8000515c:	00dd86b3          	add	a3,s11,a3
    80005160:	0006c683          	lbu	a3,0(a3)
    80005164:	02e557bb          	divuw	a5,a0,a4
    80005168:	f8d40023          	sb	a3,-128(s0)
    8000516c:	10b65e63          	bge	a2,a1,80005288 <__printf+0x670>
    80005170:	06300593          	li	a1,99
    80005174:	02e7f6bb          	remuw	a3,a5,a4
    80005178:	02069693          	slli	a3,a3,0x20
    8000517c:	0206d693          	srli	a3,a3,0x20
    80005180:	00dd86b3          	add	a3,s11,a3
    80005184:	0006c683          	lbu	a3,0(a3)
    80005188:	02e7d73b          	divuw	a4,a5,a4
    8000518c:	00200793          	li	a5,2
    80005190:	f8d400a3          	sb	a3,-127(s0)
    80005194:	bca5ece3          	bltu	a1,a0,80004d6c <__printf+0x154>
    80005198:	ce5ff06f          	j	80004e7c <__printf+0x264>
    8000519c:	40e007bb          	negw	a5,a4
    800051a0:	00002d97          	auipc	s11,0x2
    800051a4:	358d8d93          	addi	s11,s11,856 # 800074f8 <digits>
    800051a8:	00f7f693          	andi	a3,a5,15
    800051ac:	00dd86b3          	add	a3,s11,a3
    800051b0:	0006c583          	lbu	a1,0(a3)
    800051b4:	ff100613          	li	a2,-15
    800051b8:	0047d69b          	srliw	a3,a5,0x4
    800051bc:	f8b40023          	sb	a1,-128(s0)
    800051c0:	0047d59b          	srliw	a1,a5,0x4
    800051c4:	0ac75e63          	bge	a4,a2,80005280 <__printf+0x668>
    800051c8:	00f6f693          	andi	a3,a3,15
    800051cc:	00dd86b3          	add	a3,s11,a3
    800051d0:	0006c603          	lbu	a2,0(a3)
    800051d4:	00f00693          	li	a3,15
    800051d8:	0087d79b          	srliw	a5,a5,0x8
    800051dc:	f8c400a3          	sb	a2,-127(s0)
    800051e0:	d8b6e4e3          	bltu	a3,a1,80004f68 <__printf+0x350>
    800051e4:	00200793          	li	a5,2
    800051e8:	e2dff06f          	j	80005014 <__printf+0x3fc>
    800051ec:	00002c97          	auipc	s9,0x2
    800051f0:	2ecc8c93          	addi	s9,s9,748 # 800074d8 <CONSOLE_STATUS+0x4c8>
    800051f4:	02800513          	li	a0,40
    800051f8:	ef1ff06f          	j	800050e8 <__printf+0x4d0>
    800051fc:	00700793          	li	a5,7
    80005200:	00600c93          	li	s9,6
    80005204:	e0dff06f          	j	80005010 <__printf+0x3f8>
    80005208:	00700793          	li	a5,7
    8000520c:	00600c93          	li	s9,6
    80005210:	c69ff06f          	j	80004e78 <__printf+0x260>
    80005214:	00300793          	li	a5,3
    80005218:	00200c93          	li	s9,2
    8000521c:	c5dff06f          	j	80004e78 <__printf+0x260>
    80005220:	00300793          	li	a5,3
    80005224:	00200c93          	li	s9,2
    80005228:	de9ff06f          	j	80005010 <__printf+0x3f8>
    8000522c:	00400793          	li	a5,4
    80005230:	00300c93          	li	s9,3
    80005234:	dddff06f          	j	80005010 <__printf+0x3f8>
    80005238:	00400793          	li	a5,4
    8000523c:	00300c93          	li	s9,3
    80005240:	c39ff06f          	j	80004e78 <__printf+0x260>
    80005244:	00500793          	li	a5,5
    80005248:	00400c93          	li	s9,4
    8000524c:	c2dff06f          	j	80004e78 <__printf+0x260>
    80005250:	00500793          	li	a5,5
    80005254:	00400c93          	li	s9,4
    80005258:	db9ff06f          	j	80005010 <__printf+0x3f8>
    8000525c:	00600793          	li	a5,6
    80005260:	00500c93          	li	s9,5
    80005264:	dadff06f          	j	80005010 <__printf+0x3f8>
    80005268:	00600793          	li	a5,6
    8000526c:	00500c93          	li	s9,5
    80005270:	c09ff06f          	j	80004e78 <__printf+0x260>
    80005274:	00800793          	li	a5,8
    80005278:	00700c93          	li	s9,7
    8000527c:	bfdff06f          	j	80004e78 <__printf+0x260>
    80005280:	00100793          	li	a5,1
    80005284:	d91ff06f          	j	80005014 <__printf+0x3fc>
    80005288:	00100793          	li	a5,1
    8000528c:	bf1ff06f          	j	80004e7c <__printf+0x264>
    80005290:	00900793          	li	a5,9
    80005294:	00800c93          	li	s9,8
    80005298:	be1ff06f          	j	80004e78 <__printf+0x260>
    8000529c:	00002517          	auipc	a0,0x2
    800052a0:	24450513          	addi	a0,a0,580 # 800074e0 <CONSOLE_STATUS+0x4d0>
    800052a4:	00000097          	auipc	ra,0x0
    800052a8:	918080e7          	jalr	-1768(ra) # 80004bbc <panic>

00000000800052ac <printfinit>:
    800052ac:	fe010113          	addi	sp,sp,-32
    800052b0:	00813823          	sd	s0,16(sp)
    800052b4:	00913423          	sd	s1,8(sp)
    800052b8:	00113c23          	sd	ra,24(sp)
    800052bc:	02010413          	addi	s0,sp,32
    800052c0:	00004497          	auipc	s1,0x4
    800052c4:	61048493          	addi	s1,s1,1552 # 800098d0 <pr>
    800052c8:	00048513          	mv	a0,s1
    800052cc:	00002597          	auipc	a1,0x2
    800052d0:	22458593          	addi	a1,a1,548 # 800074f0 <CONSOLE_STATUS+0x4e0>
    800052d4:	00000097          	auipc	ra,0x0
    800052d8:	5f4080e7          	jalr	1524(ra) # 800058c8 <initlock>
    800052dc:	01813083          	ld	ra,24(sp)
    800052e0:	01013403          	ld	s0,16(sp)
    800052e4:	0004ac23          	sw	zero,24(s1)
    800052e8:	00813483          	ld	s1,8(sp)
    800052ec:	02010113          	addi	sp,sp,32
    800052f0:	00008067          	ret

00000000800052f4 <uartinit>:
    800052f4:	ff010113          	addi	sp,sp,-16
    800052f8:	00813423          	sd	s0,8(sp)
    800052fc:	01010413          	addi	s0,sp,16
    80005300:	100007b7          	lui	a5,0x10000
    80005304:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005308:	f8000713          	li	a4,-128
    8000530c:	00e781a3          	sb	a4,3(a5)
    80005310:	00300713          	li	a4,3
    80005314:	00e78023          	sb	a4,0(a5)
    80005318:	000780a3          	sb	zero,1(a5)
    8000531c:	00e781a3          	sb	a4,3(a5)
    80005320:	00700693          	li	a3,7
    80005324:	00d78123          	sb	a3,2(a5)
    80005328:	00e780a3          	sb	a4,1(a5)
    8000532c:	00813403          	ld	s0,8(sp)
    80005330:	01010113          	addi	sp,sp,16
    80005334:	00008067          	ret

0000000080005338 <uartputc>:
    80005338:	00003797          	auipc	a5,0x3
    8000533c:	3007a783          	lw	a5,768(a5) # 80008638 <panicked>
    80005340:	00078463          	beqz	a5,80005348 <uartputc+0x10>
    80005344:	0000006f          	j	80005344 <uartputc+0xc>
    80005348:	fd010113          	addi	sp,sp,-48
    8000534c:	02813023          	sd	s0,32(sp)
    80005350:	00913c23          	sd	s1,24(sp)
    80005354:	01213823          	sd	s2,16(sp)
    80005358:	01313423          	sd	s3,8(sp)
    8000535c:	02113423          	sd	ra,40(sp)
    80005360:	03010413          	addi	s0,sp,48
    80005364:	00003917          	auipc	s2,0x3
    80005368:	2dc90913          	addi	s2,s2,732 # 80008640 <uart_tx_r>
    8000536c:	00093783          	ld	a5,0(s2)
    80005370:	00003497          	auipc	s1,0x3
    80005374:	2d848493          	addi	s1,s1,728 # 80008648 <uart_tx_w>
    80005378:	0004b703          	ld	a4,0(s1)
    8000537c:	02078693          	addi	a3,a5,32
    80005380:	00050993          	mv	s3,a0
    80005384:	02e69c63          	bne	a3,a4,800053bc <uartputc+0x84>
    80005388:	00001097          	auipc	ra,0x1
    8000538c:	834080e7          	jalr	-1996(ra) # 80005bbc <push_on>
    80005390:	00093783          	ld	a5,0(s2)
    80005394:	0004b703          	ld	a4,0(s1)
    80005398:	02078793          	addi	a5,a5,32
    8000539c:	00e79463          	bne	a5,a4,800053a4 <uartputc+0x6c>
    800053a0:	0000006f          	j	800053a0 <uartputc+0x68>
    800053a4:	00001097          	auipc	ra,0x1
    800053a8:	88c080e7          	jalr	-1908(ra) # 80005c30 <pop_on>
    800053ac:	00093783          	ld	a5,0(s2)
    800053b0:	0004b703          	ld	a4,0(s1)
    800053b4:	02078693          	addi	a3,a5,32
    800053b8:	fce688e3          	beq	a3,a4,80005388 <uartputc+0x50>
    800053bc:	01f77693          	andi	a3,a4,31
    800053c0:	00004597          	auipc	a1,0x4
    800053c4:	53058593          	addi	a1,a1,1328 # 800098f0 <uart_tx_buf>
    800053c8:	00d586b3          	add	a3,a1,a3
    800053cc:	00170713          	addi	a4,a4,1
    800053d0:	01368023          	sb	s3,0(a3)
    800053d4:	00e4b023          	sd	a4,0(s1)
    800053d8:	10000637          	lui	a2,0x10000
    800053dc:	02f71063          	bne	a4,a5,800053fc <uartputc+0xc4>
    800053e0:	0340006f          	j	80005414 <uartputc+0xdc>
    800053e4:	00074703          	lbu	a4,0(a4)
    800053e8:	00f93023          	sd	a5,0(s2)
    800053ec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800053f0:	00093783          	ld	a5,0(s2)
    800053f4:	0004b703          	ld	a4,0(s1)
    800053f8:	00f70e63          	beq	a4,a5,80005414 <uartputc+0xdc>
    800053fc:	00564683          	lbu	a3,5(a2)
    80005400:	01f7f713          	andi	a4,a5,31
    80005404:	00e58733          	add	a4,a1,a4
    80005408:	0206f693          	andi	a3,a3,32
    8000540c:	00178793          	addi	a5,a5,1
    80005410:	fc069ae3          	bnez	a3,800053e4 <uartputc+0xac>
    80005414:	02813083          	ld	ra,40(sp)
    80005418:	02013403          	ld	s0,32(sp)
    8000541c:	01813483          	ld	s1,24(sp)
    80005420:	01013903          	ld	s2,16(sp)
    80005424:	00813983          	ld	s3,8(sp)
    80005428:	03010113          	addi	sp,sp,48
    8000542c:	00008067          	ret

0000000080005430 <uartputc_sync>:
    80005430:	ff010113          	addi	sp,sp,-16
    80005434:	00813423          	sd	s0,8(sp)
    80005438:	01010413          	addi	s0,sp,16
    8000543c:	00003717          	auipc	a4,0x3
    80005440:	1fc72703          	lw	a4,508(a4) # 80008638 <panicked>
    80005444:	02071663          	bnez	a4,80005470 <uartputc_sync+0x40>
    80005448:	00050793          	mv	a5,a0
    8000544c:	100006b7          	lui	a3,0x10000
    80005450:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005454:	02077713          	andi	a4,a4,32
    80005458:	fe070ce3          	beqz	a4,80005450 <uartputc_sync+0x20>
    8000545c:	0ff7f793          	andi	a5,a5,255
    80005460:	00f68023          	sb	a5,0(a3)
    80005464:	00813403          	ld	s0,8(sp)
    80005468:	01010113          	addi	sp,sp,16
    8000546c:	00008067          	ret
    80005470:	0000006f          	j	80005470 <uartputc_sync+0x40>

0000000080005474 <uartstart>:
    80005474:	ff010113          	addi	sp,sp,-16
    80005478:	00813423          	sd	s0,8(sp)
    8000547c:	01010413          	addi	s0,sp,16
    80005480:	00003617          	auipc	a2,0x3
    80005484:	1c060613          	addi	a2,a2,448 # 80008640 <uart_tx_r>
    80005488:	00003517          	auipc	a0,0x3
    8000548c:	1c050513          	addi	a0,a0,448 # 80008648 <uart_tx_w>
    80005490:	00063783          	ld	a5,0(a2)
    80005494:	00053703          	ld	a4,0(a0)
    80005498:	04f70263          	beq	a4,a5,800054dc <uartstart+0x68>
    8000549c:	100005b7          	lui	a1,0x10000
    800054a0:	00004817          	auipc	a6,0x4
    800054a4:	45080813          	addi	a6,a6,1104 # 800098f0 <uart_tx_buf>
    800054a8:	01c0006f          	j	800054c4 <uartstart+0x50>
    800054ac:	0006c703          	lbu	a4,0(a3)
    800054b0:	00f63023          	sd	a5,0(a2)
    800054b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054b8:	00063783          	ld	a5,0(a2)
    800054bc:	00053703          	ld	a4,0(a0)
    800054c0:	00f70e63          	beq	a4,a5,800054dc <uartstart+0x68>
    800054c4:	01f7f713          	andi	a4,a5,31
    800054c8:	00e806b3          	add	a3,a6,a4
    800054cc:	0055c703          	lbu	a4,5(a1)
    800054d0:	00178793          	addi	a5,a5,1
    800054d4:	02077713          	andi	a4,a4,32
    800054d8:	fc071ae3          	bnez	a4,800054ac <uartstart+0x38>
    800054dc:	00813403          	ld	s0,8(sp)
    800054e0:	01010113          	addi	sp,sp,16
    800054e4:	00008067          	ret

00000000800054e8 <uartgetc>:
    800054e8:	ff010113          	addi	sp,sp,-16
    800054ec:	00813423          	sd	s0,8(sp)
    800054f0:	01010413          	addi	s0,sp,16
    800054f4:	10000737          	lui	a4,0x10000
    800054f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800054fc:	0017f793          	andi	a5,a5,1
    80005500:	00078c63          	beqz	a5,80005518 <uartgetc+0x30>
    80005504:	00074503          	lbu	a0,0(a4)
    80005508:	0ff57513          	andi	a0,a0,255
    8000550c:	00813403          	ld	s0,8(sp)
    80005510:	01010113          	addi	sp,sp,16
    80005514:	00008067          	ret
    80005518:	fff00513          	li	a0,-1
    8000551c:	ff1ff06f          	j	8000550c <uartgetc+0x24>

0000000080005520 <uartintr>:
    80005520:	100007b7          	lui	a5,0x10000
    80005524:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005528:	0017f793          	andi	a5,a5,1
    8000552c:	0a078463          	beqz	a5,800055d4 <uartintr+0xb4>
    80005530:	fe010113          	addi	sp,sp,-32
    80005534:	00813823          	sd	s0,16(sp)
    80005538:	00913423          	sd	s1,8(sp)
    8000553c:	00113c23          	sd	ra,24(sp)
    80005540:	02010413          	addi	s0,sp,32
    80005544:	100004b7          	lui	s1,0x10000
    80005548:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000554c:	0ff57513          	andi	a0,a0,255
    80005550:	fffff097          	auipc	ra,0xfffff
    80005554:	534080e7          	jalr	1332(ra) # 80004a84 <consoleintr>
    80005558:	0054c783          	lbu	a5,5(s1)
    8000555c:	0017f793          	andi	a5,a5,1
    80005560:	fe0794e3          	bnez	a5,80005548 <uartintr+0x28>
    80005564:	00003617          	auipc	a2,0x3
    80005568:	0dc60613          	addi	a2,a2,220 # 80008640 <uart_tx_r>
    8000556c:	00003517          	auipc	a0,0x3
    80005570:	0dc50513          	addi	a0,a0,220 # 80008648 <uart_tx_w>
    80005574:	00063783          	ld	a5,0(a2)
    80005578:	00053703          	ld	a4,0(a0)
    8000557c:	04f70263          	beq	a4,a5,800055c0 <uartintr+0xa0>
    80005580:	100005b7          	lui	a1,0x10000
    80005584:	00004817          	auipc	a6,0x4
    80005588:	36c80813          	addi	a6,a6,876 # 800098f0 <uart_tx_buf>
    8000558c:	01c0006f          	j	800055a8 <uartintr+0x88>
    80005590:	0006c703          	lbu	a4,0(a3)
    80005594:	00f63023          	sd	a5,0(a2)
    80005598:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000559c:	00063783          	ld	a5,0(a2)
    800055a0:	00053703          	ld	a4,0(a0)
    800055a4:	00f70e63          	beq	a4,a5,800055c0 <uartintr+0xa0>
    800055a8:	01f7f713          	andi	a4,a5,31
    800055ac:	00e806b3          	add	a3,a6,a4
    800055b0:	0055c703          	lbu	a4,5(a1)
    800055b4:	00178793          	addi	a5,a5,1
    800055b8:	02077713          	andi	a4,a4,32
    800055bc:	fc071ae3          	bnez	a4,80005590 <uartintr+0x70>
    800055c0:	01813083          	ld	ra,24(sp)
    800055c4:	01013403          	ld	s0,16(sp)
    800055c8:	00813483          	ld	s1,8(sp)
    800055cc:	02010113          	addi	sp,sp,32
    800055d0:	00008067          	ret
    800055d4:	00003617          	auipc	a2,0x3
    800055d8:	06c60613          	addi	a2,a2,108 # 80008640 <uart_tx_r>
    800055dc:	00003517          	auipc	a0,0x3
    800055e0:	06c50513          	addi	a0,a0,108 # 80008648 <uart_tx_w>
    800055e4:	00063783          	ld	a5,0(a2)
    800055e8:	00053703          	ld	a4,0(a0)
    800055ec:	04f70263          	beq	a4,a5,80005630 <uartintr+0x110>
    800055f0:	100005b7          	lui	a1,0x10000
    800055f4:	00004817          	auipc	a6,0x4
    800055f8:	2fc80813          	addi	a6,a6,764 # 800098f0 <uart_tx_buf>
    800055fc:	01c0006f          	j	80005618 <uartintr+0xf8>
    80005600:	0006c703          	lbu	a4,0(a3)
    80005604:	00f63023          	sd	a5,0(a2)
    80005608:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000560c:	00063783          	ld	a5,0(a2)
    80005610:	00053703          	ld	a4,0(a0)
    80005614:	02f70063          	beq	a4,a5,80005634 <uartintr+0x114>
    80005618:	01f7f713          	andi	a4,a5,31
    8000561c:	00e806b3          	add	a3,a6,a4
    80005620:	0055c703          	lbu	a4,5(a1)
    80005624:	00178793          	addi	a5,a5,1
    80005628:	02077713          	andi	a4,a4,32
    8000562c:	fc071ae3          	bnez	a4,80005600 <uartintr+0xe0>
    80005630:	00008067          	ret
    80005634:	00008067          	ret

0000000080005638 <kinit>:
    80005638:	fc010113          	addi	sp,sp,-64
    8000563c:	02913423          	sd	s1,40(sp)
    80005640:	fffff7b7          	lui	a5,0xfffff
    80005644:	00005497          	auipc	s1,0x5
    80005648:	2cb48493          	addi	s1,s1,715 # 8000a90f <end+0xfff>
    8000564c:	02813823          	sd	s0,48(sp)
    80005650:	01313c23          	sd	s3,24(sp)
    80005654:	00f4f4b3          	and	s1,s1,a5
    80005658:	02113c23          	sd	ra,56(sp)
    8000565c:	03213023          	sd	s2,32(sp)
    80005660:	01413823          	sd	s4,16(sp)
    80005664:	01513423          	sd	s5,8(sp)
    80005668:	04010413          	addi	s0,sp,64
    8000566c:	000017b7          	lui	a5,0x1
    80005670:	01100993          	li	s3,17
    80005674:	00f487b3          	add	a5,s1,a5
    80005678:	01b99993          	slli	s3,s3,0x1b
    8000567c:	06f9e063          	bltu	s3,a5,800056dc <kinit+0xa4>
    80005680:	00004a97          	auipc	s5,0x4
    80005684:	290a8a93          	addi	s5,s5,656 # 80009910 <end>
    80005688:	0754ec63          	bltu	s1,s5,80005700 <kinit+0xc8>
    8000568c:	0734fa63          	bgeu	s1,s3,80005700 <kinit+0xc8>
    80005690:	00088a37          	lui	s4,0x88
    80005694:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005698:	00003917          	auipc	s2,0x3
    8000569c:	fb890913          	addi	s2,s2,-72 # 80008650 <kmem>
    800056a0:	00ca1a13          	slli	s4,s4,0xc
    800056a4:	0140006f          	j	800056b8 <kinit+0x80>
    800056a8:	000017b7          	lui	a5,0x1
    800056ac:	00f484b3          	add	s1,s1,a5
    800056b0:	0554e863          	bltu	s1,s5,80005700 <kinit+0xc8>
    800056b4:	0534f663          	bgeu	s1,s3,80005700 <kinit+0xc8>
    800056b8:	00001637          	lui	a2,0x1
    800056bc:	00100593          	li	a1,1
    800056c0:	00048513          	mv	a0,s1
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	5e4080e7          	jalr	1508(ra) # 80005ca8 <__memset>
    800056cc:	00093783          	ld	a5,0(s2)
    800056d0:	00f4b023          	sd	a5,0(s1)
    800056d4:	00993023          	sd	s1,0(s2)
    800056d8:	fd4498e3          	bne	s1,s4,800056a8 <kinit+0x70>
    800056dc:	03813083          	ld	ra,56(sp)
    800056e0:	03013403          	ld	s0,48(sp)
    800056e4:	02813483          	ld	s1,40(sp)
    800056e8:	02013903          	ld	s2,32(sp)
    800056ec:	01813983          	ld	s3,24(sp)
    800056f0:	01013a03          	ld	s4,16(sp)
    800056f4:	00813a83          	ld	s5,8(sp)
    800056f8:	04010113          	addi	sp,sp,64
    800056fc:	00008067          	ret
    80005700:	00002517          	auipc	a0,0x2
    80005704:	e1050513          	addi	a0,a0,-496 # 80007510 <digits+0x18>
    80005708:	fffff097          	auipc	ra,0xfffff
    8000570c:	4b4080e7          	jalr	1204(ra) # 80004bbc <panic>

0000000080005710 <freerange>:
    80005710:	fc010113          	addi	sp,sp,-64
    80005714:	000017b7          	lui	a5,0x1
    80005718:	02913423          	sd	s1,40(sp)
    8000571c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005720:	009504b3          	add	s1,a0,s1
    80005724:	fffff537          	lui	a0,0xfffff
    80005728:	02813823          	sd	s0,48(sp)
    8000572c:	02113c23          	sd	ra,56(sp)
    80005730:	03213023          	sd	s2,32(sp)
    80005734:	01313c23          	sd	s3,24(sp)
    80005738:	01413823          	sd	s4,16(sp)
    8000573c:	01513423          	sd	s5,8(sp)
    80005740:	01613023          	sd	s6,0(sp)
    80005744:	04010413          	addi	s0,sp,64
    80005748:	00a4f4b3          	and	s1,s1,a0
    8000574c:	00f487b3          	add	a5,s1,a5
    80005750:	06f5e463          	bltu	a1,a5,800057b8 <freerange+0xa8>
    80005754:	00004a97          	auipc	s5,0x4
    80005758:	1bca8a93          	addi	s5,s5,444 # 80009910 <end>
    8000575c:	0954e263          	bltu	s1,s5,800057e0 <freerange+0xd0>
    80005760:	01100993          	li	s3,17
    80005764:	01b99993          	slli	s3,s3,0x1b
    80005768:	0734fc63          	bgeu	s1,s3,800057e0 <freerange+0xd0>
    8000576c:	00058a13          	mv	s4,a1
    80005770:	00003917          	auipc	s2,0x3
    80005774:	ee090913          	addi	s2,s2,-288 # 80008650 <kmem>
    80005778:	00002b37          	lui	s6,0x2
    8000577c:	0140006f          	j	80005790 <freerange+0x80>
    80005780:	000017b7          	lui	a5,0x1
    80005784:	00f484b3          	add	s1,s1,a5
    80005788:	0554ec63          	bltu	s1,s5,800057e0 <freerange+0xd0>
    8000578c:	0534fa63          	bgeu	s1,s3,800057e0 <freerange+0xd0>
    80005790:	00001637          	lui	a2,0x1
    80005794:	00100593          	li	a1,1
    80005798:	00048513          	mv	a0,s1
    8000579c:	00000097          	auipc	ra,0x0
    800057a0:	50c080e7          	jalr	1292(ra) # 80005ca8 <__memset>
    800057a4:	00093703          	ld	a4,0(s2)
    800057a8:	016487b3          	add	a5,s1,s6
    800057ac:	00e4b023          	sd	a4,0(s1)
    800057b0:	00993023          	sd	s1,0(s2)
    800057b4:	fcfa76e3          	bgeu	s4,a5,80005780 <freerange+0x70>
    800057b8:	03813083          	ld	ra,56(sp)
    800057bc:	03013403          	ld	s0,48(sp)
    800057c0:	02813483          	ld	s1,40(sp)
    800057c4:	02013903          	ld	s2,32(sp)
    800057c8:	01813983          	ld	s3,24(sp)
    800057cc:	01013a03          	ld	s4,16(sp)
    800057d0:	00813a83          	ld	s5,8(sp)
    800057d4:	00013b03          	ld	s6,0(sp)
    800057d8:	04010113          	addi	sp,sp,64
    800057dc:	00008067          	ret
    800057e0:	00002517          	auipc	a0,0x2
    800057e4:	d3050513          	addi	a0,a0,-720 # 80007510 <digits+0x18>
    800057e8:	fffff097          	auipc	ra,0xfffff
    800057ec:	3d4080e7          	jalr	980(ra) # 80004bbc <panic>

00000000800057f0 <kfree>:
    800057f0:	fe010113          	addi	sp,sp,-32
    800057f4:	00813823          	sd	s0,16(sp)
    800057f8:	00113c23          	sd	ra,24(sp)
    800057fc:	00913423          	sd	s1,8(sp)
    80005800:	02010413          	addi	s0,sp,32
    80005804:	03451793          	slli	a5,a0,0x34
    80005808:	04079c63          	bnez	a5,80005860 <kfree+0x70>
    8000580c:	00004797          	auipc	a5,0x4
    80005810:	10478793          	addi	a5,a5,260 # 80009910 <end>
    80005814:	00050493          	mv	s1,a0
    80005818:	04f56463          	bltu	a0,a5,80005860 <kfree+0x70>
    8000581c:	01100793          	li	a5,17
    80005820:	01b79793          	slli	a5,a5,0x1b
    80005824:	02f57e63          	bgeu	a0,a5,80005860 <kfree+0x70>
    80005828:	00001637          	lui	a2,0x1
    8000582c:	00100593          	li	a1,1
    80005830:	00000097          	auipc	ra,0x0
    80005834:	478080e7          	jalr	1144(ra) # 80005ca8 <__memset>
    80005838:	00003797          	auipc	a5,0x3
    8000583c:	e1878793          	addi	a5,a5,-488 # 80008650 <kmem>
    80005840:	0007b703          	ld	a4,0(a5)
    80005844:	01813083          	ld	ra,24(sp)
    80005848:	01013403          	ld	s0,16(sp)
    8000584c:	00e4b023          	sd	a4,0(s1)
    80005850:	0097b023          	sd	s1,0(a5)
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	02010113          	addi	sp,sp,32
    8000585c:	00008067          	ret
    80005860:	00002517          	auipc	a0,0x2
    80005864:	cb050513          	addi	a0,a0,-848 # 80007510 <digits+0x18>
    80005868:	fffff097          	auipc	ra,0xfffff
    8000586c:	354080e7          	jalr	852(ra) # 80004bbc <panic>

0000000080005870 <kalloc>:
    80005870:	fe010113          	addi	sp,sp,-32
    80005874:	00813823          	sd	s0,16(sp)
    80005878:	00913423          	sd	s1,8(sp)
    8000587c:	00113c23          	sd	ra,24(sp)
    80005880:	02010413          	addi	s0,sp,32
    80005884:	00003797          	auipc	a5,0x3
    80005888:	dcc78793          	addi	a5,a5,-564 # 80008650 <kmem>
    8000588c:	0007b483          	ld	s1,0(a5)
    80005890:	02048063          	beqz	s1,800058b0 <kalloc+0x40>
    80005894:	0004b703          	ld	a4,0(s1)
    80005898:	00001637          	lui	a2,0x1
    8000589c:	00500593          	li	a1,5
    800058a0:	00048513          	mv	a0,s1
    800058a4:	00e7b023          	sd	a4,0(a5)
    800058a8:	00000097          	auipc	ra,0x0
    800058ac:	400080e7          	jalr	1024(ra) # 80005ca8 <__memset>
    800058b0:	01813083          	ld	ra,24(sp)
    800058b4:	01013403          	ld	s0,16(sp)
    800058b8:	00048513          	mv	a0,s1
    800058bc:	00813483          	ld	s1,8(sp)
    800058c0:	02010113          	addi	sp,sp,32
    800058c4:	00008067          	ret

00000000800058c8 <initlock>:
    800058c8:	ff010113          	addi	sp,sp,-16
    800058cc:	00813423          	sd	s0,8(sp)
    800058d0:	01010413          	addi	s0,sp,16
    800058d4:	00813403          	ld	s0,8(sp)
    800058d8:	00b53423          	sd	a1,8(a0)
    800058dc:	00052023          	sw	zero,0(a0)
    800058e0:	00053823          	sd	zero,16(a0)
    800058e4:	01010113          	addi	sp,sp,16
    800058e8:	00008067          	ret

00000000800058ec <acquire>:
    800058ec:	fe010113          	addi	sp,sp,-32
    800058f0:	00813823          	sd	s0,16(sp)
    800058f4:	00913423          	sd	s1,8(sp)
    800058f8:	00113c23          	sd	ra,24(sp)
    800058fc:	01213023          	sd	s2,0(sp)
    80005900:	02010413          	addi	s0,sp,32
    80005904:	00050493          	mv	s1,a0
    80005908:	10002973          	csrr	s2,sstatus
    8000590c:	100027f3          	csrr	a5,sstatus
    80005910:	ffd7f793          	andi	a5,a5,-3
    80005914:	10079073          	csrw	sstatus,a5
    80005918:	fffff097          	auipc	ra,0xfffff
    8000591c:	8e8080e7          	jalr	-1816(ra) # 80004200 <mycpu>
    80005920:	07852783          	lw	a5,120(a0)
    80005924:	06078e63          	beqz	a5,800059a0 <acquire+0xb4>
    80005928:	fffff097          	auipc	ra,0xfffff
    8000592c:	8d8080e7          	jalr	-1832(ra) # 80004200 <mycpu>
    80005930:	07852783          	lw	a5,120(a0)
    80005934:	0004a703          	lw	a4,0(s1)
    80005938:	0017879b          	addiw	a5,a5,1
    8000593c:	06f52c23          	sw	a5,120(a0)
    80005940:	04071063          	bnez	a4,80005980 <acquire+0x94>
    80005944:	00100713          	li	a4,1
    80005948:	00070793          	mv	a5,a4
    8000594c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005950:	0007879b          	sext.w	a5,a5
    80005954:	fe079ae3          	bnez	a5,80005948 <acquire+0x5c>
    80005958:	0ff0000f          	fence
    8000595c:	fffff097          	auipc	ra,0xfffff
    80005960:	8a4080e7          	jalr	-1884(ra) # 80004200 <mycpu>
    80005964:	01813083          	ld	ra,24(sp)
    80005968:	01013403          	ld	s0,16(sp)
    8000596c:	00a4b823          	sd	a0,16(s1)
    80005970:	00013903          	ld	s2,0(sp)
    80005974:	00813483          	ld	s1,8(sp)
    80005978:	02010113          	addi	sp,sp,32
    8000597c:	00008067          	ret
    80005980:	0104b903          	ld	s2,16(s1)
    80005984:	fffff097          	auipc	ra,0xfffff
    80005988:	87c080e7          	jalr	-1924(ra) # 80004200 <mycpu>
    8000598c:	faa91ce3          	bne	s2,a0,80005944 <acquire+0x58>
    80005990:	00002517          	auipc	a0,0x2
    80005994:	b8850513          	addi	a0,a0,-1144 # 80007518 <digits+0x20>
    80005998:	fffff097          	auipc	ra,0xfffff
    8000599c:	224080e7          	jalr	548(ra) # 80004bbc <panic>
    800059a0:	00195913          	srli	s2,s2,0x1
    800059a4:	fffff097          	auipc	ra,0xfffff
    800059a8:	85c080e7          	jalr	-1956(ra) # 80004200 <mycpu>
    800059ac:	00197913          	andi	s2,s2,1
    800059b0:	07252e23          	sw	s2,124(a0)
    800059b4:	f75ff06f          	j	80005928 <acquire+0x3c>

00000000800059b8 <release>:
    800059b8:	fe010113          	addi	sp,sp,-32
    800059bc:	00813823          	sd	s0,16(sp)
    800059c0:	00113c23          	sd	ra,24(sp)
    800059c4:	00913423          	sd	s1,8(sp)
    800059c8:	01213023          	sd	s2,0(sp)
    800059cc:	02010413          	addi	s0,sp,32
    800059d0:	00052783          	lw	a5,0(a0)
    800059d4:	00079a63          	bnez	a5,800059e8 <release+0x30>
    800059d8:	00002517          	auipc	a0,0x2
    800059dc:	b4850513          	addi	a0,a0,-1208 # 80007520 <digits+0x28>
    800059e0:	fffff097          	auipc	ra,0xfffff
    800059e4:	1dc080e7          	jalr	476(ra) # 80004bbc <panic>
    800059e8:	01053903          	ld	s2,16(a0)
    800059ec:	00050493          	mv	s1,a0
    800059f0:	fffff097          	auipc	ra,0xfffff
    800059f4:	810080e7          	jalr	-2032(ra) # 80004200 <mycpu>
    800059f8:	fea910e3          	bne	s2,a0,800059d8 <release+0x20>
    800059fc:	0004b823          	sd	zero,16(s1)
    80005a00:	0ff0000f          	fence
    80005a04:	0f50000f          	fence	iorw,ow
    80005a08:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005a0c:	ffffe097          	auipc	ra,0xffffe
    80005a10:	7f4080e7          	jalr	2036(ra) # 80004200 <mycpu>
    80005a14:	100027f3          	csrr	a5,sstatus
    80005a18:	0027f793          	andi	a5,a5,2
    80005a1c:	04079a63          	bnez	a5,80005a70 <release+0xb8>
    80005a20:	07852783          	lw	a5,120(a0)
    80005a24:	02f05e63          	blez	a5,80005a60 <release+0xa8>
    80005a28:	fff7871b          	addiw	a4,a5,-1
    80005a2c:	06e52c23          	sw	a4,120(a0)
    80005a30:	00071c63          	bnez	a4,80005a48 <release+0x90>
    80005a34:	07c52783          	lw	a5,124(a0)
    80005a38:	00078863          	beqz	a5,80005a48 <release+0x90>
    80005a3c:	100027f3          	csrr	a5,sstatus
    80005a40:	0027e793          	ori	a5,a5,2
    80005a44:	10079073          	csrw	sstatus,a5
    80005a48:	01813083          	ld	ra,24(sp)
    80005a4c:	01013403          	ld	s0,16(sp)
    80005a50:	00813483          	ld	s1,8(sp)
    80005a54:	00013903          	ld	s2,0(sp)
    80005a58:	02010113          	addi	sp,sp,32
    80005a5c:	00008067          	ret
    80005a60:	00002517          	auipc	a0,0x2
    80005a64:	ae050513          	addi	a0,a0,-1312 # 80007540 <digits+0x48>
    80005a68:	fffff097          	auipc	ra,0xfffff
    80005a6c:	154080e7          	jalr	340(ra) # 80004bbc <panic>
    80005a70:	00002517          	auipc	a0,0x2
    80005a74:	ab850513          	addi	a0,a0,-1352 # 80007528 <digits+0x30>
    80005a78:	fffff097          	auipc	ra,0xfffff
    80005a7c:	144080e7          	jalr	324(ra) # 80004bbc <panic>

0000000080005a80 <holding>:
    80005a80:	00052783          	lw	a5,0(a0)
    80005a84:	00079663          	bnez	a5,80005a90 <holding+0x10>
    80005a88:	00000513          	li	a0,0
    80005a8c:	00008067          	ret
    80005a90:	fe010113          	addi	sp,sp,-32
    80005a94:	00813823          	sd	s0,16(sp)
    80005a98:	00913423          	sd	s1,8(sp)
    80005a9c:	00113c23          	sd	ra,24(sp)
    80005aa0:	02010413          	addi	s0,sp,32
    80005aa4:	01053483          	ld	s1,16(a0)
    80005aa8:	ffffe097          	auipc	ra,0xffffe
    80005aac:	758080e7          	jalr	1880(ra) # 80004200 <mycpu>
    80005ab0:	01813083          	ld	ra,24(sp)
    80005ab4:	01013403          	ld	s0,16(sp)
    80005ab8:	40a48533          	sub	a0,s1,a0
    80005abc:	00153513          	seqz	a0,a0
    80005ac0:	00813483          	ld	s1,8(sp)
    80005ac4:	02010113          	addi	sp,sp,32
    80005ac8:	00008067          	ret

0000000080005acc <push_off>:
    80005acc:	fe010113          	addi	sp,sp,-32
    80005ad0:	00813823          	sd	s0,16(sp)
    80005ad4:	00113c23          	sd	ra,24(sp)
    80005ad8:	00913423          	sd	s1,8(sp)
    80005adc:	02010413          	addi	s0,sp,32
    80005ae0:	100024f3          	csrr	s1,sstatus
    80005ae4:	100027f3          	csrr	a5,sstatus
    80005ae8:	ffd7f793          	andi	a5,a5,-3
    80005aec:	10079073          	csrw	sstatus,a5
    80005af0:	ffffe097          	auipc	ra,0xffffe
    80005af4:	710080e7          	jalr	1808(ra) # 80004200 <mycpu>
    80005af8:	07852783          	lw	a5,120(a0)
    80005afc:	02078663          	beqz	a5,80005b28 <push_off+0x5c>
    80005b00:	ffffe097          	auipc	ra,0xffffe
    80005b04:	700080e7          	jalr	1792(ra) # 80004200 <mycpu>
    80005b08:	07852783          	lw	a5,120(a0)
    80005b0c:	01813083          	ld	ra,24(sp)
    80005b10:	01013403          	ld	s0,16(sp)
    80005b14:	0017879b          	addiw	a5,a5,1
    80005b18:	06f52c23          	sw	a5,120(a0)
    80005b1c:	00813483          	ld	s1,8(sp)
    80005b20:	02010113          	addi	sp,sp,32
    80005b24:	00008067          	ret
    80005b28:	0014d493          	srli	s1,s1,0x1
    80005b2c:	ffffe097          	auipc	ra,0xffffe
    80005b30:	6d4080e7          	jalr	1748(ra) # 80004200 <mycpu>
    80005b34:	0014f493          	andi	s1,s1,1
    80005b38:	06952e23          	sw	s1,124(a0)
    80005b3c:	fc5ff06f          	j	80005b00 <push_off+0x34>

0000000080005b40 <pop_off>:
    80005b40:	ff010113          	addi	sp,sp,-16
    80005b44:	00813023          	sd	s0,0(sp)
    80005b48:	00113423          	sd	ra,8(sp)
    80005b4c:	01010413          	addi	s0,sp,16
    80005b50:	ffffe097          	auipc	ra,0xffffe
    80005b54:	6b0080e7          	jalr	1712(ra) # 80004200 <mycpu>
    80005b58:	100027f3          	csrr	a5,sstatus
    80005b5c:	0027f793          	andi	a5,a5,2
    80005b60:	04079663          	bnez	a5,80005bac <pop_off+0x6c>
    80005b64:	07852783          	lw	a5,120(a0)
    80005b68:	02f05a63          	blez	a5,80005b9c <pop_off+0x5c>
    80005b6c:	fff7871b          	addiw	a4,a5,-1
    80005b70:	06e52c23          	sw	a4,120(a0)
    80005b74:	00071c63          	bnez	a4,80005b8c <pop_off+0x4c>
    80005b78:	07c52783          	lw	a5,124(a0)
    80005b7c:	00078863          	beqz	a5,80005b8c <pop_off+0x4c>
    80005b80:	100027f3          	csrr	a5,sstatus
    80005b84:	0027e793          	ori	a5,a5,2
    80005b88:	10079073          	csrw	sstatus,a5
    80005b8c:	00813083          	ld	ra,8(sp)
    80005b90:	00013403          	ld	s0,0(sp)
    80005b94:	01010113          	addi	sp,sp,16
    80005b98:	00008067          	ret
    80005b9c:	00002517          	auipc	a0,0x2
    80005ba0:	9a450513          	addi	a0,a0,-1628 # 80007540 <digits+0x48>
    80005ba4:	fffff097          	auipc	ra,0xfffff
    80005ba8:	018080e7          	jalr	24(ra) # 80004bbc <panic>
    80005bac:	00002517          	auipc	a0,0x2
    80005bb0:	97c50513          	addi	a0,a0,-1668 # 80007528 <digits+0x30>
    80005bb4:	fffff097          	auipc	ra,0xfffff
    80005bb8:	008080e7          	jalr	8(ra) # 80004bbc <panic>

0000000080005bbc <push_on>:
    80005bbc:	fe010113          	addi	sp,sp,-32
    80005bc0:	00813823          	sd	s0,16(sp)
    80005bc4:	00113c23          	sd	ra,24(sp)
    80005bc8:	00913423          	sd	s1,8(sp)
    80005bcc:	02010413          	addi	s0,sp,32
    80005bd0:	100024f3          	csrr	s1,sstatus
    80005bd4:	100027f3          	csrr	a5,sstatus
    80005bd8:	0027e793          	ori	a5,a5,2
    80005bdc:	10079073          	csrw	sstatus,a5
    80005be0:	ffffe097          	auipc	ra,0xffffe
    80005be4:	620080e7          	jalr	1568(ra) # 80004200 <mycpu>
    80005be8:	07852783          	lw	a5,120(a0)
    80005bec:	02078663          	beqz	a5,80005c18 <push_on+0x5c>
    80005bf0:	ffffe097          	auipc	ra,0xffffe
    80005bf4:	610080e7          	jalr	1552(ra) # 80004200 <mycpu>
    80005bf8:	07852783          	lw	a5,120(a0)
    80005bfc:	01813083          	ld	ra,24(sp)
    80005c00:	01013403          	ld	s0,16(sp)
    80005c04:	0017879b          	addiw	a5,a5,1
    80005c08:	06f52c23          	sw	a5,120(a0)
    80005c0c:	00813483          	ld	s1,8(sp)
    80005c10:	02010113          	addi	sp,sp,32
    80005c14:	00008067          	ret
    80005c18:	0014d493          	srli	s1,s1,0x1
    80005c1c:	ffffe097          	auipc	ra,0xffffe
    80005c20:	5e4080e7          	jalr	1508(ra) # 80004200 <mycpu>
    80005c24:	0014f493          	andi	s1,s1,1
    80005c28:	06952e23          	sw	s1,124(a0)
    80005c2c:	fc5ff06f          	j	80005bf0 <push_on+0x34>

0000000080005c30 <pop_on>:
    80005c30:	ff010113          	addi	sp,sp,-16
    80005c34:	00813023          	sd	s0,0(sp)
    80005c38:	00113423          	sd	ra,8(sp)
    80005c3c:	01010413          	addi	s0,sp,16
    80005c40:	ffffe097          	auipc	ra,0xffffe
    80005c44:	5c0080e7          	jalr	1472(ra) # 80004200 <mycpu>
    80005c48:	100027f3          	csrr	a5,sstatus
    80005c4c:	0027f793          	andi	a5,a5,2
    80005c50:	04078463          	beqz	a5,80005c98 <pop_on+0x68>
    80005c54:	07852783          	lw	a5,120(a0)
    80005c58:	02f05863          	blez	a5,80005c88 <pop_on+0x58>
    80005c5c:	fff7879b          	addiw	a5,a5,-1
    80005c60:	06f52c23          	sw	a5,120(a0)
    80005c64:	07853783          	ld	a5,120(a0)
    80005c68:	00079863          	bnez	a5,80005c78 <pop_on+0x48>
    80005c6c:	100027f3          	csrr	a5,sstatus
    80005c70:	ffd7f793          	andi	a5,a5,-3
    80005c74:	10079073          	csrw	sstatus,a5
    80005c78:	00813083          	ld	ra,8(sp)
    80005c7c:	00013403          	ld	s0,0(sp)
    80005c80:	01010113          	addi	sp,sp,16
    80005c84:	00008067          	ret
    80005c88:	00002517          	auipc	a0,0x2
    80005c8c:	8e050513          	addi	a0,a0,-1824 # 80007568 <digits+0x70>
    80005c90:	fffff097          	auipc	ra,0xfffff
    80005c94:	f2c080e7          	jalr	-212(ra) # 80004bbc <panic>
    80005c98:	00002517          	auipc	a0,0x2
    80005c9c:	8b050513          	addi	a0,a0,-1872 # 80007548 <digits+0x50>
    80005ca0:	fffff097          	auipc	ra,0xfffff
    80005ca4:	f1c080e7          	jalr	-228(ra) # 80004bbc <panic>

0000000080005ca8 <__memset>:
    80005ca8:	ff010113          	addi	sp,sp,-16
    80005cac:	00813423          	sd	s0,8(sp)
    80005cb0:	01010413          	addi	s0,sp,16
    80005cb4:	1a060e63          	beqz	a2,80005e70 <__memset+0x1c8>
    80005cb8:	40a007b3          	neg	a5,a0
    80005cbc:	0077f793          	andi	a5,a5,7
    80005cc0:	00778693          	addi	a3,a5,7
    80005cc4:	00b00813          	li	a6,11
    80005cc8:	0ff5f593          	andi	a1,a1,255
    80005ccc:	fff6071b          	addiw	a4,a2,-1
    80005cd0:	1b06e663          	bltu	a3,a6,80005e7c <__memset+0x1d4>
    80005cd4:	1cd76463          	bltu	a4,a3,80005e9c <__memset+0x1f4>
    80005cd8:	1a078e63          	beqz	a5,80005e94 <__memset+0x1ec>
    80005cdc:	00b50023          	sb	a1,0(a0)
    80005ce0:	00100713          	li	a4,1
    80005ce4:	1ae78463          	beq	a5,a4,80005e8c <__memset+0x1e4>
    80005ce8:	00b500a3          	sb	a1,1(a0)
    80005cec:	00200713          	li	a4,2
    80005cf0:	1ae78a63          	beq	a5,a4,80005ea4 <__memset+0x1fc>
    80005cf4:	00b50123          	sb	a1,2(a0)
    80005cf8:	00300713          	li	a4,3
    80005cfc:	18e78463          	beq	a5,a4,80005e84 <__memset+0x1dc>
    80005d00:	00b501a3          	sb	a1,3(a0)
    80005d04:	00400713          	li	a4,4
    80005d08:	1ae78263          	beq	a5,a4,80005eac <__memset+0x204>
    80005d0c:	00b50223          	sb	a1,4(a0)
    80005d10:	00500713          	li	a4,5
    80005d14:	1ae78063          	beq	a5,a4,80005eb4 <__memset+0x20c>
    80005d18:	00b502a3          	sb	a1,5(a0)
    80005d1c:	00700713          	li	a4,7
    80005d20:	18e79e63          	bne	a5,a4,80005ebc <__memset+0x214>
    80005d24:	00b50323          	sb	a1,6(a0)
    80005d28:	00700e93          	li	t4,7
    80005d2c:	00859713          	slli	a4,a1,0x8
    80005d30:	00e5e733          	or	a4,a1,a4
    80005d34:	01059e13          	slli	t3,a1,0x10
    80005d38:	01c76e33          	or	t3,a4,t3
    80005d3c:	01859313          	slli	t1,a1,0x18
    80005d40:	006e6333          	or	t1,t3,t1
    80005d44:	02059893          	slli	a7,a1,0x20
    80005d48:	40f60e3b          	subw	t3,a2,a5
    80005d4c:	011368b3          	or	a7,t1,a7
    80005d50:	02859813          	slli	a6,a1,0x28
    80005d54:	0108e833          	or	a6,a7,a6
    80005d58:	03059693          	slli	a3,a1,0x30
    80005d5c:	003e589b          	srliw	a7,t3,0x3
    80005d60:	00d866b3          	or	a3,a6,a3
    80005d64:	03859713          	slli	a4,a1,0x38
    80005d68:	00389813          	slli	a6,a7,0x3
    80005d6c:	00f507b3          	add	a5,a0,a5
    80005d70:	00e6e733          	or	a4,a3,a4
    80005d74:	000e089b          	sext.w	a7,t3
    80005d78:	00f806b3          	add	a3,a6,a5
    80005d7c:	00e7b023          	sd	a4,0(a5)
    80005d80:	00878793          	addi	a5,a5,8
    80005d84:	fed79ce3          	bne	a5,a3,80005d7c <__memset+0xd4>
    80005d88:	ff8e7793          	andi	a5,t3,-8
    80005d8c:	0007871b          	sext.w	a4,a5
    80005d90:	01d787bb          	addw	a5,a5,t4
    80005d94:	0ce88e63          	beq	a7,a4,80005e70 <__memset+0x1c8>
    80005d98:	00f50733          	add	a4,a0,a5
    80005d9c:	00b70023          	sb	a1,0(a4)
    80005da0:	0017871b          	addiw	a4,a5,1
    80005da4:	0cc77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005da8:	00e50733          	add	a4,a0,a4
    80005dac:	00b70023          	sb	a1,0(a4)
    80005db0:	0027871b          	addiw	a4,a5,2
    80005db4:	0ac77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005db8:	00e50733          	add	a4,a0,a4
    80005dbc:	00b70023          	sb	a1,0(a4)
    80005dc0:	0037871b          	addiw	a4,a5,3
    80005dc4:	0ac77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005dc8:	00e50733          	add	a4,a0,a4
    80005dcc:	00b70023          	sb	a1,0(a4)
    80005dd0:	0047871b          	addiw	a4,a5,4
    80005dd4:	08c77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005dd8:	00e50733          	add	a4,a0,a4
    80005ddc:	00b70023          	sb	a1,0(a4)
    80005de0:	0057871b          	addiw	a4,a5,5
    80005de4:	08c77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005de8:	00e50733          	add	a4,a0,a4
    80005dec:	00b70023          	sb	a1,0(a4)
    80005df0:	0067871b          	addiw	a4,a5,6
    80005df4:	06c77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005df8:	00e50733          	add	a4,a0,a4
    80005dfc:	00b70023          	sb	a1,0(a4)
    80005e00:	0077871b          	addiw	a4,a5,7
    80005e04:	06c77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e08:	00e50733          	add	a4,a0,a4
    80005e0c:	00b70023          	sb	a1,0(a4)
    80005e10:	0087871b          	addiw	a4,a5,8
    80005e14:	04c77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e18:	00e50733          	add	a4,a0,a4
    80005e1c:	00b70023          	sb	a1,0(a4)
    80005e20:	0097871b          	addiw	a4,a5,9
    80005e24:	04c77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e28:	00e50733          	add	a4,a0,a4
    80005e2c:	00b70023          	sb	a1,0(a4)
    80005e30:	00a7871b          	addiw	a4,a5,10
    80005e34:	02c77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e38:	00e50733          	add	a4,a0,a4
    80005e3c:	00b70023          	sb	a1,0(a4)
    80005e40:	00b7871b          	addiw	a4,a5,11
    80005e44:	02c77663          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e48:	00e50733          	add	a4,a0,a4
    80005e4c:	00b70023          	sb	a1,0(a4)
    80005e50:	00c7871b          	addiw	a4,a5,12
    80005e54:	00c77e63          	bgeu	a4,a2,80005e70 <__memset+0x1c8>
    80005e58:	00e50733          	add	a4,a0,a4
    80005e5c:	00b70023          	sb	a1,0(a4)
    80005e60:	00d7879b          	addiw	a5,a5,13
    80005e64:	00c7f663          	bgeu	a5,a2,80005e70 <__memset+0x1c8>
    80005e68:	00f507b3          	add	a5,a0,a5
    80005e6c:	00b78023          	sb	a1,0(a5)
    80005e70:	00813403          	ld	s0,8(sp)
    80005e74:	01010113          	addi	sp,sp,16
    80005e78:	00008067          	ret
    80005e7c:	00b00693          	li	a3,11
    80005e80:	e55ff06f          	j	80005cd4 <__memset+0x2c>
    80005e84:	00300e93          	li	t4,3
    80005e88:	ea5ff06f          	j	80005d2c <__memset+0x84>
    80005e8c:	00100e93          	li	t4,1
    80005e90:	e9dff06f          	j	80005d2c <__memset+0x84>
    80005e94:	00000e93          	li	t4,0
    80005e98:	e95ff06f          	j	80005d2c <__memset+0x84>
    80005e9c:	00000793          	li	a5,0
    80005ea0:	ef9ff06f          	j	80005d98 <__memset+0xf0>
    80005ea4:	00200e93          	li	t4,2
    80005ea8:	e85ff06f          	j	80005d2c <__memset+0x84>
    80005eac:	00400e93          	li	t4,4
    80005eb0:	e7dff06f          	j	80005d2c <__memset+0x84>
    80005eb4:	00500e93          	li	t4,5
    80005eb8:	e75ff06f          	j	80005d2c <__memset+0x84>
    80005ebc:	00600e93          	li	t4,6
    80005ec0:	e6dff06f          	j	80005d2c <__memset+0x84>

0000000080005ec4 <__memmove>:
    80005ec4:	ff010113          	addi	sp,sp,-16
    80005ec8:	00813423          	sd	s0,8(sp)
    80005ecc:	01010413          	addi	s0,sp,16
    80005ed0:	0e060863          	beqz	a2,80005fc0 <__memmove+0xfc>
    80005ed4:	fff6069b          	addiw	a3,a2,-1
    80005ed8:	0006881b          	sext.w	a6,a3
    80005edc:	0ea5e863          	bltu	a1,a0,80005fcc <__memmove+0x108>
    80005ee0:	00758713          	addi	a4,a1,7
    80005ee4:	00a5e7b3          	or	a5,a1,a0
    80005ee8:	40a70733          	sub	a4,a4,a0
    80005eec:	0077f793          	andi	a5,a5,7
    80005ef0:	00f73713          	sltiu	a4,a4,15
    80005ef4:	00174713          	xori	a4,a4,1
    80005ef8:	0017b793          	seqz	a5,a5
    80005efc:	00e7f7b3          	and	a5,a5,a4
    80005f00:	10078863          	beqz	a5,80006010 <__memmove+0x14c>
    80005f04:	00900793          	li	a5,9
    80005f08:	1107f463          	bgeu	a5,a6,80006010 <__memmove+0x14c>
    80005f0c:	0036581b          	srliw	a6,a2,0x3
    80005f10:	fff8081b          	addiw	a6,a6,-1
    80005f14:	02081813          	slli	a6,a6,0x20
    80005f18:	01d85893          	srli	a7,a6,0x1d
    80005f1c:	00858813          	addi	a6,a1,8
    80005f20:	00058793          	mv	a5,a1
    80005f24:	00050713          	mv	a4,a0
    80005f28:	01088833          	add	a6,a7,a6
    80005f2c:	0007b883          	ld	a7,0(a5)
    80005f30:	00878793          	addi	a5,a5,8
    80005f34:	00870713          	addi	a4,a4,8
    80005f38:	ff173c23          	sd	a7,-8(a4)
    80005f3c:	ff0798e3          	bne	a5,a6,80005f2c <__memmove+0x68>
    80005f40:	ff867713          	andi	a4,a2,-8
    80005f44:	02071793          	slli	a5,a4,0x20
    80005f48:	0207d793          	srli	a5,a5,0x20
    80005f4c:	00f585b3          	add	a1,a1,a5
    80005f50:	40e686bb          	subw	a3,a3,a4
    80005f54:	00f507b3          	add	a5,a0,a5
    80005f58:	06e60463          	beq	a2,a4,80005fc0 <__memmove+0xfc>
    80005f5c:	0005c703          	lbu	a4,0(a1)
    80005f60:	00e78023          	sb	a4,0(a5)
    80005f64:	04068e63          	beqz	a3,80005fc0 <__memmove+0xfc>
    80005f68:	0015c603          	lbu	a2,1(a1)
    80005f6c:	00100713          	li	a4,1
    80005f70:	00c780a3          	sb	a2,1(a5)
    80005f74:	04e68663          	beq	a3,a4,80005fc0 <__memmove+0xfc>
    80005f78:	0025c603          	lbu	a2,2(a1)
    80005f7c:	00200713          	li	a4,2
    80005f80:	00c78123          	sb	a2,2(a5)
    80005f84:	02e68e63          	beq	a3,a4,80005fc0 <__memmove+0xfc>
    80005f88:	0035c603          	lbu	a2,3(a1)
    80005f8c:	00300713          	li	a4,3
    80005f90:	00c781a3          	sb	a2,3(a5)
    80005f94:	02e68663          	beq	a3,a4,80005fc0 <__memmove+0xfc>
    80005f98:	0045c603          	lbu	a2,4(a1)
    80005f9c:	00400713          	li	a4,4
    80005fa0:	00c78223          	sb	a2,4(a5)
    80005fa4:	00e68e63          	beq	a3,a4,80005fc0 <__memmove+0xfc>
    80005fa8:	0055c603          	lbu	a2,5(a1)
    80005fac:	00500713          	li	a4,5
    80005fb0:	00c782a3          	sb	a2,5(a5)
    80005fb4:	00e68663          	beq	a3,a4,80005fc0 <__memmove+0xfc>
    80005fb8:	0065c703          	lbu	a4,6(a1)
    80005fbc:	00e78323          	sb	a4,6(a5)
    80005fc0:	00813403          	ld	s0,8(sp)
    80005fc4:	01010113          	addi	sp,sp,16
    80005fc8:	00008067          	ret
    80005fcc:	02061713          	slli	a4,a2,0x20
    80005fd0:	02075713          	srli	a4,a4,0x20
    80005fd4:	00e587b3          	add	a5,a1,a4
    80005fd8:	f0f574e3          	bgeu	a0,a5,80005ee0 <__memmove+0x1c>
    80005fdc:	02069613          	slli	a2,a3,0x20
    80005fe0:	02065613          	srli	a2,a2,0x20
    80005fe4:	fff64613          	not	a2,a2
    80005fe8:	00e50733          	add	a4,a0,a4
    80005fec:	00c78633          	add	a2,a5,a2
    80005ff0:	fff7c683          	lbu	a3,-1(a5)
    80005ff4:	fff78793          	addi	a5,a5,-1
    80005ff8:	fff70713          	addi	a4,a4,-1
    80005ffc:	00d70023          	sb	a3,0(a4)
    80006000:	fec798e3          	bne	a5,a2,80005ff0 <__memmove+0x12c>
    80006004:	00813403          	ld	s0,8(sp)
    80006008:	01010113          	addi	sp,sp,16
    8000600c:	00008067          	ret
    80006010:	02069713          	slli	a4,a3,0x20
    80006014:	02075713          	srli	a4,a4,0x20
    80006018:	00170713          	addi	a4,a4,1
    8000601c:	00e50733          	add	a4,a0,a4
    80006020:	00050793          	mv	a5,a0
    80006024:	0005c683          	lbu	a3,0(a1)
    80006028:	00178793          	addi	a5,a5,1
    8000602c:	00158593          	addi	a1,a1,1
    80006030:	fed78fa3          	sb	a3,-1(a5)
    80006034:	fee798e3          	bne	a5,a4,80006024 <__memmove+0x160>
    80006038:	f89ff06f          	j	80005fc0 <__memmove+0xfc>

000000008000603c <__putc>:
    8000603c:	fe010113          	addi	sp,sp,-32
    80006040:	00813823          	sd	s0,16(sp)
    80006044:	00113c23          	sd	ra,24(sp)
    80006048:	02010413          	addi	s0,sp,32
    8000604c:	00050793          	mv	a5,a0
    80006050:	fef40593          	addi	a1,s0,-17
    80006054:	00100613          	li	a2,1
    80006058:	00000513          	li	a0,0
    8000605c:	fef407a3          	sb	a5,-17(s0)
    80006060:	fffff097          	auipc	ra,0xfffff
    80006064:	b3c080e7          	jalr	-1220(ra) # 80004b9c <console_write>
    80006068:	01813083          	ld	ra,24(sp)
    8000606c:	01013403          	ld	s0,16(sp)
    80006070:	02010113          	addi	sp,sp,32
    80006074:	00008067          	ret

0000000080006078 <__getc>:
    80006078:	fe010113          	addi	sp,sp,-32
    8000607c:	00813823          	sd	s0,16(sp)
    80006080:	00113c23          	sd	ra,24(sp)
    80006084:	02010413          	addi	s0,sp,32
    80006088:	fe840593          	addi	a1,s0,-24
    8000608c:	00100613          	li	a2,1
    80006090:	00000513          	li	a0,0
    80006094:	fffff097          	auipc	ra,0xfffff
    80006098:	ae8080e7          	jalr	-1304(ra) # 80004b7c <console_read>
    8000609c:	fe844503          	lbu	a0,-24(s0)
    800060a0:	01813083          	ld	ra,24(sp)
    800060a4:	01013403          	ld	s0,16(sp)
    800060a8:	02010113          	addi	sp,sp,32
    800060ac:	00008067          	ret

00000000800060b0 <console_handler>:
    800060b0:	fe010113          	addi	sp,sp,-32
    800060b4:	00813823          	sd	s0,16(sp)
    800060b8:	00113c23          	sd	ra,24(sp)
    800060bc:	00913423          	sd	s1,8(sp)
    800060c0:	02010413          	addi	s0,sp,32
    800060c4:	14202773          	csrr	a4,scause
    800060c8:	100027f3          	csrr	a5,sstatus
    800060cc:	0027f793          	andi	a5,a5,2
    800060d0:	06079e63          	bnez	a5,8000614c <console_handler+0x9c>
    800060d4:	00074c63          	bltz	a4,800060ec <console_handler+0x3c>
    800060d8:	01813083          	ld	ra,24(sp)
    800060dc:	01013403          	ld	s0,16(sp)
    800060e0:	00813483          	ld	s1,8(sp)
    800060e4:	02010113          	addi	sp,sp,32
    800060e8:	00008067          	ret
    800060ec:	0ff77713          	andi	a4,a4,255
    800060f0:	00900793          	li	a5,9
    800060f4:	fef712e3          	bne	a4,a5,800060d8 <console_handler+0x28>
    800060f8:	ffffe097          	auipc	ra,0xffffe
    800060fc:	6dc080e7          	jalr	1756(ra) # 800047d4 <plic_claim>
    80006100:	00a00793          	li	a5,10
    80006104:	00050493          	mv	s1,a0
    80006108:	02f50c63          	beq	a0,a5,80006140 <console_handler+0x90>
    8000610c:	fc0506e3          	beqz	a0,800060d8 <console_handler+0x28>
    80006110:	00050593          	mv	a1,a0
    80006114:	00001517          	auipc	a0,0x1
    80006118:	35c50513          	addi	a0,a0,860 # 80007470 <CONSOLE_STATUS+0x460>
    8000611c:	fffff097          	auipc	ra,0xfffff
    80006120:	afc080e7          	jalr	-1284(ra) # 80004c18 <__printf>
    80006124:	01013403          	ld	s0,16(sp)
    80006128:	01813083          	ld	ra,24(sp)
    8000612c:	00048513          	mv	a0,s1
    80006130:	00813483          	ld	s1,8(sp)
    80006134:	02010113          	addi	sp,sp,32
    80006138:	ffffe317          	auipc	t1,0xffffe
    8000613c:	6d430067          	jr	1748(t1) # 8000480c <plic_complete>
    80006140:	fffff097          	auipc	ra,0xfffff
    80006144:	3e0080e7          	jalr	992(ra) # 80005520 <uartintr>
    80006148:	fddff06f          	j	80006124 <console_handler+0x74>
    8000614c:	00001517          	auipc	a0,0x1
    80006150:	42450513          	addi	a0,a0,1060 # 80007570 <digits+0x78>
    80006154:	fffff097          	auipc	ra,0xfffff
    80006158:	a68080e7          	jalr	-1432(ra) # 80004bbc <panic>
	...
