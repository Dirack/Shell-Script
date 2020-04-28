#!/bin/bash
#
# Dockerfile
# 
# Objetivo: Deploy da biblioteca Shellinclude.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0
# 
# Programador: Rodolfo A C Neves (Dirack) 26/03/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

# Ubuntu 18.04.4 com dependências básicas configuradas
FROM dirack/ubuntuenv18.04.4:2.0

# Versão da Shellinclude
ENV VERSION="Shellinclude-v1.3.0"

# define o mantenedor da imagem
LABEL maintainer="Rodolfo Dirack"
LABEL email="rodolfo_profissional@hotmail.com"
LABEL site="https://dirack.github.io"

ADD "/" "/$VERSION"
ENV PATH="/$VERSION:$PATH"
RUN chmod 777 "/$VERSION" && echo 'PATH="/$VERSION:$PATH"' >> $HOME/.bashrc
