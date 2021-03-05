project(gitlab_ci_intro)
cmake_minimum_required(VERSION 3.18)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

option(ENABLE_WARNINGS "Compile with all warnings" ON)
if(ENABLE_WARNINGS)
  if(CMAKE_C_COMPILER_ID MATCHES "GNU"
     OR CMAKE_CXX_COMPILER_ID MATCHES "GNU"
     OR CMAKE_C_COMPILER_ID MATCHES "(Apple)?[Cc]lang"
     OR CMAKE_CXX_COMPILER_ID MATCHES "(Apple)?[Cc]lang")
    # GCC/Clang
    add_compile_options(-Wall -Wextra)
  elseif(MSVC)
    # MSVC
    add_compile_options(/W4)
  endif()
endif()

add_subdirectory(Driver)



