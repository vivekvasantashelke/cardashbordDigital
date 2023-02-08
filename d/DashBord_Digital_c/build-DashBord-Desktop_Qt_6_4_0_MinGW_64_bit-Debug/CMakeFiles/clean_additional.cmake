# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\DashBord_Digital_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\DashBord_Digital_autogen.dir\\ParseCache.txt"
  "DashBord_Digital_autogen"
  "DatatetKM\\CMakeFiles\\DatatetKM_autogen.dir\\AutogenUsed.txt"
  "DatatetKM\\CMakeFiles\\DatatetKM_autogen.dir\\ParseCache.txt"
  "DatatetKM\\DatatetKM_autogen"
  "VheicleDataSender\\CMakeFiles\\VheicleDataSender_autogen.dir\\AutogenUsed.txt"
  "VheicleDataSender\\CMakeFiles\\VheicleDataSender_autogen.dir\\ParseCache.txt"
  "VheicleDataSender\\VheicleDataSender_autogen"
  "user\\CMakeFiles\\user_autogen.dir\\AutogenUsed.txt"
  "user\\CMakeFiles\\user_autogen.dir\\ParseCache.txt"
  "user\\user_autogen"
  )
endif()
