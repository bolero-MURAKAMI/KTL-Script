[eval exp='Scripts.execStorage("ktl/Sources.tjs");']
[return cond='Sources.guard("ktl/ks/ktl.ks")']

[iscript]
Scripts.execStorage("ktl/ktl.tjs");
[endscript]

;
;	MACRO: ktl_set_opt = KTLオプションの設定
;	ATTRIBUTES:
;		REQUIRED: key = キー
;		OPTIONAL: value = 値
;		OPTIONAL: once = 上書きしないか
;		OPTIONAL: cond = 条件式
;
[macro name="ktl_set_opt"]
[eval exp="ktlSetOpt(Scripts.eval(mp.key), Scripts.eval(mp.value), mp.once !== void ? Scripts.eval(mp.once) : void);" cond=%cond|"true"]
[endmacro]

[return]
