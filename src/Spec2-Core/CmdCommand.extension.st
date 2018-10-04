Extension { #name : #CmdCommand }

{ #category : #'*Spec2-Core' }
CmdCommand >> buildSpecToolbar: aToolbarLayout using: aCommandActivator [
	
	| presenter |
	presenter := self createSpecToolbarItemFor: aCommandActivator.
	
	aToolbarLayout add: presenter with: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]
]

{ #category : #'*Spec2-Core' }
CmdCommand >> createSpecToolbarItemFor: aCommandActivator [
	
	^SpCommandPresenter on: aCommandActivator
]
