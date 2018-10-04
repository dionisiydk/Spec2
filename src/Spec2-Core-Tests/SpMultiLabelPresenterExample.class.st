Class {
	#name : #SpMultiLabelPresenterExample,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'label1',
		'label2'
	],
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #initialization }
SpMultiLabelPresenterExample >> createChildren [

	label1 := SpLabelPresenter textual: 'label1 text'.
	
	label2 := SpLabelPresenter textual: 'label2 text' withStyle: #specialStyle.
]

{ #category : #accessing }
SpMultiLabelPresenterExample >> label1 [
	^ label1
]

{ #category : #accessing }
SpMultiLabelPresenterExample >> label2 [
	^ label2
]

{ #category : #styles }
SpMultiLabelPresenterExample >> setUpComplexLayout [
	<styleSpec>
	<forStyle: #complexLayout>
	
	ui layout: self with: [:layout |
		layout beFlow vertical.
		
		layout addPanelWith: [ :p | 
			layout beFlow horizontal.
			p horizontal matchParent.
			p vertical fitContent.
			
			layout add: label1 with: [:c |
				c horizontal matchParent.
				c vertical fitContent]].
		layout addPanelWith: [ :p | 
			layout beFlow horizontal.
			p horizontal matchParent.
			p vertical fitContent.
			layout add: label2 with: [:c |
				c horizontal matchParent.
				c vertical exact: 150]].		
	]
]

{ #category : #styles }
SpMultiLabelPresenterExample >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [:layout |
		layout beFlow vertical.
		
		layout add: label1 with: [:c |
			c horizontal matchParent.
			c vertical fitContent].
		
		layout add: label2 with: [:c |
			c horizontal matchParent.
			c vertical exact: 150].		
	]
]

{ #category : #styles }
SpMultiLabelPresenterExample >> setUpSingleLabelStyle [
	<styleSpec>
	<forStyle: #singleLabel>
	
	ui layout: self with: [:layout |
		layout add: label1 with: [:c | ].
	]
]
