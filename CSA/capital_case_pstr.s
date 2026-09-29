.text

_start:
    load_imm 32
    store_addr 600

    load_imm 97
    store_addr 604

    load_imm 122
    store_addr 608

    load_imm 1
    store_addr 612

_read_loop:
    load_addr 768
    store_addr 616

    load_addr 616
    beqz _end

    load_addr 616
    sub 604
    bltz _not_lower

    load_addr 608
    sub 616
    bltz _not_lower

    load_addr 612
    beqz _output_raw

    load_addr 616
    sub 600
    store_addr 616

    load_imm 0
    store_addr 612
    jmp _output_616

_not_lower:
    load_addr 616
    sub 600
    bnez _clear_flag

    load_imm 1
    store_addr 612
    jmp _output_raw

_clear_flag:
    load_imm 0
    store_addr 612

_output_raw:
    load_addr 616
    store_addr 772
    jmp _read_loop

_output_616:
    load_addr 616
    store_addr 772
    jmp _read_loop

_end:
    load_addr 616
    store_addr 772
    halt
