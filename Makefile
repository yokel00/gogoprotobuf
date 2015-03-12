# Extensions for Protocol Buffers to create more go like structures.
#
# Copyright (c) 2013, Vastech SA (PTY) LTD. All rights reserved.
# http://github.com/gogo/protobuf/gogoproto
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

.PHONY: nuke regenerate tests clean install gofmt

install:
	go install ./proto
	go install ./gogoproto
	go install ./protoc-gen-gogo
	go install ./fieldpath/fieldpath-gen
	go install ./fieldpath
	go install ./pbpath

all: clean install regenerate install tests

clean:
	go clean ./...

nuke:
	go clean -i ./...

gofmt:
	gofmt -l -s -w .

regenerate:
	make -C protoc-gen-gogo/descriptor regenerate
	make -C protoc-gen-gogo/plugin regenerate
	make -C gogoproto regenerate
	make -C fieldpath/fieldpath-gen regenerate
	make -C proto/testdata regenerate
	make -C proto/proto3_proto regenerate
	make -C test regenerate
	make -C test/example regenerate
	make -C test/unrecognized regenerate
	make -C test/group regenerate
	make -C test/unrecognizedgroup regenerate
	make -C test/enumstringer regenerate
	make -C test/unmarshalmerge regenerate
	make -C test/moredefaults regenerate
	make -C test/issue8 regenerate
	make -C test/enumprefix regenerate
	make -C test/packed regenerate
	make -C test/tags regenerate
	make -C test/oneof regenerate
	make -C test/theproto3 regenerate
	make gofmt

tests:
	go test -v ./test
	go test -v ./proto
	go test -v ./fieldpath
	go test -v ./io
	go test -v ./test/custom
	go test -v ./test/embedconflict
	go test -v ./test/defaultconflict
	go test -v ./test/unrecognized
	go test -v ./test/group
	go test -v ./test/unrecognizedgroup
	go test -v ./test/enumstringer
	go test -v ./test/unmarshalmerge
	go test -v ./test/moredefaults
	go test -v ./test/issue8
	go test -v ./test/example
	go test -v ./test/dashfilename
	go build ./test/enumprefix
	go test -v ./test/packed
	go test -v ./test/tags
	go test -v ./parser
	go test -v ./test/oneof
	go test -v ./test/theproto3/...
	go test -v ./test/combos/...
	make vet

vet:
	go vet ./...

drone:
	sudo apt-get install protobuf-compiler
	(cd $(GOPATH)/src/github.com/gogo/protobuf && make all)

testall: tests
	make -C protoc-gen-gogo/testdata test

bench:
	(cd test/mixbench && go build .)
	(cd test/mixbench && ./mixbench)

