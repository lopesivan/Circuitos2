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
