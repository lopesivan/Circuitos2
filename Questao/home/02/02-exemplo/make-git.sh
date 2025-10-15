#! /usr/bin/sh

# Script para gerar arquivos AutoHotkey para comandos Git
# Substitui ___PATH___ pelo diretório atual (pwd)

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para logging
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Obtém o diretório atual
CURRENT_PATH=$(pwd)
log_info "Diretório atual: $CURRENT_PATH"

# Função para criar git-add.ahk
create_git_add() {
    local file="git-add.ahk"
    log_info "Criando $file..."

    cat >"$file" <<EOF
; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
;a Envia o comando + Enter
ControlSend,, git add .{Enter}, %MYLOCAL%
EOF

    log_success "$file criado"
}

# Função para criar git-init.ahk
create_git_init() {
    local file="git-init.ahk"
    log_info "Criando $file..."

    cat >"$file" <<EOF
; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
;a Envia o comando + Enter
ControlSend,, git init{Enter}, %MYLOCAL%
EOF

    log_success "$file criado"
}

# Função para criar git-clean.ahk
create_git_clean() {
    local file="git-clean.ahk"
    log_info "Criando $file..."

    cat >"$file" <<EOF
; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
;a Envia o comando + Enter
ControlSend,, git clean -dfx{Enter}, %MYLOCAL%
EOF

    log_success "$file criado"
}

# Função para criar git-commit.ahk
create_git_commit() {
    local file="git-commit.ahk"
    log_info "Criando $file..."

    cat >"$file" <<EOF
; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
;a Envia o comando + Enter
ControlSend,, git commit -m wip{Enter}, %MYLOCAL%
EOF

    log_success "$file criado"
}

# Função para criar git-undo.ahk
create_git_undo() {
    local file="git-undo.ahk"
    log_info "Criando $file..."

    cat >"$file" <<EOF
; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
; Limpa arquivos não rastreados
ControlSend,, git clean -dfx{Enter}, %MYLOCAL%
; Aguarda um pouco
Sleep, 500
; Reseta mudanças no repositório
ControlSend,, git reset --hard{Enter}, %MYLOCAL%
EOF

    log_success "$file criado"
}

# Função para criar versão avançada com parâmetros
create_advanced_version() {
    local file="git-commit-msg.ahk"
    log_info "Criando versão avançada: $file (com mensagem customizável)..."

    cat >"$file" <<EOF
; Git Commit com mensagem customizável
; Uso: Execute o script e digite a mensagem quando solicitado

; Caminho para o msys.bat
msysBat := "C:\\Program Files\\Git\\git-bash.exe"

; Solicita mensagem do commit
InputBox, commitMsg, Git Commit, Digite a mensagem do commit:, , 400, 130
if ErrorLevel
    ExitApp

; Se mensagem vazia, usa "wip"
if (commitMsg = "")
    commitMsg := "wip"

; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:$CURRENT_PATH"

; Espera a janela aparecer
WinWait, %MYLOCAL%
Sleep, 1500

; Envia o comando com a mensagem
ControlSend,, git commit -m "%commitMsg%"{Enter}, %MYLOCAL%
EOF

    log_success "$file criado (versão com input de mensagem)"
}

