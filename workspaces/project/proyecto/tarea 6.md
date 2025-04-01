-

## 1. Creación de la Base de Datos
Para comenzar, es necesario crear un archivo de base de datos SQLite e importar la información de los clientes, productos y pedidos.

### **Pasos:**
1. Abrir una terminal en Windows (**CMD** o **PowerShell**).
2. Navegar a la carpeta donde se encuentran los archivos SQL:
   ```bash
   cd C:\proyectos\sqlite
   ```
3. Iniciar SQLite y crear la base de datos ejecutando:
   ```bash
   sqlite3 clientes.db
   ```
4. Dentro de SQLite, cargar la estructura de la base de datos y los datos:
   ```sql
   .read base-datos-clientes.sql
   ```
5. Verificar que las tablas fueron creadas correctamente con:
   ```sql
   .tables
   ```
   Debería mostrar: `Clientes`, `Productos`, `Pedidos`.
6. Comprobar que hay datos en las tablas, por ejemplo, consultando los primeros clientes:
   ```sql
   SELECT * FROM Clientes LIMIT 5;
   ```

---

## 2. Ejecución de Consultas
Una vez creada la base de datos, se deben ejecutar las consultas requeridas para extraer la información solicitada.

### **Opciones para ejecutar las consultas:**
1. **Ejecutar todas las consultas automáticamente:**
   ```sql
   .read consultas-bbdd.sql
   ```
   Esto ejecutará todas las consultas contenidas en el archivo de manera secuencial.

2. **Ejecutar consultas manualmente:**
   - Abrir el archivo `consultas-bbdd.sql` en un editor de texto.
   - Copiar y pegar cada consulta en la terminal de SQLite para ejecutarlas individualmente.

Algunas de las consultas incluidas en el archivo son:

-- Obtener todos los clientes.
SELECT * FROM Clientes;

-- Obtener la cantidad total de productos en todos los pedidos.
SELECT SUM(cantidad) AS total_productos FROM Pedidos;

-- Obtener el precio promedio de los productos.
SELECT AVG(precio) AS precio_promedio FROM Productos;

-- Obtener los clientes que tienen un email válido (contiene '@').
SELECT * FROM Clientes WHERE email LIKE '%@%';

-- Obtener el producto más caro.
SELECT * FROM Productos ORDER BY precio DESC LIMIT 1;

-- Obtener los pedidos realizados en febrero de 2024.
SELECT * FROM Pedidos WHERE fecha_pedido LIKE '2024-02-%';

-- Obtener la cantidad total de productos en todos los pedidos por producto.
SELECT id_producto, SUM(cantidad) AS total_cantidad FROM Pedidos GROUP BY id_producto;

-- Obtener los clientes que han realizado más de un pedido.
SELECT id_cliente, COUNT(*) AS total_pedidos FROM Pedidos GROUP BY id_cliente HAVING total_pedidos > 1;

-- Obtener los productos que tienen un precio registrado.
SELECT * FROM Productos WHERE precio IS NOT NULL;

-- Obtener la fecha del primer pedido realizado.
SELECT MIN(fecha_pedido) AS primer_pedido FROM Pedidos;

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B'.
SELECT * FROM Productos WHERE nombre LIKE 'A%' OR nombre LIKE 'B%';

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
SELECT id_cliente, SUM(cantidad) AS total_cantidad FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.
SELECT id_cliente, COUNT(*) AS total_pedidos FROM Pedidos WHERE fecha_pedido LIKE '2024-02-%' GROUP BY id_cliente HAVING total_pedidos > 1;

-- Obtener los productos con precio entre 100 y 500.
SELECT * FROM Productos WHERE precio BETWEEN 100 AND 500;

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
SELECT id_cliente, SUM(cantidad) AS total_cantidad FROM Pedidos GROUP BY id_cliente ORDER BY total_cantidad DESC;

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
SELECT * FROM Clientes WHERE nombre LIKE '%a%';

