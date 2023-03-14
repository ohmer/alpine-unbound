target "base" {
  context = "https://github.com/ohmer/alpine-s6-overlay.git#main"

  args = {
    ALPINE_VERSION     = "3.17"
    S6_OVERLAY_GIT_REF = "v3.1.4.0"
  }
}

target "default" {
  contexts = {
    base = "target:base"
    root = "root"
  }

  output = ["type=docker,name=ohmer/alpine-unbound"]
}

target "all" {
  inherits = ["default"]

  platforms = [
    "linux/386",
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/arm/v6",
    "linux/ppc64le",
    "linux/s390x",
  ]
}
