﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SICCO.Database
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SICCO_Entities : DbContext
    {
        public SICCO_Entities()
            : base("name=SICCO_Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_cor> tb_cor { get; set; }
        public virtual DbSet<tb_empresa> tb_empresa { get; set; }
        public virtual DbSet<tb_marca> tb_marca { get; set; }
        public virtual DbSet<tb_modelo> tb_modelo { get; set; }
        public virtual DbSet<tb_pessoa> tb_pessoa { get; set; }
        public virtual DbSet<tb_status> tb_status { get; set; }
        public virtual DbSet<tb_tipobem> tb_tipobem { get; set; }
        public virtual DbSet<tb_tipocombustivel> tb_tipocombustivel { get; set; }
        public virtual DbSet<tb_tipopessoa> tb_tipopessoa { get; set; }
        public virtual DbSet<tb_usuario> tb_usuario { get; set; }
        public virtual DbSet<tb_bem> tb_bem { get; set; }
        public virtual DbSet<tb_custo> tb_custo { get; set; }
        public virtual DbSet<tb_formapagamento> tb_formapagamento { get; set; }
        public virtual DbSet<tb_negociacao> tb_negociacao { get; set; }
        public virtual DbSet<tb_pagamento> tb_pagamento { get; set; }
        public virtual DbSet<tb_tipocusto> tb_tipocusto { get; set; }
        public virtual DbSet<tb_tiponegociacao> tb_tiponegociacao { get; set; }
        public virtual DbSet<tb_veiculo> tb_veiculo { get; set; }
    }
}