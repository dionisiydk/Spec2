Class {
	#name : #SpObjectPropertyAspectTests,
	#superclass : #SpValueAspectTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #helpers }
SpObjectPropertyAspectTests >> aspectExample [
	^SpObjectPropertyAspect of: 2@3 getter: #x
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilder [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect object equals: (2@3).
	self assert: aspect valueGetter selector equals: #x.
	self assert: aspect valueSetter equals: #x:.
	self assert: aspect name equals: #x.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderAsReadOnlyAspect [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x readOnly build.
	
	self assert: aspect valueSetter equals: nil
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFailsToDefineAspectTwice [
	"#aspect message gives builder instance which is waiting aspect definition using DNU logic.
	And as soon as aspect is define by simple message the builder disable DNU trick.
	So it understand any message as objecet property only at first time"
	
	| aspectBuilder |

	aspectBuilder := (2@3) aspect x.
	
	self should: [aspectBuilder x] raise: MessageNotUnderstood
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFromBlock [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| block |
	block := [:o | o x ].
	aspect := (2@3) aspect computedBy: block; build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect valueGetter equals: block.
	self assert: aspect name equals: 'noname'
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFromBooleanValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := true aspect itself build.
	
	self assert: aspect restriction equals: (SpObjectRestriction baseClass: Boolean).
	self assert: aspect stringConverter equals: SpObjectToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpBooleanPresenter.
	self assert: aspect inputPresenter mainStyle equals: #checkbox
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFromNumberValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x build.
	
	self assert: aspect restriction equals: SpNumberRestriction default.
	self assert: aspect stringConverter equals: SpNumberToStringConverter default.	
	self assert: aspect displayDecoration equals: SpSmartNumberDecoration default.
	self assert: aspect inputPresenter class equals: SpTextInputPresenter.
	self assert: aspect inputPresenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: aspect inputPresenter textDecoration equals: SpSmartNumberDecoration default.
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFromSomeObject [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3 corner: 10@30) aspect origin build.
	
	self assert: aspect restriction equals: SpAnyValueRestriction default.
	self assert: aspect stringConverter equals: SpObjectToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpObjectPreviewPresenter
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderFromTextValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := #('hello') aspect first build.

	self assert: aspect restriction equals: SpAnyTextRestriction default.
	self assert: aspect stringConverter equals: SpStringToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpTextInputPresenter.
	self assert: aspect inputPresenter inputRestriction equals: SpAnyTextRestriction default.
	self assert: aspect inputPresenter textDecoration equals: SpNoTextDecoration default.
	self assert: aspect emptyValues equals: #(nil '')
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWhenAspectIsNotDefined [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	| aspectBuilder |

	aspectBuilder := (2@3) aspect.
	
	self should: [aspectBuilder build] raise: Error
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWithCustomName [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x; name: 'point x'; build.
	
	self assert: aspect name equals: 'point x'
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWithCustomPreviewPresenter [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	| detailsPresenter |
	detailsPresenter := SpPointFormPresenterExample new.
	aspect := (10@30) aspect itself usePreviewWith: detailsPresenter; build.
	
	self assert: aspect inputPresenter class equals: SpObjectPreviewPresenter.
	self assert: aspect inputPresenter detailsPresenter equals: detailsPresenter.
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWithCustomRestriction [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| restriction |
	restriction := SpNumberRestriction minValue: 10 maxValue: 30.
	aspect := (2@3) aspect x
		restriction: restriction;
		build.
		
	self assert: aspect restriction equals: restriction.
	self assert: aspect stringConverter equals: SpNumberToStringConverter default.	
	self assert: aspect displayDecoration equals: SpSmartNumberDecoration default.
	self assert: aspect inputPresenter class equals: SpTextInputPresenter.
	self assert: aspect inputPresenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: aspect inputPresenter textDecoration equals: SpSmartNumberDecoration default.
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWithCustomSetter [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x; valueSetter: #setX:; build.
	
	self assert: aspect valueSetter equals: #setX:
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationByBuilderWithDirectSlotGetter [
	
	aspect := (2@3) aspect x useSlot build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect valueGetter equals: (Point slotNamed: #x).
	self assert: aspect valueSetter == aspect valueSetter.
	self assert: aspect name equals: #x
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationInputPresenterForNumberValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| presenter valueHolder |
	aspect := (2@3) aspect x build.
	valueHolder := aspect asValueHolder.
	presenter := aspect createInputPresenterFor: valueHolder.
	
	self assert: presenter class equals: SpTextInputPresenter.
	self assert: presenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: presenter textDecoration equals: SpSmartNumberDecoration default.
	self assert: presenter model class equals: SpPrintedValueHolder.
	self assert: presenter model stringConverter equals: aspect stringConverter.
	self assert: presenter model baseValueHolder equals: valueHolder
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testCreationValueHolderFromBuilder [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| actual aspectBuilder |
	aspectBuilder := (2@3) aspect x.
	
	actual := aspectBuilder asValueHolder.
	
	self assert: actual class equals: SpValueHolder.
	self assert: actual valueAspect equals: aspectBuilder build.
	self assert: actual value equals: 2
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testReadingComputedValue [
	
	aspect := (-1@2) aspect computedBy: [ :p | p abs ]; build.
	
	self assert: aspect readValue equals: 1@2
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testReadingValue [
	
	aspect := (2@3) aspect x build.
	
	self assert: aspect readValue equals: 2
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testReadingValueUsingDirectSlotAccess [
	
	aspect := (2@3) aspect x useSlot build.
	
	self assert: aspect readValue equals: 2
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testWritingValue [
	
	| ass |
	ass := 1->3.
	aspect := ass aspect key build.
	
	aspect writeValue: 10.
	
	self assert: ass key equals: 10
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testWritingValueUsingBlockSetter [
	
	| point |
	point := 2@3.
	aspect := point aspect x; valueSetter: [ :p :value | p setX: value setY: p y ]; build.
	
	aspect writeValue: 10.
	
	self assert: point x equals: 10
]

{ #category : #tests }
SpObjectPropertyAspectTests >> testWritingValueUsingDirectSlotAccess [
	
	| point |
	point := 2@3.
	aspect := point aspect x useSlot build.
	
	aspect writeValue: 10.
	
	self assert: point x equals: 10
]
