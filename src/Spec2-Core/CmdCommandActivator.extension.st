Extension { #name : #CmdCommandActivator }

{ #category : #'*Spec2-Core' }
CmdCommandActivator >> buildSpecToolbar: aToolbarLayout [

	self canExecuteCommand ifFalse: [ ^self ].
	
	command buildSpecToolbar: aToolbarLayout using: self
]
