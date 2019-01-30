java_library(
    name = "auth",
        srcs = glob(["*.java"]),
        deps = [
                "//src/main/java/com/asaenf/exception:exception",
                 "//3rdparty/jvm/se/michaelthelin/spotify:spotify-web-api-java",
                 "//3rdparty/jvm/org/slf4j:slf4j-api" ,
                 "//3rdparty/jvm/org/apache/httpcomponents:httpcore"
              ],
         visibility = ["//src/main/java/com/asaenf:__subpackages__",
                       "//src/test/java/com/asaenf:__subpackages__"]
)