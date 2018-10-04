Class {
	#name : #SpPointPresenterExample,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'x',
		'y'
	],
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #initialization }
SpPointPresenterExample >> createChildren [
	
	x := SpFormFieldPresenter on: model aspect x useSlot.
	y := SpFormFieldPresenter on: model aspect y useSlot.
]

{ #category : #'styles-default' }
SpPointPresenterExample >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		
		layout add: x with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		layout add: y with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		
	 ]
]

{ #category : #'styles-default' }
SpPointPresenterExample >> setUpOneLineStyle [
	<styleSpec>
	<forStyle: #oneLine>
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		layout add: x with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		layout add: y with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		
	 ]
]
