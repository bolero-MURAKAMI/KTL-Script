;==============================================================================
; Copyright (c) 2010-2016 Bolero MURAKAMI
; https://github.com/bolero-MURAKAMI/KTL-Script
;
; Distributed under the Boost Software License, Version 1.0. (See accompanying
; file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
;==============================================================================
[call storage="ktl/ks/Scripts.ks"]
[guard storage="ktl/ks/Sanbox.ks"]

[iscript]
Scripts.execStorage("ktl/ktl.tjs");
[endscript]

;
;	MACRO: cancel_skip = スキップをキャンセル
;	ATTRIBUTES:
;		OPTIONAL: cond = 条件式
;
[macro name="cancel_skip"]
[if exp=%cond|"true"]
	[eval exp="ktlSetOpt(['ktl', 'ks', 'sanbox', 'skip_mode'], kag.skipMode);"]
	[cancelskip]
[endif]
[endmacro]

;
;	MACRO: restart_skip = スキップを再会
;	ATTRIBUTES:
;		OPTIONAL: cond = 条件式
;
[macro name="restart_skip"]
[if exp=%cond|"true"]
	[eval exp="kag.skipToClick() if ktlGetOpt(['ktl', 'ks', 'sanbox', 'skip_mode']) == 1;"]
	[eval exp="kag.skipToPage() if ktlGetOpt(['ktl', 'ks', 'sanbox', 'skip_mode']) == 2;"]
	[eval exp="kag.skipToStop() if ktlGetOpt(['ktl', 'ks', 'sanbox', 'skip_mode']) == 3;"]
	[eval exp="kag.skipToStop2() if ktlGetOpt(['ktl', 'ks', 'sanbox', 'skip_mode']) == 4;"]
[endif]
[endmacro]

;
;	MACRO: restart_skip_repress = キー入力によるスキップを再会
;	ATTRIBUTES:
;		OPTIONAL: cond = 条件式
;
[macro name="restart_skip_repress"]
[if exp=%cond|"true"]
	[eval exp="kag.skipKeyRepressed = true if ktlGetOpt(['ktl', 'ks', 'sanbox', 'skip_mode']) == 4;"]
[endif]
[endmacro]
