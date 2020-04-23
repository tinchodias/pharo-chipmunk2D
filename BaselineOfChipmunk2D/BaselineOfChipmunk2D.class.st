Class {
	#name : #BaselineOfChipmunk2D,
	#superclass : #BaselineOf,
	#category : #BaselineOfChipmunk2D
}

{ #category : #baseline }
BaselineOfChipmunk2D >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'Chipmunk2D';
				package: 'Chipmunk2D-Demo' with: [ spec requires: #('Chipmunk2D') ];
				package: 'Chipmunk2D-Tests' with: [ spec requires: #('Chipmunk2D') ].
 ]
]
