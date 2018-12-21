load(":workspace.bzl", "default_maven_callback")

def maven_callback(*args, **kwargs):
  default_maven_callback(*args, **kwargs)