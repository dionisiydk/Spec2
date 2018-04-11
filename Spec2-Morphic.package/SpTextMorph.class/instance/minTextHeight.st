initialization
minTextHeight
	| vgap |
	vgap := textMorph currentHScrollBarThickness isZero
		ifTrue: [  0 ]
		ifFalse: [ self currentHScrollBarThickness - 1 ].
	^ textMorph textArea height + 1 + (textMorph borderWidth * 2) + vgap