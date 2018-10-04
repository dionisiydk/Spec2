Class {
	#name : #SpChildMorphLayoutBuilder,
	#superclass : #SpMorphLayoutBuilder,
	#category : 'Spec2-Morphic-UI'
}

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> fitContent [

	morph 
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> flow [
	^self
]

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> horizontal [
	^SpMorphHorizontalLayoutBuilder on: morph parent: parentMorph
]

{ #category : #'layout-insets' }
SpChildMorphLayoutBuilder >> margin: aPoint [ 
	parentMorph cellInset: aPoint
]

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> matchParent [

	morph 
		hResizing: #spaceFill;
		vResizing: #spaceFill
]

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> proportion [
	self assertProportionalLayout.
	
	^morph layoutFrame ifNil: [
		morph layoutFrame: LayoutFrame identity.
		morph hResizing: #spaceFill; vResizing: #spaceFill.
		morph layoutFrame]
]

{ #category : #'layout strategies' }
SpChildMorphLayoutBuilder >> vertical [
	^SpMorphVerticalLayoutBuilder on: morph parent: parentMorph
]
