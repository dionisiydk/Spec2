Class {
	#name : #SpMorphLayoutBuilder,
	#superclass : #Object,
	#instVars : [
		'parentMorph',
		'morph'
	],
	#category : 'Spec2-Morphic-UI'
}

{ #category : #'instance creation' }
SpMorphLayoutBuilder class >> on: aMorph parent: parentMorph [
	^self new 
		morph: aMorph;
		parentMorph: parentMorph
]

{ #category : #assertions }
SpMorphLayoutBuilder >> assertHorizontalFlowLayout [

	(parentMorph layoutPolicy isTableLayout
		and: [parentMorph listDirection = #leftToRight]) 
			ifTrue: [ ^self].
			
	self error: 'Parent morph should have horizontal flow layout'
]

{ #category : #assertions }
SpMorphLayoutBuilder >> assertProportionalLayout [

	parentMorph layoutPolicy isProportionalLayout ifTrue: [ ^self].
			
	self error: 'Parent morph should have proportional layout!'
]

{ #category : #assertions }
SpMorphLayoutBuilder >> assertVerticalFlowLayout [

	(parentMorph layoutPolicy isTableLayout
		and: [parentMorph listDirection = #topToBottom]) 
			ifTrue: [ ^self].
			
	self error: 'Parent morph should have vertical flow layout!'
]

{ #category : #accessing }
SpMorphLayoutBuilder >> morph [
	^ morph
]

{ #category : #accessing }
SpMorphLayoutBuilder >> morph: anObject [
	morph := anObject
]

{ #category : #accessing }
SpMorphLayoutBuilder >> parentMorph [
	^ parentMorph
]

{ #category : #accessing }
SpMorphLayoutBuilder >> parentMorph: anObject [
	parentMorph := anObject
]
