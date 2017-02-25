# vim: noexpandtab:ts=4:sw=4

SHELL=/bin/bash

provider = coldrye
os = debian
release = jessie
feature = jetty
feature_version = 9.4.2.v20170220
tag := $(shell date +"%Y%m%d%H%M%S")
image = $(os)-$(feature)

.PHONY: build fetch-latest push

build: fetch-latest
	for version in $(feature_version); do \
	  export relver=$${version//.[Mv]*/}; \
	  export hrelver=$${relver//./-}; \
	  tar -czh . | docker build --build-arg FEATURE_VERSION=$$version -t $(provider)/$(image)\:$${hrelver}-$(release)-$(tag) - && \
	  docker tag $(provider)/$(image)\:$${hrelver}-$(release)-$(tag) $(provider)/$(image)\:$${hrelver}-$(release)-latest; \
	done

fetch-latest:
	for version in $(feature_version); do \
	  export relver=$${version//.[Mv]*/}; \
	  export hrelver=$${relver//./-}; \
	  tar -czh . | docker build --build-arg FEATURE_VERSION=$$version -t $(provider)/$(image)\:$${hrelver}-$(release)-$(tag) - && \
	  docker pull $(provider)/$(image):$${hrelver}-$(release)-latest || true; \
	done

push: build
	for version in $(feature_version); do \
	  export relver=$${version//.[Mv]*/}; \
	  export hrelver=$${relver//./-}; \
	  tar -czh . | docker build --build-arg FEATURE_VERSION=$$version -t $(provider)/$(image)\:$${hrelver}-$(release)-$(tag) - && \
	  docker push $(provider)/$(image)\:$${hrelver}-$(release)-$(tag) && \
	  docker push $(provider)/$(image)\:$${hrelver}-$(release)-latest; \
	done

