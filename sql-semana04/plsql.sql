-- criar uma procedure brh.insere_projeto

CREATE OR REPLACE PROCEDURE brh.insere_projeto (
       p_id in NUMBER,
       p_nome in VARCHAR,
       p_responsavel in VARCHAR,
       p_inicio in DATE,
       p_fim in DATE)      
      IS
      BEGIN
          INSERT INTO projeto (id, nome, responsavel, inicio, fim) 
    values (p_id, p_nome, p_responsavel, p_inicio, p_fim);    
END;
        
                
        BEGIN
        
        insere_projeto (5,'Wxz', 'G123');
        
        COMMIT;
        END;
        
        
        SELECT * from projeto
    
    
 -- 2 calcule idade   
  CREATE OR REPLACE FUNCTION brh.calcula_idade (
	p_data_nascimento IN DATE) 
	RETURN NUMBER IS v_idade NUMBER;
	BEGIN
    	v_idade := TRUNC(MONTHS_BETWEEN(SYSDATE, p_data_nascimento) / 12);
    	RETURN v_idade;
    EXCEPTION
    	WHEN OTHERS THEN
        -- Trata qualquer exceção e retorna NULL
   		RETURN 0;
END;


SELECT brh.calcula_idade(to_date('19800515', 'YYYYMMDD')) AS idade FROM dual;


-- 3 finaliza projeto
CREATE OR REPLACE FUNCTION brh.finaliza_projeto (
	p_id_projeto IN NUMBER) 
	RETURN NUMBER IS v_data_fim NUMBER;
	BEGIN
    	v_data_fim := SYSDATE;
	    UPDATE TABLE PROJETO SET fim=data_fim WHERE ID=p_id_projeto;  
    	RETURN v_data_fim;
    EXCEPTION
    	WHEN OTHERS THEN
    	-- Trata qualquer exceção e retorna NULL
    	RETURN NULL;
END;


--4 validar novo projeto
CREATE OR REPLACE PROCEDURE brh.insere_projeto (
       p_id in NUMBER,
       p_nome in VARCHAR,
       p_responsavel in VARCHAR,
       p_inicio in DATE,
       p_fim in DATE)      
      IS
      BEGIN
	      IF LENGTH(p_nome) >= 2 IS NOT NULL THEN
	      	INSERT INTO projeto (id, nome, responsavel, inicio, fim) 
	      	values (p_id, p_nome, p_responsavel, p_inicio, p_fim);    
          END IF;
      EXCEPTION
    	WHEN OTHERS THEN
        -- Trata qualquer exceção e retorna NULL
        RETURN 'Nome de projeto inválido! Deve ter dois ou mais caracteres.';
END;