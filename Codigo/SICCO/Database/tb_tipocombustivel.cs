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
    
    public partial class tb_tipocombustivel
    {
        public tb_tipocombustivel()
        {
            this.tb_modelo = new HashSet<tb_modelo>();
        }
    
        public int id { get; set; }
        public string tipoCombustivel { get; set; }
    
        public virtual ICollection<tb_modelo> tb_modelo { get; set; }
    }
}
