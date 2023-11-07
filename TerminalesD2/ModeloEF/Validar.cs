using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ModeloEF
{
    public static class Validar
    {
        public static void ValidarCompanias(Companias unC)
        {
            if (string.IsNullOrWhiteSpace(unC.NombreComp))
                throw new Exception("El nombre no debe estar vacío");
            else if (unC.NombreComp.Trim().Length > 50 || unC.NombreComp.Trim().Length <= 0)
                throw new Exception("El nombre no puede tener esa cantidad de caracteres");

            if (string.IsNullOrWhiteSpace(unC.Direccion))
                throw new Exception("La dirección no debe estar vacío");
            else if (unC.Direccion.Trim().Length > 100 || unC.Direccion.Trim().Length <= 0)
                throw new Exception("La dirección no puede tener esa cantidad de caracteres");

            if (string.IsNullOrWhiteSpace(unC.Telefono))
                throw new Exception("El teléfono no debe estar vacío");
            else if (unC.Telefono.Trim().Length > 15 || unC.Telefono.Trim().Length <= 7)
                throw new Exception("El teléfono no puede tener esa cantidad de caracteres");
            else if (!Regex.IsMatch(unC.Telefono, "^[0-9]{7,15}$"))
                throw new Exception("El teléfono ingresado no es válido");
        }

        public static void ValidarEmpleados(Empleados unE)
        {
            if (unE.Usuario.Trim().Length != 8)
                throw new Exception("El usuario debe ser de 8 caracteres");

            if (string.IsNullOrWhiteSpace(unE.NombreCompleto))
                throw new Exception("El nombre no debe estar vacío");
            else if (unE.NombreCompleto.Trim().Length > 50 || unE.NombreCompleto.Trim().Length <= 0)
                throw new Exception("El nombre no puede tener esa cantidad de caracteres");


            if (!Regex.IsMatch(unE.Pass.Trim(), "[a-zA-Z]{3}[0-9]{3}$"))
                throw new Exception("La contraseña debe tener 6 caracteres de largo, y contar con 3 números y 3 letras");
        }


        public static void ValidarTerminal(Terminales unaT)
        {
            if (!Regex.IsMatch(unaT.Codigo.Trim(), "[a-zA-Z]{6}$"))
                throw new Exception("El código debe ser de 6 digitos y unicamente Caracacteres");

            if (string.IsNullOrWhiteSpace(unaT.Ciudad))
                throw new Exception("La ciudad no debe estar vacío");
            else if (unaT.Ciudad.Trim().Length > 50 || unaT.Ciudad.Trim().Length <= 0)
                throw new Exception("La ciudad no puede tener esa cantidad de caracteres");

            if (string.IsNullOrWhiteSpace(unaT.Pais))
                throw new Exception("El país no debe estar vacío");
            else if (unaT.Pais.Trim().Length > 50 || unaT.Pais.Trim().Length <= 0)
                throw new Exception("El país no puede tener esa cantidad de caracteres");
        }

        public static void ValidarViajes(Viajes unV)
        {
            if (unV.FechaLlegada < unV.FechaPartida)
                throw new Exception("La fecha de llegada debe ser más lejana a la de partida");

            if(unV.FechaPartida < DateTime.Today)
                throw new Exception("La fecha de partida no es correcta");

            if (unV.Pasajeros > 50 || unV.Pasajeros < 1)
                throw new Exception("La capacidad del ómnibus es de 50 personas.Debe haber por lo menos más de una persona por viaje");

            if (unV.Anden > 35 || unV.Anden < 1)
                throw new Exception("Solo existen andenes del 1 al 35");

            if (unV.Precio < 0)
                throw new Exception("El viaje debe tener un precio");

            if (unV.Empleados == null)
                throw new Exception("El empleado debe existir");

            if (unV.Companias == null)
                throw new Exception("La compañía debe existir");

            if (unV.ViajeTerminal == null)
                throw new Exception("La lista debe existir");

            if (unV.ViajeTerminal.Count == 0)
                throw new Exception("No hay terminales ingresadas");

        }

        public static void ValidarViajesTerminal(ViajeTerminal unVT)
        {
            if (unVT.NroParada < 0)
                throw new Exception("La parada no puede ser menor que 0");

            if (unVT.Terminales == null)
                throw new Exception("Error en el código");
        }
    }


}
