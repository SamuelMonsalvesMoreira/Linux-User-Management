# Provisionamento de Infraestrutura Linux

Projeto em Bash desenvolvido durante o desafio **Infraestrutura como Código** da DIO. O objetivo é automatizar a criação de diretórios, grupos, usuários e permissões em um ambiente Linux.

## Versões do projeto

### 1. Versão original do desafio

O arquivo `Linux-User-Management-Desafio.sh` mantém a implementação apresentada no curso, com uma senha fixa utilizada para facilitar a execução do exercício.

### 2. Versão aprimorada

O arquivo `provision-linux-users.sh` mantém o mesmo objetivo, mas:

- define uma senha inicial fictícia para cada usuário com `chpasswd`;
- utiliza `passwd -e` para obrigar a troca da senha no primeiro login;
- mantém a mesma estrutura simples apresentada no desafio;
- utiliza diretamente `mkdir`, `groupadd`, `useradd`, `chpasswd`, `passwd`, `chown` e `chmod`.

## Estrutura criada

| Setor | Grupo | Diretório | Usuários |
| --- | --- | --- | --- |
| Administração | `GRP_ADM` | `/adm` | `carlos`, `maria`, `joao` |
| Vendas | `GRP_VEN` | `/ven` | `debora`, `sebastiana`, `roberto` |
| Secretaria | `GRP_SEC` | `/sec` | `josefina`, `amanda`, `rogerio` |
| Público | — | `/publico` | Todos os usuários locais |

## Como executar a versão aprimorada

Em um sistema Linux:

```bash
chmod +x provision-linux-users.sh
sudo bash provision-linux-users.sh
```

## Primeiro acesso dos usuários

Cada usuário recebe uma senha inicial fictícia baseada em seu nome, como `Carlos@123`, `Joao@123` ou `Amanda@123`. Essas credenciais existem somente para facilitar a demonstração do desafio.

O comando `passwd -e` expira a senha imediatamente. Por isso, no primeiro login, o Linux solicita que o usuário informe a senha inicial e depois cadastre uma senha pessoal.

> As senhas presentes neste projeto são públicas e nunca devem ser reutilizadas em um ambiente real.

## Entendendo os comandos

| Comando ou opção | Função |
| --- | --- |
| `useradd` | Cria uma conta de usuário no Linux. |
| `-m` | Cria o diretório pessoal do usuário em `/home`. |
| `-s /bin/bash` | Define o Bash como shell utilizado no login. |
| `-G GRP_ADM` | Adiciona o usuário ao grupo suplementar informado. |
| `echo "carlos:Carlos@123"` | Produz o texto no formato `usuário:senha`. |
| `|` | Envia a saída do comando à esquerda para o comando à direita. |
| `sudo chpasswd` | Recebe `usuário:senha` e altera a senha da conta com permissão administrativa. |
| `sudo passwd -e carlos` | Expira a senha de Carlos e obriga sua troca no primeiro login. |
| `chown` | Altera o proprietário e o grupo de um diretório. |
| `chmod 770` | Concede acesso total ao proprietário e ao grupo e bloqueia os demais usuários. |
| `chmod 777` | Concede acesso total a todos os usuários. |

## Tecnologias e conceitos

- Linux e Bash;
- infraestrutura como código;
- usuários e grupos;
- permissões com `chmod` e `chown`;
- automação de tarefas administrativas.

## Autor

Desenvolvido por [Samuel Monsalves Moreira](https://github.com/SamuelMonsalvesMoreira) durante a formação Linux da DIO e aprimorado como projeto de portfólio.

