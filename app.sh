#!/usr/bin/env bash

# plugins bash moderen
. lib/moduler.sh
# depencies

# pesan
<<EOF

script ini di rancang oleh Bayu Riski A.M
dilarang merubah source ini sebelum ijin oleh author nya

grup    : t.me/BashShell
oficial : t.me/SpeedrunOFC

# license

MIT License

Copyright (c) 2022 Speedrun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

EOF

Bash.import: text_display/colorama text_display/IO.ECHO
Bash.import: util/io.class util/IO.FUNC
Bash.import: util/operator util/IO.SYSTEM.var

# jangan lupa subscribe pejuang kentang ya abang abang ganteng :)
# saya akan menjelaaskan setiap fungsi dan logika di syntax syntax nya [subscribe pejuang kentang ya :)]

@require modules/pack.sh; # mengimport source pack.sh ke script

def: txt.hex:(){
	global: string = "$@"; # berfungsi menamai sebuah argument
	let start=0; # perulangan di mulai dari zero (nol)
	let end=${#string};  # perulangan berakhir sesuai panjang variable string
	unset value_str; # unser variable value_str

	# system loop nya
	for ((i = start; i <= end; i++)); do
		# mungkin kalian sudah tidak asing dengan += yg fungsi nya menyimpan suatu karakter di dalam variable tanpa menimpa nya
		# ingat format hanya berlaku pada command printf
		# %X akan mengubah karakter di depan menjadi kode hex
		declare value_str+=$(printf "x%X" "'${string:i:1}")
	done; # penutup statement loop for
		echo "$value_str"|sed -e 's;x;%;g'|sed 's;%0;'';g'; # parse dan cetak
}

def: main(){
	clear
	var random : $(shuf -i 1-4 -n 1); # -i = random, -n = kepala nya => akan membuat nomer random sampai 4 dengan satu kepala / (karakter)
	var::array: eyes = { o - x + }; # array
	declare warna=(${cy} ${ij} ${me} ${m}); # array warna
	var one : $(shuf -i 0-4 -n 1)
	var two : $(shuf -i 1-4 -n 1)
	echo -e "${ku}              a8888b.${warna[$one]}         ┌─┐┌┐ ┌─┐┬ ┬┌─┐┌─┐┌─┐┌┬┐┌─┐${warna[$two]}  ╦ ╦╔╦╗╔╦╗╦"
	echo -e "${ku}             d888888b.${warna[$one]}        │ │├┴┐├┤ │ │└─┐│  ├─┤ │ ├┤ ${warna[$two]}  ╠═╣ ║ ║║║║"
	echo -e "${ku}             8P'YP'Y88${warna[$one]}        └─┘└─┘└  └─┘└─┘└─┘┴ ┴ ┴ └─┘${warna[$two]}  ╩ ╩ ╩ ╩ ╩╩═╝"
	echo -e "${ku}             8${me}|${eyes[$random]}|${cy}|o|${ku}88${ij}                    URL${cy}                ENCODE"
	echo -e "${ku}             8'    .88"
	echo -e "${ku}             8'._.' Y8.'${m}       -----------------------------------------"
	echo -e "${ku}            dn       '8b.'${ij}     > ${me}Author  : Bayu riski A.M${ij}              <"
	echo -e "${ku}          .dP   .     Y8b.${me}     > ${cy}Youtube : pejuang kentang${me}             <"
	echo -e "${ku}         d8:'   '   '::88b.'${cy}   > ${ij}github  : github.com/Bayu12345677${cy}     <"
	echo -e "${ku}        d8'           'Y88b${bi}    >        ${ku}[${hi}encode html source${ku}]${bi}           <"
	echo -e "${ku}       :8P     '       :888${m}    -----------------------------------------"
	echo -e "${ku}        8a.    :      _a88P"
	echo -e "${ku}        8a.    :      _a88P"
	echo -e "${ku}      ._/'Yaa_ :    .| 88P|"
	echo -e "${ku} jgs  \    YP'      '| 8P  '."
	echo -e "${ku} a:f  /     |._____.d|    .'"
	echo -e "${ku}      '--..__)888888P'._.''"
	echo -e "${m}==================================================================================${st}"
	echo
	Tulis.strN "${ij}> ${bg_cy}encode${st}${hi} \thtml source"
	Tulis.strN "${m}> ${bg_me}type${st}${hi}   \tencrypt url"; echo
	Tulis.str "${ku}[${hi}#${ku}]${ij}(${me}Your${ku}-${me}file${ij})${un}~${cy}>${st} "; read emot
	echo
	# ketik saja man test di situ ada penjelasan nya dan logika nya
	if (test -z "$emot"); then
		Tulis.strN "${bi}>${pu} input not found\n"
	fi
	Tulis.str "${ij}<${ku}Your-Name${ij}> ${st}"; read nama
	# jika input nama bernilai zero maka akan menggantikan nya dengan value di kanan nya
	var kosong : ${nama:-human}; echo
	Tulis.strN "${bi}> ${hi}searching your files.."; if [[ ! -f "$emot" ]]; then Tulis.strN "\n<note> [File Not Found]\n"; exit 3; fi
	Tulis.strN "${cy}> ${me}<${ij}encode${me}>  ${ku}process.."
	echo
	
	if [[ -f "enc.sh" ]]; then
		var name : "enc.html"
	else
		var name : "enc.html"
	fi

	# menyusun source code hasil encode agar bisa di eksekusi
	var html : "<html>\n  <head>\n  \n</head>\n    <body>\n   <script type=\"text/javascript\">\n<!-- HTML OBFUSCATE BY $nama -->\n<!--\ndocument.write(unescape('$(txt.hex: $(cat $emot))'));\n// -->\n</script>\n</body>\n</html>"
	# menyimpan isi variable html ke file
	if (echo -e "$html" > $name); then
		Tulis.strN "${m}~${me}>${pu} File saved in $name"; echo
	fi
	
	
}; (clear); {
	let l=0
	for x in $(shuf -i 1-3); do
		for ((y = 0; y <= 5; y++)); do
			let l++

			if ((l == 1)); then
				var sss : "$cy"
			elif ((l == 2)); then
				var sss : "$ku"
			elif ((l == 3)); then
				var sss : "$me"
			elif ((l == 4)); then
				let l=0
				var sss : "$ij"
			fi
			sleep 01
			Tulis.str "\r${ij}$ ${sss}Subscribe pejuang kentang :)"
		done;
	done;  xdg-open https://www.youtube.com/channel/UCtu-GcxKL8kJBXpR1wfMgWg; call:- main "->" start
}