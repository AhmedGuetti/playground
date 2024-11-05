	.meta source "\"test53/simple.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 14, 7
	seti r15, #1
	goto_eq L8, r14, r15
	goto L9
L8:
	seti r6, #1
	set r5, r6
	goto L10
L9:
	invoke 5, 12, 8
	seti r13, #1
	goto_eq L5, r12, r13
	goto L6
L5:
	seti r7, #1
	set r5, r7
	goto L7
L6:
	invoke 5, 10, 1
	seti r11, #1
	goto_eq L2, r10, r11
	goto L3
L2:
	seti r8, #1
	set r5, r8
	goto L4
L3:
	seti r9, #0
	set r5, r9
L4:
L7:
L10:
	invoke 4, 5, 0
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
