#  Try to find the LeapMotion library
#
#  You must provide a LEAPMOTION_ROOT_DIR which contains lib and include directories
#
#  Once done this will define
#
#  LEAPMOTION_FOUND - system found LEAPMOTION
#  LEAPMOTION_INCLUDE_DIRS - the LEAPMOTION include directory
#  LEAPMOTION_LIBRARIES - Link this to use LEAPMOTION
#
#  Created on 6/2/2014 by Sam Cake
#  Copyright (c) 2014 High Fidelity
#

if (LEAPMOTION_LIBRARIES AND LEAPMOTION_INCLUDE_DIRS)
  # in cache already
  set(LEAPMOTION_FOUND TRUE)
else (LEAPMOTION_LIBRARIES AND LEAPMOTION_INCLUDE_DIRS)
  set(LEAPMOTION_SEARCH_DIRS "${LEAPMOTION_ROOT_DIR}" "$ENV{HIFI_LIB_DIR}/leapmotion")

  find_path(LEAPMOTION_INCLUDE_DIRS Leap.h ${LEAPMOTION_ROOT_DIR}/include)

  if (WIN32)
    find_library(LEAPMOTION_LIBRARIES Leap.lib ${LEAPMOTION_ROOT_DIR}/lib/x86)
  endif (WIN32)
  if (APPLE)
    find_library(LEAPMOTION_LIBRARIES libLeap.dylib ${LEAPMOTION_ROOT_DIR}/lib)
  endif (OSX)
 
  if (LEAPMOTION_INCLUDE_DIRS AND LEAPMOTION_LIBRARIES)
    set(LEAPMOTION_FOUND TRUE)
  endif (LEAPMOTION_INCLUDE_DIRS AND LEAPMOTION_LIBRARIES)

  if (LEAPMOTION_FOUND)
    if (NOT LEAPMOTION_FIND_QUIETLY)
      message(STATUS "Found LEAPMOTION... ${LEAPMOTION_LIBRARIES}")
    endif (NOT LEAPMOTION_FIND_QUIETLY)
  else ()
    if (LEAPMOTION_FIND_REQUIRED)
      message(FATAL_ERROR "Could not find LEAPMOTION")
    endif (LEAPMOTION_FIND_REQUIRED)
  endif ()

  # show the LEAPMOTION_INCLUDE_DIRS and LEAPMOTION_LIBRARIES variables only in the advanced view
  mark_as_advanced(LEAPMOTION_INCLUDE_DIRS LEAPMOTION_LIBRARIES)

endif (LEAPMOTION_LIBRARIES AND LEAPMOTION_INCLUDE_DIRS)
