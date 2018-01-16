##
 # Copyright (c) 2013
 # Massimo Cetra <mcetra at gmail dot com>
 #
 # Permission to use, copy, modify, and distribute this software for any
 # purpose with or without fee is hereby granted, provided that the above
 # copyright notice and this permission notice appear in all copies.
 #
 # THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 # WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 # MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 # ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 # WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 ##

SET(_SOURCES
	crypto_aead/chacha20poly1305/sodium/aead_chacha20poly1305.c 
	crypto_aead/xchacha20poly1305/sodium/aead_xchacha20poly1305.c 
	crypto_auth/crypto_auth.c 
	crypto_auth/hmacsha256/auth_hmacsha256.c 
	crypto_auth/hmacsha512/auth_hmacsha512.c 
	crypto_auth/hmacsha512256/auth_hmacsha512256.c 
	crypto_box/crypto_box.c 
	crypto_box/crypto_box_easy.c 
	crypto_box/crypto_box_seal.c 
	crypto_box/curve25519xsalsa20poly1305/box_curve25519xsalsa20poly1305.c 
	crypto_core/ed25519/ref10/ed25519_ref10.c 
	crypto_core/hchacha20/core_hchacha20.c 
	crypto_core/hsalsa20/ref2/core_hsalsa20_ref2.c 
	crypto_core/hsalsa20/core_hsalsa20.c 
	crypto_core/salsa/ref/core_salsa_ref.c 
	crypto_generichash/crypto_generichash.c 
	crypto_generichash/blake2b/generichash_blake2.c 
	crypto_generichash/blake2b/ref/blake2.h 
	crypto_generichash/blake2b/ref/blake2b-compress-ref.c 
	crypto_generichash/blake2b/ref/blake2b-load-sse2.h 
	crypto_generichash/blake2b/ref/blake2b-load-sse41.h 
	crypto_generichash/blake2b/ref/blake2b-load-avx2.h 
	crypto_generichash/blake2b/ref/blake2b-ref.c 
	crypto_generichash/blake2b/ref/generichash_blake2b.c 
	crypto_hash/crypto_hash.c 
	crypto_hash/sha256/hash_sha256.c 
	crypto_hash/sha256/cp/hash_sha256_cp.c 
	crypto_hash/sha512/hash_sha512.c 
	crypto_hash/sha512/cp/hash_sha512_cp.c 
	crypto_kdf/blake2b/kdf_blake2b.c 
	crypto_kdf/crypto_kdf.c 
	crypto_kx/crypto_kx.c 
	crypto_onetimeauth/crypto_onetimeauth.c 
	crypto_onetimeauth/poly1305/onetimeauth_poly1305.c 
	crypto_onetimeauth/poly1305/onetimeauth_poly1305.h 
	crypto_onetimeauth/poly1305/donna/poly1305_donna.h 
	crypto_onetimeauth/poly1305/donna/poly1305_donna32.h 
	crypto_onetimeauth/poly1305/donna/poly1305_donna64.h 
	crypto_onetimeauth/poly1305/donna/poly1305_donna.c 
	crypto_pwhash/argon2/argon2-core.c 
	crypto_pwhash/argon2/argon2-core.h 
	crypto_pwhash/argon2/argon2-encoding.c 
	crypto_pwhash/argon2/argon2-encoding.h 
	crypto_pwhash/argon2/argon2-fill-block-ref.c 
	crypto_pwhash/argon2/argon2.c 
	crypto_pwhash/argon2/argon2.h 
	crypto_pwhash/argon2/blake2b-long.c 
	crypto_pwhash/argon2/blake2b-long.h 
	crypto_pwhash/argon2/blamka-round-ref.h 
	crypto_pwhash/argon2/pwhash_argon2i.c 
	crypto_pwhash/argon2/pwhash_argon2id.c 
	crypto_pwhash/crypto_pwhash.c 
	crypto_scalarmult/crypto_scalarmult.c 
	crypto_scalarmult/curve25519/ref10/x25519_ref10.c 
	crypto_scalarmult/curve25519/ref10/x25519_ref10.h 
	crypto_scalarmult/curve25519/scalarmult_curve25519.c 
	crypto_scalarmult/curve25519/scalarmult_curve25519.h 
	crypto_secretbox/crypto_secretbox.c 
	crypto_secretbox/crypto_secretbox_easy.c 
	crypto_secretbox/xsalsa20poly1305/secretbox_xsalsa20poly1305.c 
	crypto_secretstream/xchacha20poly1305/secretstream_xchacha20poly1305.c 
	crypto_shorthash/crypto_shorthash.c 
	crypto_shorthash/siphash24/shorthash_siphash24.c 
	crypto_shorthash/siphash24/ref/shorthash_siphash24_ref.c 
	crypto_shorthash/siphash24/ref/shorthash_siphash_ref.h 
	crypto_sign/crypto_sign.c 
	crypto_sign/ed25519/sign_ed25519.c 
	crypto_sign/ed25519/ref10/keypair.c 
	crypto_sign/ed25519/ref10/open.c 
	crypto_sign/ed25519/ref10/sign.c 
	crypto_sign/ed25519/ref10/sign_ed25519_ref10.h 
	crypto_stream/chacha20/stream_chacha20.c 
	crypto_stream/chacha20/stream_chacha20.h 
	crypto_stream/chacha20/ref/chacha20_ref.h 
	crypto_stream/chacha20/ref/chacha20_ref.c 
	crypto_stream/crypto_stream.c 
	crypto_stream/salsa20/stream_salsa20.c 
	crypto_stream/salsa20/stream_salsa20.h 
	crypto_stream/xsalsa20/stream_xsalsa20.c 
	crypto_verify/sodium/verify.c 
	include/sodium/private/common.h 
	include/sodium/private/ed25519_ref10.h 
	include/sodium/private/implementations.h 
	include/sodium/private/mutex.h 
	include/sodium/private/sse2_64_32.h 
	randombytes/randombytes.c 
	sodium/codecs.c 
	sodium/core.c 
	sodium/runtime.c 
	sodium/utils.c 
	sodium/version.c
)

