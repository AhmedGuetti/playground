	.meta source "\"test5C/cell.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 5, 7
	seti r6, #1
	goto_eq L2, r5, r6
	goto L3
L2:
	seti r7, #1
	invoke 4, 7, 0
	goto L4
L3:
	invoke 5, 8, 8
	seti r9, #1
	goto_eq L5, r8, r9
	goto L6
L5:
	seti r10, #1
	invoke 4, 10, 0
	goto L7
L6:
	invoke 5, 11, 1
	seti r12, #1
	goto_eq L8, r11, r12
	goto L9
L8:
	seti r13, #1
	invoke 4, 13, 0
	goto L10
L9:
	seti r14, #0
	invoke 4, 14, 0
L10:
L7:
L4:
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
