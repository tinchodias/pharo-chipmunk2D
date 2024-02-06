Class {
	#name : #CpLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'CpTypeAlias'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #ffi }
CpLibrary >> ffi_cpMomentForBoxWithMass: m width: width height: height [
	^ self ffiCall: #(cpFloat cpMomentForBox(cpFloat m, cpFloat width, cpFloat height))
]

{ #category : #ffi }
CpLibrary >> ffi_cpMomentForCircleWithMass: m innerRadius: r1 outerRadius: r2 offset: offset [
	^ self ffiCall: #(cpFloat cpMomentForCircle(cpFloat m, cpFloat  r1, cpFloat r2, cpVect offset))
]

{ #category : #'accessing platform' }
CpLibrary >> macModuleName [
	^ (FileLocator imageDirectory / 'Chipmunk2D' / 'src' / 'libchipmunk.dylib') fullName
]

{ #category : #utils }
CpLibrary >> momentForBoxWithMass: mass width: width height: height [
	^ self
		ffi_cpMomentForBoxWithMass: mass asFloat 
		width: width asFloat 
		height: height asFloat
]

{ #category : #utils }
CpLibrary >> momentForCircleWithMass: mass innerRadius: r1 outerRadius: r2 offset: offset [
	^ self
		ffi_cpMomentForCircleWithMass: mass asFloat 
		innerRadius: r1 asFloat 
		outerRadius: r2 asFloat 
		offset: offset asCpVector
]

{ #category : #'accessing platform' }
CpLibrary >> unixModuleName [
	^ (FileLocator imageDirectory / 'Chipmunk2D' / 'src' / 'libchipmunk.so.7.0.3') fullName
]
