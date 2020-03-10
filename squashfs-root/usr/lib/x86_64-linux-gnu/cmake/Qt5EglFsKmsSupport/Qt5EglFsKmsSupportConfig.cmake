
if (CMAKE_VERSION VERSION_LESS 3.1.0)
    message(FATAL_ERROR "Qt 5 EglFsKmsSupport module requires at least CMake version 3.1.0")
endif()

get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
# Use original install prefix when loaded through a
# cross-prefix symbolic link such as /lib -> /usr/lib.
get_filename_component(_realCurr "${_IMPORT_PREFIX}" REALPATH)
get_filename_component(_realOrig "/usr/lib/x86_64-linux-gnu/cmake/Qt5EglFsKmsSupport" REALPATH)
if(_realCurr STREQUAL _realOrig)
    get_filename_component(_qt5EglFsKmsSupport_install_prefix "/usr/lib/x86_64-linux-gnu/../../" ABSOLUTE)
else()
    get_filename_component(_qt5EglFsKmsSupport_install_prefix "${CMAKE_CURRENT_LIST_DIR}/../../../../" ABSOLUTE)
endif()
unset(_realOrig)
unset(_realCurr)
unset(_IMPORT_PREFIX)

# For backwards compatibility only. Use Qt5EglFsKmsSupport_VERSION instead.
set(Qt5EglFsKmsSupport_VERSION_STRING 5.13.2)

set(Qt5EglFsKmsSupport_LIBRARIES Qt5::EglFsKmsSupport)

