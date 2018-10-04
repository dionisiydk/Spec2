Class {
	#name : #SpThemeContextTests,
	#superclass : #SpUIContextTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpThemeContextTests >> createUIContext [
	^SpThemeContext fromClass: PharoLightTheme 
]

{ #category : #tests }
SpThemeContextTests >> testSuitableForPresenter [
	| presenter |
	presenter := SpLabelPresenter forTest.
	
	uiContext themeClass: Smalltalk ui theme class.
	self assert: (uiContext isSuitableFor: presenter).
	
	uiContext themeClass:	Smalltalk ui theme class superclass.
	self assert: (uiContext isSuitableFor: presenter).
	
	uiContext themeClass: Array.	"some another theme class"
	self deny: (uiContext isSuitableFor: presenter)
]
