Class {
	#name : #SpTextualLabelPresenter,
	#superclass : #SpLabelPresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpTextualLabelPresenter >> attachToView [
	
	view contents: (ui textForLabel: model)
]

{ #category : #styles }
SpTextualLabelPresenter >> setUpDefaultLightThemeStyle [
	<styleSpec>
	<forTheme: #PharoLightTheme>
	
	self setUpDefaultStyle
]

{ #category : #styles }
SpTextualLabelPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	view color: Color black.
	view backgroundColor: Color transparent
]

{ #category : #styles }
SpTextualLabelPresenter >> setUpWindowTitleStyle [
	<styleSpec>
	<forStyle: #windowTitle>
	
	self setUpDefaultStyle.
	view font: StandardFonts windowTitleFont emphasis: 0
]
