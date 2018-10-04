Extension { #name : #CmdMenuGroup }

{ #category : #'*Spec2-Core' }
CmdMenuGroup >> buildSpecToolbar: aToolbarLayout [

	self isActive ifFalse: [ ^self].
	
	contents do: [ :each | each buildSpecToolbar: aToolbarLayout ]
]
