# This file is generated by sync-deps, do not edit!
load("@bazel_tools//tools/build_defs/repo:java.bzl", "java_import_external")
load("@io_bazel_rules_scala//scala:scala_maven_import_external.bzl", "scala_import_external")

MAVEN_RESOLVERS = ["https://repo.maven.apache.org/maven2/"]

def default_maven_callback(name, licenses, jar_path, jar_sha256, srcjar_path = None, srcjar_sha256 = None, deps = [], runtime_deps = [], neverlink = False, is_scala = False):
    if is_scala:
        macro = scala_import_external
    else:
        macro = java_import_external

    _maybe(
        macro,
        name = name,
        licenses = licenses,
        jar_urls = [resolver + jar_path for resolver in MAVEN_RESOLVERS],
        jar_sha256 = jar_sha256,
        srcjar_urls = [] if srcjar_path == None or is_scala else [resolver + srcjar_path for resolver in MAVEN_RESOLVERS],
        srcjar_sha256 = None if is_scala else srcjar_sha256,
        deps = ["@" + d for d in deps],
        runtime_deps = runtime_deps,
        neverlink = neverlink,
        default_visibility = ["//visibility:public"],
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)


def maven_dependencies(callback=None):
    if callback == None:
        callback = default_maven_callback
    callback(name="aopalliance_aopalliance", licenses=["notice"], jar_path="aopalliance/aopalliance/1.0/aopalliance-1.0.jar", jar_sha256="0addec670fedcd3f113c5c8091d783280d23f75e3acb841b61a9cdb079376a08", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="ch_qos_logback_logback_classic", licenses=["notice"], jar_path="ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar", jar_sha256="fb53f8539e7fcb8f093a56e138112056ec1dc809ebb020b59d8a36a5ebac37e0", srcjar_path="ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar", srcjar_sha256="480cb5e99519271c9256716d4be1a27054047435ff72078d9deae5c6a19f63eb", deps=["ch_qos_logback_logback_core", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="ch_qos_logback_logback_core", licenses=["notice"], jar_path="ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar", jar_sha256="5946d837fe6f960c02a53eda7a6926ecc3c758bbdd69aa453ee429f858217f22", srcjar_path="ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar", srcjar_sha256="1f69b6b638ec551d26b10feeade5a2b77abe347f9759da95022f0da9a63a9971", deps=[], neverlink=False, is_scala=False)
    callback(name="com_codahale_metrics_metrics_core", licenses=["notice"], jar_path="com/codahale/metrics/metrics-core/3.0.2/metrics-core-3.0.2.jar", jar_sha256="9e819c6f4d5f446e00cb05b08d0127226683b725a94d161288aea870c1bd2f63", srcjar_path="com/codahale/metrics/metrics-core/3.0.2/metrics-core-3.0.2-sources.jar", srcjar_sha256="35a0ffa4209ca501244e0d1e87ab1864d2b119b5b62f90b5f13eddc4910bf182", deps=["org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_codahale_metrics_metrics_jvm", licenses=["notice"], jar_path="com/codahale/metrics/metrics-jvm/3.0.2/metrics-jvm-3.0.2.jar", jar_sha256="3037359ca538d98c5a7bcf070f98a9b9023379853276826b4902d64bc358911a", srcjar_path="com/codahale/metrics/metrics-jvm/3.0.2/metrics-jvm-3.0.2-sources.jar", srcjar_sha256="b0f9c361aff94ce8e7eb9e5360673e7eb95067ebd239befa21a5bfebf7db9943", deps=["com_codahale_metrics_metrics_core", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_core_jackson_annotations", licenses=["notice"], jar_path="com/fasterxml/jackson/core/jackson-annotations/2.9.7/jackson-annotations-2.9.7.jar", jar_sha256="8bf8c224e9205f77a0e239e96e473bdb263772db4ab85ecd1810e14c04132c5e", srcjar_path="com/fasterxml/jackson/core/jackson-annotations/2.9.7/jackson-annotations-2.9.7-sources.jar", srcjar_sha256="7cf6446b7e86bf7c9fe1f0c8facb468f828d4b2ddcc4b4503129799c2aeb090c", deps=[], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_core_jackson_core", licenses=["notice"], jar_path="com/fasterxml/jackson/core/jackson-core/2.9.7/jackson-core-2.9.7.jar", jar_sha256="9e5bc0efabd9f0cac5c1fdd9ae35b16332ed22a0ee19a356de370a18a8cb6c84", srcjar_path="com/fasterxml/jackson/core/jackson-core/2.9.7/jackson-core-2.9.7-sources.jar", srcjar_sha256="eb4b15c1e0b3eed02f6e2e15ff695fe95b36b9593ca5061298efc75f417e1f6c", deps=[], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_core_jackson_databind", licenses=["notice"], jar_path="com/fasterxml/jackson/core/jackson-databind/2.9.7/jackson-databind-2.9.7.jar", jar_sha256="675376decfc070b039d2be773a97002f1ee1e1346d95bd99feee0d56683a92bf", srcjar_path="com/fasterxml/jackson/core/jackson-databind/2.9.7/jackson-databind-2.9.7-sources.jar", srcjar_sha256="c938d7ffa341a409f35b60428bd1d445a04aa1021f4b5670bfb00d6afca9edde", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_core"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_dataformat_jackson_dataformat_yaml", licenses=["notice"], jar_path="com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.7/jackson-dataformat-yaml-2.9.7.jar", jar_sha256="a3d69d82f5b16496ebe75bd43ae0570c87dd3ebcdfd2e599496da9707b58e537", srcjar_path="com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.7/jackson-dataformat-yaml-2.9.7-sources.jar", srcjar_sha256="1aed89ca9863b65aa2ec65708bfcb036e1ad04d432ce770133f732fdb5ff56cf", deps=["com_fasterxml_jackson_core_jackson_core", "org_yaml_snakeyaml"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_datatype_jackson_datatype_guava", licenses=["notice"], jar_path="com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.7/jackson-datatype-guava-2.9.7.jar", jar_sha256="4a012f17e8d7b61463628a130e4f42534d5887ac37752e68f0c212774a59985d", srcjar_path="com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.7/jackson-datatype-guava-2.9.7-sources.jar", srcjar_sha256="cec6aa4669d00003e2791da2a9e15f0cf92849389e3245a808c7b5af120e4811", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind", "com_google_guava_guava"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_datatype_jackson_datatype_jdk8", licenses=["notice"], jar_path="com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.9.7/jackson-datatype-jdk8-2.9.7.jar", jar_sha256="ec67a3d5e6abc7c7c611dd02ad270bbac0ca9a98b32c6cc821fb011a5863b99e", srcjar_path="com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.9.7/jackson-datatype-jdk8-2.9.7-sources.jar", srcjar_sha256="16aec32187029599f48b07820101c12d22969926054e3b66ee7803e56fffcf20", deps=["com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_datatype_jackson_datatype_joda", licenses=["notice"], jar_path="com/fasterxml/jackson/datatype/jackson-datatype-joda/2.9.7/jackson-datatype-joda-2.9.7.jar", jar_sha256="3c2e9f1fc52ada48b7ed591e8337d345cc1c628a898365436282d8a34957ed58", srcjar_path="com/fasterxml/jackson/datatype/jackson-datatype-joda/2.9.7/jackson-datatype-joda-2.9.7-sources.jar", srcjar_sha256="463102d51068afdf2121e3b9192c2630f15906f89cc174b2f6b64ce712d7761e", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind", "joda_time_joda_time"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_jaxrs_jackson_jaxrs_base", licenses=["notice"], jar_path="com/fasterxml/jackson/jaxrs/jackson-jaxrs-base/2.9.7/jackson-jaxrs-base-2.9.7.jar", jar_sha256="aa392e17f53f8a4bfa30a7b871d4c8847dadf8a51bd2345c778c8c24ad1546bf", srcjar_path=None, srcjar_sha256=None, deps=["com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_jaxrs_jackson_jaxrs_json_provider", licenses=["notice"], jar_path="com/fasterxml/jackson/jaxrs/jackson-jaxrs-json-provider/2.9.7/jackson-jaxrs-json-provider-2.9.7.jar", jar_sha256="e2822cb192420154ad648b6e73ce91426b2b8a829698819505b1a6bfc02b08ea", srcjar_path="com/fasterxml/jackson/jaxrs/jackson-jaxrs-json-provider/2.9.7/jackson-jaxrs-json-provider-2.9.7-sources.jar", srcjar_sha256="eba9148decef4e5235b590df6b29efa1d8be88fa4ef0a517497791be92e69339", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind", "com_fasterxml_jackson_jaxrs_jackson_jaxrs_base", "com_fasterxml_jackson_module_jackson_module_jaxb_annotations"], neverlink=False, is_scala=False)
    callback(name="com_fasterxml_jackson_module_jackson_module_jaxb_annotations", licenses=["notice"], jar_path="com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.9.7/jackson-module-jaxb-annotations-2.9.7.jar", jar_sha256="027a1ddfc6e2372166b8825346476f8f62e5f6fac0546c5db1ee3bec0e8d104b", srcjar_path=None, srcjar_sha256=None, deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_core", "com_fasterxml_jackson_core_jackson_databind"], neverlink=False, is_scala=False)
    callback(name="com_google_code_findbugs_annotations", licenses=["notice"], jar_path="com/google/code/findbugs/annotations/2.0.0/annotations-2.0.0.jar", jar_sha256="09b0ceef7b47b39c916ed4e0e6121ecdcdb4d2538f5a479fee387146f7bc67c1", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="com_google_code_findbugs_jsr305", licenses=["notice"], jar_path="com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar", jar_sha256="766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="com_google_errorprone_error_prone_annotations", licenses=["notice"], jar_path="com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar", jar_sha256="03d0329547c13da9e17c634d1049ea2ead093925e290567e1a364fd6b1fc7ff8", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="com_google_guava_guava", licenses=["notice"], jar_path="com/google/guava/guava/26.0-jre/guava-26.0-jre.jar", jar_sha256="a0e9cabad665bc20bcd2b01f108e5fc03f756e13aea80abaadb9f407033bea2c", srcjar_path="com/google/guava/guava/26.0-jre/guava-26.0-jre-sources.jar", srcjar_sha256="a658eba55b72c320c45501045184c71da037cd52cd6056d597458a0c32504421", deps=["com_google_code_findbugs_jsr305", "com_google_errorprone_error_prone_annotations", "com_google_j2objc_j2objc_annotations", "org_checkerframework_checker_qual", "org_codehaus_mojo_animal_sniffer_annotations"], neverlink=False, is_scala=False)
    callback(name="com_google_inject_guice", licenses=["notice"], jar_path="com/google/inject/guice/4.2.2/guice-4.2.2.jar", jar_sha256="d258ff1bd9b8b527872f8402648226658ad3149f1f40e74b0566d69e7e042fbc", srcjar_path="com/google/inject/guice/4.2.2/guice-4.2.2-sources.jar", srcjar_sha256="33ecda71a3876dcc2b9d16b4a5a67d08078db5fedd61ce51c74db734889cd049", deps=["aopalliance_aopalliance", "com_google_guava_guava", "javax_inject_javax_inject"], neverlink=False, is_scala=False)
    callback(name="com_google_inject_extensions_guice_multibindings", licenses=["notice"], jar_path="com/google/inject/extensions/guice-multibindings/4.2.0/guice-multibindings-4.2.0.jar", jar_sha256="3d8fb647dc2f4739d0fec938aac846ba7b8fd33e8b49735132a8dcb342f30870", srcjar_path=None, srcjar_sha256=None, deps=["com_google_inject_guice"], neverlink=False, is_scala=False)
    callback(name="com_google_j2objc_j2objc_annotations", licenses=["notice"], jar_path="com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar", jar_sha256="2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_api", licenses=["notice"], jar_path="com/spotify/apollo-api/1.10.1/apollo-api-1.10.1.jar", jar_sha256="a8b7b5f0264004848353f4da5ba7502fba4fbb846f41cfff744d5ff6f03f13c8", srcjar_path="com/spotify/apollo-api/1.10.1/apollo-api-1.10.1-sources.jar", srcjar_sha256="1213c3cfd9627d5ab570b7af57fac6e69ecef502e804e7d628c298bd8beed7be", deps=["com_google_code_findbugs_jsr305", "com_google_guava_guava", "com_squareup_okio_okio", "com_typesafe_config", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_api_impl", licenses=["notice"], jar_path="com/spotify/apollo-api-impl/1.10.1/apollo-api-impl-1.10.1.jar", jar_sha256="7cc22256654f818de9c4c132474cdd4fa0ff00610949bdd4b9474c26097b7936", srcjar_path="com/spotify/apollo-api-impl/1.10.1/apollo-api-impl-1.10.1-sources.jar", srcjar_sha256="88d0394aec9572c78f1167e56bbcfaf018110b9d4f5b5ae0772a3ca94685170b", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_databind", "com_google_code_findbugs_jsr305", "com_google_guava_guava", "com_spotify_apollo_api", "com_spotify_apollo_route", "com_squareup_okio_okio", "com_typesafe_config", "commons_lang_commons_lang", "io_norberg_auto_matter_annotation", "io_norberg_auto_matter_jackson", "io_norberg_rut", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_core", licenses=["notice"], jar_path="com/spotify/apollo-core/1.10.1/apollo-core-1.10.1.jar", jar_sha256="f1a02ee8e8f2a88901e7128fe11eed77c1a205e8bded9b74ac1c46bb8b75f6bf", srcjar_path="com/spotify/apollo-core/1.10.1/apollo-core-1.10.1-sources.jar", srcjar_sha256="02fffa8b00880d0030c19901da76274cb3de7867130217d07b212248465ca8c1", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_databind", "com_google_guava_guava", "com_google_inject_guice", "com_typesafe_config", "net_sf_jopt_simple_jopt_simple", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_environment", licenses=["notice"], jar_path="com/spotify/apollo-environment/1.10.1/apollo-environment-1.10.1.jar", jar_sha256="2e8c1729d45e8dff73b392eba1ee2a8e6ca5634e4d63efe02092f27613960887", srcjar_path="com/spotify/apollo-environment/1.10.1/apollo-environment-1.10.1-sources.jar", srcjar_sha256="383d8f55e9d0d86e651b2b7977819973a3b69c9844002ac9da0f96f0aca22543", deps=["com_fasterxml_jackson_core_jackson_annotations", "com_fasterxml_jackson_core_jackson_databind", "com_google_code_findbugs_jsr305", "com_google_guava_guava", "com_google_inject_guice", "com_google_inject_extensions_guice_multibindings", "com_spotify_apollo_api", "com_spotify_apollo_api_impl", "com_spotify_apollo_core", "com_spotify_apollo_route", "com_squareup_okio_okio", "com_typesafe_config", "commons_lang_commons_lang", "io_norberg_auto_matter_annotation", "io_norberg_auto_matter_jackson", "io_norberg_rut", "net_sf_jopt_simple_jopt_simple", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_extra", licenses=["notice"], jar_path="com/spotify/apollo-extra/1.10.1/apollo-extra-1.10.1.jar", jar_sha256="72f3e115a54a19789e101f19e028b356cb5f2cdb4ff895ba0c2e79ebb6fcaca0", srcjar_path=None, srcjar_sha256=None, deps=["com_fasterxml_jackson_core_jackson_databind", "com_google_guava_guava", "com_spotify_apollo_api", "com_spotify_apollo_environment", "com_squareup_okio_okio"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_http_service", licenses=["notice"], jar_path="com/spotify/apollo-http-service/1.10.1/apollo-http-service-1.10.1.jar", jar_sha256="e6137010d59e319c894710ea3640c717ae17e0131fa7da1bc3748dc683552a91", srcjar_path="com/spotify/apollo-http-service/1.10.1/apollo-http-service-1.10.1-sources.jar", srcjar_sha256="b6db4fc6ce4d9e05a857547a22072bf8e2297b5e49aafa75c1703e1b344f1cee", deps=["ch_qos_logback_logback_classic", "com_spotify_apollo_api_impl", "com_spotify_apollo_core", "com_spotify_apollo_environment", "com_spotify_apollo_jetty_http_server", "com_spotify_apollo_metrics", "com_spotify_apollo_okhttp_client", "javax_servlet_javax_servlet_api", "org_eclipse_jetty_jetty_http", "org_eclipse_jetty_jetty_io", "org_eclipse_jetty_jetty_server", "org_eclipse_jetty_jetty_util"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_jetty_http_server", licenses=["notice"], jar_path="com/spotify/apollo-jetty-http-server/1.10.1/apollo-jetty-http-server-1.10.1.jar", jar_sha256="069106c2199288ddb0b8366f66edabd3d5f640f570579e05eabde3b301ae9f90", srcjar_path=None, srcjar_sha256=None, deps=["com_spotify_apollo_api_impl", "com_spotify_apollo_core", "com_spotify_apollo_environment", "javax_servlet_javax_servlet_api", "org_eclipse_jetty_jetty_http", "org_eclipse_jetty_jetty_io", "org_eclipse_jetty_jetty_server", "org_eclipse_jetty_jetty_util"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_metrics", licenses=["notice"], jar_path="com/spotify/apollo-metrics/1.10.1/apollo-metrics-1.10.1.jar", jar_sha256="5bd359638c3c80775c52f87543926dafe060c8d8ec4252beb374237e5dc9818f", srcjar_path="com/spotify/apollo-metrics/1.10.1/apollo-metrics-1.10.1-sources.jar", srcjar_sha256="8a3316ccf58a768dc54cf87da83dc993c30ba877c8262d51cf212d2c25bdc775", deps=["com_google_code_findbugs_annotations", "com_google_guava_guava", "com_spotify_apollo_core", "com_spotify_apollo_environment", "com_spotify_ffwd_ffwd_http_client", "com_spotify_metrics_semantic_metrics_api", "com_spotify_metrics_semantic_metrics_core", "com_spotify_metrics_semantic_metrics_ffwd_http_reporter", "com_spotify_metrics_semantic_metrics_ffwd_reporter", "eu_toolchain_ffwd_ffwd_client", "io_dropwizard_metrics_metrics_core", "io_dropwizard_metrics_metrics_jvm", "io_reactivex_rxjava", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_okhttp_client", licenses=["notice"], jar_path="com/spotify/apollo-okhttp-client/1.10.1/apollo-okhttp-client-1.10.1.jar", jar_sha256="5dccf03b7bcc0ed57beddea255e6d2c61cc5389959da2188edc7a0d7df677922", srcjar_path="com/spotify/apollo-okhttp-client/1.10.1/apollo-okhttp-client-1.10.1-sources.jar", srcjar_sha256="84e3171e6e0ab7d99070acac8fc9b4cd5e2d63748e475a5a35c9fe15124183f6", deps=["com_fasterxml_jackson_core_jackson_databind", "com_google_guava_guava", "com_spotify_apollo_api", "com_spotify_apollo_api_impl", "com_spotify_apollo_core", "com_spotify_apollo_environment", "com_spotify_apollo_extra", "com_squareup_okhttp_okhttp", "com_squareup_okio_okio"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_route", licenses=["notice"], jar_path="com/spotify/apollo-route/1.10.1/apollo-route-1.10.1.jar", jar_sha256="821ca4ad50e0a5468a2789805029a08b4abfd195291274f42fde04007a51ab18", srcjar_path="com/spotify/apollo-route/1.10.1/apollo-route-1.10.1-sources.jar", srcjar_sha256="3bbda0349cfe4352d53d3d67c7e99d21e85270af088c801a7836840bc46a0e0d", deps=["com_google_guava_guava", "com_spotify_apollo_api", "commons_lang_commons_lang", "io_norberg_rut", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_apollo_test", licenses=["notice"], jar_path="com/spotify/apollo-test/1.10.1/apollo-test-1.10.1.jar", jar_sha256="9285d384c8aa131e2e362cf88b8b5f7861ccadb5e424e7cb46c40e60674a44ba", srcjar_path="com/spotify/apollo-test/1.10.1/apollo-test-1.10.1-sources.jar", srcjar_sha256="37e8a6d72b9517bd547404cac447f69b399197e2111b5d6999811417fa008d68", deps=["com_google_code_findbugs_annotations", "com_google_code_findbugs_jsr305", "com_google_guava_guava", "com_spotify_apollo_api_impl", "com_spotify_apollo_core", "com_spotify_apollo_environment", "com_spotify_apollo_metrics", "com_spotify_apollo_okhttp_client", "com_spotify_ffwd_ffwd_http_client", "com_spotify_metrics_semantic_metrics_api", "com_spotify_metrics_semantic_metrics_core", "com_spotify_metrics_semantic_metrics_ffwd_http_reporter", "com_spotify_metrics_semantic_metrics_ffwd_reporter", "eu_toolchain_ffwd_ffwd_client", "io_dropwizard_metrics_metrics_core", "io_dropwizard_metrics_metrics_jvm", "io_reactivex_rxjava", "junit_junit", "org_hamcrest_hamcrest_core", "org_hamcrest_hamcrest_library", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_ffwd_ffwd_http_client", licenses=["notice"], jar_path="com/spotify/ffwd/ffwd-http-client/0.4.0/ffwd-http-client-0.4.0.jar", jar_sha256="4979dbbdd0cae33ed83858a8dfbd662949e28300a13e5595773b844a91f50d2b", srcjar_path=None, srcjar_sha256=None, deps=["com_google_code_findbugs_annotations", "io_reactivex_rxjava", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_metrics_semantic_metrics_api", licenses=["notice"], jar_path="com/spotify/metrics/semantic-metrics-api/1.0.2/semantic-metrics-api-1.0.2.jar", jar_sha256="b87a74b9de5e4bc9d13122be26f7664df1a5b8666f9bf5fe8c7f35d4cea50dc0", srcjar_path="com/spotify/metrics/semantic-metrics-api/1.0.2/semantic-metrics-api-1.0.2-sources.jar", srcjar_sha256="e02f219eaefd84d60d03882288e1b5c39c4b1201f2b862f13a870997eb83e353", deps=["com_google_guava_guava"], neverlink=False, is_scala=False)
    callback(name="com_spotify_metrics_semantic_metrics_core", licenses=["notice"], jar_path="com/spotify/metrics/semantic-metrics-core/1.0.2/semantic-metrics-core-1.0.2.jar", jar_sha256="39e864104dfe2b5f33f787e333dd1219b6e4d773c6533633e1a79dd58e4b09a6", srcjar_path="com/spotify/metrics/semantic-metrics-core/1.0.2/semantic-metrics-core-1.0.2-sources.jar", srcjar_sha256="4f76ea2a7e2c238fb396c4cfc4d047e6b3da4b9b8fe65b9fef7999d916f58b9f", deps=["com_codahale_metrics_metrics_core", "com_codahale_metrics_metrics_jvm", "com_google_guava_guava", "com_spotify_metrics_semantic_metrics_api", "io_dropwizard_metrics_metrics_core", "io_dropwizard_metrics_metrics_jvm", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_metrics_semantic_metrics_ffwd_http_reporter", licenses=["notice"], jar_path="com/spotify/metrics/semantic-metrics-ffwd-http-reporter/1.0.2/semantic-metrics-ffwd-http-reporter-1.0.2.jar", jar_sha256="bac5b19f10453c3e9992e8b5f3fe865e06f7c253d93c10122e363f835996785c", srcjar_path=None, srcjar_sha256=None, deps=["com_google_code_findbugs_annotations", "com_google_guava_guava", "com_spotify_ffwd_ffwd_http_client", "com_spotify_metrics_semantic_metrics_core", "io_reactivex_rxjava", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_spotify_metrics_semantic_metrics_ffwd_reporter", licenses=["notice"], jar_path="com/spotify/metrics/semantic-metrics-ffwd-reporter/1.0.2/semantic-metrics-ffwd-reporter-1.0.2.jar", jar_sha256="73e208b3b92d42eaa42b6a1469876569ae52eb4f07296346c5903761b839a6a9", srcjar_path="com/spotify/metrics/semantic-metrics-ffwd-reporter/1.0.2/semantic-metrics-ffwd-reporter-1.0.2-sources.jar", srcjar_sha256="ddc75bf4ecea908c3cac1d1e97f39e4c9ece28f9d264e14361c8f65a21483978", deps=["com_codahale_metrics_metrics_core", "com_codahale_metrics_metrics_jvm", "com_google_guava_guava", "com_spotify_metrics_semantic_metrics_api", "com_spotify_metrics_semantic_metrics_core", "eu_toolchain_ffwd_ffwd_client", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="com_squareup_okhttp_okhttp", licenses=["notice"], jar_path="com/squareup/okhttp/okhttp/2.5.0/okhttp-2.5.0.jar", jar_sha256="1cc716e29539adcda677949508162796daffedb4794cbf947a6f65e696f0381c", srcjar_path=None, srcjar_sha256=None, deps=["com_squareup_okio_okio"], neverlink=False, is_scala=False)
    callback(name="com_squareup_okio_okio", licenses=["notice"], jar_path="com/squareup/okio/okio/1.16.0/okio-1.16.0.jar", jar_sha256="ec0484ff1903640e3845c2b10abb99eff2d32308ffe3459e5f92309a451b9c7e", srcjar_path="com/squareup/okio/okio/1.16.0/okio-1.16.0-sources.jar", srcjar_sha256="dadd8fdc31ea10027b46bdfcdbe5546f96f2f29a1816b0a1a9f200e453cd93e0", deps=[], neverlink=False, is_scala=False)
    callback(name="com_typesafe_config", licenses=["notice"], jar_path="com/typesafe/config/1.3.1/config-1.3.1.jar", jar_sha256="e6fadfc6108220d3a6b86aa7e4e16c9e7bb857ba58955886308bb13972264af0", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="commons_lang_commons_lang", licenses=["notice"], jar_path="commons-lang/commons-lang/2.6/commons-lang-2.6.jar", jar_sha256="50f11b09f877c294d56f24463f47d28f929cf5044f648661c0f0cfbae9a2f49c", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="eu_toolchain_ffwd_ffwd_client", licenses=["notice"], jar_path="eu/toolchain/ffwd/ffwd-client/0.0.3/ffwd-client-0.0.3.jar", jar_sha256="766e336d906cd2cf509e15728868a867d9692e7227fd64fcbd280561032dc72f", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="io_dropwizard_metrics_metrics_core", licenses=["notice"], jar_path="io/dropwizard/metrics/metrics-core/4.0.2/metrics-core-4.0.2.jar", jar_sha256="750e2aed52ca23dd1583352b764d5562161ef2f3b7b702f29a170ea6fe6c6bfb", srcjar_path=None, srcjar_sha256=None, deps=["org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="io_dropwizard_metrics_metrics_jvm", licenses=["notice"], jar_path="io/dropwizard/metrics/metrics-jvm/4.0.2/metrics-jvm-4.0.2.jar", jar_sha256="a9f350c6992d99a192311603422c3bd0ffa2f5f436bc9a1583b90a11213915da", srcjar_path=None, srcjar_sha256=None, deps=["io_dropwizard_metrics_metrics_core", "org_slf4j_slf4j_api"], neverlink=False, is_scala=False)
    callback(name="io_norberg_auto_matter_annotation", licenses=["notice"], jar_path="io/norberg/auto-matter-annotation/0.15.0/auto-matter-annotation-0.15.0.jar", jar_sha256="715df1eedf9872fc130d1fc5ca8250b3bb56bdf0cfe99593ec923dbd8f11ba83", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="io_norberg_auto_matter_jackson", licenses=["notice"], jar_path="io/norberg/auto-matter-jackson/0.15.0/auto-matter-jackson-0.15.0.jar", jar_sha256="d180b726b1a5414e288111e4f1631a0a0013c901cecadfbb2cf29509ed75a208", srcjar_path=None, srcjar_sha256=None, deps=["com_fasterxml_jackson_core_jackson_databind", "io_norberg_auto_matter_annotation"], neverlink=False, is_scala=False)
    callback(name="io_norberg_rut", licenses=["notice"], jar_path="io/norberg/rut/1.0/rut-1.0.jar", jar_sha256="3fe29f3ae23567489acd52d86371b504ffc17b5024261210108189d8326af83b", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="io_reactivex_rxjava", licenses=["notice"], jar_path="io/reactivex/rxjava/1.3.3/rxjava-1.3.3.jar", jar_sha256="93a7500a620a39f4cd2b155543df9fed476dffca9654d27194e092237cb5eb09", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="javax_annotation_javax_annotation_api", licenses=["notice"], jar_path="javax/annotation/javax.annotation-api/1.2/javax.annotation-api-1.2.jar", jar_sha256="5909b396ca3a2be10d0eea32c74ef78d816e1b4ead21de1d78de1f890d033e04", srcjar_path="javax/annotation/javax.annotation-api/1.2/javax.annotation-api-1.2-sources.jar", srcjar_sha256="8bd08333ac2c195e224cc4063a72f4aab3c980cf5e9fb694130fad41689689d0", deps=[], neverlink=False, is_scala=False)
    callback(name="javax_inject_javax_inject", licenses=["notice"], jar_path="javax/inject/javax.inject/1/javax.inject-1.jar", jar_sha256="91c77044a50c481636c32d916fd89c9118a72195390452c81065080f957de7ff", srcjar_path="javax/inject/javax.inject/1/javax.inject-1-sources.jar", srcjar_sha256="c4b87ee2911c139c3daf498a781967f1eb2e75bc1a8529a2e7b328a15d0e433e", deps=[], neverlink=False, is_scala=False)
    callback(name="javax_servlet_javax_servlet_api", licenses=["notice"], jar_path="javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar", jar_sha256="af456b2dd41c4e82cf54f3e743bc678973d9fe35bd4d3071fa05c7e5333b8482", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="joda_time_joda_time", licenses=["notice"], jar_path="joda-time/joda-time/2.9.9/joda-time-2.9.9.jar", jar_sha256="b049a43c1057942e6acfbece008e4949b2e35d1658d0c8e06f4485397e2fa4e7", srcjar_path="joda-time/joda-time/2.9.9/joda-time-2.9.9-sources.jar", srcjar_sha256="facba3aeb0c0d842d545bf7e732ea19869e2b18916adaa4eeda395c946c22991", deps=[], neverlink=False, is_scala=False)
    callback(name="junit_junit", licenses=["notice"], jar_path="junit/junit/4.12/junit-4.12.jar", jar_sha256="59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a", srcjar_path="junit/junit/4.12/junit-4.12-sources.jar", srcjar_sha256="9f43fea92033ad82bcad2ae44cec5c82abc9d6ee4b095cab921d11ead98bf2ff", deps=["org_hamcrest_hamcrest_core"], neverlink=False, is_scala=False)
    callback(name="net_bytebuddy_byte_buddy", licenses=["notice"], jar_path="net/bytebuddy/byte-buddy/1.9.3/byte-buddy-1.9.3.jar", jar_sha256="a27350be602caea67a33d31281496c84c69b5ab34ddc228e9ff2253fc8f9cd31", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="net_bytebuddy_byte_buddy_agent", licenses=["notice"], jar_path="net/bytebuddy/byte-buddy-agent/1.9.3/byte-buddy-agent-1.9.3.jar", jar_sha256="547288e013a9d1f4a4ce2ab84c24e3edda6e433c7fa6b2c3c3613932671b05b1", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="net_sf_jopt_simple_jopt_simple", licenses=["notice"], jar_path="net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar", jar_sha256="26c5856e954b5f864db76f13b86919b59c6eecf9fd930b96baa8884626baf2f5", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_assertj_assertj_core", licenses=["notice"], jar_path="org/assertj/assertj-core/3.11.1/assertj-core-3.11.1.jar", jar_sha256="2ee2bd3e81fc818d423d442b658f28acf938d9078d6ba016a64b362fdd7779e8", srcjar_path="org/assertj/assertj-core/3.11.1/assertj-core-3.11.1-sources.jar", srcjar_sha256="a9e9c9ad5c8971a634d6681402174602888b09af3c1dd05bf41f3cc7441d2ae9", deps=[], neverlink=False, is_scala=False)
    callback(name="org_checkerframework_checker_qual", licenses=["notice"], jar_path="org/checkerframework/checker-qual/2.5.2/checker-qual-2.5.2.jar", jar_sha256="64b02691c8b9d4e7700f8ee2e742dce7ea2c6e81e662b7522c9ee3bf568c040a", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_codehaus_mojo_animal_sniffer_annotations", licenses=["notice"], jar_path="org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar", jar_sha256="2068320bd6bad744c3673ab048f67e30bef8f518996fa380033556600669905d", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_eclipse_jetty_jetty_http", licenses=["notice"], jar_path="org/eclipse/jetty/jetty-http/9.3.24.v20180605/jetty-http-9.3.24.v20180605.jar", jar_sha256="27a7821c47ea86c70a56bf2843b87c81c6c2e5c86ea55e7a675aa8828d432277", srcjar_path=None, srcjar_sha256=None, deps=["org_eclipse_jetty_jetty_util"], neverlink=False, is_scala=False)
    callback(name="org_eclipse_jetty_jetty_io", licenses=["notice"], jar_path="org/eclipse/jetty/jetty-io/9.3.24.v20180605/jetty-io-9.3.24.v20180605.jar", jar_sha256="a882194b64b1171b0cdc10f9b2decd2b2023bfd96e2b371218553b0e1316b4a6", srcjar_path=None, srcjar_sha256=None, deps=["org_eclipse_jetty_jetty_util"], neverlink=False, is_scala=False)
    callback(name="org_eclipse_jetty_jetty_server", licenses=["notice"], jar_path="org/eclipse/jetty/jetty-server/9.3.24.v20180605/jetty-server-9.3.24.v20180605.jar", jar_sha256="64f1b63ad2d41cf7b45b53be170706815cd82e9175820dd2cd496d93cd658f62", srcjar_path=None, srcjar_sha256=None, deps=["javax_servlet_javax_servlet_api", "org_eclipse_jetty_jetty_http", "org_eclipse_jetty_jetty_io", "org_eclipse_jetty_jetty_util"], neverlink=False, is_scala=False)
    callback(name="org_eclipse_jetty_jetty_util", licenses=["notice"], jar_path="org/eclipse/jetty/jetty-util/9.3.24.v20180605/jetty-util-9.3.24.v20180605.jar", jar_sha256="7d77c6f41a70b12dd188056517bc20e484f5b12ae4e6aac700e6ffb941815763", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_hamcrest_hamcrest_core", licenses=["notice"], jar_path="org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar", jar_sha256="66fdef91e9739348df7a096aa384a5685f4e875584cce89386a7a47251c4d8e9", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_hamcrest_hamcrest_library", licenses=["notice"], jar_path="org/hamcrest/hamcrest-library/1.3/hamcrest-library-1.3.jar", jar_sha256="711d64522f9ec410983bd310934296da134be4254a125080a0416ec178dfad1c", srcjar_path=None, srcjar_sha256=None, deps=["org_hamcrest_hamcrest_core"], neverlink=False, is_scala=False)
    callback(name="org_mockito_mockito_core", licenses=["notice"], jar_path="org/mockito/mockito-core/2.23.4/mockito-core-2.23.4.jar", jar_sha256="d77e018b6bc211d78ddcec54bc508732c4677b9a9eb9103793be85441b20bc5d", srcjar_path="org/mockito/mockito-core/2.23.4/mockito-core-2.23.4-sources.jar", srcjar_sha256="2e624439ee1de251c0e963a7183f47383eb67b29260d175ab6688675e05c9342", deps=["net_bytebuddy_byte_buddy", "net_bytebuddy_byte_buddy_agent", "org_objenesis_objenesis"], neverlink=False, is_scala=False)
    callback(name="org_objenesis_objenesis", licenses=["notice"], jar_path="org/objenesis/objenesis/2.6/objenesis-2.6.jar", jar_sha256="5e168368fbc250af3c79aa5fef0c3467a2d64e5a7bd74005f25d8399aeb0708d", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
    callback(name="org_slf4j_slf4j_api", licenses=["notice"], jar_path="org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar", jar_sha256="18c4a0095d5c1da6b817592e767bb23d29dd2f560ad74df75ff3961dbde25b79", srcjar_path="org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25-sources.jar", srcjar_sha256="c4bc93180a4f0aceec3b057a2514abe04a79f06c174bbed910a2afb227b79366", deps=[], neverlink=False, is_scala=False)
    callback(name="org_yaml_snakeyaml", licenses=["notice"], jar_path="org/yaml/snakeyaml/1.23/snakeyaml-1.23.jar", jar_sha256="13009fb5ede3cf2be5a8d0f1602155aeaa0ce5ef5f9366892bd258d8d3d4d2b1", srcjar_path=None, srcjar_sha256=None, deps=[], neverlink=False, is_scala=False)