-- Obtener el precio máximo de los productos.
SELECT MAX(precio) AS precio_maximo FROM Productos;

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
SELECT * FROM Pedidos WHERE id_cliente = 1 AND fecha_pedido LIKE '2024-02-%';

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
SELECT id_producto, SUM(cantidad) AS total_cantidad FROM Pedidos GROUP BY id_producto ORDER BY total_cantidad DESC;

-- Obtener los productos que no tienen un precio registrado.
SELECT * FROM Productos WHERE precio IS NULL;

-- Obtener la fecha del último pedido realizado.
SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos;

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
SELECT * FROM Clientes WHERE LENGTH(nombre) >= 5;

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
SELECT * FROM Productos WHERE nombre LIKE '%o%';

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
SELECT id_cliente, SUM(cantidad) AS total_cantidad FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;

-- Obtener los clientes cuyos nombres no contienen la letra 'i'.
SELECT * FROM Clientes WHERE nombre NOT LIKE '%i%';

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
SELECT * FROM Pedidos WHERE id_cliente = 2 AND fecha_pedido LIKE '2024-02-%';

-- Obtener el precio mínimo de los productos.
SELECT MIN(precio) AS precio_minimo FROM Productos;

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
SELECT DISTINCT id_cliente FROM Pedidos WHERE fecha_pedido LIKE '2024-02-%';

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos WHERE id_cliente = 3;

-- Obtener los productos que tienen una 'a' al final del nombre.
SELECT * FROM Productos WHERE nombre LIKE '%a';

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
SELECT * FROM Clientes WHERE nombre REGEXP '[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU]';

-- Obtener los productos cuyo precio tenga al menos 4 números sin contar los decimales.
SELECT * FROM Productos WHERE LENGTH(CAST(precio AS TEXT)) >= 4;

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
SELECT * FROM Clientes WHERE nombre LIKE '%a%e%';

-- Obtener los productos cuyos nombres terminan con una consonante.
SELECT * FROM Productos WHERE nombre GLOB '*[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]';

-- Obtener los productos cuyos nombres empiezan con una vocal.
SELECT * FROM Productos WHERE nombre GLOB '[aeiouAEIOU]*';

-- Obtener los clientes cuyos nombres no contienen la letra 'i'.
SELECT * FROM Clientes WHERE nombre NOT LIKE '%i%';

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
SELECT * FROM Pedidos WHERE id_cliente = 2 AND fecha_pedido LIKE '2024-02-%';

-- Obtener el precio mínimo de los productos.
SELECT MIN(precio) AS precio_minimo FROM Productos;

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
SELECT DISTINCT id_cliente FROM Pedidos WHERE fecha_pedido LIKE '2024-02-%';

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos WHERE id_cliente = 3;

-- Obtener los productos que tienen una 'a' al final del nombre.
SELECT * FROM Productos WHERE nombre LIKE '%a';

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
SELECT * FROM Clientes WHERE nombre REGEXP '[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU]';

-- Obtener los productos cuyo precio tenga al menos 4 números sin contar los decimales.
SELECT * FROM Productos WHERE LENGTH(CAST(precio AS TEXT)) >= 4;

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
SELECT * FROM Clientes WHERE nombre LIKE '%a%e%';

-- Obtener los productos cuyos nombres terminan con una consonante.
SELECT * FROM Productos WHERE nombre GLOB '*[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]';

-- Obtener los productos cuyos nombres empiezan con una vocal.
SELECT * FROM Productos WHERE nombre GLOB '[aeiouAEIOU]*';


## 3. Cierre de SQLite

```sql
.exit
```

---

## Conclusión
Este informe ha descrito el procedimiento detallado para trabajar con SQLite, desde la creación de la base de datos hasta la ejecución y verificación de consultas. Siguiendo estos pasos, se garantiza un correcto análisis de los datos almacenados en la base de datos de clientes, productos y pedidos.

