//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tb_bem
    {
        public tb_bem()
        {
            this.tb_custo = new HashSet<tb_custo>();
            this.tb_negociacao = new HashSet<tb_negociacao>();
            this.tb_veiculo = new HashSet<tb_veiculo>();
        }
    
        public int id { get; set; }
        public Nullable<float> valor { get; set; }
        public System.DateTime dataCompra { get; set; }
        public Nullable<System.DateTime> dataVenda { get; set; }
        public int idTipoBem { get; set; }
        public int idStatus { get; set; }
    
        public virtual tb_status tb_status { get; set; }
        public virtual tb_tipobem tb_tipobem { get; set; }
        public virtual ICollection<tb_custo> tb_custo { get; set; }
        public virtual ICollection<tb_negociacao> tb_negociacao { get; set; }
        public virtual ICollection<tb_veiculo> tb_veiculo { get; set; }
    }
}