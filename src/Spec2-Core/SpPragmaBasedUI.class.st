Class {
	#name : #SpPragmaBasedUI,
	#superclass : #SpUserInterface,
	#instVars : [
		'presenterSpecs'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'presenter building' }
SpPragmaBasedUI >> annotateView: aView withPresenter: aPresenter [ 
	aView presenter: aPresenter
]

{ #category : #'presenter building' }
SpPragmaBasedUI >> applySuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock [
		
	| suitableSpec |
	suitableSpec := self findMostSuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock. 
		
	suitableSpec applyTo: aPresenter
]

{ #category : #'specs collection' }
SpPragmaBasedUI >> collectSpecsFor: aPresenter [
	"The result will be grouped by class"
	| all currentClass |
	all := Dictionary new.	
	
	currentClass := aPresenter class.
	[currentClass = Object] whileFalse: [
		self collectSpecsFor: currentClass on: all.
		currentClass := currentClass superclass].
	
	^all
]

{ #category : #'specs collection' }
SpPragmaBasedUI >> collectSpecsFor: aPresenterClass on: aDictionary [
	"All specs are grouped by class"
	
	aPresenterClass methodsDo: [ :eachMethod | 
		self createSpecFrom: eachMethod andDo: [:spec | 
			aDictionary 
				at: spec class 	ifPresent: [ :container | 
					(container anySatisfy: [:existing | existing overrides: spec]) 
						ifFalse: [container add: spec] ]
				ifAbsentPut: [ OrderedCollection with: spec ]]]
]

{ #category : #'specs collection' }
SpPragmaBasedUI >> createSpecFrom: aMethod andDo: aBlock [

	SpPresenterSpec allSubclassesDo: [ :each |
		(each isDefinedIn: aMethod) ifTrue: [ 
			^aBlock value: (each createFromMethod: aMethod) ]		
	]
	
	
]

{ #category : #accessing }
SpPragmaBasedUI >> findMostSuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock [
		
	| targetSpecs suitableSpecs |
	targetSpecs := self specs: aSpecClass of: aPresenter.
	suitableSpecs := targetSpecs select: [ :each | each isSuitableFor: aPresenter ].
	suitableSpecs ifEmpty: [ ^absentBlock value ].
	
	^suitableSpecs detectMax: [ :each | each localizationLevel ]
]

{ #category : #initialization }
SpPragmaBasedUI >> initialize [
	super initialize.
	
	presenterSpecs := Dictionary new 
	
]

{ #category : #accessing }
SpPragmaBasedUI >> presenterSpecs [
	^ presenterSpecs
]

{ #category : #accessing }
SpPragmaBasedUI >> presenterSpecs: anObject [
	presenterSpecs := anObject
]

{ #category : #'presenter building' }
SpPragmaBasedUI >> setUpUndefinedViewFor: aPresenter [
	self subclassResponsibility 
]

{ #category : #'presenter building' }
SpPragmaBasedUI >> setUpViewFor: aPresenter [
	
	self applySuitableSpec: SpViewSpec for: aPresenter ifAbsent: [
		^self setUpUndefinedViewFor: aPresenter].
	
	self applySuitableSpec: SpStyleSpec for: aPresenter ifAbsent: [^self]
]

{ #category : #accessing }
SpPragmaBasedUI >> specs: aSpecClass of: aPresenter [

	| allSpecs |
	allSpecs := presenterSpecs at: aPresenter class ifAbsentPut: [ 
		self collectSpecsFor: aPresenter ].
	^allSpecs at: aSpecClass ifAbsent: [ #() ]
]
