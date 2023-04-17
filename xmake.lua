add_rules("mode.release")
set_defaultmode("release")
set_languages("cxx11", "c99")

target("boost-system")
    set_kind("shared")
    set_filename("libboost_system.so.1.58.0")
    if is_kind("shared") then
        add_defines("BOOST_SYSTEM_DYN_LINK")
    else
        add_defines("BOOST_SYSTEM_STATIC_LINK")
    end
    add_includedirs("../boost_1_58_0")
    add_files("src/*.cpp")
    add_cxxflags("-fPIC")
    add_ldflags("-Wl,--no-undefined", "-Wl,--exclude-libs,ALL", "-Wl,-Bsymbolic")
    after_build(function (target)
        os.cd(target:targetdir())
        os.tryrm("libboost_system.so")
        os.ln("libboost_system.so.1.58.0", "libboost_system.so")
    end)
    -- after_build(function (target)
    --     os.mkdir("build-out")
    --     os.cp("./build/linux", "build-out")
    --     if is_arch("arm64-v8a") then
    --         os.trycp(target:targetfile(), "/home/rhel/workspace/svn/TiprayDLPII_Server/bigLd/source/branches/pre_release/dlp_v3_08_23Q1/02_Server/trackServer/ThirdParty/libs/linux/aarch64")
    --     else
    --         os.trycp(target:targetfile(), "/home/rhel/workspace/svn/TiprayDLPII_Server/bigLd/source/branches/pre_release/dlp_v3_08_23Q1/02_Server/trackServer/ThirdParty/libs/linux/x86_64")
    --     end
    -- end)

    -- on_clean(function (target)
    --     os.tryrm("./build")
    -- end)
target_end()