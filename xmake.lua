add_rules("mode.debug", "mode.release")
set_encodings("utf-8")
set_warnings("all")
set_languages("cxx17")

target("test")
    set_kind("static")
    add_defines(string.format("__XMAKE__=\"%s\"", os.scriptdir():gsub("\\", "/")))
    add_files("learn/test.cpp")

target("learn")
    set_kind("binary")
    add_deps("test")
    add_files("learn/learn.cpp")
    add_ldflags("-pthread")    -- 使用add_ldflags显式添加链接选项
    add_syslinks("pthread")    -- 也使用add_syslink

target("summary")
    set_kind("binary")
    add_deps("test")
    add_files("learn/summary.cpp")
    add_ldflags("-pthread")    -- 使用add_ldflags显式添加链接选项
    add_syslinks("pthread")    -- 也使用add_syslinks
