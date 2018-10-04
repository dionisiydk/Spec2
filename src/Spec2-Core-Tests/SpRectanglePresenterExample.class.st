Class {
	#name : #SpRectanglePresenterExample,
	#superclass : #SpFormPresenter,
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #initialization }
SpRectanglePresenterExample >> createChildren [
	
	self field: [ model aspect origin usePreviewWith: SpPointFormPresenterExample new ].
	self field: [ model aspect corner].
]
