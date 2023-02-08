cmake_minimum_required(VERSION 3.5)

project(VheicleDataSender)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Sql)
add_library(DatatetKM SHARED dataEkm.cpp dataEkm.h )


target_link_libraries(DatatetKM PRIVATE Qt6::Sql)


target_link_libraries(DatatetKM PRIVATE Qt6::Gui Qt6::Quick)






