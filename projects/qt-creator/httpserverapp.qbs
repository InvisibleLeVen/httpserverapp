import qbs

Project {
    DynamicLibrary {
        name: "httpserverapp"

        Depends { name: "cpp" }
        cpp.cxxLanguageVersion: "c++14"

        cpp.defines: qbs.buildVariant == "debug" ? ["DEBUG"] : base

        cpp.dynamicLibraries: ["gnutls"]

        Properties {
            condition: qbs.targetOS.contains("linux")
            cpp.defines: outer.concat(["POSIX"])
            cpp.dynamicLibraries: outer.concat(["dl", "pthread"])
        }
        Properties {
            condition: qbs.targetOS.contains("windows")
            cpp.defines: outer.concat(["WIN32", "NOMINMAX"])
        }

        files: [
            "../../src/Init.cpp",
            "../../src/Init.h",
            "../../src/application/Test.cpp",
            "../../src/application/Test.h",
            "../../src/server/protocol/ClientHttp1.cpp",
            "../../src/server/protocol/ClientHttp1.h",
            "../../src/server/protocol/ClientHttp2.cpp",
            "../../src/server/protocol/ClientHttp2.h",
            "../../src/server/protocol/ClientProtocol.cpp",
            "../../src/server/protocol/ClientProtocol.h",
            "../../src/server/protocol/WebSocket.cpp",
            "../../src/server/protocol/WebSocket.h",
            "../../src/utils/Event.cpp",
            "../../src/utils/Event.h",
            "../../src/transfer/FileIncoming.cpp",
            "../../src/transfer/FileIncoming.h",
            "../../src/transfer/http2/HPack.cpp",
            "../../src/transfer/http2/HPack.h",
            "../../src/transfer/http2/Http2.cpp",
            "../../src/transfer/http2/Http2.h",
            "../../src/transfer/HttpStatusCode.h",
            "../../src/Main.cpp",
            "../../src/Main.h",
            "../../src/server/Request.cpp",
            "../../src/server/Request.h",
            "../../src/server/Response.cpp",
            "../../src/server/Response.h",
            "../../src/transfer/ProtocolVariant.h",
            "../../src/transfer/AppRequest.h",
            "../../src/transfer/AppResponse.h",
            "../../src/socket/Socket.cpp",
            "../../src/socket/Socket.h",
            "../../src/socket/Adapter.cpp",
            "../../src/socket/Adapter.h",
            "../../src/socket/AdapterDefault.cpp",
            "../../src/socket/AdapterDefault.h",
            "../../src/socket/AdapterTls.cpp",
            "../../src/socket/AdapterTls.h",
            "../../src/system/System.cpp",
            "../../src/system/System.h",
            "../../src/utils/Utils.cpp",
            "../../src/utils/Utils.h",
        ]
    }
}
