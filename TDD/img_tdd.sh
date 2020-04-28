#!/bin/bash
#
# img_tdd.sh (Shell Script)
# 
# Objetivo: Testes do programa img.
# 
# Site: https://dirack.github.io
# 
# Versão 1.3.0
# 
# Programador: Rodolfo A C Neves (Dirack) 28/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

source $(dirname $0)/tdd_lib.sh

TMP=$(mktemp -u testeimgXXXX)
TMP_VPL="${TMP}.vpl"
TMP_JPEG="${TMP}.jpeg"
TMP_DIR=".${TMP}"


clean(){
	[ -f "$TMP_VPL" ] && {
		rm "$TMP_VPL"
	}

	[ -f "$TMP_JPEG" ] && {
		rm "$TMP_JPEG"
	}

	[ -d "$TMP_DIR" ] && {
		rm -r "$TMP_DIR"
	}
}

trap clean exit err

# Testar a instalação do pacote Madagascar gerando imagens vpl
sfspike n1=1000 k1=300 | sfbandpass fhi=2 phase=y | sfwiggle clip=0.02 title="Welcome to Madagascar" > "$TMP_VPL"

mkdir "./$TMP_DIR"
cp "$TMP_VPL" "./$TMP_DIR"

img -i
error "$?" "0" "1" "Teste img -i"

img -r 1>/dev/null
error "$?" "0" "2" "Teste img -r"

img -i "./$TMP_DIR"
error "$?" "0" "3" "Teste img -i <dir>"

img -r "./$TMP_DIR" 1>/dev/null
error "$?" "0" "4" "Teste img -r <dir>" 
