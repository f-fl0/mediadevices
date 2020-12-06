// +build !dynamic

package openh264

//#cgo CFLAGS: -I${SRCDIR}/include
//#cgo darwin,amd64 LDFLAGS: ${SRCDIR}/lib/libopenh264_darwin_x64.a
import "C"
