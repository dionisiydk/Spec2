baselines
baseline: spec
   <baseline>

	spec for: #'common' do: [
		spec baseline: 'Commander' with: [
				spec repository: 'github://pharo-ide/Commander:v0.6.x' ].
		spec
			package: #'Spec2-Core' with: [
				spec requires: #('Commander' ). ]; 
			package: #'Spec2-Core-Tests' with: [
				spec requires: #('Spec2-Core'). ];
			package: #'Spec2-Morphic' with: [
				spec requires: #('Spec2-Core'). ];
			package: #'Spec2-Morphic-Tests' with: [
				spec requires: #('Spec2-Morphic') ]
	]