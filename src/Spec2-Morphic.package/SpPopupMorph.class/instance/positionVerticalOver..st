opening
positionVerticalOver: parentMorph
	| height topSpace bottomSpace pos |
	height := self height.
	topSpace := parentMorph boundsInWorld top - parentMorph world top.
	bottomSpace := parentMorph world bottom - parentMorph boundsInWorld bottom.
	pos := height <= bottomSpace
		ifTrue: [#below]
		ifFalse: [height <= topSpace
			ifTrue: [#above]
			ifFalse: [bottomSpace >= topSpace
				ifTrue: [height := bottomSpace. #below]
				ifFalse: [height := topSpace. #above]]].
		
	pos = #above
		ifTrue: [	self position: parentMorph boundsInWorld topLeft - (0 @ height)]
		ifFalse: [self position: parentMorph boundsInWorld bottomLeft ]