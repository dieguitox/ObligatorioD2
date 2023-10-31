//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ModeloEF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Viajes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Viajes()
        {
            this.ViajeTerminal = new HashSet<ViajeTerminal>();
        }
    
        public int CodigoInterno { get; set; }
        public System.DateTime FechaPartida { get; set; }
        public System.DateTime FechaLlegada { get; set; }
        public int Pasajeros { get; set; }
        public decimal Precio { get; set; }
        public int Anden { get; set; }
        public string NombreComp { get; set; }
        public string Usuario { get; set; }
    
        public virtual Companias Companias { get; set; }
        public virtual Empleados Empleados { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ViajeTerminal> ViajeTerminal { get; set; }
    }
}
