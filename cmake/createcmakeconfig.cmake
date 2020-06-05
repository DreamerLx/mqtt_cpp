## Installation and preparation of the Config.cmake file.
INCLUDE(GNUInstallDirs)
INCLUDE(CMakePackageConfigHelpers)

SET(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

CONFIGURE_FILE(${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    @ONLY
)

INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
  DESTINATION
    ${INSTALL_CONFIGDIR}
)

SET(LIB_INSTALL_PATH lib)
INSTALL(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}Targets DESTINATION ${LIB_INSTALL_PATH})
INSTALL(EXPORT ${PROJECT_NAME}Targets
	FILE ${PROJECT_NAME}Targets.cmake
	NAMESPACE ${PROJECT_NAME}::
	DESTINATION ${INSTALL_CONFIGDIR})

