if( NOT TARGET Cinder-Bullet3D )
	get_filename_component( CINDER_BULLET3D_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )

	list( APPEND CINDER_BULLET3D_SOURCES
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/BulletContext.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/Common.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/ConstraintBase.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/ConstraintConeTwist.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/ConstraintGeneric6Dof.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/ConstraintHinge.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/ConstraintPoint2Point.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/PhyObjCharacterController.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/PhyObjTriggerVol.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/PhysicsDebugRenderable.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/RigidBody.cpp
		${CINDER_BULLET3D_SOURCE_PATH}/Cinder-Bullet3D/SoftBody.cpp

		${CINDER_BULLET3D_SOURCE_PATH}/bullet3/src/.cpp
	)

	add_library( Cinder-Bullet3D ${CINDER_BULLET3D_SOURCES} )

	target_include_directories( Cinder-Bullet3D PUBLIC "${CINDER_BULLET3D_SOURCE_PATH}" )
endif()