# Função para criar script batch auxiliar
create_batch_generator() {
    local file="generate-git-ahk.bat"
    log_info "Criando versão Windows: $file..."

    cat >"$file" <<'EOF'
@echo off
rem Script Windows para gerar arquivos AutoHotkey para Git
setlocal

echo Gerando scripts AutoHotkey para Git...
set CURRENT_PATH=%CD%

rem Substitui barras por barras invertidas para AutoHotkey
set "CURRENT_PATH=%CURRENT_PATH:\=\\%"
set "CURRENT_PATH=%CURRENT_PATH:/=\\%"

echo Diretorio atual: %CURRENT_PATH%

rem Cria git-init.ahk
echo ; Caminho para o msys.bat > git-init.ahk
echo msysBat := "C:\\Program Files\\Git\\git-bash.exe" >> git-init.ahk
echo ; Executa o MSYS >> git-init.ahk
echo Run, %%msysBat%% >> git-init.ahk
echo MYLOCAL:="MINGW32:%CURRENT_PATH%" >> git-init.ahk
echo ; Espera a janela com titulo MINGW32:~ aparecer >> git-init.ahk
echo WinWait, %%MYLOCAL%% >> git-init.ahk
echo ; Da um tempinho extra pra garantir que o shell carregou >> git-init.ahk
echo Sleep, 1500 >> git-init.ahk
echo ;a Envia o comando + Enter >> git-init.ahk
echo ControlSend,, git init{Enter}, %%MYLOCAL%% >> git-init.ahk

rem Cria git-add.ahk
echo ; Caminho para o msys.bat > git-add.ahk
echo msysBat := "C:\\Program Files\\Git\\git-bash.exe" >> git-add.ahk
echo ; Executa o MSYS >> git-add.ahk
echo Run, %%msysBat%% >> git-add.ahk
echo MYLOCAL:="MINGW32:%CURRENT_PATH%" >> git-add.ahk
echo ; Espera a janela com titulo MINGW32:~ aparecer >> git-add.ahk
echo WinWait, %%MYLOCAL%% >> git-add.ahk
echo ; Da um tempinho extra pra garantir que o shell carregou >> git-add.ahk
echo Sleep, 1500 >> git-add.ahk
echo ;a Envia o comando + Enter >> git-add.ahk
echo ControlSend,, git add .{Enter}, %%MYLOCAL%% >> git-add.ahk

rem Cria git-clean.ahk
echo ; Caminho para o msys.bat > git-clean.ahk
echo msysBat := "C:\\Program Files\\Git\\git-bash.exe" >> git-clean.ahk
echo ; Executa o MSYS >> git-clean.ahk
echo Run, %%msysBat%% >> git-clean.ahk
echo MYLOCAL:="MINGW32:%CURRENT_PATH%" >> git-clean.ahk
echo ; Espera a janela com titulo MINGW32:~ aparecer >> git-clean.ahk
echo WinWait, %%MYLOCAL%% >> git-clean.ahk
echo ; Da um tempinho extra pra garantir que o shell carregou >> git-clean.ahk
echo Sleep, 1500 >> git-clean.ahk
echo ;a Envia o comando + Enter >> git-clean.ahk
echo ControlSend,, git clean -dfx{Enter}, %%MYLOCAL%% >> git-clean.ahk

rem Cria git-commit.ahk
echo ; Caminho para o msys.bat > git-commit.ahk
echo msysBat := "C:\\Program Files\\Git\\git-bash.exe" >> git-commit.ahk
echo ; Executa o MSYS >> git-commit.ahk
echo Run, %%msysBat%% >> git-commit.ahk
echo MYLOCAL:="MINGW32:%CURRENT_PATH%" >> git-commit.ahk
echo ; Espera a janela com titulo MINGW32:~ aparecer >> git-commit.ahk
echo WinWait, %%MYLOCAL%% >> git-commit.ahk
echo ; Da um tempinho extra pra garantir que o shell carregou >> git-commit.ahk
echo Sleep, 1500 >> git-commit.ahk
echo ;a Envia o comando + Enter >> git-commit.ahk
echo ControlSend,, git commit -m wip{Enter}, %%MYLOCAL%% >> git-commit.ahk

rem Cria git-undo.ahk
echo ; Caminho para o msys.bat > git-undo.ahk
echo msysBat := "C:\\Program Files\\Git\\git-bash.exe" >> git-undo.ahk
echo ; Executa o MSYS >> git-undo.ahk
echo Run, %%msysBat%% >> git-undo.ahk
echo MYLOCAL:="MINGW32:%CURRENT_PATH%" >> git-undo.ahk
echo ; Espera a janela com titulo MINGW32:~ aparecer >> git-undo.ahk
echo WinWait, %%MYLOCAL%% >> git-undo.ahk
echo ; Da um tempinho extra pra garantir que o shell carregou >> git-undo.ahk
echo Sleep, 1500 >> git-undo.ahk
echo ; Limpa arquivos nao rastreados >> git-undo.ahk
echo ControlSend,, git clean -dfx{Enter}, %%MYLOCAL%% >> git-undo.ahk
echo ; Aguarda um pouco >> git-undo.ahk
echo Sleep, 500 >> git-undo.ahk
echo ; Reseta mudancas no repositorio >> git-undo.ahk
echo ControlSend,, git reset --hard{Enter}, %%MYLOCAL%% >> git-undo.ahk

echo.
echo Arquivos criados com sucesso:
echo   - git-init.ahk
echo   - git-add.ahk
echo   - git-clean.ahk
echo   - git-commit.ahk
echo   - git-undo.ahk
echo.
echo Diretorio configurado: %CURRENT_PATH%
pause
EOF

    log_success "$file criado (versão Windows Batch)"
}

# Função principal
main() {
    echo -e "${GREEN}=== Gerador de Scripts AutoHotkey para Git ===${NC}"
    echo -e "${BLUE}Substitui ___PATH___ pelo diretório atual${NC}"
    echo

    # Verifica se estamos em um repositório git
    if git rev-parse --git-dir >/dev/null 2>&1; then
        log_info "Repositório Git detectado ✓"
    else
        log_warn "Este diretório não é um repositório Git"
    fi

    # Cria os arquivos principais
    create_git_init
    create_git_add
    create_git_clean
    create_git_commit
    create_git_undo

    # Cria versão avançada
    create_advanced_version

    # Cria versão Windows
    create_batch_generator

    echo
    log_success "Todos os arquivos foram criados com sucesso!"
    echo
    echo -e "${YELLOW}Arquivos gerados:${NC}"
    echo "  📄 git-init.ahk         - Executa 'git init'"
    echo "  📄 git-add.ahk          - Executa 'git add .'"
    echo "  📄 git-clean.ahk        - Executa 'git clean -dfx'"
    echo "  📄 git-commit.ahk       - Executa 'git commit -m wip'"
    echo "  📄 git-undo.ahk         - Executa 'git clean -dfx' + 'git reset --hard'"
    echo "  📄 git-commit-msg.ahk   - Commit com mensagem customizável"
    echo "  📄 generate-git-ahk.bat - Versão Windows do gerador"
    echo
    echo -e "${BLUE}Diretório configurado:${NC} $CURRENT_PATH"
    echo
    echo -e "${YELLOW}Como usar:${NC}"
    echo "  1. Execute os .ahk no Windows com AutoHotkey instalado"
    echo "  2. Ou use o .bat no Windows para regenerar os arquivos"
}

# Executa função principal
main "$@"

exit 0
