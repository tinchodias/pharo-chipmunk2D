Class {
	#name : #CpBody,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpBody class >> doFreeUsingFFI: handle [

	self ffiCall: #(void cpBodyFree (void * handle))
]

{ #category : #'instance creation' }
CpBody class >> newMass: mass moment: moment [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self unownedNewMass: mass asFloat moment: moment asFloat)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpBody class >> unownedNewMass: mass moment: moment [

	^ self ffiCall: #(
		CpBody
		cpBodyNew(
			cpFloat mass,
			cpFloat moment)
		)
]

{ #category : #accessing }
CpBody >> position [
	^ self positionAsCpVector asPoint
]

{ #category : #accessing }
CpBody >> position: aPoint [
	self positionAsCpVector: aPoint asCpVector
]

{ #category : #accessing }
CpBody >> positionAsCpVector [

	^ self ffiCall: #(
		cpVect
		cpBodyGetPosition(CpBody self)
		)
]

{ #category : #accessing }
CpBody >> positionAsCpVector: aCpVector [

	self ffiCall: #(
		void
		cpBodySetPosition(
			CpBody self,
			cpVect aCpVector)
		)
]

{ #category : #accessing }
CpBody >> velocity [

	^ self velocityAsCpVector asPoint
]

{ #category : #accessing }
CpBody >> velocityAsCpVector [

	^ self ffiCall: #(
		cpVect
		cpBodyGetVelocity(CpBody self)
		)
]
