BEGIN
  -- Insertar 5 registros de prueba en TVET_CLIENTES
  PKG_VETERINARIA.SP_INSERT_CLIENTE('Cliente 1', 'Calle Principal 101', '555-0101', 'cliente1@veterinaria.com');
  PKG_VETERINARIA.SP_INSERT_CLIENTE('Cliente 2', 'Avenida Secundaria 202', '555-0102', 'cliente2@veterinaria.com');
  PKG_VETERINARIA.SP_INSERT_CLIENTE('Cliente 3', 'Boulevard Terciario 303', '555-0103', 'cliente3@veterinaria.com');
  PKG_VETERINARIA.SP_INSERT_CLIENTE('Cliente 4', 'Ruta Cuaternaria 404', '555-0104', 'cliente4@veterinaria.com');
  PKG_VETERINARIA.SP_INSERT_CLIENTE('Cliente 5', 'Pasaje Quinto 505', '555-0105', 'cliente5@veterinaria.com');
  
  -- Insertar 5 registros de prueba en TVET_MASCOTAS
  PKG_VETERINARIA.SP_INSERT_MASCOTA('Mascota 1');
  PKG_VETERINARIA.SP_INSERT_MASCOTA('Mascota 2');
  PKG_VETERINARIA.SP_INSERT_MASCOTA('Mascota 3');
  PKG_VETERINARIA.SP_INSERT_MASCOTA('Mascota 4');
  PKG_VETERINARIA.SP_INSERT_MASCOTA('Mascota 5');
  
  -- Insertar 5 registros de prueba en TVET_CITAS
  PKG_VETERINARIA.SP_INSERT_CITA(1, 1, SYSDATE);
  PKG_VETERINARIA.SP_INSERT_CITA(2, 2, SYSDATE + 1);
  PKG_VETERINARIA.SP_INSERT_CITA(3, 3, SYSDATE + 2);
  PKG_VETERINARIA.SP_INSERT_CITA(4, 4, SYSDATE + 3);
  PKG_VETERINARIA.SP_INSERT_CITA(5, 5, SYSDATE + 4);
  
  -- Insertar 5 registros de prueba en TVET_DIAGNOSTICO
  PKG_VETERINARIA.SP_INSERT_DIAGNOSTICO(1, 'Diagnóstico para la cita 1');
  PKG_VETERINARIA.SP_INSERT_DIAGNOSTICO(2, 'Diagnóstico para la cita 2');
  PKG_VETERINARIA.SP_INSERT_DIAGNOSTICO(3, 'Diagnóstico para la cita 3');
  PKG_VETERINARIA.SP_INSERT_DIAGNOSTICO(4, 'Diagnóstico para la cita 4');
  PKG_VETERINARIA.SP_INSERT_DIAGNOSTICO(5, 'Diagnóstico para la cita 5');
  
  -- Insertar 5 registros de prueba en TVET_DETALLEMASCOTA
  PKG_VETERINARIA.SP_INSERT_DETALLEMASCOTA(1, 1, 'Labrador', 25.5, 'Amarillo');
  PKG_VETERINARIA.SP_INSERT_DETALLEMASCOTA(2, 2, 'Pastor Alemán', 30.0, 'Negro');
  PKG_VETERINARIA.SP_INSERT_DETALLEMASCOTA(3, 3, 'Bulldog', 20.3, 'Blanco');
  PKG_VETERINARIA.SP_INSERT_DETALLEMASCOTA(4, 4, 'Beagle', 10.8, 'Marrón');
  PKG_VETERINARIA.SP_INSERT_DETALLEMASCOTA(5, 5, 'Schnauzer', 15.0, 'Gris');

  COMMIT;
END;
/
