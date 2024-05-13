Protocol Buffers for Go with Gadgets

GoGoProtobuf http://github.com/gogo/protobuf extends
GoProtobuf http://github.com/golang/protobuf

Copyright (c) 2013, The GoGo Authors. All rights reserved.


# Go support for Protocol Buffers

Google's data interchange format.
Copyright 2010 The Go Authors.
https://github.com/golang/protobuf

This package and the code it generates requires at least Go 1.6.

This software implements Go bindings for protocol buffers.  For
information about protocol buffers themselves, see
	https://developers.google.com/protocol-buffers/

## Original instruction document https://github.com/golang/protobuf/blob/master/README.md

## gogoprotobuf/protoc-gen-gogo/generator/generator.go
## Purpose: To improve efficiency and replace use reflect.TypeOf() gets the struct name
### 目的：为提升效率，代替使用反射reflect.TypeOf()获取结构体名称
### New methods
	MsgName() string 	// struct name

	MsgId64() uint64	// xxhash.Sum64(MsgName)

	MsgId32() uint32	// murmur3.Sum32(MsgName)
### Install
	make install

### Use 
	protoc ./pbmsg/*.proto --gofast_out=./outdir
	protoc ./pbmsg/*.proto --gogofaster_out=./outdir