Class {
	#name : #SpTableMorphDataSourceAdapter,
	#superclass : #FTDataSource,
	#instVars : [
		'dataset'
	],
	#category : 'Spec2-Morphic-Dataset'
}

{ #category : #'instance creation' }
SpTableMorphDataSourceAdapter class >> on: aDataset [
	^self new 
		dataset: aDataset
]

{ #category : #accessing }
SpTableMorphDataSourceAdapter >> cellColumn: column row: rowIndex [

	| item |
	item := self elementAt: rowIndex.
	^(column buildCellFor: item) view
]

{ #category : #accessing }
SpTableMorphDataSourceAdapter >> dataset [
	^ dataset
]

{ #category : #accessing }
SpTableMorphDataSourceAdapter >> dataset: anObject [
	dataset := anObject
]

{ #category : #private }
SpTableMorphDataSourceAdapter >> elementAt: rowIndex [
	^dataset itemAt: rowIndex
]

{ #category : #accessing }
SpTableMorphDataSourceAdapter >> headerColumn: column [
	^column wantsVisibleHeader 
		ifTrue: [ column buildHeader view]
		ifFalse: [ nil ]
]

{ #category : #accessing }
SpTableMorphDataSourceAdapter >> numberOfRows [
	^dataset itemCount
]
