Class {
	#name : #SpPresenter,
	#superclass : #Object,
	#instVars : [
		'ui',
		'model',
		'view',
		'parent',
		'mainStyle',
		'currentStyle',
		'announcer'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpPresenter class >> on: aModel [

	^self new 
		model: aModel
]

{ #category : #'instance creation' }
SpPresenter class >> on: aModel withStyle: styleName [

	^(self on: aModel)
		mainStyle: styleName
]

{ #category : #controlling }
SpPresenter >> applyStyle: newStyle [

	currentStyle := newStyle.
	self rebuild
]

{ #category : #initialization }
SpPresenter >> attachToModel [
	"Here subclasses should subscribe on model events"
	self subclassResponsibility
]

{ #category : #initialization }
SpPresenter >> attachToView [
	"Here subclasses should subscribe on view events and set view properties from the model"
	self subclassResponsibility 
]

{ #category : #initialization }
SpPresenter >> build [
	self buildView.
	self attachToModel
]

{ #category : #controlling }
SpPresenter >> buildIn: anUserInterface [
	ui := anUserInterface.
	self build
]

{ #category : #initialization }
SpPresenter >> buildView [
	ui setUpViewFor: self.
	ui annotateView: view withPresenter: self.
	self attachToView.
]

{ #category : #commands }
SpPresenter >> createCommandContext [
	"simple context allow to simply bind commands to presenter class"
	^SpSimplePresenterContext for: self
]

{ #category : #commands }
SpPresenter >> createCommandContextForCursorAt: aPoint [ 
	^self createCommandContext
]

{ #category : #copying }
SpPresenter >> createNewOn: aModelObject [

	^self copy
		model: aModelObject
]

{ #category : #accessing }
SpPresenter >> currentStyle [
	^ currentStyle
]

{ #category : #accessing }
SpPresenter >> currentStyle: aSymbol [
	currentStyle := aSymbol
]

{ #category : #initialization }
SpPresenter >> detachFromModel [
	"Here subclasses should unsubscribe from model events"
	self subclassResponsibility 
]

{ #category : #initialization }
SpPresenter >> enableCommands [

	CmdCommandActivationStrategy enableAllInView: view forCommandsOf: self
]

{ #category : #controlling }
SpPresenter >> fullRebuild [

	self rebuild
]

{ #category : #testing }
SpPresenter >> hasUnsubmittedData [
	^false
]

{ #category : #initialization }
SpPresenter >> initialize [
	super initialize.
	
	ui := SpUserInterface current
]

{ #category : #testing }
SpPresenter >> isBuilt [
	^view notNil
]

{ #category : #accessing }
SpPresenter >> mainStyle [
	^ mainStyle
]

{ #category : #accessing }
SpPresenter >> mainStyle: aSymbol [
	mainStyle := aSymbol.
	currentStyle := aSymbol
]

{ #category : #accessing }
SpPresenter >> model [
	^ model
]

{ #category : #accessing }
SpPresenter >> model: anObject [
	model := anObject
]

{ #category : #controlling }
SpPresenter >> openContextMenu: aMenu [

	ui openContextMenu: aMenu of: self
]

{ #category : #controlling }
SpPresenter >> openInWindow [

	self build.
	ui openInWindow: self
]

{ #category : #accessing }
SpPresenter >> parent [
	^ parent
]

{ #category : #accessing }
SpPresenter >> parent: anObject [
	parent := anObject
]

{ #category : #'event propogation' }
SpPresenter >> propogateChanges [

	self propogateEvent: (SpModelChanged in: self)
]

{ #category : #'event propogation' }
SpPresenter >> propogateEvent: anAnnouncement [

	announcer ifNotNil: [ announcer announce: anAnnouncement ].
	parent ifNotNil: [ parent propogateEvent: anAnnouncement ]
]

{ #category : #controlling }
SpPresenter >> rebuild [

	| currentView |
	currentView := view.
	self buildView.
	ui replaceView: currentView by: view
]

{ #category : #controlling }
SpPresenter >> resetStyle [
	currentStyle = mainStyle ifTrue: [ ^self ].
	
	self applyStyle: mainStyle
]

{ #category : #testing }
SpPresenter >> showsValidData [
	"Subclasses should know about validity of data which they represent from the model"
	
	self subclassResponsibility
]

{ #category : #controlling }
SpPresenter >> submitData [
	"Subclasses can requires special acction to submit input data from user.
	For example ValuePresenter and fields (TextInputPresenter) can use memento pattern in their model.
	For them submit data simply pushes changed values to the model"
]

{ #category : #accessing }
SpPresenter >> ui [
	^ ui
]

{ #category : #accessing }
SpPresenter >> ui: anObject [
	ui := anObject
]

{ #category : #accessing }
SpPresenter >> view [
	^ view
]

{ #category : #accessing }
SpPresenter >> view: anObject [
	view := anObject
]

{ #category : #controlling }
SpPresenter >> viewWasRemoved [

	self detachFromModel.
	parent ifNotNil: [ parent removeChild: self ]
]

{ #category : #'event propogation' }
SpPresenter >> whenModelChangedDo: aBlock [

	announcer ifNil: [ announcer := Announcer new].
	
	announcer when: SpModelChanged do: aBlock for: self
]
