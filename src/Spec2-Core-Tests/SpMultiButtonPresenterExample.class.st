Class {
	#name : #SpMultiButtonPresenterExample,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'buttonRed',
		'buttonGreen'
	],
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #initialization }
SpMultiButtonPresenterExample >> createChildren [
	
	buttonRed := SpCommandPresenter 
		buttonOn: [ self applyStyle: #redStyle ] named: 'Be red' iconName: #classIcon.
	buttonGreen := SpCommandPresenter 
		buttonOn: [ self applyStyle: #greenStyle ] named: 'Be green' iconName: #testGreenIcon
]

{ #category : #'styles-default' }
SpMultiButtonPresenterExample >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow vertical.
		layout alignCenter.
		
		layout add: buttonRed with: [ :c | 
			c horizontal exact: 100.
			c vertical fitContent].
		layout add: buttonGreen with: [ :c | 
			c horizontal exact: 100.
			c vertical fitContent ]
	]
]

{ #category : #'styles-default' }
SpMultiButtonPresenterExample >> setUpGreenStyle [
	<styleSpec>
	<forStyle: #greenStyle>
	
	self setUpDefaultStyle.
	view color: Color green
]

{ #category : #'styles-default' }
SpMultiButtonPresenterExample >> setUpRedStyle [
	<styleSpec>
	<forStyle: #redStyle>
	
	self setUpDefaultStyle.
	view color: Color red
]
