Extension { #name : #SpPresenterSpec }

{ #category : #'*Spec2-Morphic' }
SpPresenterSpec >> forMorphic [
	"use pragma <forMorphic> to mark view and style specs to be only used in morphic UI"
	
	self backendUI: SpMorphicUI
]
