﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Obligatorio2Entities : DbContext
    {
        public Obligatorio2Entities()
            : base("name=Obligatorio2Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Companias> Companias { get; set; }
        public virtual DbSet<Empleados> Empleados { get; set; }
        public virtual DbSet<Terminales> Terminales { get; set; }
        public virtual DbSet<Viajes> Viajes { get; set; }
        public virtual DbSet<ViajeTerminal> ViajeTerminal { get; set; }
    
        public virtual int AltaCompania(string nom, string dir, string tel, ObjectParameter ret)
        {
            var nomParameter = nom != null ?
                new ObjectParameter("nom", nom) :
                new ObjectParameter("nom", typeof(string));
    
            var dirParameter = dir != null ?
                new ObjectParameter("dir", dir) :
                new ObjectParameter("dir", typeof(string));
    
            var telParameter = tel != null ?
                new ObjectParameter("tel", tel) :
                new ObjectParameter("tel", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AltaCompania", nomParameter, dirParameter, telParameter, ret);
        }
    
        public virtual int AltaTerminal(string cod, string ciudad, string pais, ObjectParameter ret)
        {
            var codParameter = cod != null ?
                new ObjectParameter("cod", cod) :
                new ObjectParameter("cod", typeof(string));
    
            var ciudadParameter = ciudad != null ?
                new ObjectParameter("ciudad", ciudad) :
                new ObjectParameter("ciudad", typeof(string));
    
            var paisParameter = pais != null ?
                new ObjectParameter("pais", pais) :
                new ObjectParameter("pais", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AltaTerminal", codParameter, ciudadParameter, paisParameter, ret);
        }
    
        public virtual int EliminarCompania(string nom, ObjectParameter ret)
        {
            var nomParameter = nom != null ?
                new ObjectParameter("nom", nom) :
                new ObjectParameter("nom", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarCompania", nomParameter, ret);
        }
    
        public virtual int EliminarTerminal(string cod, ObjectParameter ret)
        {
            var codParameter = cod != null ?
                new ObjectParameter("cod", cod) :
                new ObjectParameter("cod", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EliminarTerminal", codParameter, ret);
        }
    }
}