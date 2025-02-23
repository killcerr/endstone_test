set_runtimes("MD")
package("endstone")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/EndstoneMC/endstone")
    set_description("Endstone - High-level Plugin API for Bedrock Dedicated Servers (BDS), in both Python and C++")
    set_license("Apache-2.0")

    add_urls("https://github.com/EndstoneMC/endstone/archive/refs/tags/$(version).tar.gz","https://github.com/EndstoneMC/endstone.git")
    add_versions("v0.5.6","b6a78473aef733d02aa99fe960ea3ffee6e52486")
    add_patches("v0.5.6", "https://github.com/engsr6982/Js_Engine/raw/refs/heads/develop/patch/cxx20.patch",
                        "547ae3d325b8deb68747179b6bc3aa8772ba4efe36263bf31f34be7a3aac2ceb")
    on_install("windows", "linux", function (package)
        os.cp("include", package:installdir())
    end)
package_end()
package("QjsCpp")
set_kind("library", {headeronly = true})
    set_homepage("https://github.com/StratumEngine/QjsCpp")
    set_description("A C++ wrapper for QuickJS")
    set_license("CC0-1.0")
    add_urls("https://github.com/killcerr/QjsCpp.git")
    on_install("windows", "linux", function (package)
        os.cp("include", package:installdir())
    end)
package_end()
add_requires("quickjs-ng v0.7.0")
add_requires("entt 41aab920b083aa424ac1d27666ce287eeaff6ceb") -- master
add_requires("expected-lite v0.8.0")
add_requires("fmt 10.2.1")
add_requires("gsl v4.0.0")
add_requires("glm 1.0.1")
add_requires("leveldb 1.23")
add_requires("endstone v0.5.6")
add_requires("magic_enum v0.9.5")
add_requires("nlohmann_json v3.11.3")
add_requires("rapidjson v1.1.0")
add_requires("QjsCpp b7859918393c67665678c66a5dd4b70c33184464")
target("main")
    -- set_toolchains("clang-cl")
    set_runtimes("MD")
    add_packages("quickjs-ng")
    add_packages("endstone")
    add_packages("entt")
    add_packages("expected-lite")
    add_packages("fmt")
    add_packages("gsl")
    add_packages("glm")
    add_packages("leveldb")
    add_packages("magic_enum")
    add_packages("nlohmann_json")
    add_packages("rapidjson")
    add_packages("QjsCpp")
    add_includedirs("include")
    set_kind("shared")
    set_languages("c++23")
    add_files("src/**.cpp")