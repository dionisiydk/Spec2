Class {
	#name : #SpPointFormPresenterExample,
	#superclass : #SpFormPresenter,
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #initialization }
SpPointFormPresenterExample >> createChildren [

	self field: [ model aspect x useSlot restriction: (SpNumberRestriction minValue: 100)].	
	self field: [ model aspect y useSlot].
	self field: [ model aspect isZero readOnly name: 'it is zero point'].
	self field: [ 
		model aspect y useSlot 
			autoAcceptValues; 
			inputPresenter: (SpComboBoxPresenter options: (SpSimpleDataSource on: #(1 2 3 4))) ].
]
