#!/bin/bash
#
# ambiente_tdd.sh (Shell Script)
# 
# Objetivo: Teste do ambiente de desenvolvimento da Shellinclude.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0
# 
# Programador: Rodolfo A C Neves (Dirack) 02/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

source $(dirname $0)/tdd_lib.sh

error "$(echo $PATH | grep -q /Shellinclude && echo $?)" "0" "1" "Verificar se Shellinclude faz parte do PATH"

LISTA="backup cabecalho comp getscons img jonas lembrete lipsum madagainstall mensagemAjuda.sh mensagemErro.sh morse suinstall"

PASTA="$1"

echo -e "\tVerificar se os programas estão instalados corretamente"
verificaInstalacao "$LISTA" "$PASTA"
error "$?" "0" "2" ""
