-- ========================================================
-- ADRIREZ HOME CARE - ESTRUTURA DO BANCO DE DADOS (SUPABASE)
-- Cole este script no "SQL Editor" do seu painel no Supabase
-- e clique em "RUN". Todas as tabelas serão criadas prontas!
-- ========================================================

-- 1. Tabela de Clientes (CRM)
CREATE TABLE IF NOT EXISTS clients (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT,
  address TEXT,
  neighborhood TEXT,
  city TEXT DEFAULT 'São Paulo',
  cep TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Tabela de Agendamentos (Agenda de Adriano & Anny)
CREATE TABLE IF NOT EXISTS appointments (
  id TEXT PRIMARY KEY,
  client_id TEXT REFERENCES clients(id) ON DELETE SET NULL,
  client_name TEXT NOT NULL,
  client_phone TEXT,
  date DATE NOT NULL,
  time TEXT NOT NULL,
  duration_minutes INTEGER DEFAULT 120,
  services JSONB DEFAULT '[]'::jsonb,
  assigned_to TEXT DEFAULT 'adriano', -- 'adriano' | 'anny' | 'ambos'
  address TEXT,
  total_value NUMERIC(10, 2) DEFAULT 0.00,
  payment_method TEXT DEFAULT 'PIX',
  status TEXT DEFAULT 'confirmado', -- 'pendente' | 'confirmado' | 'a_caminho' | 'em_andamento' | 'concluido' | 'cancelado'
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Tabela de Orçamentos e Propostas Comerciais
CREATE TABLE IF NOT EXISTS quotes (
  id TEXT PRIMARY KEY,
  client_id TEXT REFERENCES clients(id) ON DELETE SET NULL,
  client_name TEXT NOT NULL,
  client_phone TEXT,
  items JSONB DEFAULT '[]'::jsonb,
  subtotal NUMERIC(10, 2) DEFAULT 0.00,
  discount NUMERIC(10, 2) DEFAULT 0.00,
  total NUMERIC(10, 2) DEFAULT 0.00,
  payment_method TEXT,
  validity_days INTEGER DEFAULT 15,
  status TEXT DEFAULT 'enviado', -- 'rascunho' | 'enviado' | 'aprovado' | 'recusado'
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Tabela de Notificações para Administradores
CREATE TABLE IF NOT EXISTS notifications (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  type TEXT DEFAULT 'info',
  recipient TEXT DEFAULT 'all', -- 'adriano' | 'anny' | 'all'
  read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. Tabela de Configurações da Empresa
CREATE TABLE IF NOT EXISTS company_settings (
  id TEXT PRIMARY KEY DEFAULT 'main',
  company_name TEXT DEFAULT 'ADRIREZ HOME CARE',
  slogan TEXT DEFAULT 'Higienização e Impermeabilização Especializada de Estofados',
  phone TEXT,
  email TEXT,
  city TEXT DEFAULT 'São Paulo - SP',
  pix_key TEXT,
  pix_type TEXT DEFAULT 'Email',
  terms_warranty TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ========================================================
-- Habilitar Políticas de Acesso Público Seguro (RLS)
-- Permite leitura e escrita para o aplicativo web da Adrirez
-- ========================================================
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE quotes ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE company_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Acesso Total Clientes" ON clients FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Acesso Total Agendamentos" ON appointments FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Acesso Total Orçamentos" ON quotes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Acesso Total Notificações" ON notifications FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Acesso Total Configurações" ON company_settings FOR ALL USING (true) WITH CHECK (true);

-- Habilitar sincronização em tempo real (Realtime)
ALTER PUBLICATION supabase_realtime ADD TABLE clients, appointments, quotes, notifications, company_settings;
