	.meta source "\"test53/otheralone.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	seti r15, #0
	set r5, r15
	invoke 5, 13, 7
	seti r14, #1
	goto_eq L8, r13, r14
	goto L9
L8:
	seti r12, #1
	set r5, r12
	goto L10
L9:
L10:
	invoke 5, 10, 8
	seti r11, #1
	goto_eq L5, r10, r11
	goto L6
L5:
	seti r9, #1
	set r5, r9
	goto L7
L6:
L7:
	invoke 5, 7, 1
	seti r8, #1
	goto_eq L2, r7, r8
	goto L3
L2:
	seti r6, #1
	set r5, r6
	goto L4
L3:
L4:
	invoke 4, 5, 0
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
