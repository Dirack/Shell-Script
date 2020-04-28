#!/bin/bash
#
# madagainstall_tdd.sh (Shell Script)
# 
# Objetivo: Testes do programa madagainstall.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0
# 
# Programador: Rodolfo A C Neves (Dirack) 28/04/2020
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

>SConstruct cat<<EOF
#
# Setting up
#
from rsf.proj import *

#
# Make filter.rsf
#
Flow('filter',None,'spike n1=1000 k1=300 | bandpass fhi=2 phase=y')

#
# Make filter.vpl
#
Result('filter','wiggle clip=0.02 title="Welcome to Madagascar"')

End()
EOF

scons
error "$?" "0" "3" ""

sfspike n1=1000 k1=300 | sfbandpass fhi=2 phase=y | sfin 1>/dev/null
error "$?" "0" "4" ""
