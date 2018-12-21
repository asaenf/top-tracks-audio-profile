maven_server(
    name = "default",
    url = "http://repo.maven.apache.org/maven2/",
)


spotify_bazel_tools_version = "bab81d360dd8bcc3a49efe65402793703a403f59"

http_archive(
    name = "spotify_bazel_tools",
    sha256 = "b717a4e45907db57567551413a2e39a2829cb60fea57f6ff16799fdff639050b",
    strip_prefix = "bazel-tools-%s" % (spotify_bazel_tools_version,),
    urls = ["https://github.com/spotify/bazel-tools/archive/%s.zip" % (spotify_bazel_tools_version,)],
)

rules_go_version = "1bad20854a59785f4896d8b8847bdb57bfccf2ba"

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "0f197614ef5e8c9183e8fbdcc4c9357a526d23d6b7fcdfd49b92c6e8a79b277c",
    strip_prefix = "rules_go-%s" % (rules_go_version,),
    urls = ["https://github.com/bazelbuild/rules_go/archive/%s.zip" % (rules_go_version,)],
)

rules_scala_version = "ca4edbaa2fdae8155b6a7570b712fb71285b2c6c"  # branch master

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "6c1761c383303072c010c2b69d83024b2424b6b840bc0eadf8651d93fd9c7f74",
    strip_prefix = "rules_scala-%s" % (rules_scala_version,),
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_scala/archive/%s.zip" % (rules_scala_version,),
        "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % (rules_scala_version,),
    ],
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@spotify_bazel_tools//:tools.bzl", "bazel_tools_repositories")

bazel_tools_repositories()

##
## Load all Maven dependencies, generated by sync-deps tool
##
load("//3rdparty:workspace.bzl", "maven_dependencies")
load("//3rdparty:dependency_function.bzl", "maven_callback")

maven_dependencies(maven_callback)

