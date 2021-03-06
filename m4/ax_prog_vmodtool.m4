# =============================================================================
# https://github.com/NYTimes/libvmod-queryfilter/m4/ax_prog_vmodtool.m4
# =============================================================================
#
#
# SYNOPSIS
#  AX_PROG_VMODTOOL([ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND])
#
# DESCRIPTION
#   Set the VMODTOOL output variable to the absolute path to the Varnish Cache
#   VMOD tool and execute ACTION-IF-FOUND, on success. On failure, invoke
#   ACTION-IF-NOT-FOUND.
#
#  Declares the following precious variables:
#   * VMODTOOL - path to the vmod.py utility script used to generate certain
#                auxiliary files (typically named vcc_if.c and vcc_if.h)
#
# LICENSE
#
#   Copyright 2014-2016 The New York Times Company
#   
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#   
#       http://www.apache.org/licenses/LICENSE-2.0
#   
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# =============================================================================

# serial 1

# AX_PROG_VMODTOOL([ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND])
# ---------------------------------------------------------------
AC_DEFUN([AX_PROG_VMODTOOL],[
    AC_ARG_VAR([VMODTOOL], [Path to varnish vmod tool])

    # Check for vmodtool.py (varnish 4.x):
    vmodtool_path=[$VARNISHSRC/lib/libvcc/vmodtool.py]
    AC_CHECK_FILE([$vmodtool_path],[
        AC_SUBST([VMODTOOL],[$vmodtool_path])
        AC_SUBST([VARNISH_API_MAJOR],[4])
        $1
    ],[
        # Check for vmod.py (varnish 3.x):
        vmod_py_path=[$VARNISHSRC/lib/libvmod_std/vmod.py]
        AC_CHECK_FILE([$vmod_py_path],[
            AC_SUBST([VMODTOOL],[$vmod_py_path])
            AC_SUBST([VARNISH_API_MAJOR],[3])
            $1
        ],[
            $2
        ])
    ])
])



