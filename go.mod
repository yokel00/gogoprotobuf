module github.com/yokel00/gogoprotobuf

go 1.15

//replace github.com/gogo/protobuf => github.com/yokel00/gogoprotobuf
replace github.com/gogo/protobuf => ./

require (
	github.com/cespare/xxhash v1.1.0
	github.com/gogo/protobuf v0.0.0-00010101000000-000000000000
	github.com/spaolacci/murmur3 v1.1.0
)
