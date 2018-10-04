event propogation
whenModelChangedDo: aBlock

	announcer ifNil: [ announcer := Announcer new].
	
	announcer when: SpModelChanged do: aBlock for: self