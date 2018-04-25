events
when: anUIEvent on: aView do: handlerBlock
	"No events are supported by stub UI"
	
	aView simulationAnnouncer when: anUIEvent do: handlerBlock 