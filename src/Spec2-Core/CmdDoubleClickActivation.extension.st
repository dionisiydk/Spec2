Extension { #name : #CmdDoubleClickActivation }

{ #category : #'*Spec2-Core' }
CmdDoubleClickActivation class >> enableInView: aView forCommandsOf: aPresenter [

	aView enableMouseDoubleClickForCommandsOf: aPresenter
]
