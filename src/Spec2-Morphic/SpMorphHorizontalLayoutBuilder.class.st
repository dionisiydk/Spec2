Class {
	#name : #SpMorphHorizontalLayoutBuilder,
	#superclass : #SpMorphLayoutBuilder,
	#category : 'Spec2-Morphic-UI'
}

{ #category : #'flow layout' }
SpMorphHorizontalLayoutBuilder >> alignCenter [
	self assertVerticalFlowLayout.
	
	parentMorph cellPositioning: #topCenter
]

{ #category : #'flow layout' }
SpMorphHorizontalLayoutBuilder >> alignLeft [
	self assertVerticalFlowLayout.
	
	parentMorph cellPositioning: #topLeft
]

{ #category : #'flow layout' }
SpMorphHorizontalLayoutBuilder >> alignRight [
	self assertVerticalFlowLayout.
	
	parentMorph cellPositioning: #topRight
]

{ #category : #'common layout' }
SpMorphHorizontalLayoutBuilder >> exact: aNumber [

	morph hResizing: #rigid.
	morph width: aNumber.
]

{ #category : #'common layout' }
SpMorphHorizontalLayoutBuilder >> fitContent [

	morph hResizing: #shrinkWrap
]

{ #category : #'common layout' }
SpMorphHorizontalLayoutBuilder >> matchParent [

	morph hResizing: #spaceFill
]
