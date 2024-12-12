.extern _ZN5Riscv20handleSupervisorTrapEv
.align 4 # fja koja predstavlja trep, se poravnava na adresu deljivu sa 4, da bi u najniza dva bita imala vrednost nula
.global supervisorTrap
.type supervisorTrap, @function
supervisorTrap:
#cuvamo kontekst procesora pred prekid, iz registersUtil, stim sto ovde cuvamo i registre 0, 1, 2.

        addi sp, sp, -256
        .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        sd x\index, \index * 8(sp)
        .endr

        call _ZN5Riscv20handleSupervisorTrapEv

        .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ld x\index, \index * 8(sp)
        .endr
        addi sp, sp, 256

#_ZN5Riscv14supervisorTrapEv
    sret # povratak iz prekidne rutine, menja se rezim privilegija, iz sstatus se uzima koji se rezim pre prekidne rutine, da bi se sret instrukcijom vratilo u isti. odakle smo usli u prekidnu rutinu se cita iz SEPC registra, to se upisuje u PC pri povratku
    #stvec - supervisor trap vector -