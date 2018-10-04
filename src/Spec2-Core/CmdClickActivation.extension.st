Extension { #name : #CmdClickActivation }

{ #category : #'*Spec2-Core' }
CmdClickActivation class >> enableInView: aView forCommandsOf: aPresenter [

	aView enableMouseClickForCommandsOf: aPresenter
]
