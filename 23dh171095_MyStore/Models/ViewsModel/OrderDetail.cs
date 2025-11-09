using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _23dh171095_MyStore.Models.ViewsModel
{
    public class OrderDetail
    {
        public int ID { get; set; }
        public int ProductId { get; set; }
        public int OrderID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public Nullable<decimal> TotalPrice { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
