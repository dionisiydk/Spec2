Class {
	#name : #SpMorphVerticalLayoutBuilder,
	#superclass : #SpMorphLayoutBuilder,
	#category : 'Spec2-Morphic-UI'
}

{ #category : #'flow layout' }
SpMorphVerticalLayoutBuilder >> alignBottom [
	self assertHorizontalFlowLayout.
	
	parentMorph cellPositioning: #bottomLeft
]

{ #category : #'flow layout' }
SpMorphVerticalLayoutBuilder >> alignCenter [
	self assertHorizontalFlowLayout.
	
	parentMorph cellPositioning: #leftCenter
]

{ #category : #'flow layout' }
SpMorphVerticalLayoutBuilder >> alignTop [
	self assertHorizontalFlowLayout.
	
	parentMorph cellPositioning: #topLeft
]

{ #category : #'common layout' }
SpMorphVerticalLayoutBuilder >> exact: aNumber [

	morph vResizing: #rigid.
	morph height: aNumber
]

{ #category : #'common layout' }
SpMorphVerticalLayoutBuilder >> fitContent [

	morph vResizing: #shrinkWrap
]

{ #category : #'common layout' }
SpMorphVerticalLayoutBuilder >> matchParent [

	morph vResizing: #spaceFill
]
