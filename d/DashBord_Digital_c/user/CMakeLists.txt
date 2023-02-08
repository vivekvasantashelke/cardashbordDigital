cmake_minimum_required(VERSION 3.5)

project(DashBord_Digital)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Sql)

add_library(user SHARED userD.cpp userD.h)


target_link_libraries(user PRIVATE Qt6::Sql)


target_link_libraries(user PRIVATE Qt6::Gui Qt6::Quick)









