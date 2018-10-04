Class {
	#name : #SpModalMorph,
	#superclass : #DialogWindow,
	#category : 'Spec2-Morphic-Views'
}

{ #category : #initialization }
SpModalMorph >> addInitialPanel [
]

{ #category : #controlling }
SpModalMorph >> close [
	self delete
]

{ #category : #initialization }
SpModalMorph >> initialExtent [
	^300@200
]

{ #category : #initialization }
SpModalMorph >> initialize [
	super initialize.
	
	self changeTableLayout.
"	self vResizing: #shrinkWrap.
	self hResizing: #shrinkWrap"
	self extent: 300@200
]

{ #category : #initialization }
SpModalMorph >> initializeLabelArea [
	"Initialize the label area (titlebar) for the window."
	
	"self removeBoxes.
	self replaceBoxes"
]

{ #category : #'as yet unclassified' }
SpModalMorph >> openAsIs [
	^self openInWorld
]

{ #category : #'as yet unclassified' }
SpModalMorph >> setWindowColor: aColor [ 

	self color: aColor
]
