Class {
	#name : #CpPolyShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #'instance creation' }
CpPolyShape class >> ffi_cpBoxShapeNew: aBody from: width to: height radius: radius [
	^ self ffiCall: #(
CpPolyShape
cpBoxShapeNew(CpBody aBody, cpFloat width, cpFloat height, cpFloat radius)
)
]

{ #category : #'instance creation' }
CpPolyShape class >> newBoxBody: aBody width: width height: height radius: radius [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		ffi_cpBoxShapeNew: aBody
		from: width asFloat
		to: height asFloat
		radius: radius asFloat)
		initialize;
		yourself
]

{ #category : #ffi }
CpPolyShape >> ffi_cpPolyShapeGetCount [
	^ self ffiCall: #(
int
cpPolyShapeGetCount(CpPolyShape self)
)
]

{ #category : #ffi }
CpPolyShape >> ffi_cpPolyShapeGetVert: zeroBasedIndex [
	^ self ffiCall: #(
cpVect
cpPolyShapeGetVert(CpShape self, int zeroBasedIndex)
)
]

{ #category : #ffi }
CpPolyShape >> vertexAt: oneBasedIndex [
	^ self ffi_cpPolyShapeGetVert: oneBasedIndex - 1
]

{ #category : #ffi }
CpPolyShape >> vertexCount [
	^ self ffi_cpPolyShapeGetCount
]
