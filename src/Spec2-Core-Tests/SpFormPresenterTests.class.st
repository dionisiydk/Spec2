Class {
	#name : #SpFormPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpFormPresenterTests >> createPresenter [
	^SpPointFormPresenterExample on: model
]

{ #category : #running }
SpFormPresenterTests >> defaultModel [
	^2@3
]

{ #category : #tests }
SpFormPresenterTests >> testCreationNewInstanceOnModelShouldNotShareChildren [

	| new |
	new := presenter createNewOn: model.
	
	self deny: new children == presenter children
]

{ #category : #tests }
SpFormPresenterTests >> testCreationNewInstanceOnModelShouldNotShareFields [

	| new |
	new := presenter createNewOn: model.
	
	self deny: new fields == presenter fields
]

{ #category : #tests }
SpFormPresenterTests >> testHasUnsubmittedDataWhenSomeChildHas [

	presenter fields first model value: 1000.
	self deny: presenter model x = 1000.
	
	self assert: presenter hasUnsubmittedData
]

{ #category : #tests }
SpFormPresenterTests >> testLayoutAllFields [

	self assert: presenter children equals: presenter fields asIdentitySet.
	
	self assert: presenter view contents size equals: presenter fields size
]

{ #category : #tests }
SpFormPresenterTests >> testSubmittingData [

	presenter fields first model value: 1000.
	self deny: presenter model x = 1000.
	
	presenter submitData.  
	
	self assert: presenter model x equals: 1000
]