macro(_qt5_EglFsKmsSupport_check_file_exists file)
    if(NOT EXISTS "${file}" )
        message(FATAL_ERROR "The imported target \"Qt5::EglFsKmsSupport\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
endmacro()


macro(_populate_EglFsKmsSupport_target_properties Configuration LIB_LOCATION IMPLIB_LOCATION
      IsDebugAndRelease)
    set_property(TARGET Qt5::EglFsKmsSupport APPEND PROPERTY IMPORTED_CONFIGURATIONS ${Configuration})

    set(imported_location "${_qt5EglFsKmsSupport_install_prefix}/lib/x86_64-linux-gnu/${LIB_LOCATION}")
    _qt5_EglFsKmsSupport_check_file_exists(${imported_location})
    set(_deps
        ${_Qt5EglFsKmsSupport_LIB_DEPENDENCIES}
    )
    set(_static_deps
    )

    set_target_properties(Qt5::EglFsKmsSupport PROPERTIES
        "IMPORTED_LOCATION_${Configuration}" ${imported_location}
        "IMPORTED_SONAME_${Configuration}" "libQt5EglFsKmsSupport.so.5"
        # For backward compatibility with CMake < 2.8.12
        "IMPORTED_LINK_INTERFACE_LIBRARIES_${Configuration}" "${_deps};${_static_deps}"
    )
    set_property(TARGET Qt5::EglFsKmsSupport APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 "${_deps}"
    )


endmacro()

if (NOT TARGET Qt5::EglFsKmsSupport)

    set(_Qt5EglFsKmsSupport_OWN_INCLUDE_DIRS "")
    set(Qt5EglFsKmsSupport_PRIVATE_INCLUDE_DIRS "")

    foreach(_dir ${_Qt5EglFsKmsSupport_OWN_INCLUDE_DIRS})
        _qt5_EglFsKmsSupport_check_file_exists(${_dir})
    endforeach()

    # Only check existence of private includes if the Private component is
    # specified.
    list(FIND Qt5EglFsKmsSupport_FIND_COMPONENTS Private _check_private)
    if (NOT _check_private STREQUAL -1)
        foreach(_dir ${Qt5EglFsKmsSupport_PRIVATE_INCLUDE_DIRS})
            _qt5_EglFsKmsSupport_check_file_exists(${_dir})
        endforeach()
    endif()

    set(Qt5EglFsKmsSupport_INCLUDE_DIRS ${_Qt5EglFsKmsSupport_OWN_INCLUDE_DIRS})

    set(Qt5EglFsKmsSupport_DEFINITIONS -DQT_EGLFS_KMS_SUPPORT_LIB)
    set(Qt5EglFsKmsSupport_COMPILE_DEFINITIONS QT_EGLFS_KMS_SUPPORT_LIB)
    set(_Qt5EglFsKmsSupport_MODULE_DEPENDENCIES "Gui;Core")


    set(Qt5EglFsKmsSupport_OWN_PRIVATE_INCLUDE_DIRS ${Qt5EglFsKmsSupport_PRIVATE_INCLUDE_DIRS})

    set(_Qt5EglFsKmsSupport_FIND_DEPENDENCIES_REQUIRED)
    if (Qt5EglFsKmsSupport_FIND_REQUIRED)
        set(_Qt5EglFsKmsSupport_FIND_DEPENDENCIES_REQUIRED REQUIRED)
    endif()
    set(_Qt5EglFsKmsSupport_FIND_DEPENDENCIES_QUIET)
    if (Qt5EglFsKmsSupport_FIND_QUIETLY)
        set(_Qt5EglFsKmsSupport_DEPENDENCIES_FIND_QUIET QUIET)
    endif()
    set(_Qt5EglFsKmsSupport_FIND_VERSION_EXACT)
    if (Qt5EglFsKmsSupport_FIND_VERSION_EXACT)
        set(_Qt5EglFsKmsSupport_FIND_VERSION_EXACT EXACT)
    endif()

    set(Qt5EglFsKmsSupport_EXECUTABLE_COMPILE_FLAGS "")

    foreach(_module_dep ${_Qt5EglFsKmsSupport_MODULE_DEPENDENCIES})
        if (NOT Qt5${_module_dep}_FOUND)
            find_package(Qt5${_module_dep}
                5.13.2 ${_Qt5EglFsKmsSupport_FIND_VERSION_EXACT}
                ${_Qt5EglFsKmsSupport_DEPENDENCIES_FIND_QUIET}
                ${_Qt5EglFsKmsSupport_FIND_DEPENDENCIES_REQUIRED}
                PATHS "${CMAKE_CURRENT_LIST_DIR}/.." NO_DEFAULT_PATH
            )
        endif()

        if (NOT Qt5${_module_dep}_FOUND)
            set(Qt5EglFsKmsSupport_FOUND False)
            return()
        endif()

        list(APPEND Qt5EglFsKmsSupport_INCLUDE_DIRS "${Qt5${_module_dep}_INCLUDE_DIRS}")
        list(APPEND Qt5EglFsKmsSupport_PRIVATE_INCLUDE_DIRS "${Qt5${_module_dep}_PRIVATE_INCLUDE_DIRS}")
        list(APPEND Qt5EglFsKmsSupport_DEFINITIONS ${Qt5${_module_dep}_DEFINITIONS})
        list(APPEND Qt5EglFsKmsSupport_COMPILE_DEFINITIONS ${Qt5${_module_dep}_COMPILE_DEFINITIONS})
        list(APPEND Qt5EglFsKmsSupport_EXECUTABLE_COMPILE_FLAGS ${Qt5${_module_dep}_EXECUTABLE_COMPILE_FLAGS})
    endforeach()
    list(REMOVE_DUPLICATES Qt5EglFsKmsSupport_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5EglFsKmsSupport_PRIVATE_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5EglFsKmsSupport_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5EglFsKmsSupport_COMPILE_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5EglFsKmsSupport_EXECUTABLE_COMPILE_FLAGS)

    set(_Qt5EglFsKmsSupport_LIB_DEPENDENCIES "Qt5::Gui;Qt5::Core")


    add_library(Qt5::EglFsKmsSupport SHARED IMPORTED)

    set_property(TARGET Qt5::EglFsKmsSupport PROPERTY
      INTERFACE_INCLUDE_DIRECTORIES ${_Qt5EglFsKmsSupport_OWN_INCLUDE_DIRS})
    set_property(TARGET Qt5::EglFsKmsSupport PROPERTY
      INTERFACE_COMPILE_DEFINITIONS QT_EGLFS_KMS_SUPPORT_LIB)

    set_property(TARGET Qt5::EglFsKmsSupport PROPERTY INTERFACE_QT_ENABLED_FEATURES )
    set_property(TARGET Qt5::EglFsKmsSupport PROPERTY INTERFACE_QT_DISABLED_FEATURES )

    set(_Qt5EglFsKmsSupport_PRIVATE_DIRS_EXIST TRUE)
    foreach (_Qt5EglFsKmsSupport_PRIVATE_DIR ${Qt5EglFsKmsSupport_OWN_PRIVATE_INCLUDE_DIRS})
        if (NOT EXISTS ${_Qt5EglFsKmsSupport_PRIVATE_DIR})
            set(_Qt5EglFsKmsSupport_PRIVATE_DIRS_EXIST FALSE)
        endif()
    endforeach()

    if (_Qt5EglFsKmsSupport_PRIVATE_DIRS_EXIST)
        add_library(Qt5::EglFsKmsSupportPrivate INTERFACE IMPORTED)
        set_property(TARGET Qt5::EglFsKmsSupportPrivate PROPERTY
            INTERFACE_INCLUDE_DIRECTORIES ${Qt5EglFsKmsSupport_OWN_PRIVATE_INCLUDE_DIRS}
        )
        set(_Qt5EglFsKmsSupport_PRIVATEDEPS)
        foreach(dep ${_Qt5EglFsKmsSupport_LIB_DEPENDENCIES})
            if (TARGET ${dep}Private)
                list(APPEND _Qt5EglFsKmsSupport_PRIVATEDEPS ${dep}Private)
            endif()
        endforeach()
        set_property(TARGET Qt5::EglFsKmsSupportPrivate PROPERTY
            INTERFACE_LINK_LIBRARIES Qt5::EglFsKmsSupport ${_Qt5EglFsKmsSupport_PRIVATEDEPS}
        )
    endif()

    _populate_EglFsKmsSupport_target_properties(RELEASE "libQt5EglFsKmsSupport.so.5.13.2" "" FALSE)








_qt5_EglFsKmsSupport_check_file_exists("${CMAKE_CURRENT_LIST_DIR}/Qt5EglFsKmsSupportConfigVersion.cmake")

endif()
