addi $t0, $zero, 5    //$t0 = 5 //addi OK

subi $t1, $t0, 5      //$t1 = 0 //subi OK

add $t3, $t0, $t1     //$t3 = 5 //add OK

beq $t0, $t3, label1  //branching will be executed  //beq OK

j end

label1:

sll $t4, $t0, 2       //$t4 = 20 //sll OK

sub $t1, $t4, $t3     //$t1 = 15 //sub OK

or $t4, $t1, $t0      //$t4 = ($1111 or 0101) = 1111 = 15 //or OK

nor $t1, $t4, $t3     //$t1 = (1111 nor 1111)= 11110000 //nor OK

andi $t1, $t1, 0      //$t1 = 0 //andi OK

ori $t0, $t1, 20      //$t0 = 20 //ori OK

sw $t0, 3($t1)        //mem[$t1+3] = mem[3] = 20 //sw OK

lw $t1, 3($t1)        //$t1 = 20 //lw OK

srl $t1, $t1, 1       //$t1 = 10 //srl OK

j label2              //unconditional jump will be executed //j OK

label3:

push $t1              //at the beginning, initialize the $sp as 0xFF. now mem[$sp] = mem[0xFF] = 10. //stack push OK

push $t0              //mem[0xFE] = 20

pop $t1               //$t1 = 20 //stack pop OK

pop $t0               //$t0 = 10 

j end                 //unconditional jump will be executed

label2:

bneq $t1, $t0, label3 //$t1 != $t0 so this branching will be executed //bneq OK

end: