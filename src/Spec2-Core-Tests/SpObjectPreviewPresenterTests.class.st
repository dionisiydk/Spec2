Class {
	#name : #SpObjectPreviewPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpObjectPreviewPresenterTests >> createPresenter [
	^SpObjectPreviewPresenter on: model
]

{ #category : #running }
SpObjectPreviewPresenterTests >> defaultModel [
	^(2@3) aspect itself asValueHolder
]

{ #category : #tests }
SpObjectPreviewPresenterTests >> testCreatesButtonWhenDetailsPresenterIsSpecified [

	| actual |
	presenter detailsPresenter: SpPointFormPresenterExample new.
	presenter rebuild.
	
	actual := presenter children detect: [ :each | each class = SpCommandPresenter ].
	
	self assert: actual model menuItemName equals: '...'
]

{ #category : #tests }
SpObjectPreviewPresenterTests >> testCreatesDisplayPresenter [

	| actual |
	actual := presenter children detect: [ :each | each class = SpTextInputPresenter ].
	
	self assert: actual model baseValueHolder equals: model
]

{ #category : #tests }
SpObjectPreviewPresenterTests >> testDoesNotCreatesButtonWhenNoDetailsPresenterIsSpecified [

	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])
	
]
