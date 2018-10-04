Class {
	#name : #SpTextMorphEditingMode,
	#superclass : #RubEditingMode,
	#instVars : [
		'textMorph'
	],
	#category : 'Spec2-Morphic-Views'
}

{ #category : #'instance creation' }
SpTextMorphEditingMode class >> for: aSpTextMorph [
	^self new 
		textMorph: aSpTextMorph 
]

{ #category : #accessing }
SpTextMorphEditingMode >> editorClass [
	^SpTextMorphEditor
]

{ #category : #accessing }
SpTextMorphEditingMode >> textMorph [
	^ textMorph
]

{ #category : #accessing }
SpTextMorphEditingMode >> textMorph: anObject [
	textMorph := anObject
]
