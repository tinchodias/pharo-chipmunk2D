"
I provide examples translated from the Chipmunk documentation.

	CpExamples example1.
	
Adapted from cldm/pharo-storm repository.
"
Class {
	#name : #CpExamples,
	#superclass : #Object,
	#category : #'Chipmunk2D-Demo'
}

{ #category : #examples }
CpExamples class >> example1 [
	"This is the hello world example from http://chipmunk-physics.net/release/ChipmunkLatest-Docs/"

	| space ground mass moment ballBody ballShape timeStep time |
	space := CpSpace new
		gravity: 0@ -100;
		yourself.

	ground := CpSegmentShape 
		newSegmentBody: space staticBody 
			from: -20@5
			to: 20@ -5
			radius: 0.
	ground friction: 1.0.
	space addShape: ground.

	mass := 1.0.
	moment := CpLibrary uniqueInstance
		momentForCircleWithMass: mass 
		innerRadius: 0.0 
		outerRadius: 5.0 
		offset: 0@0.
	ballBody := CpBody newMass: mass moment: moment.
	space addBody: ballBody.
	ballBody position: 0@15.

	ballShape := CpCircleShape 
		newCircleBody: ballBody 
		radius: 5 
		offset: 0@0.
	ballShape friction: 0.7.
	space addShape: ballShape.

	timeStep := (1/60) asFloat.
	time := 0.
	[ time < 2 ] whileTrue: [
	 	| pos vel |	
		
		pos := ballBody position.
		vel := ballBody velocity.
		
		Transcript 
			show: ('Time is {1}. ballBody is at ({2}, {3}). It''s velocity is ({4}, {5})'
				format: {time. pos x. pos y. vel x. vel y});
			cr.
		
		space step: timeStep.
		time := time + timeStep ].

]

{ #category : #'as yet unclassified' }
CpExamples >> seeClassSide [
]
