
.text
    .globl main

main:
    # Prompt for p 
    li $v0, 4            
    la $a0, promptp      
    syscall

    # Read p 
    li $v0, 5            # syscall to read integer
    syscall
    move $t0, $v0        # store p in $t0

    # Prompt for r 
    li $v0, 4            # print string
    la $a0, promptr      # load address of promptR
    syscall

    # Read r 
    li $v0, 5            # read integer
    syscall
    move $t1, $v0        # store r in $t1

    # Prompt for t 
    li $v0, 4            # print string
    la $a0, promptt      # load address of promptt
    syscall

    # Read t 
    li $v0, 5            # read integer
    syscall
    move $t2, $v0        # store t in $t2

    # Calculate si = (r * p * t) / 100
    mul $t3, $t0, $t1    # $t3 = p * r
    mul $t3, $t3, $t2    # $t3 = (p * r * t)
    li $t4, 100          # load 100 into $t4
    div $t3, $t4         # $t3 = (p * r * t) / 100

    mflo $t3             # move the result of division to $t3 (si)

    # Print the result
    li $v0, 4            # print string
    la $a0, resultsi     # load result message
    syscall

    # Print calculated si
    li $v0, 1            # print integer syscall
    move $a0, $t3        # move si to $a0
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10           # syscall to exit
    syscall
