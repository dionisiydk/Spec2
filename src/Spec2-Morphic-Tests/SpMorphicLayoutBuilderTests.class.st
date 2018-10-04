Class {
	#name : #SpMorphicLayoutBuilderTests,
	#superclass : #TestCase,
	#instVars : [
		'layout',
		'morph'
	],
	#category : 'Spec2-Morphic-Tests'
}

{ #category : #running }
SpMorphicLayoutBuilderTests >> setUp [
	super setUp.
	
	morph := PanelMorph new.
	
	layout := SpMorphicUILayoutBuilder new.
	layout viewContainer: morph.
	layout ui: SpMorphicUI new
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testApplyingPadding [

	layout padding: 3@2.
	
	self assert: morph layoutInset equals: 3@2
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithBottomCenterAlignment [

	layout beFlow alignBottomCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #bottomRight
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithBottomLeftAlignment [

	layout beFlow alignBottomLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #bottomRight
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithBottomRightAlignment [

	layout beFlow alignBottomRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #bottomRight
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithCenterAlignment [

	layout beFlow alignCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #center
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithCenterLeftAlignment [

	layout beFlow alignCenterLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #center
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithCenterRightAlignment [

	layout beFlow alignCenterRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #center
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithTopCenterAlignment [

	layout beFlow alignTopCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #topLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithTopLeftAlignment [

	layout beFlow alignTopLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #topLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeFlowWithTopRightAlignment [

	layout beFlow alignTopRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #topLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeHorizontalFlow [

	layout beFlow horizontal.
	
	self assert: morph layoutPolicy class equals: TableLayout.
	self assert: morph listDirection equals: #leftToRight.
	self assert: morph wrapDirection equals: #none
]

{ #category : #'tests-proportional' }
SpMorphicLayoutBuilderTests >> testBeProportional [

	layout beProportional.
	
	self assert: morph layoutPolicy class equals: ProportionalLayout
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testBeVerticalFlow [

	layout beFlow vertical.
	
	self assert: morph layoutPolicy class equals: TableLayout.
	self assert: morph listDirection equals: #topToBottom.
	self assert: morph wrapDirection equals: #none
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInHorizontalFlowWithBottomAlignment [

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignBottom ].
	
	self assert: morph cellPositioning equals: #bottomLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInHorizontalFlowWithCenterAlignment [

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignCenter ].
	
	self assert: morph cellPositioning equals: #leftCenter
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInHorizontalFlowWithTopAlignment [

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignTop ].
	
	self assert: morph cellPositioning equals: #topLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInVerticalFlowWithCenterAlignment [

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignCenter ].
	
	self assert: morph cellPositioning equals: #topCenter
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInVerticalFlowWithLeftAlignment [

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignLeft ].
	
	self assert: morph cellPositioning equals: #topLeft
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildInVerticalFlowWithRightAlignment [

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignRight ].
	
	self assert: morph cellPositioning equals: #topRight
]

{ #category : #'tests-flow layout' }
SpMorphicLayoutBuilderTests >> testLayoutChildMargin [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c margin: 2@3 ].
	
	self assert: morph cellInset equals: 2@3
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithExactHorizontalSize [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal matchParent. "To reset default rigid sizing"
		c horizontal exact: 100 ].
	
	self assert: child width equals: 100.
	self assert: child hResizing equals: #rigid
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithExactVerticalSize [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical matchParent. "To reset default rigid sizing"
		c vertical exact: 100 ].
	
	self assert: child height equals: 100.
	self assert: child vResizing equals: #rigid
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithGeneralFitContentStrategy [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c fitContent ].
	
	self assert: child hResizing equals: #shrinkWrap.
	self assert: child vResizing equals: #shrinkWrap
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithGeneralMatchParentStrategy [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c matchParent ].
	
	self assert: child hResizing equals: #spaceFill.
	self assert: child vResizing equals: #spaceFill
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithHorizontalFitContent [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal fitContent ].
	
	self assert: child hResizing equals: #shrinkWrap
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithHorizontalMatchParent [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal matchParent ].
	
	self assert: child hResizing equals: #spaceFill
]

{ #category : #'tests-proportional' }
SpMorphicLayoutBuilderTests >> testLayoutChildWithProportionalLayout [

	| child |
	child := Morph new.
	layout beProportional.
	layout layoutChildView: child with: [ :c |
		c proportion rightFraction: 0.25 ].
	
	self assert: child layoutFrame rightFraction equals: 0.25
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithVerticalFitContent [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical fitContent ].
	
	self assert: child vResizing equals: #shrinkWrap
]

{ #category : #tests }
SpMorphicLayoutBuilderTests >> testLayoutChildWithVerticalMatchParent [

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical matchParent ].
	
	self assert: child vResizing equals: #spaceFill
]

{ #category : #'tests-proportional' }
SpMorphicLayoutBuilderTests >> testProportionalLayoutShouldAddSplitters [

	| child |
	layout beProportional.
	layout buildBy: [ 
		child := Morph new.
		layout layoutChildView: child with: [ :c |
			c proportion rightFraction: 0.25 ].
		morph addMorphBack: child.
		child := Morph new.
		layout layoutChildView: child with: [ :c |
			c proportion leftFraction: 0.25 ].
		morph addMorphBack: child].
	
	self assert: (morph findA: ProportionalSplitterMorph) notNil
]
