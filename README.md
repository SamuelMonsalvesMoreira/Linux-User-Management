# Provisionamento de Infraestrutura Linux com Shell Script

Script em Bash desenvolvido para automatizar a administração de sistemas Linux. O projeto realiza o provisionamento completo de um ambiente corporativo, contemplando:

* **Criação de Diretórios**: Estruturação de pastas na raiz do sistema (`/publico`, `/adm`, `/ven`, `/sec`).
* **Gestão de Grupos**: Criação dos grupos de departamentos correspondentes (`GRP_ADM`, `GRP_VEN`, `GRP_SEC`).
* **Cadastro de Usuários**: Provisionamento de usuários por setor, com senhas criptografadas utilizando OpenSSL para automação segura.
* **Controle de Acessos**: Aplicação de permissões rigorosas via `chmod` para garantir o isolamento e a segurança dos dados entre os departamentos.
