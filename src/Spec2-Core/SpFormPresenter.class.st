Class {
	#name : #SpFormPresenter,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'fields'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #testing }
SpFormPresenter class >> isAbstract [
	^self = SpFormPresenter 
]

{ #category : #initialization }
SpFormPresenter >> field: aBlockProducedAspect [

	| newField |
	newField := SpFormFieldPresenter on: aBlockProducedAspect value.
	fields add: newField.
	^newField
]

{ #category : #accessing }
SpFormPresenter >> fields [
	^ fields
]

{ #category : #initialization }
SpFormPresenter >> initialize [
	super initialize.
	
	fields := OrderedCollection new
]

{ #category : #copying }
SpFormPresenter >> postCopy [
	super postCopy.
	fields := OrderedCollection new
]

{ #category : #'styles-default' }
SpFormPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		
		fields do: [ :each |
			layout add: each with: [ :c | 
				c margin: 6@6.
				c horizontal matchParent.
				c vertical fitContent]]
	]
]

{ #category : #'styles-default' }
SpFormPresenter >> setUpRowStyle [
	<styleSpec>
	<forStyle: #row>
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		fields do: [ :each |
			layout add: each with: [ :c | 
				c margin: 6@6.
				c horizontal matchParent.
				c vertical fitContent]]
	]
]
