Class {
	#name : #SpSelectionIndexUpdated,
	#superclass : #Announcement,
	#instVars : [
		'selection'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpSelectionIndexUpdated class >> in: aSelection [
	^self new 
		selection: aSelection
]

{ #category : #accessing }
SpSelectionIndexUpdated >> currentIndexes [
	^selection itemIndexes
]

{ #category : #accessing }
SpSelectionIndexUpdated >> selection [
	^ selection
]

{ #category : #accessing }
SpSelectionIndexUpdated >> selection: anObject [
	selection := anObject
]
