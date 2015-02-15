version = ""
dev = no
version = prompt("Version") if version is "" and not dev
sub = if dev then "" else "cdn."
version = "master" if version is ""
s = document.createElement "script"
s.setAttribute "src",
	"//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/require.js"
s.setAttribute "data-main",
	"//#{sub}rawgit.com/CodeLenny/CustomInput/#{version}/build/example/truefalse/TrueFalse.js"
document.documentElement.childNodes[0].appendChild(s)