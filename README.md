# Cupcake App

Cupcake App es una aplicación móvil desarrollada en Flutter que permite a los usuarios personalizar cupcakes, gestionar pedidos y registrar estos pedidos en la blockchain utilizando un contrato inteligente. Este proyecto combina la personalización de productos con la tecnología blockchain para garantizar la trazabilidad y la seguridad de los datos.

---

## **Características**

### **1. Selección de productos**
- Los usuarios pueden elegir entre una variedad de sabores de cupcakes disponibles.
- Cada producto incluye un título, una imagen, un precio y un color asociado.

### **2. Personalización de cupcakes**
- Los usuarios pueden personalizar sus cupcakes seleccionando ingredientes adicionales.
- Se muestra una vista previa del cupcake personalizado antes de agregarlo al carrito.

### **3. Gestión de pedidos**
- Los usuarios pueden revisar los cupcakes personalizados en un carrito de compras.
- Se valida que todos los cupcakes tengan datos completos antes de proceder.

### **4. Subida de pedidos a la blockchain**
- Los pedidos se registran en la blockchain utilizando un contrato inteligente llamado `CupcakesOrders`.
- La aplicación utiliza la biblioteca `web3dart` para interactuar con la blockchain.
- Los usuarios reciben una confirmación cuando el pedido se registra exitosamente.

### **5. Contrato inteligente**
- El contrato `CupcakesOrders` permite:
  - Registrar pedidos con sabores y listas de ingredientes.
  - Consultar pedidos específicos por su ID.
  - Obtener el número total de pedidos registrados.

---

## **Tecnologías utilizadas**

### **Frontend**
- **Flutter**: Framework para el desarrollo de aplicaciones móviles.
- **Provider**: Gestión del estado global de la aplicación.
- **web3dart**: Biblioteca para interactuar con la blockchain desde Flutter.

### **Backend (Blockchain)**
- **Solidity**: Lenguaje de programación para contratos inteligentes.
- **Ganache**: Red de desarrollo local de Ethereum.
- **Truffle**: Herramienta para la compilación, migración y pruebas de contratos inteligentes.

---

## **Requisitos previos**

1. **Flutter**:
   - Instalar Flutter SDK: [Guía de instalación](https://docs.flutter.dev/get-started/install).
2. **Node.js y Truffle**:
   - Instalar Node.js: [Descargar Node.js](https://nodejs.org/).
   - Instalar Truffle:  
     ```bash
     npm install -g truffle
     ```
3. **Ganache**:
   - Descargar e instalar Ganache: [Ganache](https://trufflesuite.com/ganache/).

---

## **Configuración del proyecto**

### **1. Clonar el repositorio**
```bash
git clone https://github.com/tu-usuario/cupcake_app.git
cd cupcake_app
