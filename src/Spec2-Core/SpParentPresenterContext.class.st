Class {
	#name : #SpParentPresenterContext,
	#superclass : #SpPresenterClassContext,
	#category : 'Spec2-Core-UI'
}

{ #category : #testing }
SpParentPresenterContext >> isSuitableFor: aPresenter [

	| parent |
	parent := aPresenter parent.
	[ parent notNil] whileTrue: [ 
		(self isSuitableForParent: parent) ifTrue: [ ^true ].
		parent := parent parent].
	
	^false
]

{ #category : #testing }
SpParentPresenterContext >> isSuitableForParent: aPresenter [

	^aPresenter isKindOf: presenterClass
]
