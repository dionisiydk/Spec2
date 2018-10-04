Class {
	#name : #SpPresenterSpec,
	#superclass : #Object,
	#instVars : [
		'contexts',
		'priority',
		'definingMethod'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #testing }
SpPresenterSpec class >> createFromMethod: aMethod [

	^self new 
		definingMethod: aMethod
]

{ #category : #testing }
SpPresenterSpec class >> definingPragmas [
	self subclassResponsibility 
]

{ #category : #testing }
SpPresenterSpec class >> isDefinedIn: aMethod [
	^self definingPragmas anySatisfy: [:each | 
		aMethod hasPragmaNamed: each]
]

{ #category : #comparing }
SpPresenterSpec >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ definingMethod == anObject definingMethod
]

{ #category : #accessing }
SpPresenterSpec >> addContext: anUIContext [
	contexts add: anUIContext
]

{ #category : #applying }
SpPresenterSpec >> applyTo: aPresenter [

	aPresenter perform: definingMethod selector
]

{ #category : #accessing }
SpPresenterSpec >> backendUI: anUserInterfaceClass [
	"It adds special backend context 
	which marks view or style specs to be used only in given UI implementation.
	Concrete UI packages add helpful methods to be used as a pragma.
	For example Spec2-Morphic adds method #forMorphic 
	which is used in presenters to define morphic views:
		<forMorphic>"
		
	self addContext: (SpBackendContext fromClass: anUserInterfaceClass)
]

{ #category : #accessing }
SpPresenterSpec >> contexts [
	^ contexts
]

{ #category : #accessing }
SpPresenterSpec >> contexts: anObject [
	contexts := anObject
]

{ #category : #accessing }
SpPresenterSpec >> definingMethod [
	^ definingMethod
]

{ #category : #accessing }
SpPresenterSpec >> definingMethod: aMethod [
	definingMethod := aMethod.
	self extractParemetersFromPragmas
]

{ #category : #accessing }
SpPresenterSpec >> definingSelector [
	^definingMethod selector
]

{ #category : #initialization }
SpPresenterSpec >> extractParemetersFromPragmas [
	
	definingMethod pragmas do: [ :each | 
		(self respondsTo: each keyword) ifTrue: [ each sendTo: self ]	
	]
]

{ #category : #contexts }
SpPresenterSpec >> forParent: parentPresenterClassName [
	"Use pragma <forParent: #PresenterClass> in presenters
	to mark view and style specs to be only used 
	when presenter is created as a child inside given presenter class"
	
	self addContext: (SpParentPresenterContext fromClassName: parentPresenterClassName)
]

{ #category : #contexts }
SpPresenterSpec >> forStyle: aSymbol [
	"Use pragma <forStyle: #someStyle> in presenters
	to mark view and style specs to be only used for given style of presenter"
		
	self addContext: (SpPresenterStyleContext style: aSymbol)
]

{ #category : #contexts }
SpPresenterSpec >> forTheme: themeClassName [
	"Use pragma <forTheme: #ThemeClass> in presenters
	to mark view or style specs to be only used for concrete UI theme.
	For example for PharoLightTheme it would be:
		<forTheme: #PharoLightTheme>
	"
	self addContext: (SpThemeContext fromClassName: themeClassName)
]

{ #category : #comparing }
SpPresenterSpec >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ definingMethod hash
]

{ #category : #initialization }
SpPresenterSpec >> initialize [
	super initialize.
	
	priority := 0.
	contexts := OrderedCollection new.
]

{ #category : #testing }
SpPresenterSpec >> isSuitableFor: aPresenter [

	^contexts allSatisfy: [ :each | each isSuitableFor: aPresenter ]
]

{ #category : #accessing }
SpPresenterSpec >> localizationLevel [
	^contexts size
]

{ #category : #testing }
SpPresenterSpec >> overrides: anotherSpec [

	^self definingSelector = anotherSpec definingSelector
]

{ #category : #printing }
SpPresenterSpec >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: definingMethod name;
		nextPut: $)
]

{ #category : #accessing }
SpPresenterSpec >> priority [
	^ priority
]

{ #category : #accessing }
SpPresenterSpec >> priority: anObject [
	priority := anObject
]
