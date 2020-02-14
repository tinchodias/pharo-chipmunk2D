Class {
	#name : #CpBody,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpBody class >> doFreeUsingFFI: handle [
	self ffi_cpBodyFree: handle
]

{ #category : #ffi }
CpBody class >> ffi_cpBodyFree: handle [
	self ffiCall: #(void cpBodyFree #(cpBody * handle))
]

{ #category : #ffi }
CpBody class >> ffi_cpBodyNewMass: mass moment: moment [
	^ self ffiCall: #(
cpBody*
cpBodyNew(cpFloat mass, cpFloat moment)
)
]

{ #category : #'instance creation' }
CpBody class >> newMass: mass moment: moment [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self ffi_cpBodyNewMass: mass asFloat moment: moment asFloat)
		initialize;
		yourself
]

{ #category : #accessing }
CpBody >> ffi_cpBodyGetPosition [
	^ self ffiCall: #(
cpVect
cpBodyGetPosition(const cpBody *self)
)
]

{ #category : #accessing }
CpBody >> ffi_cpBodySetPosition: aCpVector [
	^ self ffiCall: #(
void
cpBodySetPosition(cpBody *self, cpVect aCpVector)
)
]

{ #category : #accessing }
CpBody >> position [
	^ self ffi_cpBodyGetPosition asPoint
]

{ #category : #accessing }
CpBody >> position: aPoint [
	self ffi_cpBodySetPosition: aPoint asCpVector
]
