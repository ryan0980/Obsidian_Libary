# Version 2, do nothing, then exit
# switch to the Text segment
	.text
	.globl main
main:
	# the rest of the main program will go here
	
	 # call function Exit0
	 jal Exit0  # end the program, default return status
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# switch to the Data segment
	.data
	# global data will be defined here
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Wrapper functions around some of the system calls
# See P&H COD, Fig. A.9.1, for the complete list.
# switch to the Text segment
	.text
	.globl Print_integer
Print_integer:# print the integer in register $a0
	li $v0, 1
	syscall
	jr $ra
	.globl Print_string
Print_string:
	li $v0, 4
	syscall
	jr $ra
	.globl Exit
Exit:
	li $v0, 10
	syscall
	jr $ra
	.globl Exit0
Exit0:
	li $a0, 0
	li $v0, 17
	syscall
	jr $ra
	.globl Exit2
Exit2:
	li $v0, 17
	syscall
	jr $ra



	