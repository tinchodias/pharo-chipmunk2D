"
A CpLibraryTest is a test class for testing the behavior of CpLibrary
"
Class {
	#name : #CpLibraryTest,
	#superclass : #TestCase,
	#category : #'Chipmunk2D-Tests-Core'
}

{ #category : #tests }
CpLibraryTest >> testMomentForBox [
	self
		assert:
			(CpLibrary uniqueInstance
				momentForBoxWithMass: 0.9
				width: 4 / 7
				height: 30)
		closeTo: 67.52448979591837
]

{ #category : #tests }
CpLibraryTest >> testMomentForCircle [
	self
		assert:
			(CpLibrary uniqueInstance
				momentForCircleWithMass: 10.0
				innerRadius: 0
				outerRadius: 15.0
				offset: CpVector zero)
		closeTo: 1125.0
]
