using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _23dh171095_MyStore.Models.ViewsModel
{
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage",
            "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderDetails = new HashSet<Models.OrderDetail>();
        }

        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public System.DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public string PaymentStatus { get; set; }
        public string PaymentMethod { get; set; }
        public string ShippingMethod { get; set; }
        public string ShippingAddress { get; set; }

        public virtual customer2 Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage",
            "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Models.OrderDetail> OrderDetails { get; set; }
    }
}