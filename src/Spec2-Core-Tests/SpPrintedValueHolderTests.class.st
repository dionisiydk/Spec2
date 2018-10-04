Class {
	#name : #SpPrintedValueHolderTests,
	#superclass : #TestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpPrintedValueHolderTests >> testBecomeSynchronizedWithBaseValueWhenFirstObserverIsSubscribed [
	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.

	baseHolder value: 20.
	self assert: baseHolder value equals: 20.
	self assert: holder value equals: '2'.
	
	holder whenChangedDo: [ "holder is in sync with base holder only when there are subscriptions" ].
	self assert: holder value equals: '20'.
	self assert: baseHolder value equals: 20
]

{ #category : #tests }
SpPrintedValueHolderTests >> testConvertingToTextValueHolder [

	| holder converted |
	holder := SpPrintedValueHolder 
		of: 1 asValueHolder stringConverter: SpNumberToStringConverter default.
	
	converted := holder asTextValueHolder.
	
	self assert: converted equals: holder
]

{ #category : #tests }
SpPrintedValueHolderTests >> testHandleCircularNotificationFromBaseHolderWhenSetNewValue [
	| holder baseHolder count |
	count := 0.
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ count := count + 1 ].
	count := 0. "to reset initial synchronization during first subscription"
	
	holder value: '10'.
	
	self assert: count equals: 1
]

{ #category : #tests }
SpPrintedValueHolderTests >> testIsAutoSynchronizedWhenThereAreSubscribedObservers [
	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ "holder is in sync with base holder only when there are subscriptions"].

	baseHolder value: 20.
	self assert: baseHolder value equals: 20.

	self assert: holder value equals: '20'.
	
]

{ #category : #tests }
SpPrintedValueHolderTests >> testIsReadOnly [

	| holder baseHolder |
	baseHolder := 2 aspect itself asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	self deny: holder isReadOnly.
	
	baseHolder valueAspect readOnly.
	self assert: holder isReadOnly.
]

{ #category : #tests }
SpPrintedValueHolderTests >> testIsReadOnlyWhenStringConvertionDoesNotSupported [

	| holder baseHolder |
	baseHolder := 2 aspect itself asValueHolder.
	self deny: baseHolder isReadOnly.
	
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpObjectToStringConverter default.
	
	self assert: holder isReadOnly
]

{ #category : #tests }
SpPrintedValueHolderTests >> testIsSynchronizedWithBaseValueByDefault [

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	self assert: holder value equals: '2'
]

{ #category : #tests }
SpPrintedValueHolderTests >> testNotifiesObserversWhenBaseValueIsChanged [
	| holder baseHolder changed |
	changed := false.
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedDo: [ changed := true ].

	baseHolder value: 20.
	self assert: baseHolder value equals: 20.
	
	self assert: changed
]

{ #category : #tests }
SpPrintedValueHolderTests >> testPrintingNilBaseValue [

	| holder baseHolder |
	baseHolder := nil asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpStringToStringConverter default.
	
	self assert: holder value equals: ''
]

{ #category : #tests }
SpPrintedValueHolderTests >> testSettingNewUnparsableValue [

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	holder value: 'abc'.
	
	self assert: holder value equals: 'abc'.
	self assert: baseHolder value equals: (SpInvalidValue with: 'abc')
]

{ #category : #tests }
SpPrintedValueHolderTests >> testSettingNewValue [

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	holder value: '10'.
	
	self assert: holder value equals: '10'.
	self assert: baseHolder value equals: 10
]

{ #category : #tests }
SpPrintedValueHolderTests >> testSynchronizeWithInvalidBaseValue [

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	baseHolder value: (SpInvalidValue with: 'test invalid value').
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpStringToStringConverter default.
	
	self assert: holder value equals: 'test invalid value'
]

{ #category : #tests }
SpPrintedValueHolderTests >> testUnsubscribesFromBaseValueWhenNoObserverExistAnymore [
	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	holder whenChangedSend: #value to: self. "holder is in sync with base holder only when there is subscription".

	self assert: (baseHolder announcer hasSubscriber: holder).

	holder unsubscribe: self.	
	self deny: (baseHolder announcer hasSubscriber: holder).
]
