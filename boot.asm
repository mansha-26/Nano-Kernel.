bits 16
org 0x7C00

start:
    jmp 0x0000:initialize

initialize:
    ; Set up segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    
    ; Set video mode
    mov ax, 0x0003
    int 0x10
    
    ; Print loading message
    mov si, loading_msg
    call print_string
    
    ; Load kernel from disk - SIMPLIFIED
    mov ax, 0x1000      ; ES:BX = 0x1000:0x0000
    mov es, ax
    mov bx, 0x0000
    
    mov ah, 0x02        ; Read sectors
    mov al, 4           ; Number of sectors to read (smaller)
    mov ch, 0           ; Cylinder 0
    mov cl, 2           ; Sector 2
    mov dh, 0           ; Head 0
    mov dl, 0x00        ; Drive 0 (floppy) - CHANGED FROM 0x80
    int 0x13
    
    jc disk_error
    
    ; Success - jump to kernel
    jmp 0x1000:0x0000

disk_error:
    mov si, error_msg
    call print_string
    ; Display error code in AH
    mov al, ah
    call print_hex
    jmp $

print_string:
    mov ah, 0x0E
.loop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

print_hex:
    ; Print AL as hex
    mov ah, 0x0E
    mov bl, al
    shr al, 4
    call .nibble
    mov al, bl
    and al, 0x0F
    call .nibble
    ret
.nibble:
    cmp al, 10
    jl .digit
    add al, 'A' - 10 - '0'
.digit:
    add al, '0'
    int 0x10
    ret

loading_msg:
    db "Loading Mini-OS kernel... ", 0
error_msg:
    db "Disk error: ", 0

times 510-($-$$) db 0
dw 0xAA55