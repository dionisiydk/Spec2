Extension { #name : #SpIconicLabelPresenter }

{ #category : #'*Spec2-Morphic' }
SpIconicLabelPresenter >> setUpDefaultMorphicView [
	<viewSpec>
	<forMorphic>
	
	view := ImageMorph new
]

{ #category : #'*Spec2-Morphic' }
SpIconicLabelPresenter >> setUpDefaultStubView [
	<viewSpec>
	<forStubUI>
	
	view := SpImageViewStub new
]
