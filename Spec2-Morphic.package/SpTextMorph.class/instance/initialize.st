initialization
initialize
	super initialize.
	self changeTableLayout.
	self initializeTextMorph.
	self minHeight: self minTextHeight.
	self addMorphBack: textMorph.
	inputRestriction := SpAnyTextRestriction default.
	textDecoration := SpNoTextDecoration default