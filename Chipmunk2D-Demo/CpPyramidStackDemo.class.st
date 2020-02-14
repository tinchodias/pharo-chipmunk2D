Class {
	#name : #CpPyramidStackDemo,
	#superclass : #CpAbstractDemo,
	#category : #'Chipmunk2D-Demo'
}

{ #category : #private }
CpPyramidStackDemo >> addBallRadius: radius mass: mass offset: offset [

	| body shape |
	body := CpBody
		newMass: mass
		moment: (CpLibrary uniqueInstance
			momentForCircleWithMass: mass
			innerRadius: 0
			outerRadius: radius
			offset: offset).
	space addBody: body.
	body position: 0 @ (-240 + radius+5).
	
	shape := CpShape newCircleBody: body radius: radius offset: offset.
	space addShape: shape.
	shape
		elasticity: 0;
		friction: 0.9.
]

{ #category : #private }
CpPyramidStackDemo >> addBoxFor: i and: j mass: mass [
	| body shape |
	body := CpBody
		newMass: mass
		moment: (CpLibrary uniqueInstance
			momentForBoxWithMass: mass
			width: 30
			height: 30).
	space addBody: body.
	body position: (j*32 - (i*16)) @ (300 - (i*32)).
	
	shape := CpShape newBoxBody: body from: 30 to: 30 radius: 0.5.
	space addShape: shape.
	shape
		elasticity: 0;
		friction: 0.8.
]

{ #category : #private }
CpPyramidStackDemo >> addSegmentShapeFrom: source to: target [
	| shape |
	shape := CpShape 
		newSegmentBody: space staticBody
		from: source
		to: target
		radius: 0.
	shape
		elasticity: 1.0;
		friction: 1.0.

	space addShape: shape
]

{ #category : #initialization }
CpPyramidStackDemo >> initializeSpace [
	space
		iterations: 30;
		gravity: 0 @ -100;
		sleepTimeThreshold: 0.5.
	
	"Create segments around the edge of the screen."
	self
		addSegmentShapeFrom: -320 @ -240 to: -320 @ 240;
		addSegmentShapeFrom:  320 @ -240 to:  320 @ 240;
		addSegmentShapeFrom: -320 @ -240 to:  320 @ 240.

	"Add lots of boxes."
	0 to: 13 do: [ :i |
		0 to: i do: [ :j |
			self addBoxFor: i and: j mass: 1.0 ] ].
	
	"Add a ball to make things more interesting"
	self addBallRadius: 15 mass: 10 offset: CpVector zero.
]

{ #category : #accessing }
CpPyramidStackDemo >> title [
	^ 'Pyramid Stack'
]
