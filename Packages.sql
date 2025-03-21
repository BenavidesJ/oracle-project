CREATE OR REPLACE PACKAGE PKG_VETERINARIA AS

  TYPE T_CURSOR IS REF CURSOR;

  -- ==================================================
  --                TVET_CLIENTES
  -- ==================================================
  PROCEDURE SP_INSERT_CLIENTE (
    p_nombre            IN  TVET_CLIENTES.TC_Nombre%TYPE,
    p_direccion         IN  TVET_CLIENTES.TC_Direccion%TYPE,
    p_numTelefono       IN  TVET_CLIENTES.TC_NumTelefono%TYPE,
    p_correoElectronico IN  TVET_CLIENTES.TC_CorreoElectronico%TYPE
  );

  PROCEDURE SP_GET_CLIENTE_BY_ID (
    p_id        IN  TVET_CLIENTES.TNU_IdCliente%TYPE,
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_GET_ALL_CLIENTES (
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_UPDATE_CLIENTE (
    p_id                IN TVET_CLIENTES.TNU_IdCliente%TYPE,
    p_nombre            IN TVET_CLIENTES.TC_Nombre%TYPE,
    p_direccion         IN TVET_CLIENTES.TC_Direccion%TYPE,
    p_numTelefono       IN TVET_CLIENTES.TC_NumTelefono%TYPE,
    p_correoElectronico IN TVET_CLIENTES.TC_CorreoElectronico%TYPE
  );

  PROCEDURE SP_DELETE_CLIENTE (
    p_id IN TVET_CLIENTES.TNU_IdCliente%TYPE
  );

  -- ==================================================
  --                TVET_MASCOTAS
  -- ==================================================
  PROCEDURE SP_INSERT_MASCOTA (
    p_nombreMascota IN TVET_MASCOTAS.TC_NombreMascota%TYPE
  );

  PROCEDURE SP_GET_MASCOTA_BY_ID (
    p_id        IN  TVET_MASCOTAS.TNU_IdMascota%TYPE,
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_GET_ALL_MASCOTAS (
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_UPDATE_MASCOTA (
    p_id             IN TVET_MASCOTAS.TNU_IdMascota%TYPE,
    p_nombreMascota  IN TVET_MASCOTAS.TC_NombreMascota%TYPE
  );

  PROCEDURE SP_DELETE_MASCOTA (
    p_id IN TVET_MASCOTAS.TNU_IdMascota%TYPE
  );

  -- ==================================================
  --                TVET_CITAS
  -- ==================================================
  PROCEDURE SP_INSERT_CITA (
    p_idCliente IN TVET_CITAS.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_CITAS.TNU_IdMascota%TYPE,
    p_fecha     IN TVET_CITAS.TFE_Fecha%TYPE
  );

  PROCEDURE SP_GET_CITA_BY_ID (
    p_id        IN  TVET_CITAS.TNU_IdCita%TYPE,
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_GET_ALL_CITAS (
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_UPDATE_CITA (
    p_id         IN TVET_CITAS.TNU_IdCita%TYPE,
    p_idCliente  IN TVET_CITAS.TNU_IdCliente%TYPE,
    p_idMascota  IN TVET_CITAS.TNU_IdMascota%TYPE,
    p_fecha      IN TVET_CITAS.TFE_Fecha%TYPE
  );

  PROCEDURE SP_DELETE_CITA (
    p_id IN TVET_CITAS.TNU_IdCita%TYPE
  );

  -- ==================================================
  --                TVET_DIAGNOSTICO
  -- ==================================================
  PROCEDURE SP_INSERT_DIAGNOSTICO (
    p_idCita      IN TVET_DIAGNOSTICO.TNU_IdCita%TYPE,
    p_diagnostico IN TVET_DIAGNOSTICO.TC_Diagnostico%TYPE
  );

  PROCEDURE SP_GET_DIAGNOSTICO_BY_ID (
    p_id        IN  TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE,
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_GET_ALL_DIAGNOSTICO (
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_UPDATE_DIAGNOSTICO (
    p_id           IN TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE,
    p_idCita       IN TVET_DIAGNOSTICO.TNU_IdCita%TYPE,
    p_diagnostico  IN TVET_DIAGNOSTICO.TC_Diagnostico%TYPE
  );

  PROCEDURE SP_DELETE_DIAGNOSTICO (
    p_id IN TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE
  );

  -- ==================================================
  --                TVET_DETALLEMASCOTA
  -- ==================================================
  PROCEDURE SP_INSERT_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_raza      IN TVET_DETALLEMASCOTA.TC_Raza%TYPE,
    p_peso      IN TVET_DETALLEMASCOTA.DC_Peso%TYPE,
    p_color     IN TVET_DETALLEMASCOTA.TC_Color%TYPE
  );

  PROCEDURE SP_GET_DETALLEMASCOTA_BY_ID (
    p_idCliente IN  TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN  TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_GET_ALL_DETALLEMASCOTA (
    p_resultado OUT T_CURSOR
  );

  PROCEDURE SP_UPDATE_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_raza      IN TVET_DETALLEMASCOTA.TC_Raza%TYPE,
    p_peso      IN TVET_DETALLEMASCOTA.DC_Peso%TYPE,
    p_color     IN TVET_DETALLEMASCOTA.TC_Color%TYPE
  );

  PROCEDURE SP_DELETE_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE
  );

  -- ==================================================
  --                 FUNCIONES
  -- ==================================================
  FUNCTION FN_TOTAL_CLIENTES RETURN NUMBER;
  FUNCTION FN_TOTAL_MASCOTAS RETURN NUMBER;

END PKG_VETERINARIA;
/

CREATE OR REPLACE PACKAGE BODY PKG_VETERINARIA AS

  -- ==================================================
  --              TVET_CLIENTES
  -- ==================================================
  PROCEDURE SP_INSERT_CLIENTE (
    p_nombre            IN  TVET_CLIENTES.TC_Nombre%TYPE,
    p_direccion         IN  TVET_CLIENTES.TC_Direccion%TYPE,
    p_numTelefono       IN  TVET_CLIENTES.TC_NumTelefono%TYPE,
    p_correoElectronico IN  TVET_CLIENTES.TC_CorreoElectronico%TYPE
  ) IS
  BEGIN
    INSERT INTO TVET_CLIENTES (
      TNU_IdCliente, 
      TC_Nombre, 
      TC_Direccion, 
      TC_NumTelefono, 
      TC_CorreoElectronico
    )
    VALUES (
      NULL,
      p_nombre, 
      p_direccion, 
      p_numTelefono, 
      p_correoElectronico
    );
  END SP_INSERT_CLIENTE;
  -- -------------------------------------------------

  PROCEDURE SP_GET_CLIENTE_BY_ID (
    p_id        IN  TVET_CLIENTES.TNU_IdCliente%TYPE,
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_CLIENTES
       WHERE TNU_IdCliente = p_id;
  END SP_GET_CLIENTE_BY_ID;
  -- -------------------------------------------------

  PROCEDURE SP_GET_ALL_CLIENTES (
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_CLIENTES;
  END SP_GET_ALL_CLIENTES;
  -- -------------------------------------------------

  PROCEDURE SP_UPDATE_CLIENTE (
    p_id                IN TVET_CLIENTES.TNU_IdCliente%TYPE,
    p_nombre            IN TVET_CLIENTES.TC_Nombre%TYPE,
    p_direccion         IN TVET_CLIENTES.TC_Direccion%TYPE,
    p_numTelefono       IN TVET_CLIENTES.TC_NumTelefono%TYPE,
    p_correoElectronico IN TVET_CLIENTES.TC_CorreoElectronico%TYPE
  ) IS
  BEGIN
    UPDATE TVET_CLIENTES
       SET TC_Nombre            = p_nombre,
           TC_Direccion         = p_direccion,
           TC_NumTelefono       = p_numTelefono,
           TC_CorreoElectronico = p_correoElectronico
     WHERE TNU_IdCliente = p_id;
  END SP_UPDATE_CLIENTE;
  -- -------------------------------------------------

  PROCEDURE SP_DELETE_CLIENTE (
    p_id IN TVET_CLIENTES.TNU_IdCliente%TYPE
  ) IS
  BEGIN
    DELETE FROM TVET_CLIENTES
     WHERE TNU_IdCliente = p_id;
  END SP_DELETE_CLIENTE;
  -- -------------------------------------------------

  -- ==================================================
  --              TVET_MASCOTAS
  -- ==================================================
  PROCEDURE SP_INSERT_MASCOTA (
    p_nombreMascota IN TVET_MASCOTAS.TC_NombreMascota%TYPE
  ) IS
  BEGIN
    INSERT INTO TVET_MASCOTAS (
      TNU_IdMascota,
      TC_NombreMascota
    )
    VALUES (
      NULL,
      p_nombreMascota
    );
  END SP_INSERT_MASCOTA;
  -- -------------------------------------------------

  PROCEDURE SP_GET_MASCOTA_BY_ID (
    p_id        IN  TVET_MASCOTAS.TNU_IdMascota%TYPE,
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_MASCOTAS
       WHERE TNU_IdMascota = p_id;
  END SP_GET_MASCOTA_BY_ID;
  -- -------------------------------------------------

  PROCEDURE SP_GET_ALL_MASCOTAS (
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_MASCOTAS;
  END SP_GET_ALL_MASCOTAS;
  -- -------------------------------------------------

  PROCEDURE SP_UPDATE_MASCOTA (
    p_id             IN TVET_MASCOTAS.TNU_IdMascota%TYPE,
    p_nombreMascota  IN TVET_MASCOTAS.TC_NombreMascota%TYPE
  ) IS
  BEGIN
    UPDATE TVET_MASCOTAS
       SET TC_NombreMascota = p_nombreMascota
     WHERE TNU_IdMascota = p_id;
  END SP_UPDATE_MASCOTA;
  -- -------------------------------------------------

  PROCEDURE SP_DELETE_MASCOTA (
    p_id IN TVET_MASCOTAS.TNU_IdMascota%TYPE
  ) IS
  BEGIN
    DELETE FROM TVET_MASCOTAS
     WHERE TNU_IdMascota = p_id;
  END SP_DELETE_MASCOTA;
  -- -------------------------------------------------

  -- ==================================================
  --              TVET_CITAS
  -- ==================================================
  PROCEDURE SP_INSERT_CITA (
    p_idCliente IN TVET_CITAS.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_CITAS.TNU_IdMascota%TYPE,
    p_fecha     IN TVET_CITAS.TFE_Fecha%TYPE
  ) IS
  BEGIN
    INSERT INTO TVET_CITAS (
      TNU_IdCita,
      TNU_IdCliente,
      TNU_IdMascota,
      TFE_Fecha
    )
    VALUES (
      NULL,
      p_idCliente,
      p_idMascota,
      p_fecha
    );
  END SP_INSERT_CITA;
  -- -------------------------------------------------

  PROCEDURE SP_GET_CITA_BY_ID (
    p_id        IN  TVET_CITAS.TNU_IdCita%TYPE,
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_CITAS
       WHERE TNU_IdCita = p_id;
  END SP_GET_CITA_BY_ID;
  -- -------------------------------------------------

  PROCEDURE SP_GET_ALL_CITAS (
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_CITAS;
  END SP_GET_ALL_CITAS;
  -- -------------------------------------------------

  PROCEDURE SP_UPDATE_CITA (
    p_id         IN TVET_CITAS.TNU_IdCita%TYPE,
    p_idCliente  IN TVET_CITAS.TNU_IdCliente%TYPE,
    p_idMascota  IN TVET_CITAS.TNU_IdMascota%TYPE,
    p_fecha      IN TVET_CITAS.TFE_Fecha%TYPE
  ) IS
  BEGIN
    UPDATE TVET_CITAS
       SET TNU_IdCliente = p_idCliente,
           TNU_IdMascota = p_idMascota,
           TFE_Fecha     = p_fecha
     WHERE TNU_IdCita = p_id;
  END SP_UPDATE_CITA;
  -- -------------------------------------------------

  PROCEDURE SP_DELETE_CITA (
    p_id IN TVET_CITAS.TNU_IdCita%TYPE
  ) IS
  BEGIN
    DELETE FROM TVET_CITAS
     WHERE TNU_IdCita = p_id;
  END SP_DELETE_CITA;
  -- -------------------------------------------------

  -- ==================================================
  --              TVET_DIAGNOSTICO
  -- ==================================================
  PROCEDURE SP_INSERT_DIAGNOSTICO (
    p_idCita      IN TVET_DIAGNOSTICO.TNU_IdCita%TYPE,
    p_diagnostico IN TVET_DIAGNOSTICO.TC_Diagnostico%TYPE
  ) IS
  BEGIN
    INSERT INTO TVET_DIAGNOSTICO (
      TNU_IdDiagnostico,
      TNU_IdCita,
      TC_Diagnostico
    )
    VALUES (
      NULL,
      p_idCita,
      p_diagnostico
    );
  END SP_INSERT_DIAGNOSTICO;
  -- -------------------------------------------------

  PROCEDURE SP_GET_DIAGNOSTICO_BY_ID (
    p_id        IN  TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE,
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_DIAGNOSTICO
       WHERE TNU_IdDiagnostico = p_id;
  END SP_GET_DIAGNOSTICO_BY_ID;
  -- -------------------------------------------------

  PROCEDURE SP_GET_ALL_DIAGNOSTICO (
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_DIAGNOSTICO;
  END SP_GET_ALL_DIAGNOSTICO;
  -- -------------------------------------------------

  PROCEDURE SP_UPDATE_DIAGNOSTICO (
    p_id           IN TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE,
    p_idCita       IN TVET_DIAGNOSTICO.TNU_IdCita%TYPE,
    p_diagnostico  IN TVET_DIAGNOSTICO.TC_Diagnostico%TYPE
  ) IS
  BEGIN
    UPDATE TVET_DIAGNOSTICO
       SET TNU_IdCita      = p_idCita,
           TC_Diagnostico  = p_diagnostico
     WHERE TNU_IdDiagnostico = p_id;
  END SP_UPDATE_DIAGNOSTICO;
  -- -------------------------------------------------

  PROCEDURE SP_DELETE_DIAGNOSTICO (
    p_id IN TVET_DIAGNOSTICO.TNU_IdDiagnostico%TYPE
  ) IS
  BEGIN
    DELETE FROM TVET_DIAGNOSTICO
     WHERE TNU_IdDiagnostico = p_id;
  END SP_DELETE_DIAGNOSTICO;
  -- -------------------------------------------------

  -- ==================================================
  --              TVET_DETALLEMASCOTA
  -- ==================================================
  PROCEDURE SP_INSERT_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_raza      IN TVET_DETALLEMASCOTA.TC_Raza%TYPE,
    p_peso      IN TVET_DETALLEMASCOTA.DC_Peso%TYPE,
    p_color     IN TVET_DETALLEMASCOTA.TC_Color%TYPE
  ) IS
  BEGIN
    INSERT INTO TVET_DETALLEMASCOTA (
      TNU_IdCliente,
      TNU_IdMascota,
      TC_Raza,
      DC_Peso,
      TC_Color
    )
    VALUES (
      p_idCliente,
      p_idMascota,
      p_raza,
      p_peso,
      p_color
    );
  END SP_INSERT_DETALLEMASCOTA;
  -- -------------------------------------------------

  PROCEDURE SP_GET_DETALLEMASCOTA_BY_ID (
    p_idCliente IN  TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN  TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_DETALLEMASCOTA
       WHERE TNU_IdCliente = p_idCliente
         AND TNU_IdMascota = p_idMascota;
  END SP_GET_DETALLEMASCOTA_BY_ID;
  -- -------------------------------------------------

  PROCEDURE SP_GET_ALL_DETALLEMASCOTA (
    p_resultado OUT T_CURSOR
  ) IS
  BEGIN
    OPEN p_resultado FOR
      SELECT *
        FROM TVET_DETALLEMASCOTA;
  END SP_GET_ALL_DETALLEMASCOTA;
  -- -------------------------------------------------

  PROCEDURE SP_UPDATE_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE,
    p_raza      IN TVET_DETALLEMASCOTA.TC_Raza%TYPE,
    p_peso      IN TVET_DETALLEMASCOTA.DC_Peso%TYPE,
    p_color     IN TVET_DETALLEMASCOTA.TC_Color%TYPE
  ) IS
  BEGIN
    UPDATE TVET_DETALLEMASCOTA
       SET TC_Raza  = p_raza,
           DC_Peso  = p_peso,
           TC_Color = p_color
     WHERE TNU_IdCliente = p_idCliente
       AND TNU_IdMascota = p_idMascota;
  END SP_UPDATE_DETALLEMASCOTA;
  -- -------------------------------------------------

  PROCEDURE SP_DELETE_DETALLEMASCOTA (
    p_idCliente IN TVET_DETALLEMASCOTA.TNU_IdCliente%TYPE,
    p_idMascota IN TVET_DETALLEMASCOTA.TNU_IdMascota%TYPE
  ) IS
  BEGIN
    DELETE FROM TVET_DETALLEMASCOTA
     WHERE TNU_IdCliente = p_idCliente
       AND TNU_IdMascota = p_idMascota;
  END SP_DELETE_DETALLEMASCOTA;
  -- -------------------------------------------------

  -- ==================================================
  --              EJEMPLOS DE FUNCIONES
  -- ==================================================
  FUNCTION FN_TOTAL_CLIENTES RETURN NUMBER IS
    v_total NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_total
      FROM TVET_CLIENTES;
    RETURN v_total;
  END FN_TOTAL_CLIENTES;
  -- -------------------------------------------------

  FUNCTION FN_TOTAL_MASCOTAS RETURN NUMBER IS
    v_total NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_total
      FROM TVET_MASCOTAS;
    RETURN v_total;
  END FN_TOTAL_MASCOTAS;
  -- -------------------------------------------------

END PKG_VETERINARIA;
/

