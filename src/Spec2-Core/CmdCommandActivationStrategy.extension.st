Extension { #name : #CmdCommandActivationStrategy }

{ #category : #'*Spec2-Core' }
CmdCommandActivationStrategy class >> enableAllInView: aView forCommandsOf: aPresenter [

	self allSubclassesDo: [ :each | 
		each enableInView: aView forCommandsOf: aPresenter ]
]

{ #category : #'*Spec2-Core' }
CmdCommandActivationStrategy class >> enableInView: aView forCommandsOf: aPresenter [
]
