Class {
	#name : #SpListValueDataSource,
	#superclass : #SpDataSource,
	#instVars : [
		'listHolder'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpListValueDataSource >> listHolder [
	^ listHolder
]

{ #category : #accessing }
SpListValueDataSource >> listHolder: anObject [
	listHolder := anObject
]
