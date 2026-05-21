# 📊 ERP-Vendas

Um sistema completo de gestão de vendas desenvolvido em **Delphi** com banco de dados **SQL Server**, projetado para automatizar e controlar processos comerciais e operacionais.

![Delphi](https://img.shields.io/badge/Delphi-0079D4?style=for-the-badge&logo=delphi&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow?style=for-the-badge)

---

## 📋 Sumário

- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Instalação e Configuração](#instalação-e-configuração)
- [Como Executar](#como-executar)
- [Configuração do Banco de Dados](#configuração-do-banco-de-dados)
- [Contribuindo](#contribuindo)
- [Autor](#autor)
- [Licença](#licença)

---

## 👁️ Visão Geral

O **ERP-Vendas** é um sistema enterprise desenvolvido como projeto educacional durante estágio na empresa **Domtec Sistemas**. O sistema implementa práticas modernas de desenvolvimento, incluindo:

- ✅ Gestão de clientes, produtos e categorias
- ✅ Processamento de vendas com controle de estoque
- ✅ Relatórios e análises com gráficos interativos
- ✅ Sistema de autenticação de usuários
- ✅ Controle de acesso por funcionalidade
- ✅ Dashboard com indicadores em tempo real

---

## 🎯 Funcionalidades

### 📁 Módulo de Cadastro
- **Clientes** - Cadastro e manutenção de dados de clientes
- **Produtos** - Gestão de catálogo de produtos
- **Categorias** - Classificação e organização de produtos
- **Usuários** - Gerenciamento de usuários do sistema
- **Ações de Acesso** - Configuração de permissões

### 💰 Módulo de Movimentação
- **Vendas** - Registro completo de transações de venda
- **Controle de Estoque** - Atualização automática de quantidade
- **Histórico de Transações** - Rastreamento de movimentações

### 📈 Módulo de Relatórios
- **Relatório de Clientes** - Listagem completa com fichas individuais
- **Relatório de Produtos** - Análise de catálogo por categoria
- **Relatório de Vendas por Data** - Vendas em período especificado
- **Dashboard** - Gráficos de:
  - Produtos em estoque
  - Valor de venda por cliente
  - Top 10 produtos mais vendidos
  - Vendas na última semana

### 🔐 Módulo de Segurança
- **Login** - Autenticação segura de usuários
- **Alteração de Senha** - Gerenciamento de credenciais
- **Controle de Acesso** - Permissões granulares por funcionalidade
- **Histórico de Transações** - Rastreabilidade de operações

---

## 🛠️ Tecnologias

| Tecnologia | Versão | Descrição |
|-----------|--------|-----------|
| **Delphi** | 10.x+ | Linguagem de programação principal |
| **SQL Server** | 2012+ | Banco de dados relacional |
| **FireDAC** | Nativo Delphi | Componentes de acesso a banco de dados |
| **VCL** | Nativo Delphi | Visual Component Library |
| **ReportBuilder** | RLReport | Geração de relatórios |
| **TeeChart** | Nativo Delphi | Gráficos e visualizações |

---

## 📂 Estrutura do Projeto

```
ERP-Vendas/
├── DataModule/                 # Módulos de dados
│   ├── uDTMConexao.pas        # Conexão com banco de dados
│   ├── uDTMVenda.pas          # DataModule de vendas
│   ├── uDTMGrafico.pas        # DataModule de gráficos
│   └── uFrmAtualizaDB.pas     # Atualização automática do BD
│
├── cadastro/                   # Módulo de cadastros
│   ├── uCadCategoria.pas      # Cadastro de categorias
│   ├── uCadCliente.pas        # Cadastro de clientes
│   ├── uCadProduto.pas        # Cadastro de produtos
│   ├── uCadUsuario.pas        # Cadastro de usuários
│   └── uCadAcaoAcesso.pas     # Configuração de acesso
│
├── classes/                    # Classes de negócio
│   ├── cCadCategoria.pas      # Lógica de categorias
│   ├── cCadCliente.pas        # Lógica de clientes
│   ├── cCadProduto.pas        # Lógica de produtos
│   ├── cProVendas.pas         # Lógica de vendas
│   ├── cControleEstoque.pas   # Lógica de estoque
│   ├── cCredito.pas           # Lógica de crédito
│   ├── cAcaoAcesso.pas        # Controle de permissões
│   ├── cAtulizacaoBancoDeDados.pas
│   ├── cArquivoIni.pas        # Leitura de configurações
│   └── cFuncao.pas            # Funções utilitárias
│
├── heranca/                    # Classes base
│   ├── uTelaHeranca.pas       # Tela base para formulários
│   ├── uTelaHerancaConsulta.pas
│   ├── uEnum.pas              # Enumerações
│   └── uFuncaoCriptografia.pas
│
├── login/                      # Módulo de autenticação
│   ├── uLogin.pas             # Formulário de login
│   ├── uAlterarSenha.pas      # Alteração de senha
│   └── uUsuarioVsAcoes.pas    # Associação usuário-ações
│
├── processo/                   # Processos de negócio
│   ├── uProVendas.pas         # Processamento de vendas
│   └── uProCredito.pas        # Processamento de crédito
│
├── relatorio/                  # Relatórios e consultas
│   ├── uRelClienteFicha.pas   # Ficha de cliente
│   ├── uRelClientes.pas       # Relatório de clientes
│   ├── uRelCadProduto.pas     # Relatório de produtos
│   ├── uRelCategorias.pas     # Relatório de categorias
│   ├── uRelVendaPorData.pas   # Vendas por período
│   ├── uSelecionarData.pas    # Seletor de datas
│   └── uConCategoria.pas      # Consulta de categorias
│
├── Consulta/                   # Módulo de consultas
├── terceiros/                  # Componentes de terceiros
├── Win32/                      # Binários compilados
├── __history/                  # Histórico de versões
│
├── Upricipal.pas/dfm          # Tela principal
├── cUsuarioLogado.pas         # Dados do usuário logado
├── Vendas.dpr                 # Arquivo principal do projeto
├── Vendas.dproj               # Configuração do projeto Delphi
└── README.md                  # Este arquivo
```

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

### Ambiente de Desenvolvimento
- ✅ **Delphi 10.0 ou superior** (Community, Professional ou Enterprise)
- ✅ **SQL Server 2012 ou superior** (Express, Standard ou Enterprise)

### Dependências do Delphi
- ✅ FireDAC (incluído no Delphi 10+)
- ✅ VCL Components
- ✅ ReportBuilder (RLReport)
- ✅ TeeChart

### Sistema Operacional
- ✅ Windows 7 SP1 ou superior
- ✅ .NET Framework 4.5+ (para algumas funcionalidades)

### Banco de Dados
- ✅ SQL Server com acesso de administrador
- ✅ Permissão para criar novos bancos de dados

---

## 🚀 Instalação e Configuração

### 1️⃣ Clonar o Repositório

```bash
git clone https://github.com/DaniDev77/ERP-Vendas.git
cd ERP-Vendas
```

### 2️⃣ Abrir no Delphi

1. Abra o **Delphi IDE**
2. Vá para `File > Open Project`
3. Navegue até o arquivo **`Vendas.dproj`**
4. Clique em `Open`

### 3️⃣ Configurar Conexão com Banco de Dados

#### ⚠️ **PASSO IMPORTANTE: Alterar Parâmetros de Conexão**

Você **DEVE** alterar os parâmetros de conexão no arquivo `DataModule/uDTMConexao.pas`:

**Localize o método `DataModuleCreate` e altere:**

```pascal
procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
begin
  dtmPrincipalDB.Params.Clear;
  
  // ⚠️ ALTERE ESTES PARÂMETROS:
  dtmPrincipalDB.Params.Add('DriverID=MSSQL');
  dtmPrincipalDB.Params.Add('Server=SEU_SERVIDOR\INSTANCIA');  // ← Altere aqui
  dtmPrincipalDB.Params.Add('Database=VENDAS');                 // ← Altere se necessário
  
  // Use uma das opções abaixo:
  // Opção 1: Autenticação Windows (recomendado)
  dtmPrincipalDB.Params.Add('OSAuthent=Yes');
  
  // Opção 2: Autenticação SQL (comentar OSAuthent e descomente abaixo)
  // dtmPrincipalDB.Params.Add('User_Name=seu_usuario');
  // dtmPrincipalDB.Params.Add('Password=sua_senha');
  
  dtmPrincipalDB.LoginPrompt := False;
  dtmPrincipalDB.Connected := True;
end;
```

### Exemplos de Configuração:

#### 🔹 SQL Server Local (Autenticação Windows):
```pascal
dtmPrincipalDB.Params.Add('Server=localhost\SQLEXPRESS');
dtmPrincipalDB.Params.Add('OSAuthent=Yes');
```

#### 🔹 SQL Server em Rede (IP):
```pascal
dtmPrincipalDB.Params.Add('Server=192.168.1.100');
dtmPrincipalDB.Params.Add('User_Name=sa');
dtmPrincipalDB.Params.Add('Password=Sua_Senha_123');
```

#### 🔹 SQL Server com Autenticação SQL:
```pascal
dtmPrincipalDB.Params.Add('Server=meu_servidor');
dtmPrincipalDB.Params.Add('User_Name=vendas_user');
dtmPrincipalDB.Params.Add('Password=senhaSegura123');
```

---

## 🔧 Configuração do Banco de Dados

### Criar Banco de Dados

Execute o script SQL abaixo no seu SQL Server:

```sql
-- Criar banco de dados
CREATE DATABASE VENDAS;
GO

-- Usar o banco de dados
USE VENDAS;
GO

-- Criar tabelas básicas (exemplo)
CREATE TABLE Categoria (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(255)
);

CREATE TABLE Cliente (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(150) NOT NULL,
    Email NVARCHAR(100),
    Telefone NVARCHAR(20),
    DataCadastro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Produto (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(150) NOT NULL,
    CategoriaID INT FOREIGN KEY REFERENCES Categoria(ID),
    Preco DECIMAL(10,2),
    Estoque INT DEFAULT 0
);

CREATE TABLE Venda (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Cliente(ID),
    DataVenda DATETIME DEFAULT GETDATE(),
    ValorTotal DECIMAL(12,2)
);

CREATE TABLE VendaItem (
    ID INT PRIMARY KEY IDENTITY(1,1),
    VendaID INT FOREIGN KEY REFERENCES Venda(ID),
    ProdutoID INT FOREIGN KEY REFERENCES Produto(ID),
    Quantidade INT,
    ValorUnitario DECIMAL(10,2),
    Subtotal DECIMAL(12,2)
);

CREATE TABLE Usuario (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Senha NVARCHAR(100) NOT NULL,
    Ativo BIT DEFAULT 1,
    DataCadastro DATETIME DEFAULT GETDATE()
);
```

---

## ▶️ Como Executar

### 1️⃣ Compilar o Projeto

No Delphi IDE:
1. Vá para **`Project > Compile "Vendas"`**
   - Ou pressione **`Ctrl + F9`**

Se não houver erros, o aplicativo será compilado com sucesso.

### 2️⃣ Executar o Aplicativo

1. Vá para **`Run > Run`**
   - Ou pressione **`F9`**

### 3️⃣ Tela de Login

Você verá a tela de login. Utilize as credenciais cadastradas no banco de dados.

### 4️⃣ Menu Principal

Após autenticação com sucesso, você terá acesso a:

```
CADASTRO
├── Clientes
├── Produtos
├── Categorias
├── Usuários
└── Ações de Acesso

MOVIMENTAÇÃO
├── Vendas
├── Histórico de Transações
└── Créditos

RELATÓRIOS
├── Relatório de Clientes
├── Relatório de Ficha de Cliente
├── Relatório de Produtos
├── Relatório de Categorias
├── Relatório de Produtos por Categoria
└── Relatório de Vendas por Data

CONFIGURAÇÕES
├── Alterar Senha
├── Controle de Acesso
└── Usuários vs Ações
```

---

## 📊 Dashboard

O dashboard exibe em tempo real:

- 📦 **Produtos em Estoque** - Quantidade disponível de cada produto
- 💵 **Valor de Venda por Cliente** - Total faturado por cliente
- 🏆 **Top 10 Produtos Mais Vendidos** - Ranking de vendas
- 📈 **Vendas Última Semana** - Evolução de vendas

Clique no dashboard para **atualizar** os dados manualmente.

---

## 🔑 Variáveis de Ambiente Importantes

### uDTMConexao.pas - DataModuleCreate

Este é o método mais **crítico** da aplicação. Altere conforme sua configuração:

```pascal
procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
begin
  dtmPrincipalDB.Params.Clear;
  dtmPrincipalDB.Params.Add('DriverID=MSSQL');
  
  // ⚠️ ALTERE PARA SEU SERVIDOR
  dtmPrincipalDB.Params.Add('Server=DC-TR-01-VM\SERVERCURSO');  // Seu servidor aqui
  
  // ⚠️ ALTERE PARA SEU BANCO (se necessário)
  dtmPrincipalDB.Params.Add('Database=VENDAS');
  
  // ⚠️ Escolha o tipo de autenticação
  dtmPrincipalDB.Params.Add('OSAuthent=Yes');  // Windows
  // OU
  // dtmPrincipalDB.Params.Add('User_Name=seu_usuario');
  // dtmPrincipalDB.Params.Add('Password=sua_senha');
  
  dtmPrincipalDB.LoginPrompt := False;
  dtmPrincipalDB.Connected := True;
end;
```

### Arquivo cArquivoIni.pas

Você também pode usar arquivo `.INI` para configurações:

```ini
[Database]
Server=seu_servidor\instancia
Database=VENDAS
User_Name=usuario
Password=senha
```

---

## 🐛 Solução de Problemas

### ❌ "Conexão recusada"
- Verifique o nome do servidor SQL
- Certifique-se que SQL Server está rodando
- Confirme credenciais de acesso

### ❌ "Banco de dados não encontrado"
- Crie o banco de dados com os scripts SQL fornecidos
- Verifique o nome do banco em `uDTMConexao.pas`

### ❌ "Componente FireDAC não encontrado"
- Instale/Atualize Delphi para versão 10.0+
- Verifique componentes instalados em Delphi

### ❌ "Erro ao compilar"
- Limpe cache: `Project > Clean`
- Recompile: `Ctrl + F9`
- Verifique caminhos relativos dos includes

---

## 📝 Padrões de Código

O projeto segue as convenções:

| Tipo | Prefixo | Exemplo |
|------|---------|---------|
| **DataModule** | `u` | `uDTMConexao.pas` |
| **Formulário** | `u` | `uCadCliente.pas` |
| **Classe** | `c` | `cCadCliente.pas` |
| **Unit de Herança** | `u` | `uTelaHeranca.pas` |
| **Componente (Delphi)** | Sem prefixo | `Upricipal.dfm` |

---

## 👤 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. **Fork** o projeto
2. Crie uma **branch** para sua feature (`git checkout -b feature/MinhaFeature`)
3. **Commit** suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. **Push** para a branch (`git push origin feature/MinhaFeature`)
5. Abra um **Pull Request**

---

## 📧 Contato e Suporte

- **Desenvolvedor**: DaniDev77
- **Email**: disponível no perfil do GitHub
- **GitHub**: [github.com/DaniDev77](https://github.com/DaniDev77)
- **Empresa**: Domtec Sistemas

---

## 👨‍💻 Autor

**DaniDev77**

Este projeto foi desenvolvido como parte do programa de **treinamento prático** em desenvolvimento de sistemas ERP durante estágio na empresa **Domtec Sistemas**.

---

## 📄 Licença

Este projeto foi desenvolvido para fins **educacionais e comerciais**.

---

## 📚 Recursos Adicionais

- [Documentação Delphi](https://docwiki.embarcadero.com/)
- [FireDAC Reference](https://docwiki.embarcadero.com/RADStudio/en/FireDAC)
- [SQL Server Documentation](https://docs.microsoft.com/sql/)
- [VCL Components](https://docwiki.embarcadero.com/RADStudio/en/VCL_Components)

---

## 🎯 Roadmap Futuro

- [ ] Integração com NFS-e
- [ ] Relatórios avançados com BI
- [ ] App mobile para consultas
- [ ] Backup automático de dados
- [ ] Integração com meios de pagamento
- [ ] Multi-idioma
- [ ] Tema escuro (Dark Mode)

---

**Desenvolvido com ❤️ em Delphi**

*Última atualização: 2026-05-21*
