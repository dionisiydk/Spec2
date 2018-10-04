Extension { #name : #SpTextualLabelPresenter }

{ #category : #'*Spec2-Core-Tests' }
SpTextualLabelPresenter >> setUpBlueStyleInsideSpecialyStyledMultiLabelsExample [
	<styleSpec>
	<forParent: #SpMultiLabelPresenterExample>
	<forStyle: #specialStyleForTest>

	view color: Color blue
]

{ #category : #'*Spec2-Core-Tests' }
SpTextualLabelPresenter >> setUpDefaultStubView [
	<viewSpec>
	<forStubUI>
	
	view := SpLabelViewStub named: #defaultLabel
]

{ #category : #'*Spec2-Core-Tests' }
SpTextualLabelPresenter >> setUpRedStyleInsideMultiLabelsExample [
	<styleSpec>
	<forParent: #SpMultiLabelPresenterExample>
	
	view color: Color red
]

{ #category : #'*Spec2-Core-Tests' }
SpTextualLabelPresenter >> setUpSpecialStubView [
	<viewSpec>
	<forStyle: #specialStyle>
	<forStubUI>
	
	view := SpLabelViewStub named: #specialLabel
]

{ #category : #'*Spec2-Core-Tests' }
SpTextualLabelPresenter >> setUpSpecialStyleForTest [
	<styleSpec>
	<forStyle: #specialStyleForTest>
	
	view color: Color red.
	view backgroundColor: Color blue
]
