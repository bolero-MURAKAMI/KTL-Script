;==============================================================================
; Copyright (c) 2010-2016 Bolero MURAKAMI
; https://github.com/bolero-MURAKAMI/KTL-Script
;
; Distributed under the Boost Software License, Version 1.0. (See accompanying
; file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
;==============================================================================
[eval exp='Scripts.execStorage("ktl/Sources.tjs");']
[return cond='Sources.guard("ktl/ks/Outputs.ks")']

[iscript]
Sources.include("ktl/ktl.tjs");
Sources.include("ktl/Utility.tjs");
Sources.include("ktl/Outputs.tjs");

ktlSetOpt(["ktl", "ks", "outputs", "indents"], []);
ktlSetOpt(["ktl", "ks", "outputs", "sections"], []);
[endscript]
;
;	MACRO: kout = 直メッセージ出力（インデント無し）
;	ATTRIBUTES:
;		OPTIONAL: m = メッセージ
;		OPTIONAL: cond = 条件式
;
[macro name="kout"]
[eval exp="kout(mp.m)" cond=%cond|"true"]
[endmacro]

;
;	MACRO: koni = KTL出力をインデント
;	ATTRIBUTES:
;		OPTIONAL: t = タブ文字列
;		OPTIONAL: cond = 条件式
;
[macro name="koni"]
[eval exp="ktlGetOpt(['ktl', 'ks', 'outputs', 'indents']).push(koni(mp.t));" cond=%cond|"true"]
[endmacro]

;
;	MACRO: koei = KTL出力をアンインデント
;	ATTRIBUTES:
;		OPTIONAL: cond = 条件式
;
[macro name="koei"]
[eval exp="koinv(ktlGetOpt(['ktl', 'ks', 'outputs', 'indents']).pop());" cond=%cond|"true"]
[endmacro]

;
;	MACRO: kons = KTL出力のセクション開始
;	ATTRIBUTES:
;		OPTIONAL: n = 名前文字列
;		OPTIONAL: t = タブ文字列
;		OPTIONAL: o = 出力関数（を返す評価式）
;		OPTIONAL: cond = 条件式
;
[macro name="kons"]
[eval exp="ktlGetOpt(['ktl', 'ks', 'outputs', 'sections']).push(kons(mp.n, mp.t, evalOr(mp.o)));" cond=%cond|"true"]
[endmacro]

;
;	MACRO: koes = KTL出力のセクション終了
;	ATTRIBUTES:
;		OPTIONAL: cond = 条件式
;
[macro name="koes"]
[eval exp="koinv(ktlGetOpt(['ktl', 'ks', 'outputs', 'sections']).pop());" cond=%cond|"true"]
[endmacro]

;
;	MACRO: kom = 直メッセージ出力
;	ATTRIBUTES:
;		OPTIONAL: m = メッセージ
;		OPTIONAL: cond = 条件式
;
[macro name="kom"]
[eval exp="kom(mp.m)" cond=%cond|"true"]
[endmacro]

;
;	MACRO: komc = コメントメッセージ出力
;	ATTRIBUTES:
;		OPTIONAL: m = メッセージ
;		OPTIONAL: cond = 条件式
;
[macro name="komc"]
[eval exp="komc(mp.m)" cond=%cond|"true"]
[endmacro]

;
;	MACRO: komv = 値セクションメッセージ出力
;	ATTRIBUTES:
;		OPTIONAL: n = 名前文字列
;		OPTIONAL: v = コンテンツ評価式、または文字列
;		OPTIONAL: ev = コンテンツが評価式か文字列か
;		OPTIONAL: cond = 条件式
;
[macro name="komv"]
[eval exp="komv(mp.n, evalOr(mp.ev, true) ? evalOr(mp.v) : mp.v)" cond=%cond|"true"]
[endmacro]

[return]
