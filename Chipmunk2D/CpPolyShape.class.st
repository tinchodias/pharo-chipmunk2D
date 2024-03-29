"
I represent FFI bindings to the 'cpPolyShape' structure in the Chipmunk2D library.

I am the polygon shape of a ridig body, defined by an array of 2D coordinates.

See: include/chipmunk/cpPolyShape.h
"
Class {
	#name : #CpPolyShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #'instance creation' }
CpPolyShape class >> newBoxBody: aBody width: width height: height radius: radius [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		unownedBoxShapeNew: aBody
		width: width asFloat
		height: height asFloat
		radius: radius asFloat)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpPolyShape class >> unownedBoxShapeNew: aBody width: width height: height radius: radius [

	^ self ffiCall: #(
		CpPolyShape
		cpBoxShapeNew(
			CpBody aBody,
			cpFloat width,
			cpFloat height,
			cpFloat radius)
		)
]

{ #category : #accessing }
CpPolyShape >> pointAt: oneBasedIndex [

	^ (self vertexAt: oneBasedIndex) asPoint
]

{ #category : #accessing }
CpPolyShape >> vertexAt: oneBasedIndex [

	^ self vertexAtZeroBased: oneBasedIndex - 1
]

{ #category : #accessing }
CpPolyShape >> vertexAtZeroBased: zeroBasedIndex [

	^ self ffiCall: #(
		cpVect
		cpPolyShapeGetVert(
			CpShape self,
			int zeroBasedIndex)
		)
]

{ #category : #accessing }
CpPolyShape >> vertexCount [

	^ self ffiCall: #(
		int
		cpPolyShapeGetCount(CpPolyShape self)
		)
]
