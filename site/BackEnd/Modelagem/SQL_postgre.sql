
CREATE SEQUENCE public.onibus_onibus_id_seq_1;

CREATE TABLE public.onibus (
                onibus_id INTEGER NOT NULL DEFAULT nextval('public.onibus_onibus_id_seq_1'),
                empresa VARCHAR(20) NOT NULL,
                CONSTRAINT onibus_id PRIMARY KEY (onibus_id)
);


ALTER SEQUENCE public.onibus_onibus_id_seq_1 OWNED BY public.onibus.onibus_id;

CREATE SEQUENCE public.pessoa_pessoa_id_seq;

CREATE TABLE public.Pessoa (
                Pessoa_id INTEGER NOT NULL DEFAULT nextval('public.pessoa_pessoa_id_seq'),
                nome VARCHAR(30) NOT NULL,
                obs VARCHAR(50),
                sobrenome VARCHAR(30) NOT NULL,
                CONSTRAINT pessoa_id PRIMARY KEY (Pessoa_id)
);


ALTER SEQUENCE public.pessoa_pessoa_id_seq OWNED BY public.Pessoa.Pessoa_id;

CREATE SEQUENCE public.tipo_pessoa_tipo_pessoa_id_seq;

CREATE TABLE public.tipo_pessoa (
                tipo_pessoa_id INTEGER NOT NULL DEFAULT nextval('public.tipo_pessoa_tipo_pessoa_id_seq'),
                tipo VARCHAR(10) NOT NULL,
                Pessoa_id INTEGER NOT NULL,
                CONSTRAINT tipo_pessoa_id PRIMARY KEY (tipo_pessoa_id)
);


ALTER SEQUENCE public.tipo_pessoa_tipo_pessoa_id_seq OWNED BY public.tipo_pessoa.tipo_pessoa_id;

CREATE SEQUENCE public.passeio_passeio_id_seq_1;

CREATE TABLE public.passeio (
                passeio_id INTEGER NOT NULL DEFAULT nextval('public.passeio_passeio_id_seq_1'),
                nome_passeio VARCHAR(20) NOT NULL,
                Pessoa_id INTEGER NOT NULL,
                onibus_id INTEGER NOT NULL,
                CONSTRAINT passeio_id PRIMARY KEY (passeio_id)
);


ALTER SEQUENCE public.passeio_passeio_id_seq_1 OWNED BY public.passeio.passeio_id;

CREATE SEQUENCE public.pagamento_pagamento_id_seq;

CREATE TABLE public.pagamento (
                pagamento_id INTEGER NOT NULL DEFAULT nextval('public.pagamento_pagamento_id_seq'),
                Pessoa_id INTEGER NOT NULL,
                passeio VARCHAR(20) NOT NULL,
                tipopagamento VARCHAR(20) NOT NULL,
                data_pagamento DATE NOT NULL,
                valor_pago NUMERIC NOT NULL,
                passeio_id INTEGER NOT NULL,
                CONSTRAINT pagamento PRIMARY KEY (pagamento_id)
);


ALTER SEQUENCE public.pagamento_pagamento_id_seq OWNED BY public.pagamento.pagamento_id;

CREATE SEQUENCE public.contato_contato_id_seq;

CREATE SEQUENCE public.contato_telefone_seq;

CREATE TABLE public.contato (
                contato_id INTEGER NOT NULL DEFAULT nextval('public.contato_contato_id_seq'),
                Pessoa_id INTEGER NOT NULL,
                telefone INTEGER NOT NULL DEFAULT nextval('public.contato_telefone_seq'),
                email VARCHAR(30),
                CONSTRAINT contato PRIMARY KEY (contato_id)
);


ALTER SEQUENCE public.contato_contato_id_seq OWNED BY public.contato.contato_id;

ALTER SEQUENCE public.contato_telefone_seq OWNED BY public.contato.telefone;

CREATE SEQUENCE public.documento_documento_seq;

CREATE TABLE public.documento (
                documento INTEGER NOT NULL DEFAULT nextval('public.documento_documento_seq'),
                Pessoa_id INTEGER NOT NULL,
                tipo_documento VARCHAR(15) NOT NULL,
                numero_documento INTEGER NOT NULL,
                orgao_expedidor VARCHAR(20) NOT NULL,
                CONSTRAINT documento PRIMARY KEY (documento)
);


ALTER SEQUENCE public.documento_documento_seq OWNED BY public.documento.documento;

ALTER TABLE public.passeio ADD CONSTRAINT onibus_passeio_fk
FOREIGN KEY (onibus_id)
REFERENCES public.onibus (onibus_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.documento ADD CONSTRAINT pessoa_identidade_fk
FOREIGN KEY (Pessoa_id)
REFERENCES public.Pessoa (Pessoa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.contato ADD CONSTRAINT pessoa_contato_fk
FOREIGN KEY (Pessoa_id)
REFERENCES public.Pessoa (Pessoa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pagamento ADD CONSTRAINT pessoa_pagamento_fk
FOREIGN KEY (Pessoa_id)
REFERENCES public.Pessoa (Pessoa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.passeio ADD CONSTRAINT pessoa_passeio_fk
FOREIGN KEY (Pessoa_id)
REFERENCES public.Pessoa (Pessoa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tipo_pessoa ADD CONSTRAINT pessoa_tipo_pessoa_fk
FOREIGN KEY (Pessoa_id)
REFERENCES public.Pessoa (Pessoa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pagamento ADD CONSTRAINT passeio_pagamento_fk
FOREIGN KEY (passeio_id)
REFERENCES public.passeio (passeio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
