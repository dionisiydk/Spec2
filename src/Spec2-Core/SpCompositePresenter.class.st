Class {
	#name : #SpCompositePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'children'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpCompositePresenter >> attachToModel [
	"Here subclasses should subscribe on model events.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Simple presenters implement actual logic how to attach to the model"
]

{ #category : #initialization }
SpCompositePresenter >> attachToView [
	"Here subclasses should subscribe on view events and set view properties from the model.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Simple presenters implement actual logic how to attach to the view"
]

{ #category : #initialization }
SpCompositePresenter >> build [
	self createChildren.
	
	super build
]

{ #category : #controlling }
SpCompositePresenter >> buildChild: aPresenter [
	
	aPresenter parent: self.
	children add: aPresenter.
	
	aPresenter isBuilt ifTrue: [^self].
	
	aPresenter buildIn: ui
]

{ #category : #accessing }
SpCompositePresenter >> children [
	^ children
]

{ #category : #initialization }
SpCompositePresenter >> createChildren [
	"Subclasses should create child presenters in this method"
	self subclassResponsibility
]

{ #category : #initialization }
SpCompositePresenter >> detachChildrenFromModel [
	children do: [ :each | each detachFromModel ]
]

{ #category : #initialization }
SpCompositePresenter >> detachFromModel [
	"Here subclasses should unsubscribe from model events.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Composite presenters do not subscribe to the model by default
	and therefore they do not need to unsubscribe.
	Simple presenters implement actual logic how to detach from the model"
	self detachChildrenFromModel
]

{ #category : #controlling }
SpCompositePresenter >> fullRebuild [
	children do: [ :each | each fullRebuild ].
	
	super fullRebuild
]

{ #category : #testing }
SpCompositePresenter >> hasUnsubmittedData [
	^children anySatisfy: [ :each | each hasUnsubmittedData ]
]

{ #category : #initialization }
SpCompositePresenter >> initialize [
	super initialize.
	
	children := IdentitySet new
]

{ #category : #copying }
SpCompositePresenter >> postCopy [
	super postCopy.
	children := IdentitySet new.
]

{ #category : #controlling }
SpCompositePresenter >> rebuild [
	self detachChildrenFromModel.
	children removeAll.
	
	super rebuild
]

{ #category : #accessing }
SpCompositePresenter >> removeChild: aPresenter [
	children remove: aPresenter ifAbsent: [ ]
]

{ #category : #views }
SpCompositePresenter >> setUpDefaultContainer [
	<viewSpec>

	view := ui createDefaulViewContainer
]

{ #category : #'styles-default' }
SpCompositePresenter >> setUpDefaultStyle [
	<styleSpec>
	
	self subclassResponsibility 
]

{ #category : #testing }
SpCompositePresenter >> showsValidData [
	
	^children allSatisfy: [ :each | each showsValidData ]
]

{ #category : #controlling }
SpCompositePresenter >> submitData [
	super submitData.
	
	children do: [ :each | each submitData ]
]
