Class {
	#name : #SpFormFieldPresenter,
	#superclass : #SpValuePresenter,
	#instVars : [
		'valuePresenter',
		'namePresenter'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpFormFieldPresenter >> attachToModel [
	super attachToModel.
	
	model whenChangedSend: #valueChanged: to: self
]

{ #category : #initialization }
SpFormFieldPresenter >> createChildren [
	
	namePresenter := SpLabelPresenter textual: model name.
	valuePresenter := model createInputPresenter
]

{ #category : #testing }
SpFormFieldPresenter >> hasUnsubmittedData [
	^model hasUnacceptedValue
]

{ #category : #accessing }
SpFormFieldPresenter >> model: anObject [
	super model: anObject.
	
	model isValid ifFalse: [ currentStyle := #invalid ]
]

{ #category : #'styles-default' }
SpFormFieldPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout addPanelWith: [ :panel | 
			panel horizontal fitContent.
			panel vertical fitContent.
			layout beFlow horizontal.
			layout add: namePresenter with: [ :c | c vertical fitContent].
			layout add: (SpLabelPresenter textual: ':') with: [ :c | c vertical fitContent]].
		layout add: valuePresenter with: [ :c | 
			c margin: 4@4.
			c vertical fitContent.
			c horizontal matchParent].		
		model isOptional ifFalse: [
			layout add: (SpLabelPresenter textual: '*') with: [ :c | c vertical fitContent]].
	]
]

{ #category : #'styles-default' }
SpFormFieldPresenter >> setUpInvalidStyle [
	<styleSpec>
	<forStyle: #invalid>
	self setUpDefaultStyle.
	
	ui layout: self with: [ :layout | 
		layout add: (SpLabelPresenter iconic: #uncommentedClass) with: [ :c | ].
	]
]

{ #category : #controlling }
SpFormFieldPresenter >> submitData [
	super submitData.
	
	model acceptValue
]

{ #category : #initialization }
SpFormFieldPresenter >> valueChanged: aValueChanged [

	model isValid
		ifTrue: [ self resetStyle ] 
		ifFalse: [ self applyStyle: #invalid ].
		
	self propogateChanges 
]

{ #category : #accessing }
SpFormFieldPresenter >> valuePresenter [
	^ valuePresenter
]
