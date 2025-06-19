# 🚀 E-Commerce com React.js + Flutter + Nest.js

<p align="center">
  <img src="https://img.shields.io/badge/React-18-blue.svg" />
  <img src="https://img.shields.io/badge/Flutter-3.22-blue.svg" />
  <img src="https://img.shields.io/badge/NestJS-10-red.svg" />
  <img src="https://img.shields.io/badge/TypeScript-5-blue.svg" />
  <img src="https://img.shields.io/badge/MIT-License-green.svg" />
</p>

## ✨ Visão Geral

Este projeto é um **E-Commerce** que utiliza um backend compartilhado em dois frontends, com as seguintes tecnologias:

- Frontend em **React.js** com **TypeScript**
- Backend em **Nest.js**
- **MySQL** para armazenamento de dados, junto ao **Prisma**
- **Tailwind CSS** para React, **Material UI** para Flutter
- Integração eficiente com API REST usando **Axios** para React.js, e DIO para Flutter
- Feedback para o usuário com **React Hot Toast** para React.js, e **Get** para Flutter
- Gerenciamento de estados e navegação com o pacote **GetX** no Flutter

---

## 🛠️ Stack de Tecnologias

### Frontend 1 (React.js)

- React.js
- TypeScript
- Axios
- Tailwind CSS
- React Hot Toast
- React Icons
- React Router

- ### Frontend 2 (Flutter)

- Flutter
- DIO
- GetX

### Backend (Node.js + Nest.js)

- Nest.js
- Prisma ORM

---

## 🚀 Como Rodar o Projeto


### 1️⃣ Clonar o repositório

* git clone https://github.com/adrianoct42/in8_challenge.git


### 2️⃣ Rodar o Backend (Nest.js)

Entre na pasta do Nest.js e faça o seguinte:

Instale o Prisma e o seu client nas seguintes versões:

* npm install prisma@^5.22.0 --save-dev

* npm install @prisma/client@^5.22.0

Inicialize o primsa com:

* npx prisma init

Configure agora o arquivo .env conforme o banco que usará, olhe as documentações do Prisma por exemplo para tal: https://docs.nestjs.com/recipes/prisma

PS: Para o MySQL nessa versão do Prisma, não é preciso da linha DATABASE_URL="file:./dev.db" no arquivo .env

Por fim, rode a migração com o seguinte comando:

* npx prisma migrate dev --name init

Para que o servidor execute de fato, rode:

* npm run start:dev

---

### 3️⃣ Rodar o Frontend (React.js)

Entre na pasta do React.js e faça o seguinte:


* npm install

* npm run dev

---

### 4️⃣ Rodar o Frontend (Flutter)

Entre na pasta do Flutter e faça o seguinte:

Abra o projeto numa janela própria com o código do Flutter na raiz.

Execute um emulador de Android/iOS que esteja pronto para iniciar um app.

Vá na aba "Run and Debug" do VSCode e execute o aplicativo após ter iniciado o emulador.

---

## 🖥️ Funcionalidades

✅ Listagem de itens das APIs

✅ Adição de itens no carrinho

✅ Exclusão de item do carrinho

✅ Feedback visual com React Hot Toast e Get.snackbar()

✅ Design responsivo com Material UI + Tailwind CSS

✅ Persistência de dados com banco MySQL

✅ Backend compartilhado entre os frontends

---
