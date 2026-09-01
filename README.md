# Provisionamento de Infraestrutura Linux

Projeto em Bash desenvolvido durante o desafio **Infraestrutura como Código** da DIO. O objetivo é automatizar a criação de diretórios, grupos, usuários e permissões em um ambiente Linux.

## Objetivo

O script resolve uma tarefa de administração de usuários no Linux seguindo estas etapas:

1. cria os diretórios dos setores;
2. cria os grupos de usuários;
3. cria cada usuário e o adiciona ao seu grupo;
4. define uma senha temporária de exemplo;
5. obriga a troca da senha no primeiro acesso;
6. configura o proprietário e as permissões dos diretórios.

## Versões do projeto

### 1. Versão original do desafio

O arquivo `Linux-User-Management-Desafio.sh` mantém a implementação apresentada no curso, com uma senha fixa utilizada para facilitar a execução do exercício.

### 2. Versão comentada e aprimorada

O arquivo `provision-linux-users.sh` mantém o mesmo objetivo e utiliza diretamente os comandos estudados:

- `mkdir` para criar diretórios;
- `groupadd` para criar grupos;
- `useradd` para criar usuários;
- `chpasswd` para definir as senhas de exemplo;
- `passwd -e` para obrigar a troca da senha;
- `chown` e `chmod` para configurar as permissões.

## Estrutura criada

| Setor | Grupo | Diretório | Usuários |
| --- | --- | --- | --- |
| Administração | `GRP_ADM` | `/adm` | `carlos`, `maria`, `joao` |
| Vendas | `GRP_VEN` | `/ven` | `debora`, `sebastiana`, `roberto` |
| Secretaria | `GRP_SEC` | `/sec` | `josefina`, `amanda`, `rogerio` |
| Público | — | `/publico` | Todos os usuários locais |

## Exemplo: criação do usuário Carlos

```bash
# Cria o usuário carlos e adiciona ao grupo de administração
useradd carlos -m -s /bin/bash -G GRP_ADM

# Define uma senha temporária de exemplo
echo "carlos:Carlos123" | chpasswd

# Obriga carlos a trocar a senha no primeiro acesso
passwd -e carlos
```

O `chpasswd` recebe a informação no formato `usuario:senha`. O caractere `|` envia o resultado do `echo` para esse comando.

## Como executar a versão aprimorada

Em um sistema Linux, execute:

```bash
chmod +x provision-linux-users.sh
sudo bash provision-linux-users.sh
```

## Senhas utilizadas no exercício

Cada usuário recebe uma senha temporária de exemplo baseada em seu nome, como `Carlos123`, `Joao123` ou `Amanda123`.

O comando `passwd -e` expira essa senha imediatamente. No primeiro login, o Linux solicita que o usuário informe a senha temporária e depois cadastre uma nova senha pessoal.

> As senhas deste projeto são exemplos públicos utilizados somente para demonstrar o funcionamento do comando `chpasswd`. Elas não devem ser utilizadas em ambientes reais.

## Entendendo os comandos

| Comando ou opção | Função |
| --- | --- |
| `useradd` | Cria uma conta de usuário no Linux. |
| `-m` | Cria o diretório pessoal do usuário em `/home`. |
| `-s /bin/bash` | Define o Bash como shell utilizado no login. |
| `-G GRP_ADM` | Adiciona o usuário ao grupo informado. |
| `echo "usuario:senha"` | Produz o texto no formato aceito pelo `chpasswd`. |
| `chpasswd` | Define a senha da conta de usuário. |
| `passwd -e usuario` | Expira a senha e obriga sua troca no primeiro login. |
| `chown` | Altera o proprietário e o grupo de um diretório. |
| `chmod 770` | Concede acesso total ao proprietário e ao grupo e bloqueia os demais usuários. |
| `chmod 777` | Concede acesso total a todos os usuários no diretório público do exercício. |

## Tecnologias e conceitos

- Linux e Bash;
- infraestrutura como código;
- administração de usuários e grupos;
- permissões com `chmod` e `chown`;
- automação de tarefas administrativas.

## Autor

Desenvolvido por [Samuel Monsalves Moreira](https://github.com/SamuelMonsalvesMoreira) durante a formação Linux da DIO e aprimorado como projeto de portfólio.
