	.meta source "\"test53/cell.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 13, 7
	seti r14, #1
	goto_eq L8, r13, r14
	goto L9
L8:
	seti r5, #1
	invoke 4, 5, 0
	goto L10
L9:
	invoke 5, 11, 8
	seti r12, #1
	goto_eq L5, r11, r12
	goto L6
L5:
	seti r6, #1
	invoke 4, 6, 0
	goto L7
L6:
	invoke 5, 9, 1
	seti r10, #1
	goto_eq L2, r9, r10
	goto L3
L2:
	seti r7, #1
	invoke 4, 7, 0
	goto L4
L3:
	seti r8, #0
	invoke 4, 8, 0
L4:
L7:
L10:
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
