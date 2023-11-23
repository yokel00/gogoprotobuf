module github.com/gogo/protobuf

go 1.20

require (
	github.com/cespare/xxhash v1.1.0
	github.com/spaolacci/murmur3 v1.1.0
)

// replace github.com/gogo/protobuf => ../gogoprotobuf

replace github.com/gogo/protobuf v1.3.2 => github.com/yokel00/gogoprotobuf/protoc-gen-gofast v1.0.6
