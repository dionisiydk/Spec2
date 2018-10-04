Extension { #name : #CmdShortcutActivation }

{ #category : #'*Spec2-Core' }
CmdShortcutActivation class >> enableInView: aView forCommandsOf: aPresenter [

	aView enableShortcutsForCommandsOf: aPresenter
]
