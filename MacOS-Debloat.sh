#!/bin/bash
# macOS Debloat Script
# Este script realiza as seguintes tarefas:
# - Limpeza dos caches do usuário
# - Limpeza do cache DNS
# - Reconstrução do índice do Spotlight
# - Purga da memória inativa
# - Remoção de logs antigos (arquivos com mais de 30 dias)
# - Remoção de backups iOS antigos (diretório MobileSync/Backup com mais de 180 dias)
# - Remoção de arquivos de idiomas não utilizados (mantendo apenas "en.lproj")
#
# Execute este script com as permissões necessárias (algumas ações podem requerer sudo).
# Recomenda-se realizar backup dos dados antes de executar.

# Verifica se o script está sendo executado com privilégios de root (para etapas que exigem sudo)
if [[ $EUID -ne 0 ]]; then
    echo "Aviso: Recomenda-se executar este script como root para garantir a execução completa das ações."
fi

# Limpar caches do usuário
function clean_user_caches() {
    echo "Limpando caches do usuário..."
    rm -rf ~/Library/Caches/*
    echo "Caches do usuário limpos."
}

# Limpar cache DNS
function clean_dns_cache() {
    echo "Limpando cache DNS..."
    sudo killall -HUP mDNSResponder
    echo "Cache DNS limpo."
}

# Reconstruir o índice do Spotlight
function rebuild_spotlight() {
    echo "Reconstruindo o índice do Spotlight..."
    sudo mdutil -E /
    echo "Reconstrução do índice do Spotlight iniciada."
}

# Purga de memória inativa
function purge_memory() {
    echo "Purgando memória inativa..."
    purge
    echo "Memória inativa purgada."
}

# Remover logs antigos (arquivos com mais de 30 dias)
function remove_old_logs() {
    echo "Removendo logs antigos (mais de 30 dias)..."
    find ~/Library/Logs -type f -mtime +30 -delete
    echo "Logs antigos removidos."
}

# Remover backups iOS antigos (backups com mais de 180 dias)
function remove_old_ios_backups() {
    echo "Removendo backups iOS antigos (mais de 180 dias)..."
    BACKUP_DIR="$HOME/Library/Application Support/MobileSync/Backup"
    if [ -d "$BACKUP_DIR" ]; then
        find "$BACKUP_DIR" -type d -mtime +180 -exec rm -rf {} \;
        echo "Backups iOS antigos removidos."
    else
        echo "Diretório de backups iOS não encontrado. Pulando esta etapa."
    fi
}

# Remover arquivos de idiomas não utilizados (mantendo apenas "en.lproj")
function remove_unused_languages() {
    echo "Removendo arquivos de idiomas não utilizados (exceto en.lproj)..."
    for app in /Applications/*.app; do
        if [ -d "$app/Contents/Resources" ]; then
            find "$app/Contents/Resources" -type d -name "*.lproj" ! -name "en.lproj" -exec rm -rf {} \;
            echo "Idiomas removidos em: $app"
        fi
    done
    echo "Arquivos de idiomas não utilizados removidos."
}

# Execução das tarefas
clean_user_caches
clean_dns_cache
rebuild_spotlight
purge_memory
remove_old_logs
remove_old_ios_backups
remove_unused_languages

echo "Manutenção concluída. Seu macOS foi otimizado."
