
# macOS Debloat Script

**AVISO IMPORTANTE: ESTE SCRIPT É FORNECIDO "COMO ESTÁ" SEM QUALQUER GARANTIA. AO UTILIZAR ESTE SCRIPT, VOCÊ ASSUME TODAS AS RESPONSABILIDADES E RISCOS. USE POR SUA PRÓPRIA CONTA E RISCO.**

## Descrição

Este script realiza tarefas de manutenção no macOS para otimizar o desempenho do sistema. As ações realizadas incluem:

- Limpeza dos caches do usuário
- Limpeza do cache DNS
- Reconstrução do índice do Spotlight
- Purga da memória inativa
- Remoção de logs antigos (arquivos com mais de 30 dias)
- Remoção de backups iOS antigos (backups com mais de 180 dias)
- Remoção de arquivos de idiomas não utilizados (mantendo apenas "en.lproj")

## Pré-requisitos

- macOS (testado em versões recentes, como Big Sur e Monterey)
- Bash (shell)
- Privilégios de administrador (algumas operações exigem `sudo`)

## Instruções de Uso

1. **Clone o repositório:**

   ```bash
   git clone <URL_DO_REPOSITÓRIO>
   cd <NOME_DO_DIRETÓRIO>
   ```

2. **Dê permissão de execução ao script:**

   ```bash
   chmod +x manutencao_mac.sh
   ```

3. **Execute o script:**

   ```bash
   sudo ./manutencao_mac.sh
   ```

   *Nota: Algumas etapas exigem privilégios de root, por isso é recomendado o uso de `sudo`.*

## Observações

- **Uso por sua própria conta e risco:** Este script foi desenvolvido para ajudar na manutenção e otimização do macOS. Entretanto, a sua execução é de inteira responsabilidade do usuário. Faça backup dos seus dados e teste o script em um ambiente controlado antes de aplicá-lo em sistemas críticos.
- **Sem Garantia:** Não oferecemos suporte ou garantia quanto aos resultados ou eventuais problemas que possam ocorrer durante ou após a execução do script.

## Contribuições

Contribuições, sugestões e melhorias são bem-vindas. Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE) - veja o arquivo LICENSE para mais detalhes.
```
