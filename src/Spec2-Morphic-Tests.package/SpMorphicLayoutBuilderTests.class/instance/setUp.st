running
setUp
	super setUp.
	
	morph := PanelMorph new.
	
	layout := SpMorphicUILayoutBuilder new.
	layout viewContainer: morph.
	layout ui: SpMorphicUI new