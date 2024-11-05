	.meta source "\"test53/multi.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 23, 7
	seti r24, #1
	goto_eq L11, r23, r24
	goto L12
L11:
	seti r21, #1
	set r5, r21
	goto L13
L12:
	seti r22, #0
	set r5, r22
L13:
	invoke 5, 19, 8
	seti r20, #1
	goto_eq L8, r19, r20
	goto L9
L8:
	seti r17, #1
	set r6, r17
	goto L10
L9:
	seti r18, #0
	set r6, r18
L10:
	invoke 5, 15, 1
	seti r16, #1
	goto_eq L5, r15, r16
	goto L6
L5:
	seti r13, #1
	set r7, r13
	goto L7
L6:
	seti r14, #0
	set r7, r14
L7:
	add r10, r5, r6
	add r11, r10, r7
	seti r12, #0
	goto_ne L2, r11, r12
	goto L3
L2:
	seti r8, #1
	invoke 4, 8, 0
	goto L4
L3:
	seti r9, #0
	invoke 4, 9, 0
L4:
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
