Class {
	#name : #SpDialogResult,
	#superclass : #Object,
	#instVars : [
		'applyingBlock'
	],
	#category : 'Spec2-Core-Commands'
}

{ #category : #'instance creation' }
SpDialogResult class >> with: aBlock [
	^self new 
		applyingBlock: aBlock
]

{ #category : #applying }
SpDialogResult >> apply [

	applyingBlock value
]

{ #category : #accessing }
SpDialogResult >> applyingBlock [
	^ applyingBlock
]

{ #category : #accessing }
SpDialogResult >> applyingBlock: anObject [
	applyingBlock := anObject
]
