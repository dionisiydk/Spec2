Class {
	#name : #SpModelChanged,
	#superclass : #Announcement,
	#instVars : [
		'sourcePresenter'
	],
	#category : 'Spec2-Core-Events'
}

{ #category : #evaluating }
SpModelChanged class >> in: aPresenter [
	^self new 
		sourcePresenter: aPresenter
]

{ #category : #accessing }
SpModelChanged >> sourcePresenter [
	^ sourcePresenter
]

{ #category : #accessing }
SpModelChanged >> sourcePresenter: anObject [
	sourcePresenter := anObject
]
