[eval exp='Scripts.execStorage("ktl/Sources.tjs");']
[return cond='Sources.guard("ktl/ks/Scripts.ks")']

[call storage="ktl/ks/ktl.ks"]
[call storage="ktl/ks/Sources.ks"]
[call storage="ktl/ks/Outputs.ks"]
[include storage="ktl/Utility.tjs"]

;
;	MACRO: import = KAGシナリオのインポート
;	ATTRIBUTES:
;		REQUIRED: storage = ストレージ
;		OPTIONAL: once = 呼出側でのonce指定
;		OPTIONAL: cond = 条件式
;
[macro name="import"]
[if exp=%cond|"true"]
	[if exp='Sources.isIncludable(mp.storage, evalOr(mp.once))']
		[kons n="import"]
		[komv n="storage" v=%storage ev="false"]
		[call *]
		[set_included storage=%storage]
		[koes]
	[endif]
[endif]
[endmacro]


[return]
