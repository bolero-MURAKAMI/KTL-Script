;==============================================================================
; Copyright (c) 2010-2016 Bolero MURAKAMI
; https://github.com/bolero-MURAKAMI/KTL-Script
;
; Distributed under the Boost Software License, Version 1.0. (See accompanying
; file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
;==============================================================================
[eval exp='Scripts.execStorage("ktl/Sources.tjs");']
[return cond='Sources.guard("ktl/ks/Sources.ks")']

[iscript]
Scripts.execStorage("ktl/Sources.tjs");
Sources.include("ktl/Utility.tjs");
[endscript]

;
;	MACRO: set_once = ソースのonce指定
;	ATTRIBUTES:
;		REQUIRED: storage = ストレージ
;		OPTIONAL: v = フラグ指定
;		OPTIONAL: cond = 条件式
;
[macro name="set_once"]
[eval exp="Sources.setOnce(mp.storage, evalOr(mp.v));" cond=%cond|"true"]
[endmacro]

;
;	MACRO: set_included = ソースのincluded指定
;	ATTRIBUTES:
;		REQUIRED: storage = ストレージ
;		OPTIONAL: v = フラグ指定
;		OPTIONAL: cond = 条件式
;
[macro name="set_included"]
[eval exp="Sources.setIncluded(mp.storage, evalOr(mp.v));" cond=%cond|"true"]
[endmacro]

;
;	MACRO: guard = ソースのインクルードガード
;	ATTRIBUTES:
;		REQUIRED: storage = ストレージ
;		OPTIONAL: cond = 条件式
;
[macro name="guard"]
[if exp=%cond|"true"]
	[return cond="Sources.guard(mp.storage)"]
[endif]
[endmacro]

;
;	MACRO: include = ソースのインクルード
;	ATTRIBUTES:
;		REQUIRED: storage = ストレージ
;		OPTIONAL: once = 呼出側でのonce指定
;		OPTIONAL: cond = 条件式
;
[macro name="include"]
[eval exp="Sources.include(mp.storage, evalOr(mp.once));" cond=%cond|"true"]
[endmacro]

[return]
