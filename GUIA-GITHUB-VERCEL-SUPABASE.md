# 🌐 Guia de Conexão: GitHub + Vercel + Banco de Dados (Supabase)
### Para Adriano & Anny • ADRIREZ HOME CARE

Este guia ensina o passo a passo direto para colocar o aplicativo na internet com endereço próprio e banco de dados em nuvem com sincronização em tempo real.

---

## 🚀 PASSO 1: Colocar o Código no GitHub

1. Abra o navegador e acesse: **[https://github.com/new](https://github.com/new)**
2. No campo **Repository name**, digite: `adrirez-home-care`
3. Pode escolher **Private** (Privado) ou **Public** (Público).
4. Clique no botão verde **Create repository**.
5. Na página seguinte, você verá a opção: **"uploading an existing file"** (carregar arquivos existentes).
6. Arraste todos os arquivos da pasta `d:\MEUS DOCUMENTOS\Adriano\adrirez-app` para a tela do GitHub:
   - `index.html`
   - `manifest.json`
   - `sw.js`
   - `vercel.json`
   - `schema.sql`
   - Pasta `css/` (com `styles.css`)
   - Pasta `js/` (com `app.js`, `storage.js`, `whatsapp.js`, `notifications.js`, `cloud-db.js`)
   - Pasta `assets/` (com os ícones `icon-192.png` e `icon-512.png`)
7. Clique em **Commit changes**. Pronto, seu sistema está no GitHub!

---

## ⚡ PASSO 2: Publicar na Vercel (Acesso Externo de Qualquer Lugar)

1. Acesse: **[https://vercel.com](https://vercel.com)**
2. Clique em **Log In** e selecione **Continue with GitHub**.
3. Na tela principal, clique no botão **Add New...** e selecione **Project**.
4. Você verá seu repositório `adrirez-home-care`. Clique no botão **Import** ao lado dele.
5. Deixe as configurações padrão e clique no botão azul **Deploy**.
6. Aguarde cerca de 30 segundos. A Vercel criará um link seguro (com cadeado HTTPS), como:
   👉 **`https://adrirez-home-care.vercel.app`**
7. Envie esse link para o WhatsApp de Adriano e de Anny!
8. Ao abrir no celular pelo Chrome ou Safari, clique em **"Adicionar à tela inicial"** para instalar como aplicativo.

---

## 🗄️ PASSO 3: Conectar o Banco de Dados na Nuvem (Supabase)
*Isso garante que tudo o que Adriano fizer na rua (ex: marcar atendimento como "A caminho" ou cadastrar novo cliente) apareça na mesma hora no celular da Anny e no computador!*

1. Acesse: **[https://supabase.com](https://supabase.com)**
2. Clique em **Sign in** e escolha **Continue with GitHub**.
3. Clique em **New Project** (Novo Projeto):
   - Nome: `adrirez-care`
   - Senha do Banco: Crie uma senha segura (guarde com você).
   - Região: Escolha **São Paulo (sa-east-1)** ou a mais próxima.
   - Plano: **Free** (100% gratuito).
   - Clique em **Create new project** e aguarde 1 minuto.
4. No menu lateral esquerdo do Supabase, clique em **SQL Editor** (ícone `>_`).
5. Clique em **New Query**, abra o arquivo `schema.sql` (que criamos na sua pasta), copie todo o texto dele, cole na caixa do Supabase e clique no botão **Run** (botão verde de rodar).
   - *Pronto! Todas as tabelas (`clients`, `appointments`, `quotes`, etc.) foram criadas com suporte a tempo real.*
6. No menu lateral esquerdo, clique na engrenagem **Project Settings** -> e depois em **API**.
7. Copie duas informações:
   - **Project URL** (ex: `https://abcdefgh.supabase.co`)
   - **Project API keys -> `anon` `public`** (uma chave comprida)
8. Abra o seu aplicativo da Adrirez Home Care, vá na aba **Ajustes** -> seção **Banco na Nuvem (Acesso Externo)**.
9. Cole a **Project URL** e a **Anon Key**, marque a caixa **"Ativar Sincronização em Nuvem"** e clique em **Salvar & Conectar Nuvem**.
10. Clique no botão **"Sincronizar Tudo para a Nuvem"** para enviar os dados para o Supabase!

A partir desse momento, o indicador no topo do app mostrará **"Nuvem Conectada (Tempo Real) 🟢"**.
Qualquer mudança feita por Adriano ou Anny no celular ou PC sincronizará na hora!
