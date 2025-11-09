using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _23dh171095_MyStore.Models
{
    public class customer2
    {
        
            [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage",
                "CA2214:DoNotCallOverridableMethodsInConstructors")]
            public customer2()
            {
                this.Orders = new HashSet<Order>();
            }

            public int CustomerID { get; set; }
            public string CustomerName { get; set; }
            public string CustomerPhone { get; set; }
            public string CustomerEmail { get; set; }
            public string CustomerAddress { get; set; }
            public string Username { get; set; }

            [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage",
                "CA2227:CollectionPropertiesShouldBeReadOnly")]
            public virtual ICollection<Order> Orders { get; set; }
            public virtual User User { get; set; }
        }
    }
