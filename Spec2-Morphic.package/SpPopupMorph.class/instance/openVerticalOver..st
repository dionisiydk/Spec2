opening
openVerticalOver: parentMorph
	 
	self positionVerticalOver: parentMorph.
	
	parentMorph world addMorphInLayer: self.
	
	"There is strange issue that during first layouting the sizes are not computed correctly"
	self positionVerticalOver: parentMorph. 
	
	self takeKeyboardFocus