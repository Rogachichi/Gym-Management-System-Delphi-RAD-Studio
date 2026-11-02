# Gym Management System – Delphi RAD Studio 🏋️‍♂️💳

🔗 **GitHub Repository:** [Rogachichi/Gym Management System – Delphi RAD Studio](https://github.com/Rogachichi/Gym-Management-System-Delphi-RAD-Studio.git)

![Delphi](https://img.shields.io/badge/Delphi-EE1F26?style=for-the-badge&logo=delphi&logoColor=white)
![FireDAC](https://img.shields.io/badge/FireDAC-Database_Access-blue?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-Database-orange?style=for-the-badge&logo=database)

A comprehensive desktop application designed for managing gym memberships, client reservations, and facility usage statistics. Developed in **Embarcadero Delphi (RAD Studio)**, utilizing **FireDAC** for robust, native relational database integration.

## 🚀 Key Features

* **Client & Pass Management:** Full CRUD operations for clients. Features a smart pass system that automatically assigns 10-entry monthly passes to users.
* **Smart Reservation System:** Clients can book specific gym objects/facilities. The system automatically validates active passes and deducts entry points upon successful reservation.
* **Reservation Statuses & Reporting:**
  * Option to permanently delete or gracefully cancel (change status to "ANULOWANO") reservations.
  * Native export of reservation schedules to PDF via the Windows `Microsoft Print to PDF` virtual printer API.
* **Data Visualization (TChart):** A dedicated statistics module that generates dynamic bar charts to visualize facility popularity based on database metrics.
* **Secure Access:** Built-in splash screen loading sequence and a database-verified user authentication login form.

## 🛠️ Technology Stack

* **Environment:** Embarcadero Delphi / RAD Studio
* **Language:** Object Pascal
* **Database Access:** FireDAC (TFDConnection, TFDQuery)
* **UI Components:** VCL (Visual Component Library), TDBGrid, TChart, TDateTimePicker

## ⚙️ Project Structure Overview
* `uMain.pas` - Main MDI Dashboard and application routing.
* `uKlienci.pas` / `uEdycjaKlienta.pas` - Client management and pass issuance logic.
* `uLogikaKarnetow.pas` - Core business logic for pass validation and entry deduction.
* `uRezerwacje.pas` / `uNowaRezerwacja.pas` - Appointment scheduling and PDF printing.
* `uStatystyki.pas` - Data visualization utilizing VCLTee charts.
* `Unit3.pas` - Authentication system.

*Note: This repository serves as a code showcase. Compilation requires a valid Delphi compiler (RAD Studio).*