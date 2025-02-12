.import utils.s

.text
main:
    # This program will fill an array of size 10 with 0's

    # Allocate an array of size 10
    li a0 40   # 10 ints, 4 bytes each
    jal malloc # malloc is defined in utils.s
    mv t0 a0   # the pointer is returned in a0
    mv t4 a0

    # Fill the array with 0's
    li t1 0  # t1 is the index
    li t2 10 # t2 is the size of the array
    li t3 1

loop:
    # Store 1 at the current index
    sw t3 0(t0)
    # Increment the index
    addi t1 t1 1
    # Increment the pointer
    addi t0 t0 4
    # Check if we are done
    # If not, loop
    blt t1 ,t2 loop

    mv a0 t4
    jal free
    # Exit the program
    li a0 0
    jal exit
