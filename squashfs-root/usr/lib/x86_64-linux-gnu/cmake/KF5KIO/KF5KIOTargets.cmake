# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget KF5::KIOCore KF5::KIONTLM KF5::KIOGui KF5::KIOWidgets KF5::KIOFileWidgets)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
# Use original install prefix when loaded through a
# cross-prefix symbolic link such as /lib -> /usr/lib.
get_filename_component(_realCurr "${_IMPORT_PREFIX}" REALPATH)
get_filename_component(_realOrig "/usr/lib/x86_64-linux-gnu/cmake/KF5KIO" REALPATH)
if(_realCurr STREQUAL _realOrig)
  set(_IMPORT_PREFIX "/usr/lib/x86_64-linux-gnu/cmake/KF5KIO")
endif()
unset(_realOrig)
unset(_realCurr)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target KF5::KIOCore
add_library(KF5::KIOCore SHARED IMPORTED)

set_target_properties(KF5::KIOCore PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/KF5/KIOCore;${_IMPORT_PREFIX}/include/KF5"
  INTERFACE_LINK_LIBRARIES "KF5::CoreAddons;KF5::Service;Qt5::Network;Qt5::Concurrent;Qt5::DBus"
)

# Create imported target KF5::KIONTLM
add_library(KF5::KIONTLM SHARED IMPORTED)

set_target_properties(KF5::KIONTLM PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/KF5"
  INTERFACE_LINK_LIBRARIES "KF5::CoreAddons"
)

# Create imported target KF5::KIOGui
add_library(KF5::KIOGui SHARED IMPORTED)

set_target_properties(KF5::KIOGui PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/KF5/KIOGui;${_IMPORT_PREFIX}/include/KF5"
  INTERFACE_LINK_LIBRARIES "KF5::KIOCore;Qt5::Gui"
)

# Create imported target KF5::KIOWidgets
add_library(KF5::KIOWidgets SHARED IMPORTED)

set_target_properties(KF5::KIOWidgets PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/KF5/KIOWidgets;${_IMPORT_PREFIX}/include/KF5"
  INTERFACE_LINK_LIBRARIES "KF5::KIOCore;KF5::JobWidgets;KF5::Service;Qt5::Network;KF5::Completion;KF5::WidgetsAddons"
)

# Create imported target KF5::KIOFileWidgets
add_library(KF5::KIOFileWidgets SHARED IMPORTED)

set_target_properties(KF5::KIOFileWidgets PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/KF5/KIOFileWidgets;${_IMPORT_PREFIX}/include/KF5"
  INTERFACE_LINK_LIBRARIES "KF5::KIOWidgets;KF5::Bookmarks;KF5::ItemViews;KF5::XmlGui;KF5::Solid"
)

if(CMAKE_VERSION VERSION_LESS 2.8.12)
  message(FATAL_ERROR "This file relies on consumers using CMake 2.8.12 or greater.")
endif()

# Load information for each installed configuration.
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/KF5KIOTargets-*.cmake")
foreach(f ${CONFIG_FILES})
  include(${f})
endforeach()

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(target ${_IMPORT_CHECK_TARGETS} )
  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    if(NOT EXISTS "${file}" )
      message(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_IMPORT_CHECK_FILES_FOR_${target})
endforeach()
unset(_IMPORT_CHECK_TARGETS)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