IF (NOT HAVE_TI_MODE_V )
    MESSAGE(STATUS "TI_MODE disabled")
    SET(_SOURCES
	${_SOURCES}
	crypto_core/ed25519/ref10/fe_25_5/base.h 
	crypto_core/ed25519/ref10/fe_25_5/base2.h 
	crypto_core/ed25519/ref10/fe_25_5/constants.h 
	crypto_core/ed25519/ref10/fe_25_5/fe.h 
	include/sodium/private/ed25519_ref10_fe_25_5.h
    )
ELSE (NOT HAVE_TI_MODE_V)
    MESSAGE(STATUS "TI_MODE enabled")
    SET(_SOURCES
	${_SOURCES}
	crypto_core/ed25519/ref10/fe_51/base.h 
	crypto_core/ed25519/ref10/fe_51/base2.h 
	crypto_core/ed25519/ref10/fe_51/constants.h 
	crypto_core/ed25519/ref10/fe_51/fe.h 
	include/sodium/private/ed25519_ref10_fe_51.h
    )
ENDIF (NOT HAVE_TI_MODE_V)


SET(_SOURCES
	${_SOURCES}
	crypto_stream/salsa20/ref/salsa20_ref.c 
	crypto_stream/salsa20/ref/salsa20_ref.h

	randombytes/sysrandom/randombytes_sysrandom.c
    )


# *****************************************************************

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/include/sodium
    ${CMAKE_CURRENT_BINARY_DIR}/include/sodium
)

# *****************************************************************

# add_library (
#     libsodium
# 	SHARED
# 	    ${_SOURCES}
# )

# SET_TARGET_PROPERTIES(
#     libsodium
#     PROPERTIES
# 	PREFIX ""
# 	PROJECT_LABEL "libsodium"
# 	INSTALL_RPATH "${LIBSODIUM_LIB_DIR}"
#         LINK_FLAGS "${_LINKER_OPTIONS}"
#         VERSION   "${SODIUM_LIBRARY_VERSION_MAJOR}.${SODIUM_LIBRARY_VERSION_MINOR}"
#         SOVERSION "${SODIUM_LIBRARY_VERSION_MAJOR}"
# )

# INSTALL(
#     TARGETS
# 	libsodium
#     PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
#     LIBRARY DESTINATION ${LIBSODIUM_LIB_DIR}
#     ARCHIVE DESTINATION ${LIBSODIUM_LIB_DIR}
# )

# *****************************************************************

add_library (
    libsodium-static
	STATIC
	    ${_SOURCES}
)

SET_TARGET_PROPERTIES(
    libsodium-static
    PROPERTIES
	OUTPUT_NAME libsodium
        LINK_FLAGS "${_LINKER_OPTIONS}"
)

INSTALL(
    TARGETS
	libsodium-static
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
    LIBRARY DESTINATION ${LIBSODIUM_LIB_DIR}
    ARCHIVE DESTINATION ${LIBSODIUM_LIB_DIR}
)


ADD_SUBDIRECTORY(include)
