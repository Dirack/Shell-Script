#!/bin/bash
#
# getscons_tdd.sh (Shell Script)
# 
# Objetivo: Testes do programa madagainstall.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0
# 
# Programador: Rodolfo A C Neves (Dirack) 29/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

source $(dirname $0)/tdd_lib.sh

clean(){
	[ -f "./SConstruct" ] && {
		rm "./SConstruct"
	}
}

trap clean exit err

# Verificar a instalação do Madagascar

LINK="http://www.ahay.org/RSF/book/rsf/rsf/test.html"
getscons -l "$LINK"
scons
error "$?" "0" "3" "Teste getscons -l <url>"
